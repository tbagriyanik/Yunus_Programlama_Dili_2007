unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, Grids, inifiles, registry, Buttons, ComCtrls,
  WinProcs, shellapi, typinfo,DB, DBClient, ShlObj, unit7;


type
  TForm1 = class(TForm)
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormKaydet1Click(Sender: TObject);
    procedure FormA1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure WMNCHitTest(var M: TWMNCHitTest);
       message WM_NCHitTest;
    procedure WMNCLButtonDown(var Msg : TWMNCLButtonDown);
       message WM_NCLBUTTONDOWN;
  public
    { Public declarations }
  derlemeThread:TDerleme;       //Derleme Kanalý
         procedure TimerTiklama (Sender: TObject);
         procedure tiklama(Sender: TObject);          //OnClick
         procedure ciftTiklama(Sender: TObject);
         procedure degistiginde(Sender: TObject);
         procedure tusbasimi(Sender: TObject; var Key: Char);
         procedure metin_cikisi(Sender: TObject);
         procedure nesne_giris(Sender: TObject);
         procedure surukle(Sender: TObject; Button: TMouseButton;
          Shift: TShiftState; X, Y: Integer);        //onMouseDown
         procedure surukleCombo(Sender, Source: TObject; X, Y: Integer;
          State: TDragState; var Accept: Boolean);   //onDragDrop
         procedure nesneMouseMove( Sender: TObject; Shift: TShiftState; X,
                          Y: Integer);
         procedure sil;
         procedure kes;
         procedure kopyala(kes:boolean);
         procedure yapistir;
         procedure nesne_sayisi;
         procedure tumunusec;
         procedure ayaroku;
         procedure ayaryaz(dosyaadi:string);
         procedure uste;
         procedure alta;
         procedure sola;
         procedure saga;
         procedure yataydagit;
         procedure dikeydagit;
         procedure hepsinikaydet(dosya:string);
         procedure hepsiniac(dosyaadi:string);
         procedure hinti(Sender: TObject);
         procedure uygula(secili_satir:integer);
         procedure dfmkaydet;
         procedure geriyeYolla;
         procedure oneGetir;
         procedure kopyaBilgisi_Yaz;
         procedure kopyaBilgisi_Oku;
         procedure UnRegisterExtension(const sExt, sDesc, AppPath: string);
         procedure cevir(gelen: byte);
         function ada_ayikla(met:string):string;  //son rakamlarý siliyoruz
         function no_ayikla(met:string):string;  //son rakamlarý alýyoruz
         procedure GlobalhataDeposu(Sender: TObject; E: Exception);
         procedure FareImleciNormallestir ;
         procedure Delay(Sec, MSec:Word);
         procedure flash;
    end;

type
   nesne=record
    tip:string;
    ad:string;
    aktif:boolean;              //enabled
    baslik:string;              //text, caption
    genislik:integer;
    yukseklik:integer;
    ust:integer;
    sol:integer;
    ipucu:string;
    checkdeger:boolean;         //checkbox/onaykutusu için
    degerListesi:TStrings;      //items/lines yani TRichEdit, TComboBox ve TListBox
    secili:integer;             //itemindex, TComboBox ve TListBox için
    yazitipiAdi:TFontName;
    yazitipiStil:TFontStyles;
    yazitipiCharSet:TFontCharset;
    yazitipiBoyut:integer;
    yazitipiRenk:TColor;
    renk:TColor;
    resim:string;               //bitbtn resmi aslýnda HelpKeyword içinde saklý
   end;

const
  sc_DragMove         = $F012;
  sc_SizeLeft         = $F001;
  sc_SizeRight        = $F002;
  sc_SizeTop          = $F003;
  sc_SizeTopLeft      = $F004;
  sc_SizeTopRight     = $F005;
  sc_SizeBottom       = $F006;
  sc_SizeBottomRight  = $F008;
  sc_SizeBottomLeft   = $F007;
  maxNesne            = 1000;//kopyalanabilen ...

var
  Form1: TForm1;
  butt,labe,edit,check,list,combo,redit,timer,tablo,ExcelTablo:integer;
  basx,basy:integer;
  ayar:TIniFile;
  eskiyer2:integer;
  eskirenk:TColor;
  seciliNesneler:array[1..maxNesne]of nesne;
  ekranTemizle:boolean;
  sizeBorder:integer=5         ; //boyutlandýrma tutamacý
  basliktan:boolean;
  derlemeAktif:boolean;

implementation

uses Unit2, Unit5, Unit3, Unit6, Unit9, Unit14, Unit16;

{$R *.DFM}     {$R-}

procedure TForm1.WMNCHitTest(var M: TWMNCHitTest);
begin
inherited;
if M.Result = htCaption then
 if basliktan then begin
  form2.gride_yaz;
  basliktan:=false;                
  end;
end;

procedure TForm1.WMNCLButtonDown(var Msg : TWMNCLButtonDown);
begin
  inherited;
  if (Msg.HitTest = htCaption) then
    basliktan:=true;
end;

procedure TForm1.ayaroku;
var formc:string;
    boy,forml,formt,formw,formh,forml2,formt2,formw2,formh2,formstate:integer;
    i:integer;
begin
     formc:=ayar.readstring('Form_1','Baslik','');
     forml:=ayar.readinteger('Form_1','Sol',-99);
     formt:=ayar.readinteger('Form_1','Ust',-99);
     formw:=ayar.readinteger('Form_1','Genislik',-99);
     formh:=ayar.readinteger('Form_1','Yukseklik',-99);
     form1.color:=ayar.readInteger('Form_1','Renk',-99);
     form1.font.name:=ayar.readString('Form_1','YazitipiAdi','');
     form1.font.color:=ayar.readInteger('Form_1','YazitipiRengi',-9);
     form1.font.Height:=ayar.readInteger('Form_1','YazitipiYukseklik',-11);
     form1.Hint:= ayar.readString('Form_1','Ipucu','');
     if ayar.readInteger('Form_1','YazitipiBoyut',-9)<>-9 then
     boy:=ayar.readInteger('Form_1','YazitipiBoyut',-9)
     else boy:=8;
     form1.font.size:=boy;
     form1.Font.Style   := TFontStyles(Byte(ayar.ReadInteger('Form_1', 'Stil', Byte(form1.Font.Style))));
     form1.Font.CharSet := TFontCharSet(ayar.ReadInteger('Form_1', 'CharSet', form1.Font.CharSet));
     formstate:=ayar.ReadInteger('Form_1','Durum',-99);
     if (forml<>-99)and(formt<>99) then form1.setbounds(forml,formt,formw,formh);

     forml2:=ayar.readinteger('Form_5','Sol',-99);
     formt2:=ayar.readinteger('Form_5','Ust',-99);
     formw2:=ayar.readinteger('Form_5','Genislik',-99);
     formh2:=ayar.readinteger('Form_5','Yukseklik',-99);
     if (forml2<>-99)and(formt2<>99) then form5.setbounds(forml2,formt2,formw2,formh2);

     form2.Left:=ayar.readinteger('Form_2','Sol',-99);
     form2.top:=ayar.readinteger('Form_2','Ust',-99);
     form2.width:=ayar.readinteger('Form_2','Genislik',-99);
     form2.height:=ayar.readinteger('Form_2','Yukseklik',-99);

     form5.RichEdit1.Font.Name:=ayar.ReadString('Form_5','Yazitipi','');
     form5.RichEdit1.Font.Size:=ayar.Readinteger('Form_5','Yazitipi_Size',-99);
     form5.RichEdit1.Font.color:=colortorgb(ayar.Readinteger('Form_5','Yazi_rengi',-99));
     form5.RichEdit1.Color:=colortorgb( ayar.readinteger('Form_5','Arkaplan_rengi',-99));
     form5.RichEdit1.Font.Style   := TFontStyles(Byte(ayar.ReadInteger('Form_5', 'Stil', Byte(form5.RichEdit1.Font.Style))));
     form5.RichEdit1.Font.CharSet := TFontCharSet(ayar.ReadInteger('Form_5', 'CharSet', form5.RichEdit1.Font.CharSet));
     form3.Label6.Color:=form5.RichEdit1.Color;
     form3.Label6.font.Color:=form5.RichEdit1.font.Color;

     form3.CheckBox1.Checked:=ayar.ReadBool('Form_3','Ustte',false);
 if (form3.CheckBox1.Checked) then begin
  SetWindowPos(Form2.handle, HWND_TOPMOST,Form2.Left, Form2.Top, Form2.Width, Form2.Height,0);
     end
   else
  SetWindowPos(Form2.handle, HWND_NOTOPMOST,Form2.Left, Form2.Top, Form2.Width, Form2.Height,0);
     form3.RadioGroup1.ItemIndex:=ayar.ReadInteger('Form_3','Etiket',0);
     form3.CheckBox3.Checked:=ayar.ReadBool('Form_3','Tasarim',false);
     form3.CheckBox4.Checked:=ayar.ReadBool('Form_3','Ipucu',false);
     form3.CheckBox5.Checked:=ayar.ReadBool('Form_3','Renkli',false);
     form3.CheckBox6.Checked:=ayar.ReadBool('Form_3','Ses',false);
     form3.CheckBox7.Checked:=ayar.ReadBool('Form_3','DerlemePenceresi',false);
     form3.CheckBox8.Checked:=ayar.ReadBool('Form_3','ExcelGorunur',false);
     form3.label12.Font.Color:=colortorgb(ayar.readinteger('Form_3','Olay_Arkaplan_rengi',-99));
     form3.label13.Font.Color:=colortorgb(ayar.readinteger('Form_3','Aciklama_Arkaplan_rengi',-99));
     form3.label18.Font.Color:=colortorgb(ayar.readinteger('Form_3','Metin_rengi',-99));
     Application.HintHidePause:=ayar.readInteger('Form_3','Ipucu_suresi',-99);
     Application.HintPause:=ayar.readInteger('Form_3','Ipucu_cikma_suresi',-99);
     Application.HintColor:=colortorgb( ayar.readinteger('Form_3','Ipucu_rengi',-99));
     screen.HintFont.Name:=ayar.ReadString('Form_3','Yazitipi','');
     screen.HintFont.Size:=ayar.Readinteger('Form_3','Yazitipi_Size',-99);
     screen.HintFont.Style:= TFontStyles(Byte(ayar.ReadInteger('Form_3', 'Stil', Byte(screen.HintFont.Style))));
     screen.HintFont.CharSet:= TFontCharSet(ayar.ReadInteger('Form_3', 'CharSet', screen.HintFont.CharSet));
     screen.HintFont.Color:=ayar.readinteger('Form_3','IpucuYaziRengi',colortorgb(screen.HintFont.Color));
     form2.Label1.Caption:=ayar.readString('Form_Olaylar','Sayisi','0');
     form1.Caption:=formc;
for i:=1 to strtoint(form2.Label1.Caption) do begin
        with form2.listview1 do begin
        ListItem:= items.Add;
        if ayar.ReadString('Form_Olaylar','NesneAdi'+inttostr(i),'')='' then
          break;
        ListItem.caption:=ayar.ReadString('Form_Olaylar','NesneAdi'+inttostr(i),'');
        ListItem.SubItems.add(ayar.ReadString('Form_Olaylar','NesneOlayi'+inttostr(i),''));
        ListItem.SubItems.add(ayar.ReadString('Form_Olaylar','Satir'+inttostr(i),''));
        end;
end;
form2.KalcDeikenler1.Checked:=ayar.ReadBool('Degiskenler','Kalici',false);
if form2.KalcDeikenler1.Checked then 
for i:=0 to ayar.ReadInteger('Degiskenler','Sayisi',-99)-1 do begin
        with form2.listview2 do begin
        ListItem:= items.Add;
        ListItem.caption:=ayar.ReadString('Degiskenler','DegiskenAdi'+inttostr(i),'');
        ListItem.SubItems.add(ayar.ReadString('Degiskenler','Degeri'+inttostr(i),''));
        end;
    end;

for i:=0 to ayar.ReadInteger('DurakNoktalari','Sayisi',-99)-1 do begin
        with form16.listview1 do begin
        ListItem:= items.Add;
        ListItem.caption:=ayar.ReadString('DurakNoktalari','SatirNo'+inttostr(i),'');
        ListItem.SubItems.add(ayar.ReadString('DurakNoktalari','Sarti'+inttostr(i),''));
        end;
    end;

     case formstate of
     0:windowstate:=wsNormal;
     1:windowstate:=wsmaximized;
     2:windowstate:=wsminimized;
     end;
     formstate:=ayar.ReadInteger('Form_5','Durum',-99);
     case formstate of
     0:form5.windowstate:=wsNormal;
     1:form5.windowstate:=wsmaximized;
     2:form5.windowstate:=wsminimized;
     end;

if  ayar.readInteger('Form_2','Dil',1) = 1 then begin
form2.rke1.Checked:=true;
form2.Turkcele(True);
end
else begin
form2.ngilizce1.Checked:=true;
form2.Turkcele(False);
end;

if ayar.readInteger('Form_9','Ozellestir',-99)=1 then
  begin
  form9.Varsaylan2.Checked:=true;
  form9.Seenek1.Checked:=false;
  form9.Seenek21.Checked:=false;
  form9.Seenek11.Checked:=false;
  form9.Seenek22.Checked:=false;
  form9.oku;
  end else
if ayar.readInteger('Form_9','Ozellestir',-99)=2 then
  begin
  form9.Varsaylan2.Checked:=false;
  form9.Seenek1.Checked:=true;
  form9.Seenek21.Checked:=false;
  form9.Seenek11.Checked:=true;
  form9.Seenek22.Checked:=false;
  form9.oku;
  end else
if ayar.readInteger('Form_9','Ozellestir',-99)=3 then
  begin
  form9.Varsaylan2.Checked:=false;
  form9.Seenek1.Checked:=false;
  form9.Seenek21.Checked:=true;
  form9.Seenek11.Checked:=false;
  form9.Seenek22.Checked:=true;
  form9.oku;
  end;
     ayar.Free;
end;

procedure TForm1.AyarYaz(dosyaadi:string);
var i:integer;
begin
ayar:=tinifile.create(dosyaadi);
ayar.WriteString('Form_1','Baslik',form1.caption);
ayar.WriteInteger('Form_1','Sol',form1.left);
ayar.WriteInteger('Form_1','Ust',form1.top);
ayar.WriteInteger('Form_1','Genislik',form1.Width);
ayar.WriteInteger('Form_1','Yukseklik',form1.Height);
ayar.WriteInteger('Form_1','Renk',form1.color);
ayar.WriteString('Form_1','Ipucu',form1.hint);
ayar.WriteString('Form_1','YazitipiAdi',form1.font.name);
ayar.WriteInteger('Form_1','YazitipiRengi',form1.font.color);
ayar.WriteInteger('Form_1','YazitipiBoyut',form1.font.size);
ayar.WriteInteger('Form_1','CharSet', form1.Font.CharSet);
ayar.WriteInteger('Form_1','Stil', Byte(form1.Font.Style));
ayar.WriteInteger('Form_2','Sol',form2.left);
ayar.WriteInteger('Form_2','Ust',form2.top);
ayar.WriteInteger('Form_2','Genislik',form2.width);
ayar.WriteInteger('Form_2','Yukseklik',form2.height);

if form2.rke1.Checked then
ayar.WriteInteger('Form_2','Dil',1)
else
ayar.WriteInteger('Form_2','Dil',2);

ayar.WriteInteger('Form_5','Sol',form5.left);
ayar.WriteInteger('Form_5','Ust',form5.top);
ayar.WriteInteger('Form_5','Genislik',form5.Width);
ayar.WriteInteger('Form_5','Yukseklik',form5.Height);
ayar.WriteInteger('Form_5','Sol',form5.left);
ayar.WriteInteger('Form_5','Ust',form5.top);
ayar.WriteInteger('Form_5','Genislik',form5.Width);
ayar.WriteInteger('Form_5','Yukseklik',form5.Height);
ayar.Writeinteger('Form_5','Arkaplan_rengi',colortorgb(form5.RichEdit1.Color));
ayar.WriteBool('Form_3','Ustte',form3.CheckBox1.Checked);
ayar.WriteInteger('Form_3','Etiket',form3.RadioGroup1.ItemIndex);
ayar.WriteBool('Form_3','Tasarim',form3.CheckBox3.Checked);
ayar.WriteBool('Form_3','Ipucu',form3.CheckBox4.Checked);
ayar.WriteBool('Form_3','Renkli',form3.CheckBox5.Checked);
ayar.WriteBool('Form_3','Ses',form3.CheckBox6.Checked);
ayar.WriteBool('Form_3','DerlemePenceresi',form3.CheckBox7.Checked);
ayar.WriteInteger('Form_5','Sol',form5.left);
ayar.WriteInteger('Form_5','Ust',form5.top);
ayar.WriteInteger('Form_5','Genislik',form5.Width);
ayar.WriteInteger('Form_5','Yukseklik',form5.Height);
ayar.Writeinteger('Form_5','Arkaplan_rengi',colortorgb(form5.richedit1.Color));
ayar.WriteString('Form_5','Yazitipi',form5.richedit1.Font.Name);
ayar.Writeinteger('Form_5','Yazitipi_Size',form5.richedit1.Font.size);
ayar.Writeinteger('Form_5','Yazi_rengi',colortorgb(form5.richedit1.Font.Color));
ayar.WriteInteger('Form_5','CharSet', form5.RichEdit1.Font.CharSet);
ayar.WriteInteger('Form_5','Stil', Byte(form5.RichEdit1.Font.Style));
ayar.WriteString('Form_3','Yazitipi',screen.HintFont.Name);
ayar.Writeinteger('Form_3','Yazitipi_Size',screen.HintFont.size);
ayar.WriteInteger('Form_3','CharSet', screen.HintFont.CharSet);
ayar.WriteInteger('Form_3','Stil', Byte(screen.HintFont.Style));
ayar.Writeinteger('Form_3','Ipucu_rengi',colortorgb(Application.HintColor));
ayar.Writeinteger('Form_3','IpucuYaziRengi',colortorgb(screen.HintFont.Color));
ayar.Writeinteger('Form_3','Ipucu_suresi',Application.HintHidePause);
ayar.Writeinteger('Form_3','Ipucu_cikma_suresi',Application.HintPause);
ayar.writeinteger('Form_3','Olay_Arkaplan_rengi',form3.label12.Font.Color);
ayar.writeinteger('Form_3','Metin_rengi',form3.label18.Font.Color);
ayar.writeinteger('Form_3','Aciklama_Arkaplan_rengi',form3.label13.Font.Color);

if form9.Varsaylan2.Checked then ayar.WriteInteger('Form_9','Ozellestir',1);
if form9.Seenek1.Checked then ayar.WriteInteger('Form_9','Ozellestir',2);
if form9.Seenek21.Checked then ayar.WriteInteger('Form_9','Ozellestir',3);

for i:=1 to strtoint(form2.Label1.Caption) do begin
        with form2.listview1 do begin
        try
        ListItem:= items.Item[i-1];
        if ListItem.caption='' then break;
        Except
         on E: Exception do break;
         on EStringListError do break;
        else
         break;
        end;
        ayar.WriteString('Form_Olaylar','NesneAdi'+inttostr(i),ListItem.caption);
        ayar.WriteString('Form_Olaylar','NesneOlayi'+inttostr(i),ListItem.SubItems[0]);
        ayar.WriteString('Form_Olaylar','Satir'+inttostr(i),ListItem.SubItems[1]);
        end;
     end;
ayar.WriteString('Form_Olaylar','Sayisi',form2.Label1.Caption);
ayar.WriteBool('Degiskenler','Kalici',form2.KalcDeikenler1.Checked);
 if form2.KalcDeikenler1.Checked then begin
  for i:=0 to form2.listview2.Items.Count-1 do begin
        with form2.listview2 do begin
        try
        ListItem:= items.Item[i];
        if ListItem.caption='' then break;
        Except
         on E: Exception do break;
         on EStringListError do break;
        else
         break;
        end;
        ayar.WriteString('Degiskenler','DegiskenAdi'+inttostr(i),ListItem.caption);
        ayar.WriteString('Degiskenler','Degeri'+inttostr(i),ListItem.SubItems[0]);
        end;
    end;
   ayar.WriteInteger('Degiskenler','Sayisi',form2.listview2.Items.Count);
  end;

  for i:=0 to form16.listview1.Items.Count-1 do begin
        with form16.listview1 do begin
        try
        ListItem:= items.Item[i];
        if (ListItem.caption='-') then break;
        Except
         on E: Exception do break;
         on EStringListError do break;
        else
         break;
        end;
        ayar.WriteString('DurakNoktalari','SatirNo'+inttostr(i),ListItem.caption);
        ayar.WriteString('DurakNoktalari','Sarti'+inttostr(i),ListItem.SubItems[0]);
        end;
    end;
   ayar.WriteInteger('DurakNoktalari','Sayisi',form16.listview1.Items.Count);
case WindowState of
wsnormal:ayar.WriteInteger('Form_1','Durum',0);
wsmaximized:ayar.WriteInteger('Form_1','Durum',1);
wsminimized:ayar.WriteInteger('Form_1','Durum',2);
end;
case form5.WindowState of
wsnormal:ayar.WriteInteger('Form_5','Durum',0);
wsmaximized:ayar.WriteInteger('Form_5','Durum',1);
wsminimized:ayar.WriteInteger('Form_5','Durum',2);
end;
 ayar.Free;
end;

function TForm1.ada_ayikla(met:string):string;  //son rakamlarý siliyoruz
var i:integer;sonuc:string;
begin
sonuc:='';
for i:=1 to length(met) do
   if met[i] in ['a'..'z','A'..'Z'] then
     sonuc:=sonuc+met[i];
ada_ayikla:=sonuc;
end;

function TForm1.no_ayikla(met:string):string;  //son rakamlarý alýyoruz
var i:integer;sonuc:string;
begin
sonuc:='';
for i:=1 to length(met) do
   if met[i] in ['0'..'9'] then
     sonuc:=sonuc+met[i];
no_ayikla:=sonuc;
end;

procedure TForm1.nesne_sayisi;
var i:integer;
    Temp: TComponent;
begin
butt:=0;labe:=0;edit:=0;check:=0;list:=0;combo:=0;redit:=0;timer:=0;tablo:=0;ExcelTablo:=0;
if Form1.ComponentCount<>0 then begin
for i:=0 to Form1.ComponentCount-1 do begin
   Temp:=Components[i];
   if Temp is TBitBtn then
    begin
     if lowercase(ada_ayikla((temp as TBitbtn).name))=lowercase(form2.komutlistesi('Dugme')) then inc(butt) else
     if lowercase(ada_ayikla((temp as TBitbtn).name))=lowercase(form2.komutlistesi('Zamanlayici')) then inc(timer) else
     if lowercase(ada_ayikla((temp as TBitbtn).name))=lowercase(form2.komutlistesi('Tablo')) then inc(tablo);
     if lowercase(ada_ayikla((temp as TBitbtn).name))=lowercase(form2.komutlistesi('ExcelTablosu')) then inc(ExcelTablo);
    end;
   if Temp is TStatictext then  inc(labe);
   if Temp is TEdit then  inc(edit);
   if Temp is TCheckbox then  inc(check);
   if Temp is TListBox then  inc(list);
   if Temp is TCombobox then  inc(combo);
   if Temp is TRichEdit then  inc(redit);
end;
end;
form2.grid;
 form2.ComboBox1.items.Clear; //nesne listesi güncelleniyor
 for i:=0 to form1.ComponentCount-1 do
 begin
  form2.ComboBox1.Items.Add(Components[i].Name);
 end;
 form2.ComboBox1.Items.Add(form2.komutlistesi('Form'));
end;

procedure TForm1.metin_cikisi(Sender: TObject);
//var temp:TEdit;
begin
{if form2.ToolButton7.enabled then begin //tasarým aný ise
temp:=sender as TEdit;
form2.ComboBox1.Text:=temp.Name;
form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
end;}
end;

procedure TForm1.nesne_giris (Sender: TObject);
begin
if form2.ToolButton9.enabled then begin
        form2.ComboBox1.Text:=ActiveControl.Name;
        form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
        form2.gride_yaz;
//        form1.ActiveControl:=nil;
end;
end;

procedure TForm1.tusbasimi (Sender: TObject; var Key: Char);
//var temp:TEdit;
begin
{ if form2.ToolButton9.enabled then begin //tasarým aný ise
temp:=sender as TEdit;
//if (key<>#13)and(key<>#8) then caption:=temp.Text+key; //geliþtirilmeli
form2.StringGrid1.Cells[1,1]:=temp.Text;
form2.ComboBox1.Text:=temp.Name;
form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
end;}
end;

procedure TForm1.TimerTiklama (Sender: TObject);
var gd:TTimer;i:integer;
begin
if (sender is TTimer)and(form2.ToolButton7.enabled) then
begin
       for i:=1 to strtoint(form2.Label1.Caption) do begin
//        ListItem:=form2.ListView1.FindCaption(-1,lowercase(gd.Name),false,false,false);
        with form2.listview1 do begin
        ListItem:= items.Item[i-1];
        if ListItem.caption='' then break;
        gd := sender as TTimer;
        if (lowercase(ListItem.SubItems[0])=lowercase(form2.komutlistesi('Tiklaninca')))and
           (lowercase(ListItem.caption)+'gercek'=lowercase(gd.Name)) then
         begin
           form2.calistir(strtoint(ListItem.SubItems[1]),'Form');  //iste týklandý
           break;
         end;
        end;
       end;
end;
end;

procedure TForm1.ciftTiklama (Sender: TObject); //hazýr kod ekleme kýsmý 
begin
//
end;

procedure TForm1.degistiginde (Sender: TObject); //Memo, Combo ve Edit'in olayý
var nesneadi:string;
begin

if sender is TRichEdit then  nesneadi:=(sender as TRichEdit).Name else
if sender is TComboBox then  nesneadi:=(sender as TComboBox).Name else
if sender is TEdit then      nesneadi:=(sender as TEdit).Name else exit;
//diðer nesneler olamaz zaten

if form2.ToolButton7.enabled then //Çalýþma Aný ise
begin
     if Form2.ListView1.FindCaption(-1,lowercase(nesneadi),false,false,false)<>NIL then begin
       ListItem:= form2.ListView1.FindCaption(-1,lowercase(nesneadi),false,false,false);
       if (lowercase(ListItem.SubItems[0])=lowercase(form2.komutlistesi('Tiklaninca')))and
           (lowercase(ListItem.caption)=lowercase(nesneadi)) then
           form2.calistir(strtoint(ListItem.SubItems[1]),'Form');  //iste týklandý
       end;
end
else
        begin //tasarým aný ise
        form2.ComboBox1.Text:=nesneadi;
        form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
        form2.gride_yaz;
        end;
end;

procedure TForm1.tiklama (Sender: TObject); //iþte týklanma olay atamalarý burada Grid2'den geliyor
var nesneadi:string;
begin

if sender is TBitBtn then       nesneadi:=(sender as TBitbtn).Name else
if sender is TStaticText then   nesneadi:=(sender as TStaticText).Name else
if sender is TListBox then      nesneadi:=(sender as TListBox).Name else
if sender is TCheckBox then     nesneadi:=(sender as TCheckBox).Name else exit;
//diðer nesneler olamaz zaten
if form2.ToolButton7.enabled then //Çalýþma Aný ise
begin
     if Form2.ListView1.FindCaption(-1,lowercase(nesneadi),false,false,false)<>NIL then begin
       ListItem:= form2.ListView1.FindCaption(-1,lowercase(nesneadi),false,false,false);
       if (lowercase(ListItem.SubItems[0])=lowercase(form2.komutlistesi('Tiklaninca')))and
           (lowercase(ListItem.caption)=lowercase(nesneadi)) then
 {          begin
            derlemeThread:=TDerleme.create(strtoint(ListItem.SubItems[1]),'Form');
            derlemeAktif:=true;
           end;   }
           form2.calistir(strtoint(ListItem.SubItems[1]),'Form');  //iste týklandý
       end;
end
else
        begin //tasarým aný ise
        form2.ComboBox1.Text:=nesneadi;
        form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
        form2.gride_yaz;
        end;
end;

procedure Tform1.surukleCombo(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var acilir: TCombobox;
begin
if form2.ToolButton9.enabled then begin //tasarým aný ise
winprocs.ReleaseCapture;
 if sender is TCombobox then  begin
        acilir := sender as TCombobox;
        acilir.Perform( WM_SysCommand, SC_DragMove, 0 );
        form2.ComboBox1.Text:=(sender as TCombobox).Name;
        form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
        form2.gride_yaz;
 end;
end;
end;

procedure TForm1.surukle(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    gd:TBitBtn;gm:TEdit;ge:TStatictext;
    onay:TCheckBox; liste: TListBox; yazi :TRichEdit;

begin
if (form2.ToolButton9.enabled)and(Button = mbLeft) then begin //tasarým aný ise
//ReleaseCapture;
   WinProcs.ReleaseCapture;

 if sender is TShape then  begin
//        if Components[componentcount-1] is TShape then Components[componentcount-1].free;
//        basx:=y;basy:=x;
//        form2.ComboBox1.Text:='Form';
//        form2.grid;
//        exit;
 end;

 if sender is TBitBtn then  begin
        gd := sender as TBitBtn;
        form2.ComboBox1.Text:=gd.Name;
        form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));

     if ada_ayikla((gd as TBitbtn).name)=form2.komutlistesi('Dugme') then
      begin
    if ( X >= gd.Width - sizeBorder ) And
       NOT(( Y <= sizeBorder )  or ( Y >= gd.Height -sizeBorder ))  then
       gd.Perform( WM_SysCommand, sc_SizeRight , 0 )
    else
    if Not( ( X <= sizeBorder ) or ( X >= gd.Width -sizeBorder ) ) And
       ( Y <= sizeBorder )  then
       gd.Perform( WM_SysCommand, sc_SizeTop , 0 )
    else
    if ( X <= sizeBorder ) And ( Y <= sizeBorder )  then
       gd.Perform( WM_SysCommand, sc_SizeTopLeft, 0 )
    else
    if ( X >= gd.Width -sizeBorder ) and ( Y <= sizeBorder ) then
       gd.Perform( WM_SysCommand, sc_SizeTopRight , 0 )
    else
    if Not( ( X <= sizeBorder ) or ( X >= gd.Width -sizeBorder ) ) And
       ( Y >= gd.Height - sizeBorder )  then
       gd.Perform( WM_SysCommand, sc_SizeBottom , 0 )
    else
    if ( Y >= gd.Height -sizeBorder )  And ( X <= sizeBorder )  then
       gd.Perform( WM_SysCommand, sc_SizeBottomLeft , 0 )
    else
    if ( Y >= gd.Height -sizeBorder ) and ( X >= gd.Width - sizeBorder ) then
       gd.Perform( WM_SysCommand, sc_SizeBottomRight , 0 )
    else
    if Not( ( Y <= sizeBorder ) or ( Y >= gd.Height -sizeBorder ) ) And
       ( X <= sizeBorder )  then
       gd.Perform( WM_SysCommand, sc_SizeLeft , 0 )
    else
    begin
       gd.Perform( WM_SysCommand, SC_DragMove, 0 );       //dugme
    end;
    end else gd.Perform( WM_SysCommand, SC_DragMove, 0 ); //timer, tablo ve Exceltablo
 end else
 if sender is TStaticText then  begin
        ge := sender as TStaticText;
        form2.ComboBox1.Text:=ge.Name;
        form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
    if ( X >= ge.Width - sizeBorder ) And
       NOT(( Y <= sizeBorder )  or ( Y >= ge.Height -sizeBorder ))  then
       ge.Perform( WM_SysCommand, sc_SizeRight , 0 )
    else
    if Not( ( X <= sizeBorder ) or ( X >= ge.Width -sizeBorder ) ) And
       ( Y <= sizeBorder )  then
       ge.Perform( WM_SysCommand, sc_SizeTop , 0 )
    else
    if ( X <= sizeBorder ) And ( Y <= sizeBorder )  then
       ge.Perform( WM_SysCommand, sc_SizeTopLeft, 0 )
    else
    if ( X >= ge.Width -sizeBorder ) and ( Y <= sizeBorder ) then
       ge.Perform( WM_SysCommand, sc_SizeTopRight , 0 )
    else
    if Not( ( X <= sizeBorder ) or ( X >= ge.Width -sizeBorder ) ) And
       ( Y >= ge.Height - sizeBorder )  then
       ge.Perform( WM_SysCommand, sc_SizeBottom , 0 )
    else
    if ( Y >= ge.Height -sizeBorder )  And ( X <= sizeBorder )  then
       ge.Perform( WM_SysCommand, sc_SizeBottomLeft , 0 )
    else
    if ( Y >= ge.Height -sizeBorder ) and ( X >= ge.Width - sizeBorder ) then
       ge.Perform( WM_SysCommand, sc_SizeBottomRight , 0 )
    else
    if Not( ( Y <= sizeBorder ) or ( Y >= ge.Height -sizeBorder ) ) And
       ( X <= sizeBorder )  then
       ge.Perform( WM_SysCommand, sc_SizeLeft , 0 )
    else
    begin
       ge.Perform( WM_SysCommand, SC_DragMove, 0 );
    end;
 end else
 if sender is TEdit then  begin
        gm := sender as TEdit;
        form2.ComboBox1.Text:=gm.Name;
        form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
    if ( X >= gm.Width - sizeBorder) And
       NOT(( Y <= sizeBorder )  or ( Y >= gm.Height -sizeBorder ))  then
       gm.Perform( WM_SysCommand, sc_SizeRight , 0 )
    else
    if Not( ( X <= sizeBorder ) or ( X >= gm.Width -sizeBorder ) ) And
       ( Y <= sizeBorder )  then
       gm.Perform( WM_SysCommand, sc_SizeTop , 0 )
    else
    if ( X <= sizeBorder ) And ( Y <= sizeBorder )  then
       gm.Perform( WM_SysCommand, sc_SizeTopLeft, 0 )
    else
    if ( X >= gm.Width -sizeBorder ) and ( Y <= sizeBorder ) then
       gm.Perform( WM_SysCommand, sc_SizeTopRight , 0 )
    else
    if Not( ( X <= sizeBorder ) or ( X >= gm.Width -sizeBorder ) ) And
       ( Y >= gm.Height - sizeBorder )  then
       gm.Perform( WM_SysCommand, sc_SizeBottom , 0 )
    else
    if ( Y >= gm.Height -sizeBorder )  And ( X <= sizeBorder )  then
       gm.Perform( WM_SysCommand, sc_SizeBottomLeft , 0 )
    else
    if ( Y >= gm.Height -sizeBorder ) and ( X >= gm.Width - sizeBorder ) then
       gm.Perform( WM_SysCommand, sc_SizeBottomRight , 0 )
    else
    if Not( ( Y <= sizeBorder ) or ( Y >= gm.Height -sizeBorder ) ) And
       ( X <= sizeBorder )  then
       gm.Perform( WM_SysCommand, sc_SizeLeft , 0 )
    else
    begin
       gm.Perform( WM_SysCommand, SC_DragMove, 0 );
    end;
 end else
 if sender is TCheckbox then  begin
        onay:= sender as Tcheckbox;
        form2.ComboBox1.Text:=onay.Name;
        form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
    if ( X >= onay.Width - sizeBorder ) And
       NOT(( Y <= sizeBorder )  or ( Y >= onay.Height -sizeBorder ))  then
       onay.Perform( WM_SysCommand, sc_SizeRight , 0 )
    else
    if Not( ( X <= sizeBorder ) or ( X >= onay.Width -sizeBorder ) ) And
       ( Y <= sizeBorder )  then
       onay.Perform( WM_SysCommand, sc_SizeTop , 0 )
    else
    if ( X <= sizeBorder ) And ( Y <= sizeBorder )  then
       onay.Perform( WM_SysCommand, sc_SizeTopLeft, 0 )
    else
    if ( X >= onay.Width -sizeBorder ) and ( Y <= sizeBorder ) then
       onay.Perform( WM_SysCommand, sc_SizeTopRight , 0 )
    else
    if Not( ( X <= sizeBorder ) or ( X >= onay.Width -sizeBorder ) ) And
       ( Y >= onay.Height - sizeBorder )  then
       onay.Perform( WM_SysCommand, sc_SizeBottom , 0 )
    else
    if ( Y >= onay.Height -sizeBorder )  And ( X <= sizeBorder )  then
       onay.Perform( WM_SysCommand, sc_SizeBottomLeft , 0 )
    else
    if ( Y >= onay.Height -sizeBorder ) and ( X >= onay.Width - sizeBorder ) then
       onay.Perform( WM_SysCommand, sc_SizeBottomRight , 0 )
    else
    if Not( ( Y <= sizeBorder ) or ( Y >= onay.Height -sizeBorder ) ) And
       ( X <= sizeBorder )  then
       onay.Perform( WM_SysCommand, sc_SizeLeft , 0 )
    else
    begin
       onay.Perform( WM_SysCommand, SC_DragMove, 0 );
    end;
 end else
 if sender is TListBox then  begin
        liste := sender as Tlistbox;
        form2.ComboBox1.Text:=liste.Name;
        form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
    if ( X >= liste.Width - sizeBorder ) And
       NOT(( Y <= sizeBorder )  or ( Y >= liste.Height -sizeBorder ))  then
       liste.Perform( WM_SysCommand, sc_SizeRight , 0 )
    else
    if Not( ( X <= sizeBorder ) or ( X >= liste.Width -sizeBorder ) ) And
       ( Y <= sizeBorder )  then
       liste.Perform( WM_SysCommand, sc_SizeTop , 0 )
    else
    if ( X <= sizeBorder ) And ( Y <= sizeBorder )  then
       liste.Perform( WM_SysCommand, sc_SizeTopLeft, 0 )
    else
    if ( X >= liste.Width -sizeBorder ) and ( Y <= sizeBorder ) then
       liste.Perform( WM_SysCommand, sc_SizeTopRight , 0 )
    else
    if Not( ( X <= sizeBorder ) or ( X >= liste.Width -sizeBorder ) ) And
       ( Y >= liste.Height - sizeBorder )  then
       liste.Perform( WM_SysCommand, sc_SizeBottom , 0 )
    else
    if ( Y >= liste.Height -sizeBorder )  And ( X <= sizeBorder )  then
       liste.Perform( WM_SysCommand, sc_SizeBottomLeft , 0 )
    else
    if ( Y >= liste.Height -sizeBorder ) and ( X >= liste.Width - sizeBorder ) then
       liste.Perform( WM_SysCommand, sc_SizeBottomRight , 0 )
    else
    if Not( ( Y <= sizeBorder ) or ( Y >= liste.Height -sizeBorder ) ) And
       ( X <= sizeBorder )  then
       liste.Perform( WM_SysCommand, sc_SizeLeft , 0 )
    else
    begin
       liste.Perform( WM_SysCommand, SC_DragMove, 0 );
    end;
 end else
 if sender is TRichEdit then  begin
        yazi := sender as TRichEdit;
        form2.ComboBox1.Text:=yazi.Name;
        form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
    if ( X >= yazi.Width - sizeBorder ) And
       NOT(( Y <= sizeBorder )  or ( Y >= yazi.Height -sizeBorder))  then
       yazi.Perform( WM_SysCommand, sc_SizeRight , 0 )
    else
    if Not( ( X <= sizeBorder ) or ( X >= yazi.Width -sizeBorder) ) And
       ( Y <= sizeBorder )  then
       yazi.Perform( WM_SysCommand, sc_SizeTop , 0 )
    else
    if ( X <= sizeBorder ) And ( Y <= sizeBorder )  then
       yazi.Perform( WM_SysCommand, sc_SizeTopLeft, 0 )
    else
    if ( X >= yazi.Width -sizeBorder ) and ( Y <= sizeBorder ) then
       yazi.Perform( WM_SysCommand, sc_SizeTopRight , 0 )
    else
    if Not( ( X <= sizeBorder ) or ( X >= yazi.Width -sizeBorder ) ) And
       ( Y >= yazi.Height - sizeBorder )  then
       yazi.Perform( WM_SysCommand, sc_SizeBottom , 0 )
    else
    if ( Y >= yazi.Height -sizeBorder )  And ( X <= sizeBorder )  then
       yazi.Perform( WM_SysCommand, sc_SizeBottomLeft , 0 )
    else
    if ( Y >= yazi.Height -sizeBorder ) and ( X >= yazi.Width - sizeBorder ) then
       yazi.Perform( WM_SysCommand, sc_SizeBottomRight , 0 )
    else
    if Not( ( Y <= sizeBorder ) or ( Y >= yazi.Height -sizeBorder ) ) And
       ( X <= sizeBorder )  then
       yazi.Perform( WM_SysCommand, sc_SizeLeft , 0 )
    else
    begin
       yazi.Perform( WM_SysCommand, SC_DragMove, 0 );
    end;
 end;
form2.gride_yaz;
end;
end;

procedure TForm1.nesneMouseMove( Sender: TObject; Shift: TShiftState; X,
                          Y: Integer);
var gd:TBitBtn;gm:TEdit;ge:TStatictext;
    gc:TCheckBox; gl: TListBox; gr :TRichEdit;

begin

if sender is TBitBtn then       gd := sender as TBitBtn;
if sender is TEdit then         gm := sender as TEdit;
if sender is TStaticText then   ge := sender as TStaticText;
if sender is TCheckBox then     gc := sender as TCheckBox;
if sender is TListBox then      gl := sender as TListBox;
if sender is TRichEdit then     gr := sender as TRichEdit;

if (form2.ToolButton9.enabled) then begin //tasarým aný ise
 if sender is TBitBtn then  begin
  form2.StatusBar1.SimpleText:=gd.Name+format(', %d x %d',[gd.width,gd.height]);
  if ada_ayikla(gd.name)=form2.komutlistesi('Dugme') then
   if ( X <= sizeBorder ) or ( X >= gd.Width -sizeBorder ) then
   begin
      if ( Y >= gd.Height - sizeBorder ) then
      begin
        if ( X >= gd.Width - sizeBorder ) then
          gd.Cursor := crSizeNWSE
        else
          gd.Cursor := crSizeNESW;
      end
      else
      if ( Y <= sizeBorder ) then
      begin
        if ( X >= gd.Width -sizeBorder ) then
          gd.Cursor := crSizeNESW
        else
          gd.Cursor := crSizeNWSE;
      end
      else
        gd.Cursor := crSizeWE;
   end
   else
   if ( Y <= sizeBorder ) or ( Y >= gd.Height - sizeBorder ) then
   begin
      gd.Cursor := crSizeNS;
   end
   else
      gd.Cursor := crDefault;
 end else
 if sender is TEdit then  begin
  form2.StatusBar1.SimpleText:=gm.Name+format(', %d x %d',[gm.width,gm.height]);
   if ( X <= sizeBorder ) or ( X >= gm.Width -sizeBorder ) then
   begin
      if ( Y >= gm.Height - sizeBorder ) then
      begin
        if ( X >= gm.Width - sizeBorder ) then
          gm.Cursor := crSizeNWSE
        else
          gm.Cursor := crSizeNESW;
      end
      else
      if ( Y <= sizeBorder ) then
      begin
        if ( X >= gm.Width -sizeBorder ) then
          gm.Cursor := crSizeNESW
        else
          gm.Cursor := crSizeNWSE;
      end
      else
        gm.Cursor := crSizeWE;
   end
   else
   if ( Y <= sizeBorder ) or ( Y >= gm.Height - sizeBorder ) then
   begin
      gm.Cursor := crSizeNS;
   end
   else
      gm.Cursor := crDefault;
 end else
 if sender is TStaticText then  begin
  form2.StatusBar1.SimpleText:=ge.Name+format(', %d x %d',[ge.width,ge.height]);
   if ( X <= sizeBorder ) or ( X >= ge.Width -sizeBorder ) then
   begin
      if ( Y >= ge.Height - sizeBorder ) then
      begin
        if ( X >= ge.Width - sizeBorder ) then
          ge.Cursor := crSizeNWSE
        else
          ge.Cursor := crSizeNESW;
      end
      else
      if ( Y <= sizeBorder ) then
      begin
        if ( X >= ge.Width -sizeBorder ) then
          ge.Cursor := crSizeNESW
        else
          ge.Cursor := crSizeNWSE;
      end
      else
        ge.Cursor := crSizeWE;
   end
   else
   if ( Y <= sizeBorder ) or ( Y >= ge.Height - sizeBorder ) then
   begin
      ge.Cursor := crSizeNS;
   end
   else
      ge.Cursor := crDefault;
 end else
 if sender is TCheckBox then  begin
  form2.StatusBar1.SimpleText:=gc.Name+format(', %d x %d',[gc.width,gc.height]);
   if ( X <= sizeBorder ) or ( X >= gc.Width -sizeBorder ) then
   begin
      if ( Y >= gc.Height - sizeBorder ) then
      begin
        if ( X >= gc.Width - sizeBorder ) then
          gc.Cursor := crSizeNWSE
        else
          gc.Cursor := crSizeNESW;
      end
      else
      if ( Y <= sizeBorder ) then
      begin
        if ( X >= gc.Width -sizeBorder ) then
          gc.Cursor := crSizeNESW
        else
          gc.Cursor := crSizeNWSE;
      end
      else
        gc.Cursor := crSizeWE;
   end
   else
   if ( Y <= sizeBorder ) or ( Y >= gc.Height - sizeBorder ) then
   begin
      gc.Cursor := crSizeNS;
   end
   else
      gc.Cursor := crDefault;
 end else
 if sender is TListBox then  begin
  form2.StatusBar1.SimpleText:=gl.Name+format(', %d x %d',[gl.width,gl.height]);
   if ( X <= sizeBorder ) or ( X >= gl.Width -sizeBorder ) then
   begin
      if ( Y >= gl.Height - sizeBorder ) then
      begin
        if ( X >= gl.Width - sizeBorder ) then
          gl.Cursor := crSizeNWSE
        else
          gl.Cursor := crSizeNESW;
      end
      else
      if ( Y <= sizeBorder ) then
      begin
        if ( X >= gl.Width -sizeBorder ) then
          gl.Cursor := crSizeNESW
        else
          gl.Cursor := crSizeNWSE;
      end
      else
        gl.Cursor := crSizeWE;
   end
   else
   if ( Y <= sizeBorder ) or ( Y >= gl.Height - sizeBorder ) then
   begin
      gl.Cursor := crSizeNS;
   end
   else
      gl.Cursor := crDefault;
 end else
 if sender is TRichEdit then  begin
  form2.StatusBar1.SimpleText:=gr.Name+format(', %d x %d',[gr.width,gr.height]);
   if ( X <= sizeBorder ) or ( X >= gr.Width -sizeBorder ) then
   begin
      if ( Y >= gr.Height - sizeBorder ) then
      begin
        if ( X >= gr.Width - sizeBorder ) then
          gr.Cursor := crSizeNWSE
        else
          gr.Cursor := crSizeNESW;
      end
      else
      if ( Y <= sizeBorder ) then
      begin
        if ( X >= gr.Width -sizeBorder ) then
          gr.Cursor := crSizeNESW
        else
          gr.Cursor := crSizeNWSE;
      end
      else
        gr.Cursor := crSizeWE;
   end
   else
   if ( Y <= sizeBorder ) or ( Y >= gr.Height - sizeBorder ) then
   begin
      gr.Cursor := crSizeNS;
   end
   else
      gr.Cursor := crDefault;
 end;
 end
 else begin
if sender is TBitBtn then       gd.Cursor:=crDefault;
if sender is TEdit then         gm.Cursor:=crDefault;
if sender is TStaticText then   ge.Cursor:=crDefault;
if sender is TCheckBox then     gc.Cursor:=crDefault;
if sender is TListBox then      gl.Cursor:=crDefault;
if sender is TRichEdit then     gr.Cursor:=crDefault;
 end;

end;

procedure TForm1.geriyeYolla;
begin
if FindComponent(form2.ComboBox1.Text) is TBitBtn then
  TBitBtn(FindComponent(form2.ComboBox1.Text)).SendToBack
  else
if FindComponent(form2.ComboBox1.Text) is TEdit then
  TEdit(FindComponent(form2.ComboBox1.Text)).SendToBack
  else
if FindComponent(form2.ComboBox1.Text) is TStaticText then
  TStaticText(FindComponent(form2.ComboBox1.Text)).SendToBack
  else
if FindComponent(form2.ComboBox1.Text) is TCheckBox then
  TCheckBox(FindComponent(form2.ComboBox1.Text)).SendToBack
  else
if FindComponent(form2.ComboBox1.Text) is TListBox then
  TListBox(FindComponent(form2.ComboBox1.Text)).SendToBack
  else
if FindComponent(form2.ComboBox1.Text) is TRichEdit then
  TRichEdit(FindComponent(form2.ComboBox1.Text)).SendToBack
  else
if FindComponent(form2.ComboBox1.Text) is TCombobox then
  TCombobox(FindComponent(form2.ComboBox1.Text)).SendToBack;
end;

procedure TForm1.oneGetir;
begin
if FindComponent(form2.ComboBox1.Text) is TBitBtn then
  TBitBtn(FindComponent(form2.ComboBox1.Text)).BringToFront
  else
if FindComponent(form2.ComboBox1.Text) is TEdit then
  TEdit(FindComponent(form2.ComboBox1.Text)).BringToFront
  else
if FindComponent(form2.ComboBox1.Text) is TStaticText then
  TStaticText(FindComponent(form2.ComboBox1.Text)).BringToFront
  else
if FindComponent(form2.ComboBox1.Text) is TCheckBox then
  TCheckBox(FindComponent(form2.ComboBox1.Text)).BringToFront
  else
if FindComponent(form2.ComboBox1.Text) is TListBox then
  TListBox(FindComponent(form2.ComboBox1.Text)).BringToFront
  else
if FindComponent(form2.ComboBox1.Text) is TRichEdit then
  TRichEdit(FindComponent(form2.ComboBox1.Text)).BringToFront
  else
if FindComponent(form2.ComboBox1.Text) is TCombobox then
  TCombobox(FindComponent(form2.ComboBox1.Text)).BringToFront;
end;

function bos_nesne_bul(tip:string):integer; //kesme gibi iþlemlerde boþalan nesne numaralarý bulunur
var i,j:integer;a:array[0..maxNesne]of integer; //1000 adet belli tipte nesne olsa
    temp:TComponent;ara:integer;bul:boolean;
begin
ara:=0;
    for i:=0 to form1.ComponentCount-2 do begin
      temp:=form1.Components[i];
      if (lowercase(temp.ClassName) = lowercase(tip)) then begin
       inc(ara);
       a[i]:=strtoint(form1.no_ayikla(temp.Name));
      end;
    end;
   for j:=1 to ara do begin //ikinci taramada j 'ye göre karþýlaþtýrýlýr
   bul:=false;
    for i:=0 to form1.ComponentCount-2 do begin
      if  a[i]=j then begin
        bul:=true;
        break;
      end;
     end;
   if bul=false then
     begin
      bos_nesne_bul:=j;
      exit;
     end;
   end;
if ara=0 then bos_nesne_bul:=1 else
 bos_nesne_bul:=j;
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   dugmemiz: TBitBtn;Etiket:TStatictext;Metin:TEdit;
   onay:TCheckBox; liste: TListBox; acilir: TCombobox ; yazi :TRichEdit;
   basili:byte;gecici:TComponent;
   key:word;shiftim:TShiftState;
   yuvarX,yuvarY:integer;
begin
if form2.ToolButton9.enabled then begin //sadece tasarýmda gerekli
basx:=x; //seçimin baþlangýcý
basy:=y;
   if Componentcount<>0 then
    begin
     gecici:=Components[componentcount-1];
      //secimi tekrar aktif etmek için shape nesnesini siliyoruz
    if gecici is TShape then gecici.free;
    end;
if (ssLeft in shift)and(form2.ToolButton9.enabled) then begin
basili:=255;
if form2.ToolButton1.Down=false then

if form2.ToolButton8.Down then basili:=7; //RichEdit
if form2.ToolButton10.Down then basili:=5; //list
if form2.ToolButton6.Down then basili:=6; //combo
if form2.ToolButton13.Down then basili:=4; //check
if form2.ToolButton14.Down then basili:=8; //timer
if form2.ToolButton17.Down then basili:=9; //table
if form2.ToolButton18.Down then basili:=10; //Excel

if form2.ToolButton2.Down then basili:=2; //metin
if form2.ToolButton3.Down then basili:=3; //düðme
if form2.ToolButton4.Down then basili:=1; //etiket

        if form3.CheckBox10.Checked then begin
                yuvarX:=x-x mod form3.SpinEdit2.Value;
                yuvarY:=y-y mod form3.SpinEdit2.Value;;
        end
        else
        begin
                yuvarX:=x;
                yuvarY:=y;
        end;

case basili of
1: begin
        Dugmemiz := TBitBtn.Create (self);           //yeni düðme oluþturuldu...
      	Dugmemiz.Parent:= self;
       	Dugmemiz.Top:= yuvarY;
     	Dugmemiz.Left:= yuvarX;
        Dugmemiz.ShowHint:=true;
//        dugmemiz.TabStop:=false;
        inc(butt);

      if form1.ComponentCount<>1 then begin
         Dugmemiz.Name:=form2.komutlistesi('Dugme')+inttostr(bos_nesne_bul('TBitBtn'));
       	 Dugmemiz.Caption:=form2.komutlistesi('Dugme')+ no_ayikla(Dugmemiz.name);
      end
      else begin
         Dugmemiz.Name:=form2.komutlistesi('Dugme')+inttostr(butt);
       	 Dugmemiz.Caption:=form2.komutlistesi('Dugme')+ IntToStr (butt);
      end;
        dugmemiz.HelpType:=htContext;
        Dugmemiz.OnClick:=tiklama;
        dugmemiz.OnMouseDown:=surukle;
        dugmemiz.OnMouseMove:=nesneMouseMove;
        dugmemiz.OnEnter:= nesne_giris;
        nesne_sayisi;    //sonucta ne oldu?
        form2.ComboBox1.Text:=dugmemiz.Name;
        form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
        form2.gride_yaz;
   end;
2: begin Etiket := TStatictext.Create (self);              //yeni etiket oluþturuldu...
      	Etiket.Parent:= self;
       	Etiket.Top:= yuvary;
      	Etiket.Left:= yuvarx;
//        etiket.Width:=60;
//        etiket.height:=15;
        etiket.ShowHint:=true;
//        etiket.TabStop:=false;
        etiket.AutoSize:=true;
        inc(labe);

      if form1.ComponentCount<>1 then begin
        Etiket.Name:=form2.komutlistesi('Etiket')+IntToStr (bos_nesne_bul('TStaticText'));
      	Etiket.Caption:=form2.komutlistesi('Etiket')+ no_ayikla (etiket.Name);
        end
      else begin
        etiket.Name:=form2.komutlistesi('Etiket')+inttostr(labe);
      	Etiket.Caption:=form2.komutlistesi('Etiket')+ IntToStr (labe);
      end;

        etiket.OnClick:=tiklama;
        etiket.OnMouseDown:=surukle;
        etiket.OnMouseMove:=nesneMouseMove;
        nesne_sayisi;    //sonucta ne oldu?
        form2.ComboBox1.Text:=etiket.Name;
        form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
        form2.gride_yaz;
   end;
3: begin Metin := TEdit.Create (self);              //yeni metin kutusu oluþturuldu...
      	Metin.Parent:= self;
       	Metin.Top:= yuvary;
      	Metin.Left:= yuvarx;
        metin.ShowHint:=true;
///        metin.TabStop:=false;
        inc(edit);

      if form1.ComponentCount<>1 then begin
        Metin.Name:=form2.komutlistesi('MetinKutusu') + IntToStr (bos_nesne_bul('TEdit'));
      	Metin.text:=form2.komutlistesi('MetinKutusu') + no_ayikla (metin.name);
        end
      else begin
        metin.Name:=form2.komutlistesi('MetinKutusu')+inttostr(edit);
      	Metin.text:=form2.komutlistesi('MetinKutusu')+ IntToStr (edit);
      end;

        Metin.OnKeyPress:=tusbasimi;
        metin.OnChange:=degistiginde;
        Metin.OnEnter:= nesne_giris;
        Metin.OnExit:=metin_cikisi;
        metin.OnMouseDown:=surukle;
        metin.OnMouseMove:=nesneMouseMove;
        nesne_sayisi;    //sonucta ne oldu?
        form2.ComboBox1.Text:=metin.Name;
        form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
        form2.gride_yaz;
   end;
4: begin onay := TCheckBox.Create (self);              //onay
      	onay.Parent:= self;
       	onay.Top:= yuvary;
      	onay.Left:= yuvarx;
        onay.ShowHint:=true;
//        onay.TabStop:=false;
        inc(check);

      if form1.ComponentCount<>1 then begin
        onay.Name:=form2.komutlistesi('OnayKutusu') + IntToStr (bos_nesne_bul('TCheckBox'));
      	onay.Caption:=form2.komutlistesi('OnayKutusu') + no_ayikla (onay.name);
        end
      else begin
        onay.Name:=form2.komutlistesi('OnayKutusu')+inttostr(check);
      	onay.Caption:=form2.komutlistesi('OnayKutusu') + IntToStr (check);
      end;

        onay.OnMouseDown:=surukle;
        onay.OnClick:=tiklama;
        onay.OnEnter:= nesne_giris;
        onay.OnMouseMove:=nesneMouseMove;
        nesne_sayisi;    //sonucta ne oldu?
        form2.ComboBox1.Text:=onay.Name;
        form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
        form2.gride_yaz;
   end;
5: begin liste := TListBox.Create (Form1);              //yeni liste kutusu oluþturuldu...
      	liste.Parent:= Form1;
       	liste.Top:= yuvary;
      	liste.Left:= yuvarx;
        liste.ShowHint:=true;
//        liste.TabStop:=false;
        inc(list);

      if form1.ComponentCount<>1 then begin
        liste.Name:=form2.komutlistesi('ListeKutusu') + IntToStr (bos_nesne_bul('TListBox'));
      	liste.Items.add(form2.komutlistesi('ListeKutusu') + no_ayikla (liste.name));
        end
      else begin
        liste.Name:=form2.komutlistesi('ListeKutusu')+inttostr(list);
      	liste.Items.add(form2.komutlistesi('ListeKutusu') + IntToStr (list));
      end;
        liste.ItemIndex:=0;
        liste.OnMouseDown:=surukle;
        liste.OnClick:=tiklama;
        liste.OnMouseMove:=nesneMouseMove;
        liste.OnEnter:= nesne_giris;
        nesne_sayisi;    //sonucta ne oldu?
        form2.ComboBox1.Text:=liste.Name;
        form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
        form2.gride_yaz;
   end;
6: begin acilir :=TCombobox.Create (self);              //yeni açýlýr kutu oluþturuldu...
      	acilir.Parent:= self;
       	acilir.Top:= yuvary;
      	acilir.Left:= yuvarx;
        acilir.ShowHint:=true;
//        acilir.TabStop:=false;
        acilir.DragCursor:=crDefault;
        acilir.DragMode:=dmAutomatic;
        inc(combo);

      if form1.ComponentCount<>1 then begin
        acilir.Name:=form2.komutlistesi('AcilirKutu') + IntToStr (bos_nesne_bul('TCombobox'));
      	acilir.text:=form2.komutlistesi('AcilirKutu') + no_ayikla (acilir.name);
        end
      else begin
        acilir.Name:=form2.komutlistesi('AcilirKutu')+inttostr(combo);
      	acilir.text:=form2.komutlistesi('AcilirKutu')+ IntToStr (combo);
      end;

        acilir.OnDragOver:=surukleCombo; //Özel olay eklendi
        acilir.OnChange:=degistiginde;
        acilir.OnEnter:= nesne_giris;
        nesne_sayisi;    //sonucta ne oldu?
        form2.ComboBox1.Text:=acilir.Name;
        form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
        form2.gride_yaz;
   end;
7: begin yazi := TRichEdit.Create (self);              //yeni yazý kutusu oluþturuldu...
      	yazi.Parent:= Form1;
       	yazi.Top:= yuvary;
      	yazi.Left:= yuvarx;
        yazi.ShowHint:=true;
        yazi.WordWrap:=false;
        yazi.ScrollBars:=ssBoth;
//        yazi.TabStop:=false;
        inc(REdit);

      if form1.ComponentCount<>1 then begin
        yazi.Name:=form2.komutlistesi('YaziKutusu') + IntToStr (bos_nesne_bul('TRichEdit'));
      	yazi.text:=form2.komutlistesi('YaziKutusu') + no_ayikla (yazi.name);
        end
      else begin
        yazi.Name:=form2.komutlistesi('YaziKutusu')+inttostr(REdit);
      	yazi.text:=form2.komutlistesi('YaziKutusu')+ IntToStr (REdit);
      end;

        yazi.OnMouseDown:=surukle;
        yazi.OnEnter:= nesne_giris;
        yazi.OnChange:=degistiginde;
        yazi.OnMouseMove:=nesneMouseMove;
        nesne_sayisi;    //sonucta ne oldu?
        form2.ComboBox1.Text:=yazi.Name;
        form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
        form2.gride_yaz;
   end;
8: begin
        Dugmemiz := TBitBtn.Create (self);           //yeni Timer oluþturuldu...
      	Dugmemiz.Parent:= self;
       	Dugmemiz.Top:= yuvary;
     	Dugmemiz.Left:= yuvarx;
        Dugmemiz.ShowHint:=false;
        dugmemiz.Hint:='1000';
        inc(timer);
        dugmemiz.Glyph:=form2.timer1.Bitmap;
        dugmemiz.Layout:=blGlyphLeft;
        dugmemiz.Width:=110;
        dugmemiz.Height:=30;

      if form1.ComponentCount<>1 then begin
         Dugmemiz.Name:=form2.komutlistesi('Zamanlayici')+inttostr(bos_nesne_bul('TBitBtn'));
       	 Dugmemiz.Caption:=form2.komutlistesi('Zamanlayici') + no_ayikla(Dugmemiz.name);
      end
      else begin
         Dugmemiz.Name:=form2.komutlistesi('Zamanlayici')+inttostr(timer);
       	 Dugmemiz.Caption:=form2.komutlistesi('Zamanlayici') + IntToStr (timer);
      end;
        dugmemiz.OnMouseDown:=surukle;
        dugmemiz.OnMouseMove:=nesneMouseMove;
        dugmemiz.OnEnter:= nesne_giris;
        nesne_sayisi;    //sonucta ne oldu?
        form2.ComboBox1.Text:=dugmemiz.Name;
        form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
        form2.gride_yaz;
   end;
9: begin
        Dugmemiz := TBitBtn.Create (self);           //yeni Tablo oluþturuldu...
      	Dugmemiz.Parent:= self;
       	Dugmemiz.Top:= yuvary;
     	Dugmemiz.Left:= yuvarx;
        Dugmemiz.ShowHint:=false;
        dugmemiz.Hint:='<>';
        inc(tablo);
        dugmemiz.Glyph:=form2.table1.Bitmap;
        dugmemiz.Layout:=blGlyphLeft;
        dugmemiz.Width:=100;
        dugmemiz.Height:=30;
        dugmemiz.Enabled:=true;

      if form1.ComponentCount<>1 then begin
         Dugmemiz.Name:=form2.komutlistesi('Tablo')+inttostr(bos_nesne_bul('TBitBtn'));
       	 Dugmemiz.Caption:=form2.komutlistesi('Tablo') + no_ayikla(Dugmemiz.name);
      end
      else begin
         Dugmemiz.Name:=form2.komutlistesi('Tablo')+inttostr(tablo);
       	 Dugmemiz.Caption:=form2.komutlistesi('Tablo') + IntToStr (tablo);
      end;
        dugmemiz.OnMouseDown:=surukle;
        dugmemiz.OnMouseMove:=nesneMouseMove;
        dugmemiz.OnEnter:= nesne_giris;
        nesne_sayisi;    //sonucta ne oldu?
        form2.ComboBox1.Text:=dugmemiz.Name;
        form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
        form2.gride_yaz;
   end;
10: begin
        Dugmemiz := TBitBtn.Create (self);
      	Dugmemiz.Parent:= self;
       	Dugmemiz.Top:= yuvary;
     	Dugmemiz.Left:= yuvarx;
        Dugmemiz.ShowHint:=false;
        dugmemiz.Hint:='<>';
        inc(ExcelTablo);
        dugmemiz.Glyph:=form2.excel1.Bitmap;
        dugmemiz.Layout:=blGlyphLeft;
        dugmemiz.Width:=120;
        dugmemiz.Height:=30;
        dugmemiz.Enabled:=true;

      if form1.ComponentCount<>1 then begin
         Dugmemiz.Name:=form2.komutlistesi('ExcelTablosu')+inttostr(bos_nesne_bul('TBitBtn'));
       	 Dugmemiz.Caption:=form2.komutlistesi('ExcelTablosu') + no_ayikla(Dugmemiz.name);
      end
      else begin
         Dugmemiz.Name:=form2.komutlistesi('ExcelTablosu')+inttostr(ExcelTablo);
       	 Dugmemiz.Caption:=form2.komutlistesi('ExcelTablosu')+ IntToStr (ExcelTablo);
      end;
        dugmemiz.OnMouseDown:=surukle;
        dugmemiz.OnMouseMove:=nesneMouseMove;
        dugmemiz.OnEnter:= nesne_giris;
        nesne_sayisi;    //sonucta ne oldu?
        form2.ComboBox1.Text:=dugmemiz.Name;
        form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
        form2.gride_yaz;
   end;
 else begin
  form2.ComboBox1.Text:=form2.komutlistesi('Form');
  form2.grid;
 end;

end;

if form3.CheckBox9.Checked then
 begin
        key:=VK_ESCAPE;
        Form1.FormKeyDown(self,key,shiftim); //seçim shape'inden kurtulmak için
 end;

end;
end;
end;

procedure RegisterExtension(const sExt, sDesc, AppPath: string);    //dýþarýdan da dosya çift týklanýp açýlabilir
  begin                                                             //*.proje olanlar
    with TRegistry.Create do
      try
        RootKey := HKEY_CLASSES_ROOT;
        if KeyExists(sExt) then  exit;

        if OpenKey(sExt, True) then begin
          WriteString('', sDesc);
          CloseKey;
        end;
        if OpenKey('\' + sDesc, True) then begin
          WriteString('', sDesc);
          CloseKey;
        end;
        if OpenKey('DefaultIcon', True) then begin
          WriteString('', AppPath + ',' + IntToStr(0));
          CloseKey;
        end;
        if OpenKey('\' + sDesc + '\Shell\Open\Command', True) then begin
          WriteString('', '"' + AppPath + '" "%1"');
          CloseKey;
        end;
        if OpenKey('\' + sDesc + '\defaulticon', True) then begin
          WriteString('', AppPath + ',0');
          CloseKey;
        end;
    SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
      finally
        Free;
      end;
  end;

procedure TForm1.UnRegisterExtension(const sExt, sDesc, AppPath: string);
  begin                                                             //*.proje olanlar
    with TRegistry.Create do
      try
        RootKey := HKEY_CLASSES_ROOT;
          DeleteKey(sExt);
          DeleteKey('\' + sDesc);
        if OpenKey('DefaultIcon', True) then begin
          DeleteKey( AppPath + ',' + IntToStr(0));
          CloseKey;
        end;
        if OpenKey('\' + sDesc + '\Shell\Open\Command', True) then begin
          DeleteKey('\' + sDesc + '\Shell\Open\Command');
          CloseKey;
        end;
        if OpenKey('\' + sDesc + '\defaulticon', True) then begin
          DeleteKey('\' + sDesc + '\defaulticon');
          CloseKey;
        end;
    SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
      finally
        Free;
      end;
  end;

procedure TForm1.hepsinikaydet(dosya:string);    //Ctrl+S
var  sil:TPopupMenu;
begin
ayaryaz(dosya+'.ayar');                                 //ayarlar
form5.richedit1.Lines.SaveToFile(dosya+'.proje');       //kodlar
form5.richedit1.Modified:=false;

try
sil:=TPopupMenu.Create(self);
sil.Name:='pop';
form1.PopupMenu:=sil;
finally
Tpopupmenu(form1.FindComponent('pop')).Free;
Form1.Name:='Form1';
WriteComponentResFile(dosya+'.dfm', Self);
form1.PopupMenu:=Form2.PopupMenu1;
end;
end;

procedure TForm1.FormKaydet1Click(Sender: TObject); //Farklý Kaydet
var fname: String;
    sil:TPopupMenu;
begin
if form2.SaveDialog1.Execute then
 begin
 fname:=Form2.dosyaadi_ayikla(form2.saveDialog1.FileName)+'.dfm';
        try
        sil:=TPopupMenu.Create(self);
        sil.Name:='pop';
        form1.PopupMenu:=sil;
        finally
        Tpopupmenu(form1.FindComponent('pop')).Free;
        Form1.Name:='Form1';
        WriteComponentResFile(fname, Self);
        form1.PopupMenu:=Form2.PopupMenu1;
        end;
 ayaryaz(form2.dosyaadi_ayikla(form2.saveDialog1.FileName)+'.ayar');
 end;
end;

procedure TForm1.FareImleciNormallestir;
var
  PropInfo : PPropInfo ;
  Component : TComponent ;
  i : integer ;
begin
  for i := 0 to ComponentCount - 1 do begin
    Component := Components[ i ] ;
      if Component is TControl then begin
        PropInfo := GetPropInfo( Component.ClassInfo, 'Cursor' ) ;
          if Assigned( PropInfo ) and ( PropInfo^.PropType^.Kind = tkinteger ) then
               SetOrdProp( Component, PropInfo, crdefault ) ;
      end ;
  end ;
end ;

Function WinExecute32Wait(FileName : AnsiString) : integer;
var
 zAppName:array[0..512] of char;
 zCurDir:array[0..255] of char;
 WorkDir:String;
 StartupInfo:TStartupInfo;
 ProcessInfo:TProcessInformation;
 res : DWord;
begin
 StrPCopy(zAppName,FileName);
 GetDir(0,WorkDir);
 StrPCopy(zCurDir, ExtractFilePath(FileName));
 FillChar(StartupInfo, Sizeof(StartupInfo),#0);
 StartupInfo.cb          := Sizeof(StartupInfo);
 StartupInfo.dwFlags     := STARTF_USESHOWWINDOW;
 //StartupInfo.wShowWindow := SW_HIDE;           // hide the application window
 StartupInfo.wShowWindow := SW_SHOW;
 if not CreateProcess(nil,
   zAppName,                      { pointer to command line string }
   nil,                           { pointer to process security attributes}
   nil,                           { pointer to thread security attributes }
   false,                         { handle inheritance flag }
   CREATE_NEW_CONSOLE or          { creation flags }
   NORMAL_PRIORITY_CLASS,
   nil,                           { pointer to new environment block }
   nil,                           { pointer to current directory name }
   StartupInfo,                   { pointer to STARTUPINFO }
   ProcessInfo) then Result := 0  { pointer to PROCESS_INF }
 else begin
   WaitforSingleObject(ProcessInfo.hProcess,INFINITE);
   GetExitCodeProcess(ProcessInfo.hProcess, res);
   result := res;
 end;
end;

procedure SoleBee_To_DelphiUnit;
var i:integer;
    satir:string;
begin

if form5.RichEdit1.Lines.Count=0 then exit;
exit;//ÞÝMDÝLÝK ÇALIÞMAYACAK, FORM VE KOD TAMAMEN BITMEDEN OLMAZ...
 for i:=0 to form5.RichEdit1.Lines.Count-1 do
   begin
    satir:=trim(form5.RichEdit1.Lines[i]);
    if (form2.mid (satir,1,1) ='''')or(length(satir)=0) then continue;
    form2.atom(satir);
     if (komut[1].tip='olay')or((komut[1].tip='nesne')and(komut[2].tip='olay')) then  //olay buldu
      begin
        
      end
      else  //veya normal bir satýr
      begin
      end;
   end;
end;

procedure TForm1.dfmkaydet; //MAKE COMPATIBLE WITH DELPHI
var i : integer;
    kayit,adsiz : string;
begin

if klasorproje<>'' then
 begin

 kayit:='';
 screen.Cursor:=crhourglass;

 adsiz:=klasorproje;
 for i:=length(klasorproje) downto 1 do begin
  if klasorproje[i]<>'\' then
  kayit:=klasorproje[i]+kayit
  else
  break;
 end;
 delete(adsiz,i+1,length(kayit));
 SetCurrentDirectory(pchar(adsiz));

 deletefile(pchar(adsiz+'project1.exe'));  //eskisi gitti, sorun olabilirdi...
 deletefile(pchar(adsiz+'project1.dpr'));
 deletefile(pchar(adsiz+'project1.res'));
 deletefile(pchar(adsiz+'unit1.pas'));
 deletefile(pchar(adsiz+'unit1.dcu'));
 deletefile(pchar(adsiz+'unit1.dfm'));
 deletefile(pchar(adsiz+'project1.dsk'));

 CopyFile(pchar(extractfilepath(Application.ExeName)+'Template\unit1.dcu'),pchar(adsiz+'unit1.dcu'),false);
 CopyFile(pchar(extractfilepath(Application.ExeName)+'Template\project1.res'),pchar(adsiz+'project1.res'),false);

 form6.RichEdit1.Lines.SaveToFile(adsiz+'project1.dpr');

 form6.RichEdit3.Lines:=form6.RichEdit2.Lines;  //varolan nesneler unit'e eklenir...

 FareImleciNormallestir; //Form üzerinde bazýlarý hala yan ok halinde

 for i:=0 to ComponentCount-1 do
   if Components[i].Name<>'' then
    form6.RichEdit3.Lines.Add('    '+Components[i].Name+':'+Components[i].ClassName+';'); //NESNE ADLARI

 SoleBee_To_DelphiUnit;
 
 form6.RichEdit3.Lines.Append(form6.RichEdit4.Lines.Text); //OLAY ADLARI
 form6.RichEdit3.Lines.Append(form6.RichEdit5.Lines.Text); //DEÐÝÞKENLER
 form6.RichEdit3.Lines.Append(form6.RichEdit6.Lines.Text); //KOD
 
 form6.RichEdit3.Lines.SaveToFile(adsiz+'unit1.pas');

 CopyFile(pchar(adsiz+kayit+'.dfm'),pchar(adsiz+'unit1.dfm'),false);

 adsiz:= '"'+form3.Edit1.text+'" "'+adsiz+'project1.dpr"';

// winexec(pchar(adsiz),SW_SHOWNORMAL);
 WinExecute32Wait(adsiz);
 screen.Cursor:=crDefault;

 ShellExecute(0, nil, 'project1.exe', nil, nil, SW_SHOWDEFAULT);

 if form3.CheckBox6.Checked then beep(100,100);
 end;
end;

procedure TForm1.hepsiniac(dosyaadi:string);
var dosya :TFileStream;
    I,ara:integer;
begin
if not(FileExists(dosyaadi+'.ayar'))or
   not(FileExists(dosyaadi+'.dfm'))or
   not(FileExists(dosyaadi+'.proje')) then
   begin
   if Form2.rke1.Checked then ara:=0 else ara:=1000;
   ShowMessage( paramstr(1)+#13+LoadStr(301+ara)+#13+LoadStr(1301)); //XP 'de sorun çýkýyordu.
   form2.Close;
   exit;
   end;
     ayar:=tinifile.create((dosyaadi)+'.ayar');
     ayaroku;
     form5.RichEdit1.UndoList.Clear;
//     form5.RichEdit1.CaretXY(0,0);
     form5.ListBox1.Clear;

   dosya:=TFileStream.Create((dosyaadi)+'.dfm',fmOpenRead);
      for I := ComponentCount - 1 downto 0 do
        Components[I].Free;
   dosya.ReadComponentRes(Self);
   form1.PopupMenu:=form2.PopupMenu1;
   Tpopupmenu(FindComponent('pop')).Free;
      for I := ComponentCount - 1 downto 0 do begin
       if Components[i] is TShape then Components[I].Free;
       if Components[i] is TBitbtn then
        begin
        Tbitbtn(Components[i]).Visible:=true;
        Tbitbtn(Components[i]).OnClick:=form1.tiklama;
        Tbitbtn(Components[i]).OnMouseDown:=surukle;
        Tbitbtn(Components[i]).OnMouseMove:=nesneMouseMove;
        inc(butt);
        end;
       if Components[i] is TEdit then
        begin
        TEdit(Components[i]).OnMouseDown:=surukle;
        TEdit(Components[i]).OnChange:=degistiginde;
        TEdit(Components[i]).OnMouseMove:=nesneMouseMove;
        inc(edit);
        end;
       if Components[i] is TStaticText then
        begin
        TStaticText(Components[i]).OnClick:=form1.tiklama;
        TStaticText(Components[i]).OnMouseDown:=surukle;
        TStaticText(Components[i]).OnMouseMove:=nesneMouseMove;
        inc(labe);
        end;
       if Components[i] is TCheckBox then
        begin
        TCheckBox(Components[i]).OnMouseDown:=surukle;
        TCheckBox(Components[i]).OnClick:=tiklama;
        TCheckBox(Components[i]).OnMouseMove:=nesneMouseMove;
        inc(check);
        end;
       if Components[i] is TListBox then
        begin
        TListBox(Components[i]).OnMouseDown:=surukle;
        TListBox(Components[i]).OnClick:=tiklama;
        TListBox(Components[i]).OnMouseMove:=nesneMouseMove;
        inc(list);
        end;
       if Components[i] is TComboBox then
        begin
        TComboBox(Components[i]).OnDragOver:=surukleCombo;
        TComboBox(Components[i]).OnChange:=degistiginde;
        inc(combo);
        end;
       if Components[i] is TRichEdit then
        begin
        TRichEdit(Components[i]).OnMouseDown:=surukle;
        TRichEdit(Components[i]).OnChange:=degistiginde;
        TRichEdit(Components[i]).OnMouseMove:=nesneMouseMove;
        inc(edit);
        end;
      end;
 dosya.Free;

form5.richedit1.Lines.LoadFromFile((dosyaadi)+'.proje');
form5.richedit1.Modified:=false;

klasorproje:=(dosyaadi);
proje:=form2.projeadi_ayikla(dosyaadi);
Application.Title:=proje;

if form2.rke1.Checked then begin
form2.caption:='Yunus - <'+proje+'> ['+loadstr(92)+']';
form5.Caption:=loadstr(82)+' - '+form2.dosyaadi_ayikla(dosyaadi)+'.proje';
end
else
begin
form2.caption:='Yunus - <'+proje+'> ['+loadstr(1092)+']';
form5.Caption:=loadstr(1082)+' - '+form2.dosyaadi_ayikla(dosyaadi)+'.proje';
end;

form2.ComboBox1.Text:=form2.komutlistesi('Form');
form2.grid;

if form2.rke1.Checked then
form2.Turkcele(True)
else
form2.Turkcele(False);

if (Paramstr(1)<>'')and(form3.RadioGroup1.ItemIndex=1) then begin
  form2.WindowState:=wsMinimized;
  form5.WindowState:=wsMinimized;
  end;
if (Paramstr(1)<>'')and(form3.RadioGroup1.ItemIndex=2) then begin
  form2.Visible:=false;
  form5.Visible:=false;
  end;

end;

procedure TForm1.FormA1Click(Sender: TObject);
var dosya :TFileStream;
    dosyaadi:string;
    I,ara:integer;
begin
if form2.OpenDialog1.Execute then
 begin
   dosyaadi:=form2.OpenDialog1.FileName;
 if (FileExists(form2.dosyaadi_ayikla(dosyaadi)+'.ayar'))and
   (FileExists(form2.dosyaadi_ayikla(dosyaadi)+'.dfm')) then begin

   form2.YeniYeni;  //yeni'nin temizliði
   klasorproje:=form2.dosyaadi_ayikla(dosyaadi);
   proje:=form2.projeadi_ayikla(dosyaadi);
   Application.Title:=proje;

   ayar:=tinifile.create(form2.dosyaadi_ayikla(dosyaadi)+'.ayar');
   ayaroku;
   form5.RichEdit1.CaretX:=0;
   form5.RichEdit1.CaretY:=0;
   form5.RichEdit1.UndoList.Clear;

   dosya:=TFileStream.Create(form2.dosyaadi_ayikla(dosyaadi)+'.dfm',fmOpenRead);
      for I := ComponentCount - 1 downto 0 do
        Components[I].Free;
   dosya.ReadComponentRes(Self);
   form1.PopupMenu:=form2.PopupMenu1;
   Tpopupmenu(FindComponent('pop')).Free;
      for I := ComponentCount - 1 downto 0 do begin
       if Components[i] is TShape then Components[I].Free;
       if Components[i] is TBitbtn then
        begin
        Tbitbtn(Components[i]).Visible:=true;
        Tbitbtn(Components[i]).OnClick:=form1.tiklama;
        Tbitbtn(Components[i]).OnMouseDown:=surukle;
        Tbitbtn(Components[i]).OnMouseMove:=nesneMouseMove;
        inc(butt);
        end;
       if Components[i] is TEdit then
        begin
        TEdit(Components[i]).OnMouseDown:=surukle;
        Tedit(Components[i]).OnChange:=degistiginde;
        TEdit(Components[i]).OnMouseMove:=nesneMouseMove;
        inc(edit);
        end;
       if Components[i] is TStaticText then
        begin
        TStaticText(Components[i]).OnClick:=form1.tiklama;
        TStaticText(Components[i]).OnMouseDown:=surukle;
        TStaticText(Components[i]).OnMouseMove:=nesneMouseMove;
        inc(labe);
        end;
       if Components[i] is TCheckBox then
        begin
        TCheckBox(Components[i]).OnMouseDown:=surukle;
        TCheckBox(Components[i]).OnMouseMove:=nesneMouseMove;
        TCheckBox(Components[i]).OnClick:=tiklama;
        inc(check);
        end;
       if Components[i] is TListBox then
        begin
        TListBox(Components[i]).OnClick:=form1.tiklama;
        TListBox(Components[i]).OnMouseDown:=surukle;
        TListBox(Components[i]).OnMouseMove:=nesneMouseMove;
        inc(list);
        end;
       if Components[i] is TComboBox then
        begin
        TComboBox(Components[i]).OnDragOver:=surukleCombo;
        TComboBox(Components[i]).OnChange:=degistiginde;
        inc(combo);
        end;
       if Components[i] is TRichEdit then
        begin
        TRichEdit(Components[i]).OnMouseDown:=surukle;
        TRichEdit(Components[i]).OnChange:=degistiginde;
        TRichEdit(Components[i]).OnMouseMove:=nesneMouseMove;
        inc(edit);
        end;
      end;
 dosya.Free;
form5.richedit1.Lines.LoadFromFile(form2.dosyaadi_ayikla(dosyaadi)+'.proje');
form5.richedit1.Modified:=false;
  form2.ToolButton7.Enabled:=false;
  form2.ToolButton9.Enabled:=true;
if form3.CheckBox3.Checked=false then
 begin
  form2.ToolButton9Click(self);

if form2.rke1.Checked then begin
form2.caption:='Yunus - <'+proje+'> ['+loadstr(93)+']';
form5.Caption:=loadstr(82)+' - '+form2.dosyaadi_ayikla(dosyaadi)+'.proje';
end
else
begin
form2.caption:='Yunus - <'+proje+'> ['+loadstr(1093)+']';
form5.Caption:=loadstr(1082)+' - '+form2.dosyaadi_ayikla(dosyaadi)+'.proje';
end;
 end else
begin
if form2.rke1.Checked then begin
form2.caption:='Yunus - <'+proje+'> ['+loadstr(92)+']';
form5.Caption:=loadstr(82)+' - '+form2.dosyaadi_ayikla(dosyaadi)+'.proje';
end
else
begin
form2.caption:='Yunus - <'+proje+'> ['+loadstr(1092)+']';
form5.Caption:=loadstr(1082)+' - '+form2.dosyaadi_ayikla(dosyaadi)+'.proje';
end;
end;
end
else
   begin
   if Form2.rke1.Checked then ara:=0 else ara:=1000;
   ShowMessage(LoadStr(301+ara));
   end;
end;
end;


function dokunuyor_mu(a,b:TRect):boolean;
var ara:TRect;
begin
 dokunuyor_mu:=IntersectRect(ara,a,b);//aha bu da ne...
end;

procedure TForm1.sil;
var temp,gecici:TComponent;
    dugmemiz:TBitBtn;
    etiket:TStatictext;
    metin:TEdit;
    onay:TCheckBox;
    liste: TListBox;
    acilir: TCombobox;
    yazi :TRichEdit;
    secim:TShape;
    i,j:integer;
    secimRect,tempRect: TRect;
begin
if componentcount<>0 then begin
temp:=Components[componentcount-1];
  if temp is TShape then
  begin
         secim := temp as TShape;
         secimRect := secim.BoundsRect;
         for i:=form1.ComponentCount-1 downto 0 do
         begin
                gecici:=components[i];
                if gecici is TBitBtn then begin
                        dugmemiz:=gecici as TBitBtn;
                        tempRect:=dugmemiz.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then form1.Components[i].free;
                end else
                if gecici is TStatictext then begin
                        etiket:=gecici as TStatictext;
                        tempRect:=etiket.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then form1.Components[i].free;
                end else
                if gecici is TEdit then begin
                        metin:=gecici as TEdit;
                        tempRect:=metin.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then form1.Components[i].free;
                end else
                if gecici is TCHeckBox then begin
                        onay:=gecici as TCHeckBox;
                        tempRect:=onay.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then form1.Components[i].free;
                end else
                if gecici is TListBox then begin
                        liste:=gecici as TListBox;
                        tempRect:=liste.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then form1.Components[i].free;
                end else
                if gecici is TCombobox then begin
                        acilir:=gecici as TCombobox;
                        tempRect:=acilir.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then form1.Components[i].free;
                end else
                if gecici is TRichEdit then begin
                        yazi:=gecici as TRichEdit;
                        tempRect:=yazi.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then form1.Components[i].free;
                end;
        gecici:=findComponent('secim');
        if gecici is TShape then
        gecici.free;
        //nesne listesi güncelleniyor
           form2.ComboBox1.Items.Clear;
           for j:=0 to form1.ComponentCount-1 do
           begin
            form2.ComboBox1.Items.Add(Components[j].Name);
           end;
           form2.ComboBox1.text:=form2.komutlistesi('Form');
         end;
  end else
         if lowercase(form2.ComboBox1.Text) <> lowercase(form2.komutlistesi('Form')) then
          begin
           gecici:=FindComponent(form2.ComboBox1.Text);
           gecici.Free;
           form2.ComboBox1.text:=form2.komutlistesi('Form');
          end;
end;
end;

procedure TForm1.tumunusec; //sadece döþeli bir shape...
var kareSecim:TShape;temp:TComponent;
begin
if componentcount<>0 then begin
        temp:=Components[componentcount-1];
        if temp is TShape then temp.free;
end;
if (form2.ToolButton9.enabled)and(form2.ToolButton1.Down) then begin
   if FindComponent('secim') is tshape then
      (FindComponent('secim') as tshape).Free;
        kareSecim := Tshape.Create (self);
        kareSecim.Parent:= self;
        kareSecim.Name:='secim';

        kareSecim.Pen.Style:=psdot;
        kareSecim.Pen.mode:=pmNot;
        kareSecim.Brush.Style:=bsClear;

        kareSecim.Width:=width-11;
   	kareSecim.Left:= 0;
        kareSecim.Height:=height-29;
     	kareSecim.Top:= 0;

        form1.ActiveControl:=nil;
end;
end;

procedure TForm1.kopyaBilgisi_Yaz;
var
  bilgi:TIniFile;
  dizin:string;i,j:integer;
begin
dizin:=extractfilepath(application.ExeName);
DeleteFile(pchar(dizin+'~kopya.txt'));          //eskisi gider...
bilgi:=TIniFile.Create(dizin+'~kopya.txt');     //kopyalama bilgileri
  for i:=1 to maxNesne do
  begin
   if seciliNesneler[i].tip='' then break;      //basitce bitirdik...

   bilgi.WriteString('Nesne'+inttostr(i),'Tip',seciliNesneler[i].tip);
   bilgi.WriteString('Nesne'+inttostr(i),'Ad',seciliNesneler[i].ad);
   bilgi.WriteBool('Nesne'+inttostr(i),'Aktif',seciliNesneler[i].aktif);
   bilgi.WriteString('Nesne'+inttostr(i),'Baslik',seciliNesneler[i].baslik);
   bilgi.WriteInteger('Nesne'+inttostr(i),'Genislik',seciliNesneler[i].genislik);
   bilgi.WriteInteger('Nesne'+inttostr(i),'Yukseklik',seciliNesneler[i].yukseklik);
   bilgi.WriteInteger('Nesne'+inttostr(i),'Ust',seciliNesneler[i].ust);
   bilgi.WriteInteger('Nesne'+inttostr(i),'Sol',seciliNesneler[i].sol);
   bilgi.WriteString('Nesne'+inttostr(i),'Ipucu',seciliNesneler[i].ipucu);
   bilgi.WriteBool('Nesne'+inttostr(i),'Checkdeger',seciliNesneler[i].checkdeger);
   bilgi.WriteInteger('Nesne'+inttostr(i),'Secili',seciliNesneler[i].secili);
   bilgi.WriteString('Nesne'+inttostr(i),'YazitipiAdi',seciliNesneler[i].yazitipiAdi);
   bilgi.WriteInteger('Nesne'+inttostr(i),'YazitipiRengi',seciliNesneler[i].yazitipiRenk);
   bilgi.WriteInteger('Nesne'+inttostr(i),'YazitipiBoyut',seciliNesneler[i].yazitipiBoyut);
   bilgi.WriteInteger('Nesne'+inttostr(i),'CharSet', seciliNesneler[i].yazitipiCharSet);
   bilgi.WriteInteger('Nesne'+inttostr(i),'Stil', Byte(seciliNesneler[i].yazitipiStil));
   bilgi.WriteInteger('Nesne'+inttostr(i),'Renk',seciliNesneler[i].renk);
   bilgi.WriteString('Nesne'+inttostr(i),'Resim',seciliNesneler[i].resim);

   if (seciliNesneler[i].tip='TListBox')  or   (seciliNesneler[i].tip='TComboBox')or
      (seciliNesneler[i].tip='TRichEdit') then begin
         bilgi.WriteInteger('Nesne'+inttostr(i),'DegerListesiSatirSayisi',seciliNesneler[i].degerListesi.Count);
         for j:=0 to secilinesneler[i].degerListesi.Count-1 do
            bilgi.WriteString('Nesne'+inttostr(i),'DegerListesi'+inttostr(j),seciliNesneler[i].degerListesi[j]);
      end;

  end;
if seciliNesneler[1].tip<>'' then bilgi.WriteInteger('Nesne','Toplam',i-1);
bilgi.Free;
end;

procedure TForm1.kopyaBilgisi_Oku;                 //~kopya.txt içi alýnýr
var
  bilgi:TIniFile;
  dizin:string;i,j:integer;
begin
dizin:=extractfilepath(application.ExeName);
bilgi:=TIniFile.Create(dizin+'~kopya.txt');        //kopyalama bilgileri
for i:=1 to maxNesne do seciliNesneler[i].tip:=''; //temizlik
  for i:=1 to bilgi.ReadInteger('Nesne','Toplam',0) do
  begin
   seciliNesneler[i].tip:=bilgi.ReadString('Nesne'+inttostr(i),'Tip','');
   seciliNesneler[i].ad:=bilgi.ReadString('Nesne'+inttostr(i),'Ad','');
   seciliNesneler[i].aktif:=bilgi.ReadBool('Nesne'+inttostr(i),'Aktif',false);
   seciliNesneler[i].baslik:=bilgi.ReadString('Nesne'+inttostr(i),'Baslik','');
   seciliNesneler[i].genislik:=bilgi.ReadInteger('Nesne'+inttostr(i),'Genislik',-99);
   seciliNesneler[i].yukseklik:=bilgi.ReadInteger('Nesne'+inttostr(i),'Yukseklik',-99);
   seciliNesneler[i].ust:=bilgi.ReadInteger('Nesne'+inttostr(i),'Ust',-99);
   seciliNesneler[i].sol:=bilgi.ReadInteger('Nesne'+inttostr(i),'Sol',-99);
   seciliNesneler[i].ipucu:=bilgi.ReadString('Nesne'+inttostr(i),'Ipucu','');
   seciliNesneler[i].checkdeger:=bilgi.ReadBool('Nesne'+inttostr(i),'Checkdeger',false);
   seciliNesneler[i].yazitipiAdi:=bilgi.ReadString('Nesne'+inttostr(i),'YazitipiAdi','');
   seciliNesneler[i].yazitipiRenk:=bilgi.ReadInteger('Nesne'+inttostr(i),'YazitipiRengi',-99);
   seciliNesneler[i].yazitipiBoyut:=bilgi.ReadInteger('Nesne'+inttostr(i),'YazitipiBoyut',-99);
   seciliNesneler[i].yazitipiCharSet:=TFontCharSet(bilgi.ReadInteger('Nesne'+inttostr(i),'CharSet', -99));
   seciliNesneler[i].yazitipiStil:=TFontStyles(Byte(bilgi.ReadInteger('Nesne'+inttostr(i),'Stil', -99)));
   seciliNesneler[i].renk:=bilgi.ReadInteger('Nesne'+inttostr(i),'Renk',-99);
   seciliNesneler[i].resim:=bilgi.ReadString('Nesne'+inttostr(i),'Resim','');

   if (seciliNesneler[i].tip='TListBox')or
      (seciliNesneler[i].tip='TComboBox')or
      (seciliNesneler[i].tip='TRichEdit') then begin
    seciliNesneler[i].degerListesi.Clear;
    for j:=0 to bilgi.ReadInteger('Nesne'+inttostr(i),'DegerListesiSatirSayisi',0)-1 do
    begin
     seciliNesneler[i].degerListesi.Add(bilgi.ReadString('Nesne'+inttostr(i),'DegerListesi'+inttostr(j),''));
    end;
   end;

   seciliNesneler[i].secili:=bilgi.ReadInteger('Nesne'+inttostr(i),'Secili',-99);

  end;
bilgi.Free;
end;

procedure TForm1.kopyala(kes:boolean);
var temp,gecici:TComponent;
    dugmemiz:TBitBtn;
    etiket:TStatictext;
    metin:TEdit;
    onay:TCheckBox;
    liste: TListBox;
    acilir: TCombobox;
    yazi :TRichEdit;
    secim:TShape;
    i:integer;
    secimRect,tempRect: TRect;
    kopyalaIndex:integer;
begin
if componentcount<>0 then begin
gecici:=Components[componentcount-1];
if gecici is TShape then begin //eðer seçim yapýlmýþ ise kopyala olabilir

temp:=Components[componentcount-1];
kopyalaIndex:=0;
for i:=1 to maxNesne do seciliNesneler[i].tip:=''; //temizlik
        if temp is TShape then
        begin
         secim := temp as TShape;
         secimRect:= secim.BoundsRect;
         for i:=form1.ComponentCount-1 downto 0 do
         begin
                gecici:=components[i];
                if gecici is TBitBtn then begin
                   dugmemiz:=gecici as TBitBtn;
                   tempRect:=dugmemiz.BoundsRect;
                   if dokunuyor_mu(tempRect,secimRect) then
                   begin
                     inc(kopyalaIndex);
                     if kopyalaIndex<maxNesne then
                      begin
                        seciliNesneler[kopyalaIndex].tip:=dugmemiz.ClassName;
                        seciliNesneler[kopyalaIndex].ad:=dugmemiz.Name;
                        seciliNesneler[kopyalaIndex].baslik:=dugmemiz.Caption;
                        seciliNesneler[kopyalaIndex].aktif:=dugmemiz.enabled;
                        seciliNesneler[kopyalaIndex].genislik:=dugmemiz.width;
                        seciliNesneler[kopyalaIndex].yukseklik:=dugmemiz.height;
                        seciliNesneler[kopyalaIndex].sol:=dugmemiz.left;
                        seciliNesneler[kopyalaIndex].ust:=dugmemiz.top;
                        seciliNesneler[kopyalaIndex].ipucu:=dugmemiz.hint;
                        seciliNesneler[kopyalaIndex].yazitipiAdi:=dugmemiz.font.Name;
                        seciliNesneler[kopyalaIndex].yazitipiStil:=dugmemiz.font.style;
                        seciliNesneler[kopyalaIndex].yazitipiCharSet:=dugmemiz.font.Charset;
                        seciliNesneler[kopyalaIndex].yazitipiBoyut:=dugmemiz.font.Size;
                        seciliNesneler[kopyalaIndex].yazitipiRenk:=dugmemiz.font.color;
                        seciliNesneler[kopyalaIndex].resim:=dugmemiz.HelpKeyword;
                      end;
                   end;
                end else
                if gecici is TStatictext then begin
                   etiket:=gecici as TStatictext;
                   tempRect:=etiket.BoundsRect;
                   if dokunuyor_mu(tempRect,secimRect) then
                   begin
                     inc(kopyalaIndex);
                     if kopyalaIndex<maxNesne then
                      begin
                        seciliNesneler[kopyalaIndex].tip:=etiket.ClassName;
                        seciliNesneler[kopyalaIndex].ad:=etiket.Name;
                        seciliNesneler[kopyalaIndex].baslik:=etiket.Caption;
                        seciliNesneler[kopyalaIndex].aktif:=etiket.enabled;
                        seciliNesneler[kopyalaIndex].genislik:=etiket.width;
                        seciliNesneler[kopyalaIndex].yukseklik:=etiket.height;
                        seciliNesneler[kopyalaIndex].sol:=etiket.left;
                        seciliNesneler[kopyalaIndex].ust:=etiket.top;
                        seciliNesneler[kopyalaIndex].ipucu:=etiket.hint;
                        seciliNesneler[kopyalaIndex].yazitipiAdi:=etiket.font.Name;
                        seciliNesneler[kopyalaIndex].yazitipiStil:=etiket.font.style;
                        seciliNesneler[kopyalaIndex].yazitipiCharSet:=etiket.font.Charset;
                        seciliNesneler[kopyalaIndex].yazitipiBoyut:=etiket.font.Size;
                        seciliNesneler[kopyalaIndex].yazitipiRenk:=etiket.font.color;
                        seciliNesneler[kopyalaIndex].renk:=etiket.color;
                      end;
                   end;
                end else
                if gecici is TEdit then begin
                   metin:=gecici as TEdit;
                   tempRect:=metin.BoundsRect;
                   if dokunuyor_mu(tempRect,secimRect) then
                   begin
                     inc(kopyalaIndex);
                     if kopyalaIndex<maxNesne then
                      begin
                        seciliNesneler[kopyalaIndex].tip:=metin.ClassName;
                        seciliNesneler[kopyalaIndex].ad:=metin.Name;
                        seciliNesneler[kopyalaIndex].baslik:=metin.text;
                        seciliNesneler[kopyalaIndex].aktif:=metin.enabled;
                        seciliNesneler[kopyalaIndex].genislik:=metin.width;
                        seciliNesneler[kopyalaIndex].yukseklik:=metin.height;
                        seciliNesneler[kopyalaIndex].sol:=metin.left;
                        seciliNesneler[kopyalaIndex].ust:=metin.top;
                        seciliNesneler[kopyalaIndex].ipucu:=metin.hint;
                        seciliNesneler[kopyalaIndex].yazitipiAdi:=metin.font.Name;
                        seciliNesneler[kopyalaIndex].yazitipiStil:=metin.font.style;
                        seciliNesneler[kopyalaIndex].yazitipiCharSet:=metin.font.Charset;
                        seciliNesneler[kopyalaIndex].yazitipiBoyut:=metin.font.Size;
                        seciliNesneler[kopyalaIndex].yazitipiRenk:=metin.font.color;
                        seciliNesneler[kopyalaIndex].renk:=metin.color;
                      end;
                   end;
                end else
                if gecici is TCHeckBox then begin
                        onay:=gecici as TCHeckBox;
                        tempRect:=onay.BoundsRect;
                   if dokunuyor_mu(tempRect,secimRect) then
                   begin
                     inc(kopyalaIndex);
                     if kopyalaIndex<maxNesne then
                      begin
                        seciliNesneler[kopyalaIndex].tip:=onay.ClassName;
                        seciliNesneler[kopyalaIndex].ad:=onay.Name;
                        seciliNesneler[kopyalaIndex].baslik:=onay.caption;
                        seciliNesneler[kopyalaIndex].aktif:=onay.enabled;
                        seciliNesneler[kopyalaIndex].genislik:=onay.width;
                        seciliNesneler[kopyalaIndex].yukseklik:=onay.height;
                        seciliNesneler[kopyalaIndex].sol:=onay.left;
                        seciliNesneler[kopyalaIndex].ust:=onay.top;
                        seciliNesneler[kopyalaIndex].ipucu:=onay.hint;
                        seciliNesneler[kopyalaIndex].yazitipiAdi:=onay.font.Name;
                        seciliNesneler[kopyalaIndex].yazitipiStil:=onay.font.style;
                        seciliNesneler[kopyalaIndex].yazitipiCharSet:=onay.font.Charset;
                        seciliNesneler[kopyalaIndex].yazitipiBoyut:=onay.font.Size;
                        seciliNesneler[kopyalaIndex].yazitipiRenk:=onay.font.color;
                        seciliNesneler[kopyalaIndex].renk:=onay.color;
                        seciliNesneler[kopyalaIndex].checkdeger :=onay.Checked;
                      end;
                   end;
                end else
                if gecici is TListBox then begin
                        liste:=gecici as TListBox;
                        tempRect:=liste.BoundsRect;
                   if dokunuyor_mu(tempRect,secimRect) then
                   begin
                     inc(kopyalaIndex);
                     if kopyalaIndex<maxNesne then
                      begin
                        seciliNesneler[kopyalaIndex].tip:=liste.ClassName;
                        seciliNesneler[kopyalaIndex].ad:=liste.Name;
                        seciliNesneler[kopyalaIndex].aktif:=liste.enabled;
                        seciliNesneler[kopyalaIndex].genislik:=liste.width;
                        seciliNesneler[kopyalaIndex].yukseklik:=liste.height;
                        seciliNesneler[kopyalaIndex].sol:=liste.left;
                        seciliNesneler[kopyalaIndex].ust:=liste.top;
                        seciliNesneler[kopyalaIndex].ipucu:=liste.hint;
                        seciliNesneler[kopyalaIndex].yazitipiAdi:=liste.font.Name;
                        seciliNesneler[kopyalaIndex].yazitipiStil:=liste.font.style;
                        seciliNesneler[kopyalaIndex].yazitipiCharSet:=liste.font.Charset;
                        seciliNesneler[kopyalaIndex].yazitipiBoyut:=liste.font.Size;
                        seciliNesneler[kopyalaIndex].yazitipiRenk:=liste.font.color;
                        seciliNesneler[kopyalaIndex].renk:=liste.color;

                        seciliNesneler[kopyalaIndex].secili := liste.ItemIndex;
                        seciliNesneler[kopyalaIndex].degerListesi.Assign(liste.Items);
                      end;
                   end;
                end else
                if gecici is TCombobox then begin
                        acilir:=gecici as TCombobox;
                        tempRect:=acilir.BoundsRect;
                   if dokunuyor_mu(tempRect,secimRect) then
                   begin
                     inc(kopyalaIndex);
                     if kopyalaIndex<maxNesne then
                      begin
                        seciliNesneler[kopyalaIndex].tip:=acilir.ClassName;
                        seciliNesneler[kopyalaIndex].ad:=acilir.Name;
                        seciliNesneler[kopyalaIndex].aktif:=acilir.enabled;
                        seciliNesneler[kopyalaIndex].genislik:=acilir.width;
                        seciliNesneler[kopyalaIndex].yukseklik:=acilir.height;
                        seciliNesneler[kopyalaIndex].sol:=acilir.left;
                        seciliNesneler[kopyalaIndex].ust:=acilir.top;
                        seciliNesneler[kopyalaIndex].ipucu:=acilir.hint;
                        seciliNesneler[kopyalaIndex].yazitipiAdi:=acilir.font.Name;
                        seciliNesneler[kopyalaIndex].yazitipiStil:=acilir.font.style;
                        seciliNesneler[kopyalaIndex].yazitipiCharSet:=acilir.font.Charset;
                        seciliNesneler[kopyalaIndex].yazitipiBoyut:=acilir.font.Size;
                        seciliNesneler[kopyalaIndex].yazitipiRenk:=acilir.font.color;
                        seciliNesneler[kopyalaIndex].renk:=acilir.color;
                        seciliNesneler[kopyalaIndex].degerListesi.Assign(acilir.Items);
                        seciliNesneler[kopyalaIndex].secili := acilir.ItemIndex;
                        seciliNesneler[kopyalaIndex].baslik:=acilir.Items[acilir.ItemIndex];
                      end;
                   end;
                end else
                if gecici is TRichEdit then begin
                        yazi:=gecici as TRichEdit;
                        tempRect:=yazi.BoundsRect;
                   if dokunuyor_mu(tempRect,secimRect) then
                   begin
                     inc(kopyalaIndex);
                     if kopyalaIndex<maxNesne then
                      begin
                        seciliNesneler[kopyalaIndex].tip:=yazi.ClassName;
                        seciliNesneler[kopyalaIndex].ad:=yazi.Name;
                        seciliNesneler[kopyalaIndex].aktif:=yazi.enabled;
                        seciliNesneler[kopyalaIndex].genislik:=yazi.width;
                        seciliNesneler[kopyalaIndex].yukseklik:=yazi.height;
                        seciliNesneler[kopyalaIndex].sol:=yazi.left;
                        seciliNesneler[kopyalaIndex].ust:=yazi.top;
                        seciliNesneler[kopyalaIndex].ipucu:=yazi.hint;
                        seciliNesneler[kopyalaIndex].yazitipiAdi:=yazi.font.Name;
                        seciliNesneler[kopyalaIndex].yazitipiStil:=yazi.font.style;
                        seciliNesneler[kopyalaIndex].yazitipiCharSet:=yazi.font.Charset;
                        seciliNesneler[kopyalaIndex].yazitipiBoyut:=yazi.font.Size;
                        seciliNesneler[kopyalaIndex].yazitipiRenk:=yazi.font.color;
                        seciliNesneler[kopyalaIndex].renk:=yazi.color;
                        seciliNesneler[kopyalaIndex].degerListesi.Assign(yazi.Lines);
                      end;
                   end;
                end;
         end;
        end;

end else begin// tek nesne seçili ise...
     kopyalaIndex:=1;
     gecici:=FindComponent(form2.ComboBox1.Text);
     if gecici is TBitBtn then begin
      dugmemiz:=gecici as TBitBtn;
      seciliNesneler[kopyalaIndex].tip:=dugmemiz.ClassName;
      seciliNesneler[kopyalaIndex].ad:=dugmemiz.Name;
      seciliNesneler[kopyalaIndex].baslik:=dugmemiz.Caption;
      seciliNesneler[kopyalaIndex].aktif:=dugmemiz.enabled;
      seciliNesneler[kopyalaIndex].genislik:=dugmemiz.width;
      seciliNesneler[kopyalaIndex].yukseklik:=dugmemiz.height;
      seciliNesneler[kopyalaIndex].sol:=dugmemiz.left;
      seciliNesneler[kopyalaIndex].ust:=dugmemiz.top;
      seciliNesneler[kopyalaIndex].ipucu:=dugmemiz.hint;
      seciliNesneler[kopyalaIndex].yazitipiAdi:=dugmemiz.font.Name;
      seciliNesneler[kopyalaIndex].yazitipiStil:=dugmemiz.font.style;
      seciliNesneler[kopyalaIndex].yazitipiCharSet:=dugmemiz.font.Charset;
      seciliNesneler[kopyalaIndex].yazitipiBoyut:=dugmemiz.font.Size;
      seciliNesneler[kopyalaIndex].yazitipiRenk:=dugmemiz.font.color;
      seciliNesneler[kopyalaIndex].resim:=dugmemiz.HelpKeyword;
     end else
                if gecici is TStatictext then begin
                   etiket:=gecici as TStatictext;
                        seciliNesneler[kopyalaIndex].tip:=etiket.ClassName;
                        seciliNesneler[kopyalaIndex].ad:=etiket.Name;
                        seciliNesneler[kopyalaIndex].baslik:=etiket.Caption;
                        seciliNesneler[kopyalaIndex].aktif:=etiket.enabled;
                        seciliNesneler[kopyalaIndex].genislik:=etiket.width;
                        seciliNesneler[kopyalaIndex].yukseklik:=etiket.height;
                        seciliNesneler[kopyalaIndex].sol:=etiket.left;
                        seciliNesneler[kopyalaIndex].ust:=etiket.top;
                        seciliNesneler[kopyalaIndex].ipucu:=etiket.hint;
                        seciliNesneler[kopyalaIndex].yazitipiAdi:=etiket.font.Name;
                        seciliNesneler[kopyalaIndex].yazitipiStil:=etiket.font.style;
                        seciliNesneler[kopyalaIndex].yazitipiCharSet:=etiket.font.Charset;
                        seciliNesneler[kopyalaIndex].yazitipiBoyut:=etiket.font.Size;
                        seciliNesneler[kopyalaIndex].yazitipiRenk:=etiket.font.color;
                        seciliNesneler[kopyalaIndex].renk:=etiket.color;
                end else
                if gecici is TEdit then begin
                   metin:=gecici as TEdit;
                        seciliNesneler[kopyalaIndex].tip:=metin.ClassName;
                        seciliNesneler[kopyalaIndex].ad:=metin.Name;
                        seciliNesneler[kopyalaIndex].baslik:=metin.text;
                        seciliNesneler[kopyalaIndex].aktif:=metin.enabled;
                        seciliNesneler[kopyalaIndex].genislik:=metin.width;
                        seciliNesneler[kopyalaIndex].yukseklik:=metin.height;
                        seciliNesneler[kopyalaIndex].sol:=metin.left;
                        seciliNesneler[kopyalaIndex].ust:=metin.top;
                        seciliNesneler[kopyalaIndex].ipucu:=metin.hint;
                        seciliNesneler[kopyalaIndex].yazitipiAdi:=metin.font.Name;
                        seciliNesneler[kopyalaIndex].yazitipiStil:=metin.font.style;
                        seciliNesneler[kopyalaIndex].yazitipiCharSet:=metin.font.Charset;
                        seciliNesneler[kopyalaIndex].yazitipiBoyut:=metin.font.Size;
                        seciliNesneler[kopyalaIndex].yazitipiRenk:=metin.font.color;
                        seciliNesneler[kopyalaIndex].renk:=metin.color;
                end else
                if gecici is TCHeckBox then begin
                        onay:=gecici as TCHeckBox;
                        seciliNesneler[kopyalaIndex].tip:=onay.ClassName;
                        seciliNesneler[kopyalaIndex].ad:=onay.Name;
                        seciliNesneler[kopyalaIndex].baslik:=onay.caption;
                        seciliNesneler[kopyalaIndex].aktif:=onay.enabled;
                        seciliNesneler[kopyalaIndex].genislik:=onay.width;
                        seciliNesneler[kopyalaIndex].yukseklik:=onay.height;
                        seciliNesneler[kopyalaIndex].sol:=onay.left;
                        seciliNesneler[kopyalaIndex].ust:=onay.top;
                        seciliNesneler[kopyalaIndex].ipucu:=onay.hint;
                        seciliNesneler[kopyalaIndex].yazitipiAdi:=onay.font.Name;
                        seciliNesneler[kopyalaIndex].yazitipiStil:=onay.font.style;
                        seciliNesneler[kopyalaIndex].yazitipiCharSet:=onay.font.Charset;
                        seciliNesneler[kopyalaIndex].yazitipiBoyut:=onay.font.Size;
                        seciliNesneler[kopyalaIndex].yazitipiRenk:=onay.font.color;
                        seciliNesneler[kopyalaIndex].renk:=onay.color;
                        seciliNesneler[kopyalaIndex].checkdeger :=onay.Checked;
                end else
                if gecici is TListBox then begin
                        liste:=gecici as TListBox;
                        seciliNesneler[kopyalaIndex].tip:=liste.ClassName;
                        seciliNesneler[kopyalaIndex].ad:=liste.Name;
                        seciliNesneler[kopyalaIndex].aktif:=liste.enabled;
                        seciliNesneler[kopyalaIndex].genislik:=liste.width;
                        seciliNesneler[kopyalaIndex].yukseklik:=liste.height;
                        seciliNesneler[kopyalaIndex].sol:=liste.left;
                        seciliNesneler[kopyalaIndex].ust:=liste.top;
                        seciliNesneler[kopyalaIndex].ipucu:=liste.hint;
                        seciliNesneler[kopyalaIndex].yazitipiAdi:=liste.font.Name;
                        seciliNesneler[kopyalaIndex].yazitipiStil:=liste.font.style;
                        seciliNesneler[kopyalaIndex].yazitipiCharSet:=liste.font.Charset;
                        seciliNesneler[kopyalaIndex].yazitipiBoyut:=liste.font.Size;
                        seciliNesneler[kopyalaIndex].yazitipiRenk:=liste.font.color;
                        seciliNesneler[kopyalaIndex].renk:=liste.color;
                        seciliNesneler[kopyalaIndex].secili := liste.ItemIndex;
                        seciliNesneler[kopyalaIndex].degerListesi.Assign(liste.Items);
                end else
                if gecici is TCombobox then begin
                        acilir:=gecici as TCombobox;
                        seciliNesneler[kopyalaIndex].tip:=acilir.ClassName;
                        seciliNesneler[kopyalaIndex].ad:=acilir.Name;
                        seciliNesneler[kopyalaIndex].aktif:=acilir.enabled;
                        seciliNesneler[kopyalaIndex].genislik:=acilir.width;
                        seciliNesneler[kopyalaIndex].yukseklik:=acilir.height;
                        seciliNesneler[kopyalaIndex].sol:=acilir.left;
                        seciliNesneler[kopyalaIndex].ust:=acilir.top;
                        seciliNesneler[kopyalaIndex].ipucu:=acilir.hint;
                        seciliNesneler[kopyalaIndex].yazitipiAdi:=acilir.font.Name;
                        seciliNesneler[kopyalaIndex].yazitipiStil:=acilir.font.style;
                        seciliNesneler[kopyalaIndex].yazitipiCharSet:=acilir.font.Charset;
                        seciliNesneler[kopyalaIndex].yazitipiBoyut:=acilir.font.Size;
                        seciliNesneler[kopyalaIndex].yazitipiRenk:=acilir.font.color;
                        seciliNesneler[kopyalaIndex].renk:=acilir.color;
                        seciliNesneler[kopyalaIndex].degerListesi.Assign(acilir.Items);
                        seciliNesneler[kopyalaIndex].secili := acilir.ItemIndex;
                        seciliNesneler[kopyalaIndex].baslik:=acilir.Items[acilir.ItemIndex];
                end else
                if gecici is TRichEdit then begin
                        yazi:=gecici as TRichEdit;
                        seciliNesneler[kopyalaIndex].tip:=yazi.ClassName;
                        seciliNesneler[kopyalaIndex].ad:=yazi.Name;
                        seciliNesneler[kopyalaIndex].aktif:=yazi.enabled;
                        seciliNesneler[kopyalaIndex].genislik:=yazi.width;
                        seciliNesneler[kopyalaIndex].yukseklik:=yazi.height;
                        seciliNesneler[kopyalaIndex].sol:=yazi.left;
                        seciliNesneler[kopyalaIndex].ust:=yazi.top;
                        seciliNesneler[kopyalaIndex].ipucu:=yazi.hint;
                        seciliNesneler[kopyalaIndex].yazitipiAdi:=yazi.font.Name;
                        seciliNesneler[kopyalaIndex].yazitipiStil:=yazi.font.style;
                        seciliNesneler[kopyalaIndex].yazitipiCharSet:=yazi.font.Charset;
                        seciliNesneler[kopyalaIndex].yazitipiBoyut:=yazi.font.Size;
                        seciliNesneler[kopyalaIndex].yazitipiRenk:=yazi.font.color;
                        seciliNesneler[kopyalaIndex].renk:=yazi.color;
                        seciliNesneler[kopyalaIndex].degerListesi.Assign(yazi.Lines);
                      end;
  end;
gecici:=Components[componentcount-1];
if (gecici is TShape)and(kes=false) then gecici.free;
kopyaBilgisi_Yaz;               //~kopya.txt oluþturma
end; //if compo...
end;

procedure TForm1.kes;
var temp,gecici:TComponent;
    dugmemiz:TBitBtn;
    etiket:TStatictext;
    metin:TEdit;
    onay:TCheckBox;
    liste: TListBox;
    acilir: TCombobox;
    yazi :TRichEdit;
    secim:TShape;
    i:integer;
    secimRect,tempRect: TRect;
begin
if componentcount<>0 then begin
gecici:=Components[componentcount-1];
if gecici is TShape then begin //eðer seçim yapýlmýþ ise kes olabilir
kopyala(true);
temp:=Components[componentcount-1];
        if temp is TShape then
        begin
         secim := temp as TShape;
         secimRect:= secim.BoundsRect;
         for i:=form1.ComponentCount-1 downto 0 do
         begin
                gecici:=components[i];
                if gecici is TBitBtn then begin
                dugmemiz:=gecici as TBitBtn;
                tempRect:=dugmemiz.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  begin
                  form1.Components[i].free;
                  end;
                end else
                if gecici is TStatictext then begin
                etiket:=gecici as TStatictext;
                tempRect:=etiket.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  begin
                  form1.Components[i].free;
                  end;
                end else
                if gecici is TEdit then begin
                metin:=gecici as TEdit;
                tempRect:=metin.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  begin
                  form1.Components[i].free;
                  end;
                end else
                if gecici is TCHeckBox then begin
                        onay:=gecici as TCHeckBox;
                        tempRect:=onay.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                  begin
                  form1.Components[i].free;
                  end;
                end else
                if gecici is TListBox then begin
                        liste:=gecici as TListBox;
                        tempRect:=liste.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                  begin
                  form1.Components[i].free;
                  end;
                end else
                if gecici is TCombobox then begin
                        acilir:=gecici as TCombobox;
                        tempRect:=acilir.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                  begin
                  form1.Components[i].free;
                  end;
                end else
                if gecici is TRichEdit then begin
                        yazi:=gecici as TRichEdit;
                        tempRect:=yazi.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                  begin
                  form1.Components[i].free;
                  end;
                end;
         end;
        end;
gecici:=Components[componentcount-1];
if gecici is TShape then gecici.free;
//nesne listesi güncelleniyor
   form2.ComboBox1.Items.Clear;
   for i:=0 to form1.ComponentCount-1 do
   begin
    form2.ComboBox1.Items.Add(Components[i].Name);
   end;
   form2.ComboBox1.Items.Add(form2.komutlistesi('Form'));
   form2.ComboBox1.text:=form2.komutlistesi('Form');
   form2.grid;
end
        else  // eðer tek nesne týklanmýþ ise
         kopyala(true);
         if lowercase(form2.ComboBox1.Text) <> lowercase(form2.komutlistesi('Form')) then
          begin
           gecici:=FindComponent(form2.ComboBox1.Text);
           gecici.Free;
           form2.ComboBox1.text:=form2.komutlistesi('Form');
          end;
end;
end;

procedure TForm1.yapistir;
var gecici:TComponent;
    dugmemiz:TBitBtn;
    etiket:TStatictext;
    metin:TEdit;
    onay:TCheckBox;
    liste: TListBox;
    acilir: TCombobox;
    yazi :TRichEdit;
    i:integer;
begin
if form2.ToolButton9.enabled then begin
if componentcount<>0 then begin
gecici:=Components[componentcount-1];
if gecici is TShape then gecici.free;
end;
kopyaBilgisi_Oku;       //kopya bilgilerini diziye aktarýr
        for i:=1 to maxNesne do begin
        if seciliNesneler[i].tip='' then break;

        if seciliNesneler[i].tip='TBitBtn' then
        begin
      Dugmemiz := TBitBtn.Create (self);
      if lowercase(ada_ayikla(seciliNesneler[i].ad))=lowercase(Form2.komutlistesi('Dugme')) then
      begin
      inc(butt);
      if form1.ComponentCount<>1 then
         Dugmemiz.Name:=ada_ayikla(seciliNesneler[i].ad)+inttostr(bos_nesne_bul('TBitBtn'))
      else
         Dugmemiz.Name:=ada_ayikla(seciliNesneler[i].ad)+inttostr(butt);

      Dugmemiz.Parent:= self;
      dugmemiz.Caption:=seciliNesneler[i].baslik;
      dugmemiz.top:=seciliNesneler[i].ust;
      dugmemiz.left:=seciliNesneler[i].sol;
      dugmemiz.width:=seciliNesneler[i].genislik;
      dugmemiz.height:=seciliNesneler[i].yukseklik;
      dugmemiz.hint:=seciliNesneler[i].ipucu;
      dugmemiz.showhint:=true;
      dugmemiz.ParentShowHint:=true;
//      dugmemiz.TabStop:=false;
      dugmemiz.font.name:=seciliNesneler[i].yazitipiAdi;
      dugmemiz.font.style:=seciliNesneler[i].yazitipiStil;
      dugmemiz.font.CharSet:=seciliNesneler[i].yazitipiCharSet;
      dugmemiz.font.size:=seciliNesneler[i].yazitipiBoyut;
      dugmemiz.font.color:=seciliNesneler[i].yazitipiRenk;
      dugmemiz.enabled:=seciliNesneler[i].aktif;
      dugmemiz.HelpKeyword:=seciliNesneler[i].resim;
      dugmemiz.HelpType:=htContext;
      if (fileexists(dugmemiz.HelpKeyword)) then //mecbur deðiliz
        dugmemiz.Glyph.LoadFromFile(dugmemiz.HelpKeyword);
      Dugmemiz.OnClick:=form1.tiklama;
      dugmemiz.OnMouseDown:=surukle;
      dugmemiz.OnEnter:= nesne_giris;
      dugmemiz.OnMouseMove:=nesneMouseMove;
        end else
     if lowercase(ada_ayikla(seciliNesneler[i].ad))=lowercase(Form2.komutlistesi('Zamanlayici')) then
         begin
        inc(timer);
      if form1.ComponentCount<>1 then
         Dugmemiz.Name:=form2.komutlistesi('Zamanlayici')+inttostr(bos_nesne_bul('TBitBtn'))
      else
         Dugmemiz.Name:=form2.komutlistesi('Zamanlayici')+inttostr(timer);
      	Dugmemiz.Parent:= self;
        dugmemiz.Caption:=Dugmemiz.Name;
        dugmemiz.top:=seciliNesneler[i].ust;
        dugmemiz.left:=seciliNesneler[i].sol;
        dugmemiz.width:=seciliNesneler[i].genislik;
        dugmemiz.height:=seciliNesneler[i].yukseklik;
        dugmemiz.hint:=seciliNesneler[i].ipucu;
        Dugmemiz.ShowHint:=false;
      dugmemiz.font.name:=seciliNesneler[i].yazitipiAdi;
      dugmemiz.font.style:=seciliNesneler[i].yazitipiStil;
      dugmemiz.font.CharSet:=seciliNesneler[i].yazitipiCharSet;
      dugmemiz.font.size:=seciliNesneler[i].yazitipiBoyut;
      dugmemiz.font.color:=seciliNesneler[i].yazitipiRenk;
      dugmemiz.enabled:=seciliNesneler[i].aktif;
        dugmemiz.Glyph:=form2.timer1.Bitmap;
        dugmemiz.Layout:=blGlyphLeft;

//        Dugmemiz.OnClick:=tiklama;
        dugmemiz.OnMouseDown:=surukle;
        dugmemiz.OnMouseMove:=nesneMouseMove;
        dugmemiz.OnEnter:= nesne_giris;
        end else
     if lowercase(ada_ayikla(seciliNesneler[i].ad))=lowercase(Form2.komutlistesi('Tablo')) then
         begin
        inc(tablo);
      if form1.ComponentCount<>1 then
         Dugmemiz.Name:=form2.komutlistesi('Tablo')+inttostr(bos_nesne_bul('TBitBtn'))
      else
         Dugmemiz.Name:=form2.komutlistesi('Tablo')+inttostr(tablo);
      	Dugmemiz.Parent:= self;
        dugmemiz.Caption:=Dugmemiz.Name;
        dugmemiz.top:=seciliNesneler[i].ust;
        dugmemiz.left:=seciliNesneler[i].sol;
        dugmemiz.width:=seciliNesneler[i].genislik;
        dugmemiz.height:=seciliNesneler[i].yukseklik;
        dugmemiz.hint:=seciliNesneler[i].ipucu;
        Dugmemiz.ShowHint:=false;
      dugmemiz.font.name:=seciliNesneler[i].yazitipiAdi;
      dugmemiz.font.style:=seciliNesneler[i].yazitipiStil;
      dugmemiz.font.CharSet:=seciliNesneler[i].yazitipiCharSet;
      dugmemiz.font.size:=seciliNesneler[i].yazitipiBoyut;
      dugmemiz.font.color:=seciliNesneler[i].yazitipiRenk;
      dugmemiz.enabled:=seciliNesneler[i].aktif;
        dugmemiz.Glyph:=form2.table1.Bitmap;
        dugmemiz.Layout:=blGlyphLeft;

//        Dugmemiz.OnClick:=tiklama;
        dugmemiz.OnMouseDown:=surukle;
        dugmemiz.OnMouseMove:=nesneMouseMove;
        dugmemiz.OnEnter:= nesne_giris;
        end else
     if lowercase(ada_ayikla(seciliNesneler[i].ad))=lowercase(Form2.komutlistesi('exceltablosu')) then
         begin
        inc(ExcelTablo);
      if form1.ComponentCount<>1 then
         Dugmemiz.Name:=form2.komutlistesi('exceltablosu')+inttostr(bos_nesne_bul('TBitBtn'))
      else
         Dugmemiz.Name:=form2.komutlistesi('exceltablosu')+inttostr(exceltablo);
      	Dugmemiz.Parent:= self;
        dugmemiz.Caption:=Dugmemiz.Name;
        dugmemiz.top:=seciliNesneler[i].ust;
        dugmemiz.left:=seciliNesneler[i].sol;
        dugmemiz.width:=seciliNesneler[i].genislik;
        dugmemiz.height:=seciliNesneler[i].yukseklik;
        dugmemiz.hint:=seciliNesneler[i].ipucu;
        Dugmemiz.ShowHint:=false;
      dugmemiz.font.name:=seciliNesneler[i].yazitipiAdi;
      dugmemiz.font.style:=seciliNesneler[i].yazitipiStil;
      dugmemiz.font.CharSet:=seciliNesneler[i].yazitipiCharSet;
      dugmemiz.font.size:=seciliNesneler[i].yazitipiBoyut;
      dugmemiz.font.color:=seciliNesneler[i].yazitipiRenk;
      dugmemiz.enabled:=seciliNesneler[i].aktif;
        dugmemiz.Glyph:=form2.excel1.Bitmap;
        dugmemiz.Layout:=blGlyphLeft;

//        Dugmemiz.OnClick:=tiklama;
        dugmemiz.OnMouseDown:=surukle;
        dugmemiz.OnMouseMove:=nesneMouseMove;
        dugmemiz.OnEnter:= nesne_giris;
        end;
        end else
     if seciliNesneler[i].tip='TStaticText' then
        begin
      etiket := TStatictext.Create (self);
      inc(labe);

      if form1.ComponentCount<>1 then
        etiket.Name:=ada_ayikla(seciliNesneler[i].ad)+inttostr(bos_nesne_bul('TStaticText'))
      else
        etiket.Name:=ada_ayikla(seciliNesneler[i].ad)+inttostr(labe);

      etiket.Parent:= self;
      etiket.top:=seciliNesneler[i].ust;
      etiket.left:=seciliNesneler[i].sol;
      etiket.width:=seciliNesneler[i].genislik;
      etiket.height:=seciliNesneler[i].yukseklik;
      etiket.hint:=seciliNesneler[i].ipucu;
      etiket.ParentShowHint:=true;
//      etiket.TabStop:=false;
      etiket.AutoSize:=true;
      etiket.Color:=seciliNesneler[i].renk;
      etiket.font.name:=seciliNesneler[i].yazitipiAdi;
      etiket.font.style:=seciliNesneler[i].yazitipiStil;
      etiket.font.CharSet:=seciliNesneler[i].yazitipiCharSet;
      etiket.font.size:=seciliNesneler[i].yazitipiBoyut;
      etiket.font.color:=seciliNesneler[i].yazitipiRenk;
      etiket.showhint:=true;
      etiket.enabled:=seciliNesneler[i].aktif;
      etiket.Caption:=seciliNesneler[i].baslik;
      etiket.OnClick:=form1.tiklama;
      etiket.OnMouseDown:=surukle;
      etiket.OnMouseMove:=nesneMouseMove;
        end else
     if seciliNesneler[i].tip='TEdit' then
        begin
      metin := Tedit.Create (self);
      inc(edit);

      if form1.ComponentCount<>1 then
        metin.Name:=ada_ayikla(seciliNesneler[i].ad)+inttostr(bos_nesne_bul('TEdit'))
      else
        metin.Name:=ada_ayikla(seciliNesneler[i].ad)+inttostr(edit);

      metin.Parent:= self;
      metin.top:=seciliNesneler[i].ust;
      metin.left:=seciliNesneler[i].sol;
      metin.width:=seciliNesneler[i].genislik;
      metin.height:=seciliNesneler[i].yukseklik;
      metin.hint:=seciliNesneler[i].ipucu;
      metin.ParentShowHint:=true;
//      metin.TabStop:=false;
      metin.Color:=seciliNesneler[i].renk;
      metin.font.name:=seciliNesneler[i].yazitipiAdi;
      metin.font.style:=seciliNesneler[i].yazitipiStil;
      metin.font.CharSet:=seciliNesneler[i].yazitipiCharSet;
      metin.font.size:=seciliNesneler[i].yazitipiBoyut;
      metin.font.color:=seciliNesneler[i].yazitipiRenk;
      metin.showhint:=true;
      metin.enabled:=seciliNesneler[i].aktif;
      metin.text:=seciliNesneler[i].baslik;
        Metin.OnKeyPress:=form1.tusbasimi;
        Metin.OnEnter:= form1.nesne_giris;
        metin.OnChange:=degistiginde;
        Metin.OnExit:=form1.metin_cikisi;
        metin.OnMouseDown:=surukle;
        metin.OnMouseMove:=nesneMouseMove;
        end else
     if seciliNesneler[i].tip='TCheckBox' then
        begin
      onay := TCheckBox.Create (self);
      inc(check);

      if form1.ComponentCount<>1 then
        onay.Name:=ada_ayikla(seciliNesneler[i].ad)+inttostr(bos_nesne_bul('TCheckBox'))
      else
        onay.Name:=ada_ayikla(seciliNesneler[i].ad)+inttostr(check);

      onay.Parent:= self;
      onay.top:=seciliNesneler[i].ust;
      onay.left:=seciliNesneler[i].sol;
      onay.width:=seciliNesneler[i].genislik;
      onay.height:=seciliNesneler[i].yukseklik;
      onay.hint:=seciliNesneler[i].ipucu;
      onay.ParentShowHint:=true;
//      onay.TabStop:=false;
      onay.Color:=seciliNesneler[i].renk;
      onay.font.name:=seciliNesneler[i].yazitipiAdi;
      onay.font.style:=seciliNesneler[i].yazitipiStil;
      onay.font.CharSet:=seciliNesneler[i].yazitipiCharSet;
      onay.font.size:=seciliNesneler[i].yazitipiBoyut;
      onay.font.color:=seciliNesneler[i].yazitipiRenk;
      onay.showhint:=true;
      onay.enabled:=seciliNesneler[i].aktif;
      onay.Caption:=seciliNesneler[i].baslik;
      onay.Checked:=seciliNesneler[i].checkdeger;
        onay.OnMouseDown:=surukle;
        onay.OnClick:=form1.tiklama;
        onay.OnEnter:= nesne_giris;
        onay.OnMouseMove:=nesneMouseMove;
        end else
     if seciliNesneler[i].tip='TListBox' then
        begin
      liste := TListBox.Create (self);
      inc(list);

      if form1.ComponentCount<>1 then
        liste.Name:=ada_ayikla(seciliNesneler[i].ad)+inttostr(bos_nesne_bul('TListBox'))
      else
        liste.Name:=ada_ayikla(seciliNesneler[i].ad)+inttostr(list);

      liste.Parent:= self;
      liste.top:=seciliNesneler[i].ust;
      liste.left:=seciliNesneler[i].sol;
      liste.width:=seciliNesneler[i].genislik;
      liste.height:=seciliNesneler[i].yukseklik;
      liste.hint:=seciliNesneler[i].ipucu;
      liste.ParentShowHint:=true;
//      liste.TabStop:=false;
      liste.Color:=seciliNesneler[i].renk;
      liste.font.name:=seciliNesneler[i].yazitipiAdi;
      liste.font.style:=seciliNesneler[i].yazitipiStil;
      liste.font.CharSet:=seciliNesneler[i].yazitipiCharSet;
      liste.font.size:=seciliNesneler[i].yazitipiBoyut;
      liste.font.color:=seciliNesneler[i].yazitipiRenk;
      liste.showhint:=true;
      liste.enabled:=seciliNesneler[i].aktif;
      liste.items.Assign(seciliNesneler[i].degerListesi);
      liste.ItemIndex:=seciliNesneler[i].secili;
       liste.OnMouseDown:=surukle;
       liste.OnEnter:= nesne_giris;
       liste.OnClick:=tiklama;
       liste.OnMouseMove:=nesneMouseMove;
        end else
     if seciliNesneler[i].tip='TComboBox' then
        begin
      acilir := TComboBox.Create (self);
      inc(combo);

      if form1.ComponentCount<>1 then
        acilir.Name:=ada_ayikla(seciliNesneler[i].ad)+inttostr(bos_nesne_bul('TComboBox'))
      else
        acilir.Name:=ada_ayikla(seciliNesneler[i].ad)+inttostr(combo);

      acilir.Parent:= self;
      acilir.top:=seciliNesneler[i].ust;
      acilir.left:=seciliNesneler[i].sol;
      acilir.width:=seciliNesneler[i].genislik;
      acilir.height:=seciliNesneler[i].yukseklik;
      acilir.hint:=seciliNesneler[i].ipucu;
      acilir.ParentShowHint:=true;
///      acilir.TabStop:=false;
      acilir.Color:=seciliNesneler[i].renk;
      acilir.font.name:=seciliNesneler[i].yazitipiAdi;
      acilir.font.style:=seciliNesneler[i].yazitipiStil;
      acilir.font.CharSet:=seciliNesneler[i].yazitipiCharSet;
      acilir.font.size:=seciliNesneler[i].yazitipiBoyut;
      acilir.font.color:=seciliNesneler[i].yazitipiRenk;
      acilir.showhint:=true;
      acilir.enabled:=seciliNesneler[i].aktif;
      acilir.items.Assign(seciliNesneler[i].degerListesi);
      acilir.ItemIndex:=seciliNesneler[i].secili;
       acilir.DragCursor:=crDefault;
       acilir.DragMode:=dmAutomatic;
       acilir.OnEnter:= nesne_giris;
       acilir.OnChange:=degistiginde;
       acilir.OnDragOver:=surukleCombo;
        end else
     if seciliNesneler[i].tip='TRichEdit' then
        begin
      yazi := TRichEdit.Create (self);
      inc(redit);

      if form1.ComponentCount<>1 then
        yazi.Name:=ada_ayikla(seciliNesneler[i].ad)+inttostr(bos_nesne_bul('TRichEdit'))
      else
        yazi.Name:=ada_ayikla(seciliNesneler[i].ad)+inttostr(redit);

      yazi.Parent:= self;
      yazi.top:=seciliNesneler[i].ust;
      yazi.left:=seciliNesneler[i].sol;
      yazi.width:=seciliNesneler[i].genislik;
      yazi.height:=seciliNesneler[i].yukseklik;
      yazi.hint:=seciliNesneler[i].ipucu;
      yazi.ParentShowHint:=true;
//      yazi.TabStop:=false;
      yazi.ScrollBars:=ssBoth;
      yazi.WordWrap:=false;
      yazi.Color:=seciliNesneler[i].renk;
      yazi.font.name:=seciliNesneler[i].yazitipiAdi;
      yazi.font.style:=seciliNesneler[i].yazitipiStil;
      yazi.font.CharSet:=seciliNesneler[i].yazitipiCharSet;
      yazi.font.size:=seciliNesneler[i].yazitipiBoyut;
      yazi.font.color:=seciliNesneler[i].yazitipiRenk;
      yazi.showhint:=true;
      yazi.enabled:=seciliNesneler[i].aktif;
      yazi.Lines.Assign(seciliNesneler[i].degerListesi);
        yazi.OnMouseDown:=surukle;
        yazi.OnEnter:= nesne_giris;
        yazi.OnChange:=degistiginde;
        yazi.OnMouseMove:=nesneMouseMove;
        end;
      end; //for
   form2.ComboBox1.Items.Clear;
    for i:=0 to form1.ComponentCount-1 do
     form2.ComboBox1.Items.Add(Components[i].Name);
   form2.ComboBox1.Items.Add(form2.komutlistesi('Form'));
   form2.ComboBox1.text:=form2.komutlistesi('Form');
   form2.grid;
///   form2.ComboBox1.itemindex:=0;
//   form2.ComboBox1Change(self);
   nesne_sayisi;    //sonucta ne oldu?
end;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;    //seçimden kurtulma
  Shift: TShiftState);
var temp,gecici:TComponent;
    dugmemiz:TBitBtn;
    etiket:TStatictext;
    metin:TEdit;
    secim:TShape;
    onay:TCheckBox;
    liste: TListBox;
    acilir: TCombobox;
    yazi :TRichEdit;
    i:integer;
    secimRect,tempRect: TRect;
begin
if (key=VK_ESCAPE)and(componentcount<>0) then
 begin
        gecici:=Components[componentcount-1];
        if gecici is TShape then gecici.free;
        form2.ComboBox1.Text:=form2.komutlistesi('Form');
        form2.grid;
        form2.ToolButton1.Down:=true;
 end;
       // Boyutlandýrma (Ctrl+Ok tuþlarý) / Konumlandýrma  (Shift+Ok tuþlarý)
if (key=VK_DOWN)and(ssCtrl in shift) then
 begin
if Componentcount<>0 then
begin
gecici:=Components[componentcount-1];
if gecici is TShape then begin
temp:=Components[componentcount-1];
        if temp is TShape then
        begin
         secim := temp as TShape;
         secimRect:= secim.BoundsRect;
         for i:=form1.ComponentCount-1 downto 0 do
         begin
                gecici:=components[i];
                if gecici is TBitBtn then begin
                dugmemiz:=gecici as TBitBtn;
                tempRect:=dugmemiz.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  dugmemiz.Top:=dugmemiz.Top+form3.SpinEdit1.Value;
                end else
                if gecici is TStatictext then begin
                etiket:=gecici as TStatictext;
                tempRect:=etiket.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  etiket.Top:=etiket.Top+form3.SpinEdit1.Value;
                end else
                if gecici is TEdit then begin
                metin:=gecici as TEdit;
                tempRect:=metin.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                   metin.Top:=metin.top+form3.SpinEdit1.Value;
                end else
                if gecici is TCHeckBox then begin
                        onay:=gecici as TCHeckBox;
                        tempRect:=onay.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   onay.Top:=onay.top+form3.SpinEdit1.Value;
                end else
                if gecici is TListBox then begin
                        liste:=gecici as TListBox;
                        tempRect:=liste.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   liste.Top:=liste.top+form3.SpinEdit1.Value;
                end else
                if gecici is TCombobox then begin
                        acilir:=gecici as TCombobox;
                        tempRect:=acilir.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   acilir.Top:=acilir.top+form3.SpinEdit1.Value;
                end else
                if gecici is TRichEdit then begin
                        yazi:=gecici as TRichEdit;
                        tempRect:=yazi.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   yazi.Top:=yazi.top+form3.SpinEdit1.Value;
                end;
         end;
        end;
end;
end;
end;

if (key=VK_UP)and(ssCtrl in shift) then
 begin
if Componentcount<>0 then
begin
gecici:=Components[componentcount-1];

if gecici is TShape then begin
temp:=Components[componentcount-1];
        if temp is TShape then
        begin
         secim := temp as TShape;
         secimRect:= secim.BoundsRect;
         for i:=form1.ComponentCount-1 downto 0 do
         begin
                gecici:=components[i];
                if gecici is TBitBtn then begin
                dugmemiz:=gecici as TBitBtn;
                tempRect:=dugmemiz.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  dugmemiz.Top:=dugmemiz.Top-form3.SpinEdit1.Value;
                end else
                if gecici is TStatictext then begin
                etiket:=gecici as TStatictext;
                tempRect:=etiket.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  etiket.Top:=etiket.Top-form3.SpinEdit1.Value;
                end else
                if gecici is TEdit then begin
                metin:=gecici as TEdit;
                tempRect:=metin.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                   metin.Top:=metin.top-form3.SpinEdit1.Value;
                end else
                if gecici is TCHeckBox then begin
                        onay:=gecici as TCHeckBox;
                        tempRect:=onay.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   onay.Top:=onay.top-form3.SpinEdit1.Value;
                end else
                if gecici is TListBox then begin
                        liste:=gecici as TListBox;
                        tempRect:=liste.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   liste.Top:=liste.top-form3.SpinEdit1.Value;
                end else
                if gecici is TCombobox then begin
                        acilir:=gecici as TCombobox;
                        tempRect:=acilir.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   acilir.Top:=acilir.top-form3.SpinEdit1.Value;
                end else
                if gecici is TRichEdit then begin
                        yazi:=gecici as TRichEdit;
                        tempRect:=yazi.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   yazi.Top:=yazi.top-form3.SpinEdit1.Value;
                end;
         end;
        end;
end;
end;
end;

if (key=VK_LEFT)and(ssCtrl in shift) then
 begin
if Componentcount<>0 then
begin
gecici:=Components[componentcount-1];

if gecici is TShape then begin
temp:=Components[componentcount-1];
        if temp is TShape then
        begin
         secim := temp as TShape;
         secimRect:= secim.BoundsRect;
         for i:=form1.ComponentCount-1 downto 0 do
         begin
                gecici:=components[i];
                if gecici is TBitBtn then begin
                dugmemiz:=gecici as TBitBtn;
                tempRect:=dugmemiz.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  dugmemiz.left:=dugmemiz.left-form3.SpinEdit1.Value;
                end else
                if gecici is TStatictext then begin
                etiket:=gecici as TStatictext;
                tempRect:=etiket.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  etiket.left:=etiket.left-form3.SpinEdit1.Value;
                end else
                if gecici is TEdit then begin
                metin:=gecici as TEdit;
                tempRect:=metin.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                   metin.left:=metin.left-form3.SpinEdit1.Value;
                end else
                if gecici is TCHeckBox then begin
                        onay:=gecici as TCHeckBox;
                        tempRect:=onay.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   onay.left:=onay.left-form3.SpinEdit1.Value;
                end else
                if gecici is TListBox then begin
                        liste:=gecici as TListBox;
                        tempRect:=liste.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   liste.left:=liste.left-form3.SpinEdit1.Value;
                end else
                if gecici is TCombobox then begin
                        acilir:=gecici as TCombobox;
                        tempRect:=acilir.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   acilir.left:=acilir.left-form3.SpinEdit1.Value;
                end else
                if gecici is TRichEdit then begin
                        yazi:=gecici as TRichEdit;
                        tempRect:=yazi.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   yazi.left:=yazi.left-form3.SpinEdit1.Value;
                end;
         end;
        end;
end;
end;
end;

if (key=VK_RIGHT)and(ssCtrl in shift) then
 begin
if Componentcount<>0 then
begin
gecici:=Components[componentcount-1];

if gecici is TShape then begin
temp:=Components[componentcount-1];
        if temp is TShape then
        begin
         secim := temp as TShape;
         secimRect:= secim.BoundsRect;
         for i:=form1.ComponentCount-1 downto 0 do
         begin
                gecici:=components[i];
                if gecici is TBitBtn then begin
                dugmemiz:=gecici as TBitBtn;
                tempRect:=dugmemiz.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  dugmemiz.left:=dugmemiz.left+form3.SpinEdit1.Value;
                end else
                if gecici is TStatictext then begin
                etiket:=gecici as TStatictext;
                tempRect:=etiket.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  etiket.left:=etiket.left+form3.SpinEdit1.Value;
                end else
                if gecici is TEdit then begin
                metin:=gecici as TEdit;
                tempRect:=metin.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                   metin.left:=metin.left+form3.SpinEdit1.Value;
                end else
                if gecici is TCHeckBox then begin
                        onay:=gecici as TCHeckBox;
                        tempRect:=onay.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   onay.left:=onay.left+form3.SpinEdit1.Value;
                end else
                if gecici is TListBox then begin
                        liste:=gecici as TListBox;
                        tempRect:=liste.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   liste.left:=liste.left+form3.SpinEdit1.Value;
                end else
                if gecici is TCombobox then begin
                        acilir:=gecici as TCombobox;
                        tempRect:=acilir.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   acilir.left:=acilir.left+form3.SpinEdit1.Value;
                end else
                if gecici is TRichEdit then begin
                        yazi:=gecici as TRichEdit;
                        tempRect:=yazi.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   yazi.left:=yazi.left+form3.SpinEdit1.Value;
                end;
         end;
        end;
end;
end;
end;

if (key=VK_DOWN)and(ssShift in shift) then
 begin
if Componentcount<>0 then
begin
gecici:=Components[componentcount-1];
if gecici is TShape then begin
temp:=Components[componentcount-1];
        if temp is TShape then
        begin
         secim := temp as TShape;
         secimRect:= secim.BoundsRect;
         for i:=form1.ComponentCount-1 downto 0 do
         begin
                gecici:=components[i];
                if gecici is TBitBtn then begin
                dugmemiz:=gecici as TBitBtn;
                tempRect:=dugmemiz.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  dugmemiz.height:=dugmemiz.height+form3.SpinEdit1.Value;
                end else
                if gecici is TStatictext then begin
                etiket:=gecici as TStatictext;
                tempRect:=etiket.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  etiket.height:=etiket.height+form3.SpinEdit1.Value;
                end else
                if gecici is TEdit then begin
                metin:=gecici as TEdit;
                tempRect:=metin.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                   metin.height:=metin.height+form3.SpinEdit1.Value;
                end else
                if gecici is TCHeckBox then begin
                        onay:=gecici as TCHeckBox;
                        tempRect:=onay.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   onay.height:=onay.height+form3.SpinEdit1.Value;
                end else
                if gecici is TListBox then begin
                        liste:=gecici as TListBox;
                        tempRect:=liste.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   liste.Height:=liste.height+form3.SpinEdit1.Value;
                end else
                if gecici is TCombobox then begin
                        acilir:=gecici as TCombobox;
                        tempRect:=acilir.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   acilir.Height:=acilir.height+form3.SpinEdit1.Value;
                end else
                if gecici is TRichEdit then begin
                        yazi:=gecici as TRichEdit;
                        tempRect:=yazi.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   yazi.Height:=yazi.height+form3.SpinEdit1.Value;
                end;
         end;
        end;
end;
end;
 end;
if (key=VK_UP)and(ssShift in shift) then
 begin
if Componentcount<>0 then
begin
gecici:=Components[componentcount-1];
if gecici is TShape then begin
temp:=Components[componentcount-1];
        if temp is TShape then
        begin
         secim := temp as TShape;
         secimRect:= secim.BoundsRect;
         for i:=form1.ComponentCount-1 downto 0 do
         begin
                gecici:=components[i];
                if gecici is TBitBtn then begin
                dugmemiz:=gecici as TBitBtn;
                tempRect:=dugmemiz.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  dugmemiz.height:=dugmemiz.height-form3.SpinEdit1.Value;
                end else
                if gecici is TStatictext then begin
                etiket:=gecici as TStatictext;
                tempRect:=etiket.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  etiket.height:=etiket.height-form3.SpinEdit1.Value;
                end else
                if gecici is TEdit then begin
                metin:=gecici as TEdit;
                tempRect:=metin.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                   metin.height:=metin.height-form3.SpinEdit1.Value;
                end else
                if gecici is TCHeckBox then begin
                        onay:=gecici as TCHeckBox;
                        tempRect:=onay.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   onay.height:=onay.height-form3.SpinEdit1.Value;
                end else
                if gecici is TListBox then begin
                        liste:=gecici as TListBox;
                        tempRect:=liste.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   liste.Height:=liste.height-form3.SpinEdit1.Value;
                end else
                if gecici is TCombobox then begin
                        acilir:=gecici as TCombobox;
                        tempRect:=acilir.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   acilir.Height:=acilir.height-form3.SpinEdit1.Value;
                end else
                if gecici is TRichEdit then begin
                        yazi:=gecici as TRichEdit;
                        tempRect:=yazi.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   yazi.Height:=yazi.height-form3.SpinEdit1.Value;
                end;
         end;
        end;
end;
end;
 end;
if (key=VK_LEFT)and(ssShift in shift) then
 begin
if Componentcount<>0 then
begin
gecici:=Components[componentcount-1];
if gecici is TShape then begin
temp:=Components[componentcount-1];
        if temp is TShape then
        begin
         secim := temp as TShape;
         secimRect:= secim.BoundsRect;
         for i:=form1.ComponentCount-1 downto 0 do
         begin
                gecici:=components[i];
                if gecici is TBitBtn then begin
                dugmemiz:=gecici as TBitBtn;
                tempRect:=dugmemiz.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  dugmemiz.width:=dugmemiz.width-form3.SpinEdit1.Value;
                end else
                if gecici is TStatictext then begin
                etiket:=gecici as TStatictext;
                tempRect:=etiket.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  etiket.width:=etiket.width-form3.SpinEdit1.Value;
                end else
                if gecici is TEdit then begin
                metin:=gecici as TEdit;
                tempRect:=metin.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                   metin.width:=metin.width-form3.SpinEdit1.Value;
                end else
                if gecici is TCHeckBox then begin
                        onay:=gecici as TCHeckBox;
                        tempRect:=onay.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   onay.Width:=onay.width-form3.SpinEdit1.Value;
                end else
                if gecici is TListBox then begin
                        liste:=gecici as TListBox;
                        tempRect:=liste.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   liste.Width:=liste.width-form3.SpinEdit1.Value;
                end else
                if gecici is TCombobox then begin
                        acilir:=gecici as TCombobox;
                        tempRect:=acilir.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   acilir.Width:=acilir.width-form3.SpinEdit1.Value;
                end else
                if gecici is TRichEdit then begin
                        yazi:=gecici as TRichEdit;
                        tempRect:=yazi.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   yazi.Width:=yazi.width-form3.SpinEdit1.Value;
                end;
         end;
        end;
end;
end;
 end;
if (key=VK_RIGHT)and(ssShift in shift) then
 begin
if Componentcount<>0 then
begin
gecici:=Components[componentcount-1];
if gecici is TShape then begin
temp:=Components[componentcount-1];
        if temp is TShape then
        begin
         secim := temp as TShape;
         secimRect:= secim.BoundsRect;
         for i:=form1.ComponentCount-1 downto 0 do
         begin
                gecici:=components[i];
                if gecici is TBitBtn then begin
                dugmemiz:=gecici as TBitBtn;
                tempRect:=dugmemiz.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  dugmemiz.width:=dugmemiz.width+form3.SpinEdit1.Value;
                end else
                if gecici is TStatictext then begin
                etiket:=gecici as TStatictext;
                tempRect:=etiket.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  etiket.width:=etiket.width+form3.SpinEdit1.Value;
                end else
                if gecici is TEdit then begin
                metin:=gecici as TEdit;
                tempRect:=metin.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                   metin.width:=metin.width+form3.SpinEdit1.Value;
                end else
                if gecici is TCHeckBox then begin
                        onay:=gecici as TCHeckBox;
                        tempRect:=onay.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   onay.Width:=onay.width+form3.SpinEdit1.Value;
                end else
                if gecici is TListBox then begin
                        liste:=gecici as TListBox;
                        tempRect:=liste.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   liste.Width:=liste.width+form3.SpinEdit1.Value;
                end else
                if gecici is TCombobox then begin
                        acilir:=gecici as TCombobox;
                        tempRect:=acilir.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   acilir.Width:=acilir.width+form3.SpinEdit1.Value;
                end else
                if gecici is TRichEdit then begin
                        yazi:=gecici as TRichEdit;
                        tempRect:=yazi.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   yazi.Width:=yazi.width+form3.SpinEdit1.Value;
                end;
         end;
        end;
end;
end;
 end;

end;
//------------------------------------dayalý
procedure TForm1.uste;
var temp,gecici:TComponent;
    dugmemiz:TBitBtn;
    etiket:TStatictext;
    metin:TEdit;
    onay:TCheckBox;
    liste: TListBox;
    acilir: TCombobox;
    yazi :TRichEdit;
    secim:TShape;
    i:integer;
    secimRect,tempRect: TRect;
begin
if Componentcount<>0 then
begin
gecici:=Components[componentcount-1];
if gecici is TShape then begin
temp:=Components[componentcount-1];
        if temp is TShape then
        begin
         secim := temp as TShape;
         secimRect:= secim.BoundsRect;
         for i:=form1.ComponentCount-1 downto 0 do
         begin
                gecici:=components[i];
                if gecici is TBitBtn then begin
                dugmemiz:=gecici as TBitBtn;
                tempRect:=dugmemiz.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  dugmemiz.Top:=secim.top;
                end else
                if gecici is TStatictext then begin
                etiket:=gecici as TStatictext;
                tempRect:=etiket.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  etiket.Top:=secim.top;
                end else
                if gecici is TEdit then begin
                metin:=gecici as TEdit;
                tempRect:=metin.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                   metin.Top:=secim.top;
                end else
                if gecici is TCHeckBox then begin
                        onay:=gecici as TCHeckBox;
                        tempRect:=onay.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   onay.top:=secim.top;
                end else
                if gecici is TListBox then begin
                        liste:=gecici as TListBox;
                        tempRect:=liste.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   liste.top:=secim.top;
                end else
                if gecici is TCombobox then begin
                        acilir:=gecici as TCombobox;
                        tempRect:=acilir.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   acilir.top:=secim.top;
                end else
                if gecici is TRichEdit then begin
                        yazi:=gecici as TRichEdit;
                        tempRect:=yazi.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   yazi.top:=secim.top;
                end;
         end;
        end;
end;
end;
end;

procedure TForm1.alta;
var temp,gecici:TComponent;
    dugmemiz:TBitBtn;
    etiket:TStatictext;
    metin:TEdit;
    onay:TCheckBox;
    liste: TListBox;
    acilir: TCombobox;
    yazi :TRichEdit;
    secim:TShape;
    i:integer;
    secimRect,tempRect: TRect;
begin
if Componentcount<>0 then
begin
gecici:=Components[componentcount-1];
if gecici is TShape then begin
temp:=Components[componentcount-1];
        if temp is TShape then
        begin
         secim := temp as TShape;
         secimRect:= secim.BoundsRect;
         for i:=form1.ComponentCount-1 downto 0 do
         begin
                gecici:=components[i];
                if gecici is TBitBtn then begin
                dugmemiz:=gecici as TBitBtn;
                tempRect:=dugmemiz.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  dugmemiz.Top:=secim.top+secim.height-dugmemiz.height;
                end else
                if gecici is TStatictext then begin
                etiket:=gecici as TStatictext;
                tempRect:=etiket.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  etiket.Top:=secim.top+secim.height-etiket.Height;
                end else
                if gecici is TEdit then begin
                metin:=gecici as TEdit;
                tempRect:=metin.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                   metin.Top:=secim.top+secim.height-metin.Height;
                end else
                if gecici is TCHeckBox then begin
                        onay:=gecici as TCHeckBox;
                        tempRect:=onay.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   onay.top:=secim.top+secim.height-onay.Height;
                end else
                if gecici is TListBox then begin
                        liste:=gecici as TListBox;
                        tempRect:=liste.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   liste.top:=secim.top+secim.height-liste.Height;
                end else
                if gecici is TCombobox then begin
                        acilir:=gecici as TCombobox;
                        tempRect:=acilir.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   acilir.top:=secim.top+secim.height-acilir.Height;
                end else
                if gecici is TRichEdit then begin
                        yazi:=gecici as TRichEdit;
                        tempRect:=yazi.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   yazi.top:=secim.top+secim.height-yazi.Height;
                end;
         end;
        end;
end;end;
end;

procedure TForm1.sola;
var temp,gecici:TComponent;
    dugmemiz:TBitBtn;
    etiket:TStatictext;
    metin:TEdit;
    onay:TCheckBox;
    liste: TListBox;
    acilir: TCombobox;
    yazi :TRichEdit;
    secim:TShape;
    i:integer;
    secimRect,tempRect: TRect;
begin
if Componentcount<>0 then
begin
gecici:=Components[componentcount-1];
if gecici is TShape then begin
temp:=Components[componentcount-1];
        if temp is TShape then
        begin
         secim := temp as TShape;
         secimRect:= secim.BoundsRect;
         for i:=form1.ComponentCount-1 downto 0 do
         begin
                gecici:=components[i];
                if gecici is TBitBtn then begin
                dugmemiz:=gecici as TBitBtn;
                tempRect:=dugmemiz.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  dugmemiz.left:=secim.left;
                end else
                if gecici is TStatictext then begin
                etiket:=gecici as TStatictext;
                tempRect:=etiket.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  etiket.left:=secim.left;
                end else
                if gecici is TEdit then begin
                metin:=gecici as TEdit;
                tempRect:=metin.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                   metin.left:=secim.left;
                end else
                if gecici is TCHeckBox then begin
                        onay:=gecici as TCHeckBox;
                        tempRect:=onay.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   onay.left:=secim.left;
                end else
                if gecici is TListBox then begin
                        liste:=gecici as TListBox;
                        tempRect:=liste.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   liste.Left:=secim.left;
                end else
                if gecici is TCombobox then begin
                        acilir:=gecici as TCombobox;
                        tempRect:=acilir.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   acilir.left:=secim.left;
                end else
                if gecici is TRichEdit then begin
                        yazi:=gecici as TRichEdit;
                        tempRect:=yazi.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   yazi.left:=secim.left;
                end;
         end;
        end;
end;end;
end;

procedure TForm1.saga;
var temp,gecici:TComponent;
    dugmemiz:TBitBtn;
    etiket:TStatictext;
    metin:TEdit;
    onay:TCheckBox;
    liste: TListBox;
    acilir: TCombobox;
    yazi :TRichEdit;
    secim:TShape;
    i:integer;
    secimRect,tempRect: TRect;
begin
if Componentcount<>0 then
begin
gecici:=Components[componentcount-1];
if gecici is TShape then begin
temp:=Components[componentcount-1];
        if temp is TShape then
        begin
         secim := temp as TShape;
         secimRect:= secim.BoundsRect;
         for i:=form1.ComponentCount-1 downto 0 do
         begin
                gecici:=components[i];
                if gecici is TBitBtn then begin
                dugmemiz:=gecici as TBitBtn;
                tempRect:=dugmemiz.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  dugmemiz.left:=secim.left+secim.width-dugmemiz.width;
                end else
                if gecici is TStatictext then begin
                etiket:=gecici as TStatictext;
                tempRect:=etiket.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                  etiket.left:=secim.left+secim.width-etiket.width;
                end else
                if gecici is TEdit then begin
                metin:=gecici as TEdit;
                tempRect:=metin.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                   metin.left:=secim.left+secim.width-metin.Width;
                end else
                if gecici is TCHeckBox then begin
                        onay:=gecici as TCHeckBox;
                        tempRect:=onay.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   onay.left:=secim.left+secim.width-onay.Width;
                end else
                if gecici is TListBox then begin
                        liste:=gecici as TListBox;
                        tempRect:=liste.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   liste.Left:=secim.left+secim.width-liste.Width;
                end else
                if gecici is TCombobox then begin
                        acilir:=gecici as TCombobox;
                        tempRect:=acilir.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   acilir.left:=secim.left+secim.width-acilir.Width;
                end else
                if gecici is TRichEdit then begin
                        yazi:=gecici as TRichEdit;
                        tempRect:=yazi.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                   yazi.left:=secim.left+secim.width-yazi.Width;
                end;
         end;
        end;
end;end;
end;

procedure TForm1.yataydagit;  //belli aralýk olarak
var temp,gecici:TComponent;
    dugmemiz:TBitBtn;
    etiket:TStatictext;
    metin:TEdit;
    secim:TShape;
    onay:TCheckBox;
    liste: TListBox;
    acilir: TCombobox;
    yazi :TRichEdit;
    i:integer;
    secimRect,tempRect: TRect;
    aralik:string;eskinokta:integer;
    str1, str2:string;
begin
aralik:='10';
if Componentcount<>0 then
begin
gecici:=Components[componentcount-1];
if gecici is TShape then begin
temp:=Components[componentcount-1];
if form2.rke1.checked then begin
str1:=loadstr(89);
str2:=loadstr(91);
end
else
begin
str1:=loadstr(1089);
str2:=loadstr(1091);
end;
if InputQuery(str1,str2,aralik) then
        if temp is TShape then
        begin
         secim := temp as TShape;
         secimRect:= secim.BoundsRect;
         eskinokta:=secim.Left;
         for i:=0 to form1.ComponentCount-1 do
         begin
                gecici:=components[i];
                if gecici is TBitBtn then begin
                dugmemiz:=gecici as TBitBtn;
                tempRect:=dugmemiz.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then begin
                 dugmemiz.left:=eskinokta;
                 eskinokta:=dugmemiz.Left+dugmemiz.Width+strtoint(aralik);
                 end;
                end else
                if gecici is TStatictext then begin
                etiket:=gecici as TStatictext;
                tempRect:=etiket.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then begin
                 etiket.left:=eskinokta;
                 eskinokta:=etiket.Left+etiket.Width+strtoint(aralik);
                 end;
                end else
                if gecici is TEdit then begin
                metin:=gecici as TEdit;
                tempRect:=metin.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then
                 begin
                 metin.left:=eskinokta;
                 eskinokta:=metin.Left+metin.Width+strtoint(aralik);
                 end;
                end else
                if gecici is TCHeckBox then begin
                        onay:=gecici as TCHeckBox;
                        tempRect:=onay.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                 begin
                 onay.left:=eskinokta;
                 eskinokta:=onay.Left+onay.Width+strtoint(aralik);
                 end;
                end else
                if gecici is TListBox then begin
                        liste:=gecici as TListBox;
                        tempRect:=liste.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                 begin
                 liste.left:=eskinokta;
                 eskinokta:=liste.Left+liste.Width+strtoint(aralik);
                 end;
                end else
                if gecici is TCombobox then begin
                        acilir:=gecici as TCombobox;
                        tempRect:=acilir.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                 begin
                 acilir.left:=eskinokta;
                 eskinokta:=acilir.Left+acilir.Width+strtoint(aralik);
                 end;
                end else
                if gecici is TRichEdit then begin
                        yazi:=gecici as TRichEdit;
                        tempRect:=yazi.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                 begin
                 yazi.left:=eskinokta;
                 eskinokta:=yazi.Left+yazi.Width+strtoint(aralik);
                 end;
                end;
         end;
        end;
end;end;
end;

procedure TForm1.dikeydagit;
var temp,gecici:TComponent;
    dugmemiz:TBitBtn;
    etiket:TStatictext;
    metin:TEdit;
    onay:TCheckBox;
    liste: TListBox;
    acilir: TCombobox;
    yazi :TRichEdit;
    secim:TShape;
    i:integer;
    secimRect,tempRect: TRect;
    aralik:string;eskinokta:integer;
    str1,str2:string;
begin
aralik:='10';
if Componentcount<>0 then
begin
gecici:=Components[componentcount-1];
if gecici is TShape then begin
temp:=Components[componentcount-1];
if form2.rke1.checked then begin
str1:=loadstr(90);
str2:=loadstr(91);
end
else
begin
str1:=loadstr(1090);
str2:=loadstr(1091);
end;
if InputQuery(str1,str2,aralik) then
        if temp is TShape then
        begin
         secim := temp as TShape;
         secimRect:= secim.BoundsRect;
         eskinokta:=secim.top;
         for i:=0 to form1.ComponentCount-1 do
         begin
                gecici:=components[i];
                if gecici is TBitBtn then begin
                dugmemiz:=gecici as TBitBtn;
                tempRect:=dugmemiz.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then begin
                 dugmemiz.top:=eskinokta;
                 eskinokta:=dugmemiz.top+dugmemiz.height+strtoint(aralik);
                 end;
                end else
                if gecici is TStatictext then begin
                etiket:=gecici as TStatictext;
                tempRect:=etiket.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then begin
                 etiket.top:=eskinokta;
                 eskinokta:=etiket.top+etiket.height+strtoint(aralik);
                 end;
                end else
                if gecici is TEdit then begin
                metin:=gecici as TEdit;
                tempRect:=metin.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then begin
                 metin.top:=eskinokta;
                 eskinokta:=metin.top+metin.height+strtoint(aralik);
                 end;
                end else
                if gecici is TCHeckBox then begin
                        onay:=gecici as TCHeckBox;
                        tempRect:=onay.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                 begin
                 onay.top:=eskinokta;
                 eskinokta:=onay.top+onay.height+strtoint(aralik);
                 end;
                end else
                if gecici is TListBox then begin
                        liste:=gecici as TListBox;
                        tempRect:=liste.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                 begin
                 liste.top:=eskinokta;
                 eskinokta:=liste.top+liste.height+strtoint(aralik);
                 end;
                end else
                if gecici is TCombobox then begin
                        acilir:=gecici as TCombobox;
                        tempRect:=acilir.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                 begin
                 acilir.top:=eskinokta;
                 eskinokta:=acilir.top+acilir.height+strtoint(aralik);
                 end;
                end else
                if gecici is TRichEdit then begin
                        yazi:=gecici as TRichEdit;
                        tempRect:=yazi.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                 begin
                 yazi.top:=eskinokta;
                 eskinokta:=yazi.top+yazi.height+strtoint(aralik);
                 end;
                end;
         end;
        end;
end;end;
end;

procedure TForm1.uygula(secili_satir:integer);  //seçili olanlara belli özellik atama
var temp,gecici:TComponent;
    dugmemiz:TBitBtn;
    etiket:TStatictext;
    metin:TEdit;
    onay:TCheckBox;
    liste: TListBox;
    acilir: TCombobox;
    yazi :TRichEdit;
    secim:TShape;
    i:integer;
    secimRect,tempRect: TRect;
begin
if Componentcount<>0 then
begin
gecici:=Components[componentcount-1];
if gecici is TShape then begin
temp:=Components[componentcount-1];
        if temp is TShape then
        begin
         secim := temp as TShape;
         secimRect:= secim.BoundsRect;
         for i:=0 to form1.ComponentCount-1 do
         begin
                gecici:=components[i];
                if gecici is TBitBtn then begin
                dugmemiz:=gecici as TBitBtn;
                tempRect:=dugmemiz.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then begin
                case secili_satir of
                0:if Form2.ValueListEditor1.Cells[1,0]=form2.komutlistesi('Evet') then
                     dugmemiz.Enabled:=true else
                     dugmemiz.Enabled:=false;
                1:   dugmemiz.Caption:=Form2.ValueListEditor1.Cells[1,1];
                2:   dugmemiz.top:=strtoint(Form2.ValueListEditor1.Cells[1,2]);
                3:   dugmemiz.left:=strtoint(Form2.ValueListEditor1.Cells[1,3]);
                4:   dugmemiz.width:=strtoint(Form2.ValueListEditor1.Cells[1,4]);
                5:   dugmemiz.Height:=strtoint(Form2.ValueListEditor1.Cells[1,5]);
                6:   dugmemiz.Hint:=Form2.ValueListEditor1.Cells[1,6];
                7:   dugmemiz.font.Color:=strtoint(Form2.ValueListEditor1.Cells[1,7]);
                8:   dugmemiz.font:=Form2.FontDialog1.Font;
                end;
                 end;
                end else
                if gecici is TStatictext then begin
                etiket:=gecici as TStatictext;
                tempRect:=etiket.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then begin
                case secili_satir of
                0:if Form2.ValueListEditor1.Cells[1,0]=form2.komutlistesi('Evet') then
                     etiket.Enabled:=true else
                     etiket.Enabled:=false;
                1:   etiket.Caption:=Form2.ValueListEditor1.Cells[1,1];
                2:   etiket.top:=strtoint(Form2.ValueListEditor1.Cells[1,2]);
                3:   etiket.left:=strtoint(Form2.ValueListEditor1.Cells[1,3]);
                4:   etiket.width:=strtoint(Form2.ValueListEditor1.Cells[1,4]);
                5:   etiket.Height:=strtoint(Form2.ValueListEditor1.Cells[1,5]);
                6:   etiket.Hint:=Form2.ValueListEditor1.Cells[1,6];
                7:   etiket.color:=strtoint(Form2.ValueListEditor1.Cells[1,7]);
                8:   etiket.font:=Form2.FontDialog1.Font;
                end;
                 end;
                end else
                if gecici is TEdit then begin
                metin:=gecici as TEdit;
                tempRect:=metin.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then begin
                case secili_satir of
                0:if Form2.ValueListEditor1.Cells[1,0]=form2.komutlistesi('Evet') then
                     metin.Enabled:=true else
                     metin.Enabled:=false;
                1:   metin.text:=Form2.ValueListEditor1.Cells[1,1];
                2:   metin.top:=strtoint(Form2.ValueListEditor1.Cells[1,2]);
                3:   metin.left:=strtoint(Form2.ValueListEditor1.Cells[1,3]);
                4:   metin.width:=strtoint(Form2.ValueListEditor1.Cells[1,4]);
                5:   metin.Height:=strtoint(Form2.ValueListEditor1.Cells[1,5]);
                6:   metin.Hint:=Form2.ValueListEditor1.Cells[1,6];
                7:   metin.color:=strtoint(Form2.ValueListEditor1.Cells[1,7]);
                8:   metin.font:=Form2.FontDialog1.Font;
                end;
                 end;
                end else
                if gecici is TCheckBox then begin
                onay:=gecici as TCheckBox;
                tempRect:=onay.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then begin
                case secili_satir of
                0:if Form2.ValueListEditor1.Cells[1,0]=form2.komutlistesi('Evet') then
                     onay.Enabled:=true else
                     onay.Enabled:=false;
                1:   onay.Caption:=Form2.ValueListEditor1.Cells[1,1];
                2:   onay.top:=strtoint(Form2.ValueListEditor1.Cells[1,2]);
                3:   onay.left:=strtoint(Form2.ValueListEditor1.Cells[1,3]);
                4:   onay.width:=strtoint(Form2.ValueListEditor1.Cells[1,4]);
                5:   onay.Height:=strtoint(Form2.ValueListEditor1.Cells[1,5]);
                6:   onay.Hint:=Form2.ValueListEditor1.Cells[1,6];
                7:   onay.color:=strtoint(Form2.ValueListEditor1.Cells[1,7]);
                8:   onay.font:=Form2.FontDialog1.Font;
                end;
                 end;
                end else
                if gecici is TListBox then begin
                liste:=gecici as TListBox;
                tempRect:=liste.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then begin
                case secili_satir of
                0:if Form2.ValueListEditor1.Cells[1,0]=form2.komutlistesi('Evet') then
                     liste.Enabled:=true else
                     liste.Enabled:=false;
//                1:   liste.text:=Form2.ValueListEditor1.Cells[1,1];
                2:   liste.top:=strtoint(Form2.ValueListEditor1.Cells[1,2]);
                3:   liste.left:=strtoint(Form2.ValueListEditor1.Cells[1,3]);
                4:   liste.width:=strtoint(Form2.ValueListEditor1.Cells[1,4]);
                5:   liste.Height:=strtoint(Form2.ValueListEditor1.Cells[1,5]);
                6:   liste.Hint:=Form2.ValueListEditor1.Cells[1,6];
                7:   liste.color:=strtoint(Form2.ValueListEditor1.Cells[1,7]);
                8:   liste.font:=Form2.FontDialog1.Font;
                end;
                 end;
                end else
                if gecici is TCombobox then begin
                acilir:=gecici as TCombobox;
                tempRect:=acilir.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then begin
                case secili_satir of
                0:if Form2.ValueListEditor1.Cells[1,0]=form2.komutlistesi('Evet') then
                     acilir.Enabled:=true else
                     acilir.Enabled:=false;
                1:   acilir.text:=Form2.ValueListEditor1.Cells[1,1];
                2:   acilir.top:=strtoint(Form2.ValueListEditor1.Cells[1,2]);
                3:   acilir.left:=strtoint(Form2.ValueListEditor1.Cells[1,3]);
                4:   acilir.width:=strtoint(Form2.ValueListEditor1.Cells[1,4]);
                5:   acilir.Height:=strtoint(Form2.ValueListEditor1.Cells[1,5]);
                6:   acilir.Hint:=Form2.ValueListEditor1.Cells[1,6];
                7:   acilir.color:=strtoint(Form2.ValueListEditor1.Cells[1,7]);
                8:   acilir.font:=Form2.FontDialog1.Font;
                end;
                 end;
                end else
                if gecici is TRichEdit then begin
                yazi:=gecici as TRichEdit;
                tempRect:=yazi.BoundsRect;
                if dokunuyor_mu(tempRect,secimRect) then begin
                case secili_satir of
                0:if Form2.ValueListEditor1.Cells[1,0]=form2.komutlistesi('Evet') then
                     yazi.Enabled:=true else
                     yazi.Enabled:=false;
                1:   yazi.text:=Form2.ValueListEditor1.Cells[1,1];
                2:   yazi.top:=strtoint(Form2.ValueListEditor1.Cells[1,2]);
                3:   yazi.left:=strtoint(Form2.ValueListEditor1.Cells[1,3]);
                4:   yazi.width:=strtoint(Form2.ValueListEditor1.Cells[1,4]);
                5:   yazi.Height:=strtoint(Form2.ValueListEditor1.Cells[1,5]);
                6:   yazi.Hint:=Form2.ValueListEditor1.Cells[1,6];
                7:   yazi.color:=strtoint(Form2.ValueListEditor1.Cells[1,7]);
                8:   yazi.font:=Form2.FontDialog1.Font;
                end;
                 end;
                end;
         end;
        end;
end;
end;
end;

procedure TForm1.hinti(Sender: TObject);
var
   S:string;
begin
   S:=Application.Hint;
   if (S <> '') then begin
      form2.StatusBar1.SimpleText:=Application.Hint;
      form14.StatusBar1.SimpleText:=Application.Hint;
      end;
end;

procedure TForm1.delay(sec,msec:word);
var
start,stop:longint;
begin
start := gettickcount;
repeat
stop := gettickcount;
application.processmessages;
until (stop - start ) >= msec;   
end;

procedure TForm1.flash;
begin
//
end;

procedure TForm1.GlobalhataDeposu(Sender: TObject; E: Exception);
begin
//  Application.ShowException(E);
//  Application.Terminate;
  form2.StatusBar1.SimpleText:=E.ClassName+' : '+E.Message;
  form2.ListBox1.Items.Add(E.ClassName+' : '+E.Message);
end;

procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
    toplamPara:string;
begin
DecimalSeparator := ',';                //Yunus'un varsayýlan sayý ayracý
ShortDateFormat := 'mm/dd/yyyy';        //tarih
ShortTimeFormat := 'hh:mm:ss';          //saat

nesne_sayisi;
Application.HintColor:=claqua;
Application.HintHidePause:=3000;  //hint bekleme zamaný
Application.HintPause:=300;   //hint çýkma zamaný
Application.OnHint:=hinti;
Application.OnException:=Globalhatadeposu;
RegisterExtension('.proje', 'Yunus Proje Dosyasi', Application.ExeName); //sadece proje açýlmasý yeterli

toplamPara:='';
for i:=1 to ParamCount do
 toplampara:=toplampara+' '+Paramstr(i); //boþluklu klasör adlarý sorun çýkarýyordu, bir sürü parametre...
toplampara:=trim(toplampara);

//  toplampara:= GetCommandLine; //2. yöntem XP 'de  noolcak? GetShortPathName() ..
//  Delete(toplampara, 1, pos('exe"', toplampara) + 4);

if toplamPara<>'' then begin
  form2.ToolButton9.Enabled:=true;
  form2.ToolButton7.Enabled:=false;
  hepsiniac(form2.dosyaadi_ayikla(toplamPara)); //dýþarýdan açýlmýþ ise
  form2.akilliListe;
  form1.nesne_sayisi;

  form2.ComboBox1.text:=form2.komutlistesi('Form');
//  form9.ilkoku;
  form2.grid;
end;
for i:=1 to maxNesne do seciliNesneler[i].degerListesi := TStringList.Create;
aktifPencereNo:=1;
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
cursor:=crDefault;
FareImleciNormallestir;
   if form2.ToolButton9.enabled then
     form2.StatusBar1.SimpleText:=format('%d , %d',[x,y]);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
form2.ComboBox1.Text:=form2.komutlistesi('Form');
form2.grid;
end;

procedure TForm1.FormPaint(Sender: TObject);
var x,y:integer;
   axa:integer;
begin
if form2.ToolButton9.enabled then begin
 x:=0;
 axa:=form3.SpinEdit2.Value;
 while (x<form1.Width) do
 begin
  x:=x+form3.SpinEdit2.Value;y:=0;
 while (y<form1.Height) do
   begin
    y:=y+form3.SpinEdit2.Value;
      form1.Canvas.Pen.Mode:=pmMaskPenNot;
      form1.Canvas.Pixels[x- axa -1,y- axa -1]:=clWindow;
   end;
  end;
end;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if form2.ToolButton7.enabled then begin
 form2.ToolButton7Click(self);
 canclose:=false;
 end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
aktifpencere:=true;
aktifPencereNo:=strtoint(no_ayikla(screen.ActiveForm.Name));

form2.ToolButton5.ImageIndex:=5;
form2.ToolButton5.Hint:=loadstr(ararakam+18);
//if form2.ToolButton7.enabled then SetDesigning(True) else SetDesigning(false); //hmmm ilginç...
end;

procedure TForm1.cevir(gelen: byte);
var temp,gecici:TComponent;
    temp2,secim:TShape;
    i,j,toplam:integer;
    dugmemiz, d2        :TBitBtn;
    etiket, e2          :TStatictext;
    metin, m2           :TEdit;
    onay, c2            :TCheckBox;
    liste, l2           :TListBox;
    acilir, a2          :TCombobox;
    yazi, y2            :TRichEdit;
    secimRect,tempRect: TRect;
    Silinecek_CompNo: array [0..maxNesne] of integer;
    kacinci:integer;
begin
if componentcount<>0 then begin
temp:=Components[componentcount-1];
for i:=0 to maxNesne do Silinecek_CompNo[i]:=-1;
kacinci:=-1;

  if temp is TShape then
  begin
         secim := temp as TShape;
         secimRect := secim.BoundsRect;
         toplam:=form1.ComponentCount-1;
         
         for i:=toplam downto 0 do
         begin
                gecici:=components[i];
////////////////////////////////////////////////////Düðme -> ...
                if gecici is TBitBtn then begin
                        dugmemiz:=gecici as TBitBtn;
                        tempRect:=dugmemiz.BoundsRect;
        if ada_ayikla(dugmemiz.name)=form2.komutlistesi('Dugme') then begin
                        if dokunuyor_mu(tempRect,secimRect) then
        case gelen of
        0:   //label
         begin

      e2 := TStatictext.Create (self);
      inc(labe);

      if form1.ComponentCount<>1 then
        e2.Name:=form2.komutlistesi('Etiket')+inttostr(bos_nesne_bul('TStaticText'))
      else
        e2.Name:=form2.komutlistesi('Etiket')+inttostr(labe);

      e2.Parent:= self;
      e2.top:=dugmemiz.Top;
      e2.left:=dugmemiz.left;
      e2.width:=dugmemiz.width;
      e2.height:=dugmemiz.height;
      e2.hint:=dugmemiz.hint;
      e2.ParentShowHint:=true;
//      etiket.TabStop:=false;
      e2.AutoSize:=true;
      e2.font.name:=dugmemiz.font.name;
      e2.font.style:=dugmemiz.font.Style;
      e2.font.CharSet:=dugmemiz.font.Charset;
      e2.font.size:=dugmemiz.font.size;
      e2.font.color:=dugmemiz.font.color;
      e2.showhint:=true;
      e2.enabled:=dugmemiz.Enabled;
      e2.Caption:=dugmemiz.Caption;
      e2.OnClick:=form1.tiklama;
      e2.OnMouseDown:=surukle;
      e2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        1:   //edit
         begin
      m2 := Tedit.Create (self);
      inc(edit);

      if form1.ComponentCount<>1 then
        m2.Name:=form2.komutlistesi('MetinKutusu')+inttostr(bos_nesne_bul('TEdit'))
      else
        m2.Name:=form2.komutlistesi('MetinKutusu')+inttostr(edit);

      m2.Parent:= self;
      m2.top:=dugmemiz.Top;
      m2.left:=dugmemiz.left;
      m2.width:=dugmemiz.width;
      m2.height:=dugmemiz.height;
      m2.hint:=dugmemiz.hint;
      m2.ParentShowHint:=true;
//      metin.TabStop:=false;
      m2.font.name:=dugmemiz.font.name;
      m2.font.style:=dugmemiz.font.Style;
      m2.font.CharSet:=dugmemiz.font.Charset;
      m2.font.size:=dugmemiz.font.size;
      m2.font.color:=dugmemiz.font.color;
      m2.showhint:=true;
      m2.enabled:=dugmemiz.Enabled;
      m2.text:=dugmemiz.Caption;
        m2.OnKeyPress:=form1.tusbasimi;
        m2.OnEnter:= form1.nesne_giris;
        m2.OnChange:=form1.degistiginde;
        m2.OnExit:=form1.metin_cikisi;
        m2.OnMouseDown:=surukle;
        m2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        2:   //bitbtn - ups
         begin
         end;
        3:   //Checkbox
         begin
      c2 := Tcheckbox.Create (self);
      inc(check);

      if form1.ComponentCount<>1 then
        c2.Name:=form2.komutlistesi('OnayKutusu')+inttostr(bos_nesne_bul('TCheckBox'))
      else
        c2.Name:=form2.komutlistesi('OnayKutusu')+inttostr(check);

      c2.Parent:= self;
      c2.top:=dugmemiz.Top;
      c2.left:=dugmemiz.left;
      c2.width:=dugmemiz.width;
      c2.height:=dugmemiz.height;
      c2.hint:=dugmemiz.hint;
      c2.ParentShowHint:=true;
//      metin.TabStop:=false;
      c2.font.name:=dugmemiz.font.name;
      c2.font.style:=dugmemiz.font.Style;
      c2.font.CharSet:=dugmemiz.font.Charset;
      c2.font.size:=dugmemiz.font.size;
      c2.font.color:=dugmemiz.font.color;
      c2.showhint:=true;
      c2.enabled:=dugmemiz.Enabled;
      c2.Caption:=dugmemiz.Caption;
        c2.OnMouseDown:=surukle;
        c2.OnEnter:= nesne_giris;
        c2.OnClick:=form1.tiklama;
        c2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        4:   //listbox
         begin
      l2 := TListBox.Create (self);
      inc(list);

      if form1.ComponentCount<>1 then
        l2.Name:=form2.komutlistesi('ListeKutusu')+inttostr(bos_nesne_bul('TListBox'))
      else
        l2.Name:=form2.komutlistesi('ListeKutusu')+inttostr(list);

      l2.Parent:= self;
      l2.top:=dugmemiz.Top;
      l2.left:=dugmemiz.left;
      l2.width:=dugmemiz.width;
      l2.height:=dugmemiz.height;
      l2.hint:=dugmemiz.hint;
      l2.ParentShowHint:=true;
//      metin.TabStop:=false;
      l2.font.name:=dugmemiz.font.name;
      l2.font.style:=dugmemiz.font.Style;
      l2.font.CharSet:=dugmemiz.font.Charset;
      l2.font.size:=dugmemiz.font.size;
      l2.font.color:=dugmemiz.font.color;
      l2.showhint:=true;
      l2.enabled:=dugmemiz.Enabled;
      l2.Items.Text:=dugmemiz.Caption;
        l2.OnMouseDown:=surukle;
        l2.OnClick:=form1.tiklama;
        l2.OnEnter:= nesne_giris;
        l2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        5:   //combobox
         begin
      a2 := TComboBox.Create (self);
      inc(combo);

      if form1.ComponentCount<>1 then
        a2.Name:=form2.komutlistesi('AcilirKutu')+inttostr(bos_nesne_bul('TComboBox'))
      else
        a2.Name:=form2.komutlistesi('AcilirKutu')+inttostr(combo);

      a2.Parent:= self;
      a2.top:=dugmemiz.Top;
      a2.left:=dugmemiz.left;
      a2.width:=dugmemiz.width;
      a2.height:=dugmemiz.height;
      a2.hint:=dugmemiz.hint;
      a2.ParentShowHint:=true;
//      metin.TabStop:=false;
      a2.font.name:=dugmemiz.font.name;
      a2.font.style:=dugmemiz.font.Style;
      a2.font.CharSet:=dugmemiz.font.Charset;
      a2.font.size:=dugmemiz.font.size;
      a2.font.color:=dugmemiz.font.color;
      a2.showhint:=true;
      a2.enabled:=dugmemiz.Enabled;
      a2.items.Text:=dugmemiz.Caption;
       a2.DragCursor:=crDefault;
       a2.DragMode:=dmAutomatic;
       a2.OnChange:=form1.degistiginde;
       a2.OnEnter:= nesne_giris;
       a2.OnDragOver:=surukleCombo;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        6:   //richedit
         begin
      y2 := TRichEdit.Create (self);
      inc(redit);

      if form1.ComponentCount<>1 then
        y2.Name:=form2.komutlistesi('YaziKutusu')+inttostr(bos_nesne_bul('TRichEdit'))
      else
        y2.Name:=form2.komutlistesi('YaziKutusu')+inttostr(redit);

      y2.Parent:= self;
      y2.top:=dugmemiz.Top;
      y2.left:=dugmemiz.left;
      y2.width:=dugmemiz.width;
      y2.height:=dugmemiz.height;
      y2.hint:=dugmemiz.hint;
      y2.ParentShowHint:=true;
//      metin.TabStop:=false;
      y2.font.name:=dugmemiz.font.name;
      y2.font.style:=dugmemiz.font.Style;
      y2.font.CharSet:=dugmemiz.font.Charset;
      y2.font.size:=dugmemiz.font.size;
      y2.font.color:=dugmemiz.font.color;
      y2.showhint:=true;
      y2.enabled:=dugmemiz.Enabled;
      y2.Lines.text:=dugmemiz.Caption;
      y2.ScrollBars:=ssBoth;
      y2.WordWrap:=false;
        y2.OnMouseDown:=surukle;
        y2.OnChange:=form1.degistiginde;
        y2.OnEnter:= nesne_giris;
        y2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
         end;
        end;
////////////////////////////////////////////////////Etiket -> ...
                end else
                if gecici is TStatictext then begin
                        etiket:=gecici as TStatictext;
                        tempRect:=etiket.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
        case gelen of
        0:   //label - ups
         begin
         end;
        1:   //edit
         begin
      m2 := Tedit.Create (self);
      inc(edit);

      if form1.ComponentCount<>1 then
        m2.Name:=form2.komutlistesi('MetinKutusu')+inttostr(bos_nesne_bul('TEdit'))
      else
        m2.Name:=form2.komutlistesi('MetinKutusu')+inttostr(edit);

      m2.Parent:= self;
      m2.top:=etiket.Top;
      m2.left:=etiket.left;
      m2.width:=etiket.width;
      m2.height:=etiket.height;
      m2.hint:=etiket.hint;
      m2.ParentShowHint:=true;
      m2.Color:=etiket.Color;
//      metin.TabStop:=false;
      m2.font.name:=etiket.font.name;
      m2.font.style:=etiket.font.Style;
      m2.font.CharSet:=etiket.font.Charset;
      m2.font.size:=etiket.font.size;
      m2.font.color:=etiket.font.color;
      m2.showhint:=true;
      m2.enabled:=etiket.Enabled;
      m2.text:=etiket.Caption;
        m2.OnKeyPress:=form1.tusbasimi;
        m2.OnEnter:= form1.nesne_giris;
        m2.OnExit:=form1.metin_cikisi;
        m2.OnChange:=form1.degistiginde;
        m2.OnMouseDown:=surukle;
        m2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        2:   //bitbtn
         begin
      d2 := TBitBtn.Create (self);
      inc(butt);

      if form1.ComponentCount<>1 then
        d2.Name:=form2.komutlistesi('Dugme')+inttostr(bos_nesne_bul('TBitBtn'))
      else
        d2.Name:=form2.komutlistesi('Dugme')+inttostr(butt);

      d2.Parent:= self;
      d2.top:=etiket.Top;
      d2.left:=etiket.left;
      d2.width:=etiket.width;
      d2.height:=etiket.height;
      d2.hint:=etiket.hint;
      d2.ParentShowHint:=true;
//      etiket.TabStop:=false;
//      d2.AutoSize:=true;
//      e2.Color:=dugmemiz.font.color;
      d2.font.name:=etiket.font.name;
      d2.font.style:=etiket.font.Style;
      d2.font.CharSet:=etiket.font.Charset;
      d2.font.size:=etiket.font.size;
      d2.font.color:=etiket.font.color;
      d2.showhint:=true;
      d2.enabled:=etiket.Enabled;
      d2.Caption:=etiket.Caption;
      d2.OnClick:=form1.tiklama;
      d2.OnMouseDown:=surukle;
      d2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        3:   //Checkbox
         begin
      c2 := Tcheckbox.Create (self);
      inc(check);

      if form1.ComponentCount<>1 then
        c2.Name:=form2.komutlistesi('OnayKutusu')+inttostr(bos_nesne_bul('TCheckBox'))
      else
        c2.Name:=form2.komutlistesi('OnayKutusu')+inttostr(check);

      c2.Parent:= self;
      c2.top:=etiket.Top;
      c2.left:=etiket.left;
      c2.width:=etiket.width;
      c2.height:=etiket.height;
      c2.hint:=etiket.hint;
      c2.ParentShowHint:=true;
      c2.Color:=etiket.Color;
//      metin.TabStop:=false;
      c2.font.name:=etiket.font.name;
      c2.font.style:=etiket.font.Style;
      c2.font.CharSet:=etiket.font.Charset;
      c2.font.size:=etiket.font.size;
      c2.font.color:=etiket.font.color;
      c2.showhint:=true;
      c2.enabled:=etiket.Enabled;
      c2.Caption:=etiket.Caption;
        c2.OnMouseDown:=surukle;
        c2.OnEnter:= nesne_giris;
        c2.OnClick:=form1.tiklama;
        c2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        4:   //listbox
         begin
      l2 := TListBox.Create (self);
      inc(list);

      if form1.ComponentCount<>1 then
        l2.Name:=form2.komutlistesi('ListeKutusu')+inttostr(bos_nesne_bul('TListBox'))
      else
        l2.Name:=form2.komutlistesi('ListeKutusu')+inttostr(list);

      l2.Parent:= self;
      l2.top:=etiket.Top;
      l2.left:=etiket.left;
      l2.width:=etiket.width;
      l2.height:=etiket.height;
      l2.hint:=etiket.hint;
      l2.ParentShowHint:=true;
      l2.Color:=etiket.Color;
//      metin.TabStop:=false;
      l2.font.name:=etiket.font.name;
      l2.font.style:=etiket.font.Style;
      l2.font.CharSet:=etiket.font.Charset;
      l2.font.size:=etiket.font.size;
      l2.font.color:=etiket.font.color;
      l2.showhint:=true;
      l2.enabled:=etiket.Enabled;
      l2.Items.Text:=etiket.Caption;
        l2.OnMouseDown:=surukle;
        l2.OnEnter:= nesne_giris;
        l2.OnClick:=form1.tiklama;
        l2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        5:   //combobox
         begin
      a2 := TComboBox.Create (self);
      inc(combo);

      if form1.ComponentCount<>1 then
        a2.Name:=form2.komutlistesi('AcilirKutu')+inttostr(bos_nesne_bul('TComboBox'))
      else
        a2.Name:=form2.komutlistesi('AcilirKutu')+inttostr(combo);

      a2.Parent:= self;
      a2.top:=etiket.Top;
      a2.left:=etiket.left;
      a2.width:=etiket.width;
      a2.height:=etiket.height;
      a2.hint:=etiket.hint;
      a2.ParentShowHint:=true;
      a2.Color:=etiket.Color;
//      metin.TabStop:=false;
      a2.font.name:=etiket.font.name;
      a2.font.style:=etiket.font.Style;
      a2.font.CharSet:=etiket.font.Charset;
      a2.font.size:=etiket.font.size;
      a2.font.color:=etiket.font.color;
      a2.showhint:=true;
      a2.enabled:=etiket.Enabled;
      a2.items.text:=etiket.Caption;
       a2.DragCursor:=crDefault;
       a2.DragMode:=dmAutomatic;
       a2.OnChange:=form1.degistiginde;
       a2.OnEnter:= nesne_giris;
       a2.OnDragOver:=surukleCombo;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        6:   //richedit
         begin
      y2 := TRichEdit.Create (self);
      inc(redit);

      if form1.ComponentCount<>1 then
        y2.Name:=form2.komutlistesi('YaziKutusu')+inttostr(bos_nesne_bul('TRichEdit'))
      else
        y2.Name:=form2.komutlistesi('YaziKutusu')+inttostr(redit);

      y2.Parent:= self;
      y2.top:=etiket.Top;
      y2.left:=etiket.left;
      y2.width:=etiket.width;
      y2.height:=etiket.height;
      y2.hint:=etiket.hint;
      y2.ParentShowHint:=true;
      y2.Color:=etiket.Color;
//      metin.TabStop:=false;
      y2.font.name:=etiket.font.name;
      y2.font.style:=etiket.font.Style;
      y2.font.CharSet:=etiket.font.Charset;
      y2.font.size:=etiket.font.size;
      y2.font.color:=etiket.font.color;
      y2.showhint:=true;
      y2.enabled:=etiket.Enabled;
      y2.text:=etiket.Caption;
      y2.ScrollBars:=ssBoth;
      y2.WordWrap:=false;
        y2.OnMouseDown:=surukle;
        y2.OnEnter:= nesne_giris;
        y2.OnChange:=form1.degistiginde;
        y2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        end;
                end else
////////////////////////////////////////////////////Metin Kutusu -> ...
                if gecici is TEdit then begin
                        metin:=gecici as TEdit;
                        tempRect:=metin.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
        case gelen of
        0:   //label
         begin
      e2 := TStatictext.Create (self);
      inc(labe);

      if form1.ComponentCount<>1 then
        e2.Name:=form2.komutlistesi('Etiket')+inttostr(bos_nesne_bul('TStaticText'))
      else
        e2.Name:=form2.komutlistesi('Etiket')+inttostr(labe);

      e2.Parent:= self;
      e2.top:=metin.Top;
      e2.left:=metin.left;
      e2.width:=metin.width;
      e2.height:=metin.height;
      e2.hint:=metin.hint;
      e2.ParentShowHint:=true;
//      etiket.TabStop:=false;
      e2.AutoSize:=true;
      e2.Color:=metin.color;
      e2.font.name:=metin.font.name;
      e2.font.style:=metin.font.Style;
      e2.font.CharSet:=metin.font.Charset;
      e2.font.size:=metin.font.size;
      e2.font.color:=metin.font.color;
      e2.showhint:=true;
      e2.enabled:=metin.Enabled;
      e2.Caption:=metin.text;
      e2.OnClick:=form1.tiklama;
      e2.OnMouseDown:=surukle;
      e2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        1:   //edit - ups
         begin
         end;
        2:   //bitbtn
         begin
      d2 := TBitBtn.Create (self);
      inc(butt);

      if form1.ComponentCount<>1 then
        d2.Name:=form2.komutlistesi('Dugme')+inttostr(bos_nesne_bul('TBitBtn'))
      else
        d2.Name:=form2.komutlistesi('Dugme')+inttostr(butt);

      d2.Parent:= self;
      d2.top:=metin.Top;
      d2.left:=metin.left;
      d2.width:=metin.width;
      d2.height:=metin.height;
      d2.hint:=metin.hint;
      d2.ParentShowHint:=true;
//      metin.TabStop:=false;
      d2.font.name:=metin.font.name;
      d2.font.style:=metin.font.Style;
      d2.font.CharSet:=metin.font.Charset;
      d2.font.size:=metin.font.size;
      d2.font.color:=metin.font.color;
      d2.showhint:=true;
      d2.enabled:=metin.Enabled;
      d2.Caption:=metin.text;
      d2.OnClick:=form1.tiklama;
      d2.OnMouseDown:=surukle;
      d2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        3:   //Checkbox
         begin
      c2 := Tcheckbox.Create (self);
      inc(check);

      if form1.ComponentCount<>1 then
        c2.Name:=form2.komutlistesi('OnayKutusu')+inttostr(bos_nesne_bul('TCheckBox'))
      else
        c2.Name:=form2.komutlistesi('OnayKutusu')+inttostr(check);

      c2.Parent:= self;
      c2.top:=metin.Top;
      c2.left:=metin.left;
      c2.width:=metin.width;
      c2.height:=metin.height;
      c2.hint:=metin.hint;
      c2.ParentShowHint:=true;
      c2.Color:=metin.color;
//      metin.TabStop:=false;
      c2.font.name:=metin.font.name;
      c2.font.style:=metin.font.Style;
      c2.font.CharSet:=metin.font.Charset;
      c2.font.size:=metin.font.size;
      c2.font.color:=metin.font.color;
      c2.showhint:=true;
      c2.enabled:=metin.Enabled;
      c2.Caption:=metin.text;
        c2.OnMouseDown:=surukle;
        c2.OnEnter:= nesne_giris;
        c2.OnClick:=form1.tiklama;
        c2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        4:   //listbox
         begin
      l2 := TListBox.Create (self);
      inc(list);

      if form1.ComponentCount<>1 then
        l2.Name:=form2.komutlistesi('ListeKutusu')+inttostr(bos_nesne_bul('TListBox'))
      else
        l2.Name:=form2.komutlistesi('ListeKutusu')+inttostr(list);

      l2.Parent:= self;
      l2.top:=metin.Top;
      l2.left:=metin.left;
      l2.width:=metin.width;
      l2.height:=metin.height;
      l2.hint:=metin.hint;
      l2.ParentShowHint:=true;
      l2.Color:=metin.color;
//      metin.TabStop:=false;
      l2.font.name:=metin.font.name;
      l2.font.style:=metin.font.Style;
      l2.font.CharSet:=metin.font.Charset;
      l2.font.size:=metin.font.size;
      l2.font.color:=metin.font.color;
      l2.showhint:=true;
      l2.enabled:=metin.Enabled;
      l2.Items.Text:=metin.text;
        l2.OnMouseDown:=surukle;
        l2.OnEnter:= nesne_giris;
        l2.OnClick:=form1.tiklama;
        l2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        5:   //combobox
         begin
      a2 := TComboBox.Create (self);
      inc(combo);

      if form1.ComponentCount<>1 then
        a2.Name:=form2.komutlistesi('AcilirKutu')+inttostr(bos_nesne_bul('TComboBox'))
      else
        a2.Name:=form2.komutlistesi('AcilirKutu')+inttostr(combo);

      a2.Parent:= self;
      a2.top:=metin.Top;
      a2.left:=metin.left;
      a2.width:=metin.width;
      a2.height:=metin.height;
      a2.hint:=metin.hint;
      a2.ParentShowHint:=true;
      a2.Color:=metin.color;
//      metin.TabStop:=false;
      a2.font.name:=metin.font.name;
      a2.font.style:=metin.font.Style;
      a2.font.CharSet:=metin.font.Charset;
      a2.font.size:=metin.font.size;
      a2.font.color:=metin.font.color;
      a2.showhint:=true;
      a2.enabled:=metin.Enabled;
      a2.items.text:=metin.text;
       a2.DragCursor:=crDefault;
       a2.DragMode:=dmAutomatic;
       a2.OnChange:=form1.degistiginde;
       a2.OnEnter:= nesne_giris;
       a2.OnDragOver:=surukleCombo;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        6:   //richedit
         begin
      y2 := TRichEdit.Create (self);
      inc(redit);

      if form1.ComponentCount<>1 then
        y2.Name:=form2.komutlistesi('YaziKutusu')+inttostr(bos_nesne_bul('TRichEdit'))
      else
        y2.Name:=form2.komutlistesi('YaziKutusu')+inttostr(redit);

      y2.Parent:= self;
      y2.top:=metin.Top;
      y2.left:=metin.left;
      y2.width:=metin.width;
      y2.height:=metin.height;
      y2.hint:=metin.hint;
      y2.ParentShowHint:=true;
      y2.Color:=metin.color;
//      metin.TabStop:=false;
      y2.font.name:=metin.font.name;
      y2.font.style:=metin.font.Style;
      y2.font.CharSet:=metin.font.Charset;
      y2.font.size:=metin.font.size;
      y2.font.color:=metin.font.color;
      y2.showhint:=true;
      y2.enabled:=metin.Enabled;
      y2.text:=metin.text;
      y2.ScrollBars:=ssBoth;
      y2.WordWrap:=false;
        y2.OnMouseDown:=surukle;
        y2.OnChange:=form1.degistiginde;
        y2.OnEnter:= nesne_giris;
        y2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        end;
////////////////////////////////////////////////////Onay Kutusu -> ...
                end else
                if gecici is TCHeckBox then begin
                        onay:=gecici as TCHeckBox;
                        tempRect:=onay.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
        case gelen of
        0:   //label
         begin
      e2 := TStatictext.Create (self);
      inc(labe);

      if form1.ComponentCount<>1 then
        e2.Name:=form2.komutlistesi('Etiket')+inttostr(bos_nesne_bul('TStaticText'))
      else
        e2.Name:=form2.komutlistesi('Etiket')+inttostr(labe);

      e2.Parent:= self;
      e2.top:=onay.Top;
      e2.left:=onay.left;
      e2.width:=onay.width;
      e2.height:=onay.height;
      e2.hint:=onay.hint;
      e2.ParentShowHint:=true;
//      etiket.TabStop:=false;
      e2.AutoSize:=true;
      e2.Color:=onay.color;
      e2.font.name:=onay.font.name;
      e2.font.style:=onay.font.Style;
      e2.font.CharSet:=onay.font.Charset;
      e2.font.size:=onay.font.size;
      e2.font.color:=onay.font.color;
      e2.showhint:=true;
      e2.enabled:=onay.Enabled;
      e2.Caption:=onay.Caption;
      e2.OnClick:=form1.tiklama;
      e2.OnMouseDown:=surukle;
      e2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        1:   //edit
         begin
      m2 := Tedit.Create (self);
      inc(edit);

      if form1.ComponentCount<>1 then
        m2.Name:=form2.komutlistesi('MetinKutusu')+inttostr(bos_nesne_bul('TEdit'))
      else
        m2.Name:=form2.komutlistesi('MetinKutusu')+inttostr(edit);

      m2.Parent:= self;
      m2.top:=onay.Top;
      m2.left:=onay.left;
      m2.width:=onay.width;
      m2.height:=onay.height;
      m2.hint:=onay.hint;
      m2.ParentShowHint:=true;
      m2.Color:=onay.color;
//      metin.TabStop:=false;
      m2.font.name:=onay.font.name;
      m2.font.style:=onay.font.Style;
      m2.font.CharSet:=onay.font.Charset;
      m2.font.size:=onay.font.size;
      m2.font.color:=onay.font.color;
      m2.showhint:=true;
      m2.enabled:=onay.Enabled;
      m2.text:=onay.Caption;
        m2.OnKeyPress:=form1.tusbasimi;
        m2.OnEnter:= form1.nesne_giris;
        m2.OnExit:=form1.metin_cikisi;
        m2.OnChange:=form1.degistiginde;
        m2.OnMouseDown:=surukle;
        m2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        2:   //bitbtn
         begin
      d2 := TBitBtn.Create (self);
      inc(butt);

      if form1.ComponentCount<>1 then
        d2.Name:=form2.komutlistesi('Dugme')+inttostr(bos_nesne_bul('TBitBtn'))
      else
        d2.Name:=form2.komutlistesi('Dugme')+inttostr(butt);

      d2.Parent:= self;
      d2.top:=onay.Top;
      d2.left:=onay.left;
      d2.width:=onay.width;
      d2.height:=onay.height;
      d2.hint:=onay.hint;
      d2.ParentShowHint:=true;
//      onay.TabStop:=false;
      d2.font.name:=onay.font.name;
      d2.font.style:=onay.font.Style;
      d2.font.CharSet:=onay.font.Charset;
      d2.font.size:=onay.font.size;
      d2.font.color:=onay.font.color;
      d2.showhint:=true;
      d2.enabled:=onay.Enabled;
      d2.Caption:=onay.Caption;
      d2.OnClick:=form1.tiklama;
      d2.OnMouseDown:=surukle;
      d2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        3:   //Checkbox - ups
         begin
         end;
        4:   //listbox
         begin
      l2 := TListBox.Create (self);
      inc(list);

      if form1.ComponentCount<>1 then
        l2.Name:=form2.komutlistesi('ListeKutusu')+inttostr(bos_nesne_bul('TListBox'))
      else
        l2.Name:=form2.komutlistesi('ListeKutusu')+inttostr(list);

      l2.Parent:= self;
      l2.top:=onay.Top;
      l2.left:=onay.left;
      l2.width:=onay.width;
      l2.height:=onay.height;
      l2.hint:=onay.hint;
      l2.ParentShowHint:=true;
      l2.Color:=onay.color;
//      metin.TabStop:=false;
      l2.font.name:=onay.font.name;
      l2.font.style:=onay.font.Style;
      l2.font.CharSet:=onay.font.Charset;
      l2.font.size:=onay.font.size;
      l2.font.color:=onay.font.color;
      l2.showhint:=true;
      l2.enabled:=onay.Enabled;
      l2.Items.Text:=onay.Caption;
        l2.OnMouseDown:=surukle;
        l2.OnClick:=form1.tiklama;
        l2.OnEnter:= nesne_giris;
        l2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        5:   //combobox
         begin
      a2 := TComboBox.Create (self);
      inc(combo);

      if form1.ComponentCount<>1 then
        a2.Name:=form2.komutlistesi('AcilirKutu')+inttostr(bos_nesne_bul('TComboBox'))
      else
        a2.Name:=form2.komutlistesi('AcilirKutu')+inttostr(combo);

      a2.Parent:= self;
      a2.top:=onay.Top;
      a2.left:=onay.left;
      a2.width:=onay.width;
      a2.height:=onay.height;
      a2.hint:=onay.hint;
      a2.ParentShowHint:=true;
      a2.Color:=onay.color;
//      metin.TabStop:=false;
      a2.font.name:=onay.font.name;
      a2.font.style:=onay.font.Style;
      a2.font.CharSet:=onay.font.Charset;
      a2.font.size:=onay.font.size;
      a2.font.color:=onay.font.color;
      a2.showhint:=true;
      a2.enabled:=onay.Enabled;
      a2.items.text:=onay.Caption;
       a2.DragCursor:=crDefault;
       a2.DragMode:=dmAutomatic;
       a2.OnChange:=form1.degistiginde;
       a2.OnEnter:= nesne_giris;
       a2.OnDragOver:=surukleCombo;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        6:   //richedit
         begin
      y2 := TRichEdit.Create (self);
      inc(redit);

      if form1.ComponentCount<>1 then
        y2.Name:=form2.komutlistesi('YaziKutusu')+inttostr(bos_nesne_bul('TRichEdit'))
      else
        y2.Name:=form2.komutlistesi('YaziKutusu')+inttostr(redit);

      y2.Parent:= self;
      y2.top:=onay.Top;
      y2.left:=onay.left;
      y2.width:=onay.width;
      y2.height:=onay.height;
      y2.hint:=onay.hint;
      y2.ParentShowHint:=true;
      y2.Color:=onay.color;
//      metin.TabStop:=false;
      y2.font.name:=onay.font.name;
      y2.font.style:=onay.font.Style;
      y2.font.CharSet:=onay.font.Charset;
      y2.font.size:=onay.font.size;
      y2.font.color:=onay.font.color;
      y2.showhint:=true;
      y2.enabled:=onay.Enabled;
      y2.text:=onay.Caption;
      y2.ScrollBars:=ssBoth;
      y2.WordWrap:=false;
        y2.OnMouseDown:=surukle;
        y2.OnChange:=form1.degistiginde;
        y2.OnEnter:= nesne_giris;
        y2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        end;
////////////////////////////////////////////////////Liste Kutusu -> ...
                end else
                if gecici is TListBox then begin
                        liste:=gecici as TListBox;
                        tempRect:=liste.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
        case gelen of
        0:   //label
         begin
      e2 := TStatictext.Create (self);
      inc(labe);

      if form1.ComponentCount<>1 then
        e2.Name:=form2.komutlistesi('Etiket')+inttostr(bos_nesne_bul('TStaticText'))
      else
        e2.Name:=form2.komutlistesi('Etiket')+inttostr(labe);

      e2.Parent:= self;
      e2.top:=liste.Top;
      e2.left:=liste.left;
      e2.width:=liste.width;
      e2.height:=liste.height;
      e2.hint:=liste.hint;
      e2.ParentShowHint:=true;
//      etiket.TabStop:=false;
      e2.AutoSize:=true;
      e2.Color:=liste.color;
      e2.font.name:=liste.font.name;
      e2.font.style:=liste.font.Style;
      e2.font.CharSet:=liste.font.Charset;
      e2.font.size:=liste.font.size;
      e2.font.color:=liste.font.color;
      e2.showhint:=true;
      e2.enabled:=liste.Enabled;
      e2.Caption:=liste.Items.Text;
      e2.OnClick:=form1.tiklama;
      e2.OnMouseDown:=surukle;
      e2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;

         end;
        1:   //edit
         begin
      m2 := Tedit.Create (self);
      inc(edit);

      if form1.ComponentCount<>1 then
        m2.Name:=form2.komutlistesi('MetinKutusu')+inttostr(bos_nesne_bul('TEdit'))
      else
        m2.Name:=form2.komutlistesi('MetinKutusu')+inttostr(edit);

      m2.Parent:= self;
      m2.top:=liste.Top;
      m2.left:=liste.left;
      m2.width:=liste.width;
      m2.height:=liste.height;
      m2.hint:=liste.hint;
      m2.ParentShowHint:=true;
      m2.Color:=liste.color;
//      metin.TabStop:=false;
      m2.font.name:=liste.font.name;
      m2.font.style:=liste.font.Style;
      m2.font.CharSet:=liste.font.Charset;
      m2.font.size:=liste.font.size;
      m2.font.color:=liste.font.color;
      m2.showhint:=true;
      m2.enabled:=liste.Enabled;
      m2.text:=liste.Items.Text;
        m2.OnKeyPress:=form1.tusbasimi;
        m2.OnEnter:= form1.nesne_giris;
        m2.OnExit:=form1.metin_cikisi;
        m2.OnChange:=form1.degistiginde;
        m2.OnMouseDown:=surukle;
        m2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        2:   //bitbtn
         begin
      d2 := TBitBtn.Create (self);
      inc(butt);

      if form1.ComponentCount<>1 then
        d2.Name:=form2.komutlistesi('Dugme')+inttostr(bos_nesne_bul('TBitBtn'))
      else
        d2.Name:=form2.komutlistesi('Dugme')+inttostr(butt);

      d2.Parent:= self;
      d2.top:=liste.Top;
      d2.left:=liste.left;
      d2.width:=liste.width;
      d2.height:=liste.height;
      d2.hint:=liste.hint;
      d2.ParentShowHint:=true;
//      liste.TabStop:=false;
      d2.font.name:=liste.font.name;
      d2.font.style:=liste.font.Style;
      d2.font.CharSet:=liste.font.Charset;
      d2.font.size:=liste.font.size;
      d2.font.color:=liste.font.color;
      d2.showhint:=true;
      d2.enabled:=liste.Enabled;
      d2.Caption:=liste.Items.Text;
      d2.OnClick:=form1.tiklama;
      d2.OnMouseDown:=surukle;
      d2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        3:   //Checkbox
         begin
      c2 := Tcheckbox.Create (self);
      inc(check);

      if form1.ComponentCount<>1 then
        c2.Name:=form2.komutlistesi('OnayKutusu')+inttostr(bos_nesne_bul('TCheckBox'))
      else
        c2.Name:=form2.komutlistesi('OnayKutusu')+inttostr(check);

      c2.Parent:= self;
      c2.top:=liste.Top;
      c2.left:=liste.left;
      c2.width:=liste.width;
      c2.height:=liste.height;
      c2.hint:=liste.hint;
      c2.ParentShowHint:=true;
      c2.Color:=liste.color;
//      metin.TabStop:=false;
      c2.font.name:=liste.font.name;
      c2.font.style:=liste.font.Style;
      c2.font.CharSet:=liste.font.Charset;
      c2.font.size:=liste.font.size;
      c2.font.color:=liste.font.color;
      c2.showhint:=true;
      c2.enabled:=liste.Enabled;
      c2.Caption:=liste.Items.Text;
        c2.OnMouseDown:=surukle;
        c2.OnEnter:= nesne_giris;
        c2.OnClick:=form1.tiklama;
        c2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        4:   //listbox - ups
         begin
         end;
        5:   //combobox
         begin
      a2 := TComboBox.Create (self);
      inc(combo);

      if form1.ComponentCount<>1 then
        a2.Name:=form2.komutlistesi('AcilirKutu')+inttostr(bos_nesne_bul('TComboBox'))
      else
        a2.Name:=form2.komutlistesi('AcilirKutu')+inttostr(combo);

      a2.Parent:= self;
      a2.top:=liste.Top;
      a2.left:=liste.left;
      a2.width:=liste.width;
      a2.height:=liste.height;
      a2.hint:=liste.hint;
      a2.ParentShowHint:=true;
      a2.Color:=liste.color;
//      metin.TabStop:=false;
      a2.font.name:=liste.font.name;
      a2.font.style:=liste.font.Style;
      a2.font.CharSet:=liste.font.Charset;
      a2.font.size:=liste.font.size;
      a2.font.color:=liste.font.color;
      a2.showhint:=true;
      a2.enabled:=liste.Enabled;
      a2.items.text:=liste.Items.Text;
       a2.DragCursor:=crDefault;
       a2.DragMode:=dmAutomatic;
       a2.OnChange:=form1.degistiginde;
       a2.OnEnter:= nesne_giris;
       a2.OnDragOver:=surukleCombo;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        6:   //richedit
         begin
      y2 := TRichEdit.Create (self);
      inc(redit);

      if form1.ComponentCount<>1 then
        y2.Name:=form2.komutlistesi('YaziKutusu')+inttostr(bos_nesne_bul('TRichEdit'))
      else
        y2.Name:=form2.komutlistesi('YaziKutusu')+inttostr(redit);

      y2.Parent:= self;
      y2.top:=liste.Top;
      y2.left:=liste.left;
      y2.width:=liste.width;
      y2.height:=liste.height;
      y2.hint:=liste.hint;
      y2.ParentShowHint:=true;
      y2.Color:=liste.color;
//      metin.TabStop:=false;
      y2.font.name:=liste.font.name;
      y2.font.style:=liste.font.Style;
      y2.font.CharSet:=liste.font.Charset;
      y2.font.size:=liste.font.size;
      y2.font.color:=liste.font.color;
      y2.showhint:=true;
      y2.enabled:=liste.Enabled;
      y2.text:=liste.Items.Text;
      y2.ScrollBars:=ssBoth;
      y2.WordWrap:=false;
        y2.OnMouseDown:=surukle;
        y2.OnChange:=form1.degistiginde;
        y2.OnEnter:= nesne_giris;
        y2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        end;
////////////////////////////////////////////////////Açýlýr Kutu -> ...
                end else
                if gecici is TCombobox then begin
                        acilir:=gecici as TCombobox;
                        tempRect:=acilir.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
        case gelen of
        0:   //label
         begin
      e2 := TStatictext.Create (self);
      inc(labe);

      if form1.ComponentCount<>1 then
        e2.Name:=form2.komutlistesi('Etiket')+inttostr(bos_nesne_bul('TStaticText'))
      else
        e2.Name:=form2.komutlistesi('Etiket')+inttostr(labe);

      e2.Parent:= self;
      e2.top:=acilir.Top;
      e2.left:=acilir.left;
      e2.width:=acilir.width;
      e2.height:=acilir.height;
      e2.hint:=acilir.hint;
      e2.ParentShowHint:=true;
//      etiket.TabStop:=false;
      e2.AutoSize:=true;
      e2.Color:=acilir.color;
      e2.font.name:=acilir.font.name;
      e2.font.style:=acilir.font.Style;
      e2.font.CharSet:=acilir.font.Charset;
      e2.font.size:=acilir.font.size;
      e2.font.color:=acilir.font.color;
      e2.showhint:=true;
      e2.enabled:=acilir.Enabled;
      e2.Caption:=acilir.Text;
      e2.OnClick:=form1.tiklama;
      e2.OnMouseDown:=surukle;
      e2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        1:   //edit
         begin
      m2 := Tedit.Create (self);
      inc(edit);

      if form1.ComponentCount<>1 then
        m2.Name:=form2.komutlistesi('MetinKutusu')+inttostr(bos_nesne_bul('TEdit'))
      else
        m2.Name:=form2.komutlistesi('MetinKutusu')+inttostr(edit);

      m2.Parent:= self;
      m2.top:=acilir.Top;
      m2.left:=acilir.left;
      m2.width:=acilir.width;
      m2.height:=acilir.height;
      m2.hint:=acilir.hint;
      m2.ParentShowHint:=true;
      m2.Color:=acilir.color;
//      metin.TabStop:=false;
      m2.font.name:=acilir.font.name;
      m2.font.style:=acilir.font.Style;
      m2.font.CharSet:=acilir.font.Charset;
      m2.font.size:=acilir.font.size;
      m2.font.color:=acilir.font.color;
      m2.showhint:=true;
      m2.enabled:=acilir.Enabled;
      m2.text:=acilir.Items.Text;
        m2.OnKeyPress:=form1.tusbasimi;
        m2.OnEnter:= form1.nesne_giris;
        m2.OnExit:=form1.metin_cikisi;
        m2.OnChange:=form1.degistiginde;
        m2.OnMouseDown:=surukle;
        m2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        2:   //bitbtn
         begin
      d2 := TBitBtn.Create (self);
      inc(butt);

      if form1.ComponentCount<>1 then
        d2.Name:=form2.komutlistesi('Dugme')+inttostr(bos_nesne_bul('TBitBtn'))
      else
        d2.Name:=form2.komutlistesi('Dugme')+inttostr(butt);

      d2.Parent:= self;
      d2.top:=acilir.Top;
      d2.left:=acilir.left;
      d2.width:=acilir.width;
      d2.height:=acilir.height;
      d2.hint:=acilir.hint;
      d2.ParentShowHint:=true;
//      acilir.TabStop:=false;
      d2.font.name:=acilir.font.name;
      d2.font.style:=acilir.font.Style;
      d2.font.CharSet:=acilir.font.Charset;
      d2.font.size:=acilir.font.size;
      d2.font.color:=acilir.font.color;
      d2.showhint:=true;
      d2.enabled:=acilir.Enabled;
      d2.Caption:=acilir.Items.Text;
      d2.OnClick:=form1.tiklama;
      d2.OnMouseDown:=surukle;
      d2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        3:   //Checkbox
         begin
      c2 := Tcheckbox.Create (self);
      inc(check);

      if form1.ComponentCount<>1 then
        c2.Name:=form2.komutlistesi('OnayKutusu')+inttostr(bos_nesne_bul('TCheckBox'))
      else
        c2.Name:=form2.komutlistesi('OnayKutusu')+inttostr(check);

      c2.Parent:= self;
      c2.top:=acilir.Top;
      c2.left:=acilir.left;
      c2.width:=acilir.width;
      c2.height:=acilir.height;
      c2.hint:=acilir.hint;
      c2.ParentShowHint:=true;
      c2.Color:=acilir.color;
//      metin.TabStop:=false;
      c2.font.name:=acilir.font.name;
      c2.font.style:=acilir.font.Style;
      c2.font.CharSet:=acilir.font.Charset;
      c2.font.size:=acilir.font.size;
      c2.font.color:=acilir.font.color;
      c2.showhint:=true;
      c2.enabled:=acilir.Enabled;
      c2.Caption:=acilir.Items.Text;
        c2.OnMouseDown:=surukle;
        c2.OnEnter:= nesne_giris;
        c2.OnClick:=form1.tiklama;
        c2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        4:   //listbox
         begin
      l2 := TListBox.Create (self);
      inc(list);

      if form1.ComponentCount<>1 then
        l2.Name:=form2.komutlistesi('ListeKutusu')+inttostr(bos_nesne_bul('TListBox'))
      else
        l2.Name:=form2.komutlistesi('ListeKutusu')+inttostr(list);

      l2.Parent:= self;
      l2.top:=acilir.Top;
      l2.left:=acilir.left;
      l2.width:=acilir.width;
      l2.height:=acilir.height;
      l2.hint:=acilir.hint;
      l2.ParentShowHint:=true;
      l2.Color:=acilir.color;
//      metin.TabStop:=false;
      l2.font.name:=acilir.font.name;
      l2.font.style:=acilir.font.Style;
      l2.font.CharSet:=acilir.font.Charset;
      l2.font.size:=acilir.font.size;
      l2.font.color:=acilir.font.color;
      l2.showhint:=true;
      l2.enabled:=acilir.Enabled;
      l2.Items.Text:=acilir.Items.Text;
        l2.OnMouseDown:=surukle;
        l2.OnClick:=form1.tiklama;
        l2.OnEnter:= nesne_giris;
        l2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        5:   //combobox - ups
         begin
         end;
        6:   //richedit
         begin
      y2 := TRichEdit.Create (self);
      inc(redit);

      if form1.ComponentCount<>1 then
        y2.Name:=form2.komutlistesi('YaziKutusu')+inttostr(bos_nesne_bul('TRichEdit'))
      else
        y2.Name:=form2.komutlistesi('YaziKutusu')+inttostr(redit);

      y2.Parent:= self;
      y2.top:=acilir.Top;
      y2.left:=acilir.left;
      y2.width:=acilir.width;
      y2.height:=acilir.height;
      y2.hint:=acilir.hint;
      y2.ParentShowHint:=true;
      y2.Color:=acilir.color;
//      metin.TabStop:=false;
      y2.font.name:=acilir.font.name;
      y2.font.style:=acilir.font.Style;
      y2.font.CharSet:=acilir.font.Charset;
      y2.font.size:=acilir.font.size;
      y2.font.color:=acilir.font.color;
      y2.showhint:=true;
      y2.enabled:=acilir.Enabled;
      y2.text:=acilir.Items.Text;
      y2.ScrollBars:=ssBoth;
      y2.WordWrap:=false;
        y2.OnMouseDown:=surukle;
        y2.OnEnter:= nesne_giris;
        y2.OnChange:=form1.degistiginde;
        y2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        end;
////////////////////////////////////////////////////Yazý Kutusu -> ...
                end else
                if gecici is TRichEdit then begin
                        yazi:=gecici as TRichEdit;
                        tempRect:=yazi.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
        case gelen of
        0:   //label - ups
         begin
      e2 := TStatictext.Create (self);
      inc(labe);

      if form1.ComponentCount<>1 then
        e2.Name:=form2.komutlistesi('Etiket')+inttostr(bos_nesne_bul('TStaticText'))
      else
        e2.Name:=form2.komutlistesi('Etiket')+inttostr(labe);

      e2.Parent:= self;
      e2.top:=yazi.Top;
      e2.left:=yazi.left;
      e2.width:=yazi.width;
      e2.height:=yazi.height;
      e2.hint:=yazi.hint;
      e2.ParentShowHint:=true;
      e2.Color:=yazi.color;
//      metin.TabStop:=false;
      e2.font.name:=yazi.font.name;
      e2.font.style:=yazi.font.Style;
      e2.font.CharSet:=yazi.font.Charset;
      e2.font.size:=yazi.font.size;
      e2.font.color:=yazi.font.color;
      e2.showhint:=true;
      e2.enabled:=yazi.Enabled;
      e2.caption:=yazi.lines.Text;
      e2.OnMouseDown:=surukle;
      e2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        1:   //edit
         begin
      m2 := Tedit.Create (self);
      inc(edit);

      if form1.ComponentCount<>1 then
        m2.Name:=form2.komutlistesi('MetinKutusu')+inttostr(bos_nesne_bul('TEdit'))
      else
        m2.Name:=form2.komutlistesi('MetinKutusu')+inttostr(edit);

      m2.Parent:= self;
      m2.top:=yazi.Top;
      m2.left:=yazi.left;
      m2.width:=yazi.width;
      m2.height:=yazi.height;
      m2.hint:=yazi.hint;
      m2.ParentShowHint:=true;
      m2.Color:=yazi.color;
//      metin.TabStop:=false;
      m2.font.name:=yazi.font.name;
      m2.font.style:=yazi.font.Style;
      m2.font.CharSet:=yazi.font.Charset;
      m2.font.size:=yazi.font.size;
      m2.font.color:=yazi.font.color;
      m2.showhint:=true;
      m2.enabled:=yazi.Enabled;
      m2.text:=yazi.lines.Text;
        m2.OnKeyPress:=form1.tusbasimi;
        m2.OnEnter:= form1.nesne_giris;
        m2.OnExit:=form1.metin_cikisi;
        m2.OnMouseDown:=surukle;
        m2.OnChange:=form1.degistiginde;
        m2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        2:   //bitbtn
         begin
      d2 := TBitBtn.Create (self);
      inc(butt);

      if form1.ComponentCount<>1 then
        d2.Name:=form2.komutlistesi('Dugme')+inttostr(bos_nesne_bul('TBitBtn'))
      else
        d2.Name:=form2.komutlistesi('Dugme')+inttostr(butt);

      d2.Parent:= self;
      d2.top:=yazi.Top;
      d2.left:=yazi.left;
      d2.width:=yazi.width;
      d2.height:=yazi.height;
      d2.hint:=yazi.hint;
      d2.ParentShowHint:=true;
//      yazi.TabStop:=false;
      d2.font.name:=yazi.font.name;
      d2.font.style:=yazi.font.Style;
      d2.font.CharSet:=yazi.font.Charset;
      d2.font.size:=yazi.font.size;
      d2.font.color:=yazi.font.color;
      d2.showhint:=true;
      d2.enabled:=yazi.Enabled;
      d2.Caption:=yazi.lines.Text;
      d2.OnClick:=form1.tiklama;
      d2.OnMouseDown:=surukle;
      d2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        3:   //Checkbox
         begin
      c2 := Tcheckbox.Create (self);
      inc(check);

      if form1.ComponentCount<>1 then
        c2.Name:=form2.komutlistesi('OnayKutusu')+inttostr(bos_nesne_bul('TCheckBox'))
      else
        c2.Name:=form2.komutlistesi('OnayKutusu')+inttostr(check);

      c2.Parent:= self;
      c2.top:=yazi.Top;
      c2.left:=yazi.left;
      c2.width:=yazi.width;
      c2.height:=yazi.height;
      c2.hint:=yazi.hint;
      c2.ParentShowHint:=true;
      c2.Color:=yazi.color;
//      metin.TabStop:=false;
      c2.font.name:=yazi.font.name;
      c2.font.style:=yazi.font.Style;
      c2.font.CharSet:=yazi.font.Charset;
      c2.font.size:=yazi.font.size;
      c2.font.color:=yazi.font.color;
      c2.showhint:=true;
      c2.enabled:=yazi.Enabled;
      c2.Caption:=yazi.lines.Text;
        c2.OnMouseDown:=surukle;
        c2.OnEnter:= nesne_giris;
        c2.OnClick:=form1.tiklama;
        c2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        4:   //listbox
         begin
      l2 := TListBox.Create (self);
      inc(list);

      if form1.ComponentCount<>1 then
        l2.Name:=form2.komutlistesi('ListeKutusu')+inttostr(bos_nesne_bul('TListBox'))
      else
        l2.Name:=form2.komutlistesi('ListeKutusu')+inttostr(list);

      l2.Parent:= self;
      l2.top:=yazi.Top;
      l2.left:=yazi.left;
      l2.width:=yazi.width;
      l2.height:=yazi.height;
      l2.hint:=yazi.hint;
      l2.ParentShowHint:=true;
      l2.Color:=yazi.color;
//      metin.TabStop:=false;
      l2.font.name:=yazi.font.name;
      l2.font.style:=yazi.font.Style;
      l2.font.CharSet:=yazi.font.Charset;
      l2.font.size:=yazi.font.size;
      l2.font.color:=yazi.font.color;
      l2.showhint:=true;
      l2.enabled:=yazi.Enabled;
      l2.Items.Text:=yazi.lines.Text;
        l2.OnMouseDown:=surukle;
        l2.OnEnter:= nesne_giris;
        l2.OnClick:=form1.tiklama;
        l2.OnMouseMove:=nesneMouseMove;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        5:   //combobox
         begin
      a2 := TComboBox.Create (self);
      inc(combo);

      if form1.ComponentCount<>1 then
        a2.Name:=form2.komutlistesi('AcilirKutu')+inttostr(bos_nesne_bul('TComboBox'))
      else
        a2.Name:=form2.komutlistesi('AcilirKutu')+inttostr(combo);

      a2.Parent:= self;
      a2.top:=yazi.Top;
      a2.left:=yazi.left;
      a2.width:=yazi.width;
      a2.height:=yazi.height;
      a2.hint:=yazi.hint;
      a2.ParentShowHint:=true;
      a2.Color:=yazi.color;
//      metin.TabStop:=false;
      a2.font.name:=yazi.font.name;
      a2.font.style:=yazi.font.Style;
      a2.font.CharSet:=yazi.font.Charset;
      a2.font.size:=yazi.font.size;
      a2.font.color:=yazi.font.color;
      a2.showhint:=true;
      a2.enabled:=yazi.Enabled;
      a2.items.text:=yazi.lines.Text;
       a2.DragCursor:=crDefault;
       a2.DragMode:=dmAutomatic;
       a2.OnEnter:= nesne_giris;
       a2.OnChange:=form1.degistiginde;
       a2.OnDragOver:=surukleCombo;
      inc(kacinci);
      Silinecek_CompNo[kacinci]:=i;
         end;
        6:   //richedit - ups
         begin
         end;
        end;
                end;
         end;
  end else
         if lowercase(form2.ComboBox1.Text) <> lowercase(form2.komutlistesi('Form')) then
          begin
           gecici:=FindComponent(form2.ComboBox1.Text);
           temp2 := Tshape.Create (self);
           temp2.Parent:= self;
           temp2.Name:='secim';
           temp2.Pen.Style:=psSolid;
           temp2.Brush.Style:=bsDiagCross;

           if gecici is TStaticText then
            begin
        temp2.Top:=(gecici as TStaticText).Top - 2 ;
        temp2.width:=(gecici as TStaticText).width + 4 ;
        temp2.left:=(gecici as TStaticText).left - 2 ;
        temp2.height:=(gecici as TStaticText).height + 4 ;
            end else
           if gecici is TBitbtn then
            begin
        temp2.Top:=(gecici as TBitbtn).Top - 2 ;
        temp2.width:=(gecici as TBitbtn).width + 4 ;
        temp2.left:=(gecici as TBitbtn).left - 2 ;
        temp2.height:=(gecici as TBitbtn).height + 4 ;
            end else
           if gecici is TEdit then
            begin
        temp2.Top:=(gecici as TEdit).Top - 2 ;
        temp2.width:=(gecici as TEdit).width + 4 ;
        temp2.left:=(gecici as TEdit).left - 2 ;
        temp2.height:=(gecici as TEdit).height + 4 ;
            end else
           if gecici is TCombobox then
            begin
        temp2.Top:=(gecici as TCombobox).Top - 2 ;
        temp2.width:=(gecici as TCombobox).width + 4 ;
        temp2.left:=(gecici as TCombobox).left - 2 ;
        temp2.height:=(gecici as TCombobox).height + 4 ;
            end else
           if gecici is TListBox then
            begin
        temp2.Top:=(gecici as TListBox).Top - 2 ;
        temp2.width:=(gecici as TListBox).width + 4 ;
        temp2.left:=(gecici as TListBox).left - 2 ;
        temp2.height:=(gecici as TListBox).height + 4 ;
            end else
           if gecici is TRichEdit then
            begin
        temp2.Top:=(gecici as TRichEdit).Top - 2 ;
        temp2.width:=(gecici as TRichEdit).width + 4 ;
        temp2.left:=(gecici as TRichEdit).left - 2 ;
        temp2.height:=(gecici as TRichEdit).height + 4 ;
            end else
           if gecici is TCheckBox then
            begin
        temp2.Top:=(gecici as TCheckBox).Top - 2 ;
        temp2.width:=(gecici as TCheckBox).width + 4 ;
        temp2.left:=(gecici as TCheckBox).left - 2 ;
        temp2.height:=(gecici as TCheckBox).height + 4 ;
            end;

        cevir(gelen);
          end;
end;
        gecici:=findComponent('secim');
        if gecici is TShape then gecici.free;
        //nesne listesi güncelleniyor

  for j:=0 to kacinci do
    form1.Components[Silinecek_CompNo[j]].free;

   form2.ComboBox1.Items.Clear;
    for j:=0 to form1.ComponentCount-1 do
     form2.ComboBox1.Items.Add(form1.Components[j].Name);
   form2.ComboBox1.Items.Add(form2.komutlistesi('Form'));
   form2.ComboBox1.itemindex:=0;
   form2.ComboBox1Change(self);
   nesne_sayisi;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
aktifpencere:=true;
aktifPencereNo:=strtoint(no_ayikla(screen.ActiveForm.Name));

form2.ToolButton5.ImageIndex:=5;
end;

procedure TForm1.FormDblClick(Sender: TObject);
var buldum:boolean;i:integer;
    satir:string;
begin
if form2.ToolButton9.enabled then
 begin
 buldum:=false;
 if form5.RichEdit1.Lines.Count<>0 then
 for i:=0 to form5.RichEdit1.Lines.Count-1 do begin
  satir:=trim(form5.RichEdit1.Lines[i]);
  if (lowercase(form2.mid(satir,1,length(form2.komutlistesi('form')+' '+form2.komutlistesi('yuklenince'))))
     =lowercase(form2.komutlistesi('form')+' '+form2.komutlistesi('yuklenince'))) then
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
  form5.RichEdit1.CaretY:= 0;
  form5.FormYuklenince1.Click;
  form5.richedit1.Lines.insert(form5.RichEdit1.Lines.Count,'');
  end;
 form5.Show;
 form5.PageControl1.ActivePageIndex:=0;
 if  form5.RichEdit1.enabled then form5.RichEdit1.SetFocus;
 end;
end;

procedure TForm1.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var kareSecim:TShape;
    gecici:TComponent;
    dugmemiz:TBitBtn;
    etiket:TStatictext;
    metin:TEdit;
    onay:TCheckBox;
    liste: TListBox;
    acilir: TCombobox;
    yazi :TRichEdit;
    i:integer;
    secimRect,tempRect: TRect;
begin
if (form2.ToolButton9.enabled)and(form2.ToolButton1.Down)and(button=mbLeft) then begin

   if FindComponent('secim') is tshape then
      (FindComponent('secim') as tshape).Free;

        form1.ActiveControl:=nil;

        kareSecim := Tshape.Create (self);
        kareSecim.Parent:= self;
        kareSecim.Name:='secim';
        kareSecim.Pen.Style:=psdot;
        kareSecim.Pen.mode:=pmNot;
        kareSecim.Brush.Style:=bsClear;
        kareSecim.OnMouseDown:=surukle;
        if x-basx<0 then
         begin
         kareSecim.Width:=basx-x;
       	 kareSecim.Left:= x;
         end else begin
         kareSecim.Width:=x-basx;
       	 kareSecim.Left:= basx;
         end;
        if y-basy<0 then
        begin
         kareSecim.Height:=basy-y;
     	 kareSecim.Top:= y;
       end else begin
         kareSecim.Height:=y-basy;
       	 kareSecim.Top:= basy;
        end;
//seçili nesnelerin ilki aktif edilmeli
        if (kareSecim.Width<5)and(kareSecim.height<5) then   //bu kadar da olamaz ya...
        kareSecim.free
        else begin
        secimRect := kareSecim.BoundsRect;
         for i:=form1.ComponentCount-1 downto 0 do
         begin
                gecici:=components[i];
                if gecici is TBitBtn then begin
                        dugmemiz:=gecici as TBitBtn;
                        tempRect:=dugmemiz.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                        begin
   form2.ComboBox1.Text:=dugmemiz.Name;
                        end;
                end else
                if gecici is TStatictext then begin
                        etiket:=gecici as TStatictext;
                        tempRect:=etiket.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                        begin
   form2.ComboBox1.Text:=etiket.Name;
                        end;
                end else
                if gecici is TEdit then begin
                        metin:=gecici as TEdit;
                        tempRect:=metin.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                        begin
   form2.ComboBox1.Text:=metin.Name;
                        end;
                end else
                if gecici is TCheckBox then begin
                        onay:=gecici as TCheckBox;
                        tempRect:=onay.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                        begin
   form2.ComboBox1.Text:=onay.Name;
                        end;
                end else
                if gecici is TListBox then begin
                        liste:=gecici as TListBox;
                        tempRect:=liste.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                        begin
   form2.ComboBox1.Text:=liste.Name;
                        end;
                end else
                if gecici is TCombobox then begin
                        acilir:=gecici as TCombobox;
                        tempRect:=acilir.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                        begin
   form2.ComboBox1.Text:=acilir.Name;
                        end;
                end else
                if gecici is TRichEdit then begin
                        yazi:=gecici as TRichEdit;
                        tempRect:=yazi.BoundsRect;
                        if dokunuyor_mu(tempRect,secimRect) then
                        begin
   form2.ComboBox1.Text:=yazi.Name;
                        end;
                end;
         end; //for
   form2.ComboBox1.ItemIndex:=form2.combobox1.Perform(CB_FINDSTRING,-1,LongInt(PChar(form2.ComboBox1.text)));
   form2.gride_yaz;
       end; //if
end; //if
end;

initialization
//formdaki tüm nesne tipleri
  RegisterClasses ([TStaticText, TEdit, TBitbtn,
                    TCombobox, TListBox, TRichEdit, TCheckBox, TShape,
                    TTimer, Tpopupmenu,
                    TClientDataSet]);
end.
