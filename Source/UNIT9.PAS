unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, Grids, ValEdit, inifiles, ToolWin,
  ComCtrls; 

type
  TForm9 = class(TForm)
    PopupMenu1: TPopupMenu;
    Varsaylan1: TMenuItem;
    Kapat1: TMenuItem;
    ValueListEditor1: TValueListEditor;
    ekrarYkle1: TMenuItem;
    Varsaylan2: TMenuItem;
    Seenek1: TMenuItem;
    Seenek21: TMenuItem;
    Seenek11: TMenuItem;
    Seenek22: TMenuItem;
    ToolBar1: TToolBar;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    procedure Varsaylan1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ValueListEditor1MouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure Seenek1Click(Sender: TObject);
    procedure Seenek21Click(Sender: TObject);
    procedure Seenek11Click(Sender: TObject);
    procedure Seenek22Click(Sender: TObject);
    procedure kaydet;
    procedure oku;
    procedure ilkoku;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type   pnt=array [1..72,1..3] of string;
const   Referans_degerleri:pnt=
(('TBitBtn','Bitmap resimli olarak da kullanýlabilen düðmedir','TBitBtn is a push button control that can include a bitmap on its face'),
('TEdit','Tek satýr veri giriþi için kullanýlýr','TEdit is a wrapper for a Windows single-line edit control'),
('TStaticText','Veri göstermek için kullanýlýr','TStaticText is a windowed control that displays text on a form'),
('TCheckBox','Sadece iki ihtimali olan veriler için kullanýlýr','TCheckBox represents a check box that can be on (checked) or off (unchecked)'),
('TListBox','Listeleme amacý için kullanýlýr','TListBox is a wrapper for a Windows list box control'),
('TComboBox','Aþaðý doðru açýlabilen liste ve veri giriþi olarak kullanýlýr','TComboBox combines an edit box with a scrollable list'),
('TRichEdit','Çok satýrlý veri giriþi için kullanýlýr','TRichEdit is a wrapper for a Windows rich text edit control'),
('TTimer','Belli anlarda iþlem yapýlamasý için kullanýlýr','TTimer encapsulates the Windows API timer functions'),
('TClientDataSet','Veritabaný için kullanýlýr','TClientDataSet implements a database-independent dataset'),
('CreateOleObject(''Excel.Application'')','Microsoft Excel Nesnesi oluþturur','Instantiates a single instance of an Automation (Microsoft Excel) object'),
('TForm','Uygulamanýn penceresi olarak kullanýlýr','TForm represents a standard application window (form)'),
('OnClick','Nesnenin fare týklanmasý olayýdýr','Occurs when the user clicks the control'),
('OnCreate','Formun ilk açýlýþ anýnda çalýþan kodlar buraya yazýlýr','Occurs when the form is created'),
('OnClose','Form kapanýrken çalýþacak kodlar buraya yazýlýr','Occurs when the form closes'),
('True','Olumlu mantýksal deðer','Positive boolean value'),
('False','Olumsuz mantýksal deðer','Negative boolean value'),
('End','Blok sonlandýrýcý deyimi','Block ending command'),
('Close','Programý sonlandýrýr','Ends the application'),
('Beep','Basit bip sesi çýkarýlýr','Generates a message beep'),
('Application.MessageBox (text, caption, MB_OK+MB_ICONINFORMATION)','Kullanýcýya basit mesaj gösterir','Displays a specified message to the user'),
('varName := InputBox (text, caption, ''<>'')','Kullanýcýnýn veri girebildiði diyalog kutusudur','Displays an input dialog box that lets the user enter a string'),
('MessageBeep (integer)','Windows''un varsayýlan sesleri çýkarýlabilir','The MessageBeep function plays a waveform sound'),
('WinExec (command, SW_NORMAL)','Belli bir uygulama veya dýþ komut çalýþtýrýlabilir','The WinExec function runs the specified application'),
('Active','Nesnenin klavye, fare ve zamanlayýcý olaylarýna cevap vermesi ayarlanýr','Controls whether the control responds to mouse, keyboard, and timer events'),
('Caption / Text','Nesnenin metin özelliðidir','Specifies a text string that identifies the control to the user'),
('Hint','Ýpucu kutusunda çýkan metni belirtir','Specifies the text string that appears in the Help Hint box'),
('Color / Font.Color','Yazýtipi rengi veya arkaplan rengini belirtir','Specifies the background or font color of the control'),
('Top','Piksel olarak Y koordinatýnda nesnenin sol üst köþesini belirtir','Specifies the Y coordinate of the top left corner of a control in pixels'),
('Left','Nesnenin yatay sol kenar koordinatýný belirtir','Specifies the horizontal coordinate of the left edge of a component'),
('Width','Piksel olarak nesne veya formun yatay boyutunu belirtir','Specifies the horizontal size of the control or form in pixels'),
('Height','Piksel olarak nesne veya formun dikey boyutunu belirtir','Specifies the vertical size of the control or form in pixels'),
('Font','Yazýtipi seçimi için kullanýlýr','Identifies the typeface of the font'),
('Items / Lines','Çok satýrlý yazý veya liste kutusunun içindeki deðerlerdir','Contains the list of items displayed by the list view or the richedit'),
('ItemIndex','Liste kutusunda veya açýlýr kutunun seçili nesnesidir','Specifies the ordinal number of the selected item in the list box’s item list'),
('Book.Worksheets[integer].Cells[integer,integer]','Excel dosyasýndaki hücre içine ulaþýlýr','Gives the strings for each cell in the Excel file grid'),
('If condition','Else ile veya olmayan Þartlý olarak kullanýlan komut bloðudur','Conditional block command with or without else'),
('Else','If komutunun sonucu negatif ise Degilse bloðu çalýþtýrýlýr','If the condition result is negative, Else block runs'),
('End If','If bloðunun bittiðini belirtir','Ends the If block'),
('IIf (expression, true, false)','Tek satýrlý If komutu','Single line If command'),
('For forVar=startVal, endVal, incrementVal','Döngü sayýsýnýn artým ve bitiminin belli olduðu tekrar komutudur','A for statement requires you to specify explicitly the number of iterations you want the loop to go through'),
('Next','For komut bloðunu bitirir','Next finishes For block'),
('While condition' ,'Belli bir þarta göre tekrar edilen bloðu baþlatýr','Control condition is evaluated before the first execution of the statement sequence'),
('do (end of while)','While döngüsünü bloðunu bitirir','Finishes the while loop'),
('Function / Procedure','Yeni bir fonksiyon baþlatýr ','Declares a new function'),
('Goto Label','Belli bir etikete dallanýlýr','Goes a specified label'),
('ClientDataSet1.First','Veritabanýnýn ilk kaydýna ulaþtýrýr','Moves to the first record in the dataset'),
('ClientDataSet1.Prior','Veritabanýnýn önceki kaydýna ulaþtýrýr','Moves to the previous record in the dataset'),
('ClientDataSet1.Next','Veritabanýnýn sonraki kaydýna ulaþtýrýr','Moves to the next record in the dataset'),
('ClientDataSet1.Last','Veritabanýnýn son kaydýna ulaþtýrýr','Moves to the last record in the dataset'),
('ClientDataSet1.Post','Verileri kaydetmek için kullanýlýr','Writes a modified record to the database'),
('ClientDataSet1.Insert','Boþ bir kayýt açar','Inserts a new, empty record in the dataset'),
('ClientDataSet1.Delete','Aktif kaydý siler','Deletes the active record and positions the dataset on the next record'),
('ClientDataSet1.Edit','Veritabanýnda kayýt edilebilmesini saðlar','Enables editing of data in the dataset'),
('ClientDataSet1.Filter','Filtre þartýdýr','Specifies the text of the current filter'),
('ClientDataSet1.MoveBy(integer)','Veritabanýnda geri veya ileri gidilebilmesini saðlar','Moves to another record relative to the active record in the dataset'),
('text:=ClientDataSet1.Fields.Fields[integer].AsString','Belli bir alanýn numarasý kullanýlarak deðerini verir','Represents the field’s value as a string'),
('integer:=ClientDataSet1.RecordCount','Veritabanýndaki kayýt sayýsýný verir','Indicates the total number of records in the dataset'),
('integer:=ClientDataSet1.RecNo','Aktif kaydýn numarasýný verir','Indicates the active record in the dataset'),
('Form1.Canvas','Formun çizim yüzeyini belirtir','Specifies the drawing surface for the control'),
('Form1.Canvas.TextOut()','X ve Y koordinatýna bir yazý basar; örneðin: Canvas Text, x1, y1, metinDeger, metinRengi','Writes a string on the canvas, starting at the point (X,Y); example: canvas text, x1, y1, textValue, textColor'),
('Form1.Canvas.Rectangle()','Yüzeye dikdörtgen çizer; örneðin: Canvas Rectangle, x1, y1, x2, y2, kalemRengi, fýrçaRengi','Draws a rectangle on the canvas; example: canvas rectangle, x1, y1, x2, y2, penColor, brushColor'),
('Form1.Canvas.Lineto()','Baþlangýç ve bitiþi belli bir çizgi yapar; örneðin: Canvas Line, x1, y1, x2, y2, kalemRengi','Draws a line on the canvas from PenPos to the point specified by X and Y; example: canvas line, x1, y1, x2, y2, penColor'),
('Form1.Canvas.Pixels[]','Form üzerindeki noktalarýn rengini belirler; örneðin: Canvas Point, x1, y1, kalemRengi','Specifies the color of the pixels; example: canvas point, x1, y1, penColor'),
('Form1.Canvas.Ellipse()','Yuvarlak bir þekil çizmek için kullanýlýr; örneðin: Canvas Circle, x1, y1, x2, y2, kalemRengi, fýrçaRengi','Draws the ellipse defined by a bounding rectangle on the canvas; example: canvas circle, x1, y1, x2, y2, penColor, brushColor'),
('Form1.Canvas.PolyLine()','Birçok noktalara sahip çizgilerden oluþan çizim komutudur; örneðin: Canvas PolyLine, x1, y1, x2, y2, x3, y3, x4, y4, kalemRengi','Draws a series of lines connecting each of their points; example: canvas polyline, x1, y1, x2, y2, x3, y3, x4, y4, penColor'),
('Form1.Refresh','Formun yüzeyini temizler','Repaints the control on the screen'),
('PlaySound(filename)','Bir ses dosyasýný çalar','The PlaySound function plays a sound specified by the given filename'),
('-','Tek satýr olan komutlarý çalýþtýrýr','Executes single line commands'),
('Exit','Fonksiyondan çýkmak için kullanýlýr','Exits from the current procedure'),
('Break','Döngülerin bitirilmesi için kullanýlýr','Causes the flow of control to exit a for, while, or repeat statement'),
('Continue','Döngülere devam etmek için kullanýlýr','To continue for and while repetitions'),
('','','')
);
var
  Form9: TForm9;
  eskihint:string;
implementation

uses Unit5, Unit2, Unit3;

{$R *.dfm}

procedure Tform9.kaydet;
var    ayarini:Tinifile;dizin:string; i : integer;
begin
dizin:=extractfilepath(application.ExeName);
ayarini:=TIniFile.Create(dizin+'\varsayilan.ayar');    //form ayar bilgileri
if Form9.Varsaylan2.Checked then begin
   for i:=1 to form9.ValueListEditor1.RowCount-1 do
    form9.ValueListEditor1.cells[1,i]:=form9.ValueListEditor1.Cells[0,i];
  end else
if Form9.Seenek1.Checked then begin
    for i:=1 to form9.ValueListEditor1.RowCount-1 do
    ayarini.writestring('Ozellestir',inttostr(i),form9.ValueListEditor1.cells[1,i]);
   end else
if Form9.Seenek21.Checked then begin
    for i:=1 to form9.ValueListEditor1.RowCount-1 do
    ayarini.writestring('Ozellestir2',inttostr(i),form9.ValueListEditor1.cells[1,i]);
   end;
ayarini.Free;
form5.DugmeTiknaninca1.Caption:=form2.komutlistesi('Dugme')+' '+form2.komutlistesi('Tiklaninca');
form5.FormYuklenince1.Caption:=form2.komutlistesi('Form')+' '+form2.komutlistesi('Yuklenince');
form2.ValueListEditor1.ItemProps[0].PickList.text:=form2.komutlistesi('Evet')+#13+form2.komutlistesi('Hayir');
form2.Etiket1.Caption:=form9.ValueListEditor1.cells[1,3];
form2.Metin1.Caption:=form9.ValueListEditor1.cells[1,2];
form2.Dugme1.Caption:=form9.ValueListEditor1.cells[1,1];
form2.Onay1.Caption:=form9.ValueListEditor1.cells[1,4];
form2.Liste1.Caption:=form9.ValueListEditor1.cells[1,5];
form2.Acilir1.Caption:=form9.ValueListEditor1.cells[1,6];
form2.M1.Caption:=form9.ValueListEditor1.cells[1,7];
end;

procedure TForm9.oku;
var    ayarini:Tinifile;dizin:string; i : integer;
begin
dizin:=extractfilepath(application.ExeName);
ayarini:=TIniFile.Create(dizin+'\varsayilan.ayar');    //form ayar bilgileri
if Form9.Varsaylan2.Checked then begin
   for i:=1 to form9.ValueListEditor1.RowCount-1 do
    form9.ValueListEditor1.cells[1,i]:=form9.ValueListEditor1.Cells[0,i];
   end;
if Form9.Seenek1.Checked then begin
     for i:=1 to form9.ValueListEditor1.RowCount-1 do
      form9.ValueListEditor1.cells[0,i]:=ayarini.Readstring('Ozellestir',inttostr(i),'');
   end;
if Form9.Seenek21.Checked then begin
     for i:=1 to form9.ValueListEditor1.RowCount-1 do
      form9.ValueListEditor1.cells[1,i]:=ayarini.Readstring('Ozellestir2',inttostr(i),'');
   end;
form2.ValueListEditor1.ItemProps[0].PickList.text:=form2.komutlistesi('Evet')+#13+form2.komutlistesi('Hayir');
ayarini.Free;
form5.DugmeTiknaninca1.Caption:=form2.komutlistesi('Dugme')+' '+form2.komutlistesi('Tiklaninca');
form5.FormYuklenince1.Caption:=form2.komutlistesi('Form')+' '+form2.komutlistesi('Yuklenince');
form5.EgerDegilse1.Caption:=form2.komutlistesi('Eger')+' '+form2.komutlistesi('Egerbitti');
form5.Donder1.Caption:=form2.komutlistesi('Donder')+' '+form2.komutlistesi('Donderbitti');
form5.WhileRepeat1.Caption:=form2.komutlistesi('iken')+' '+form2.komutlistesi('ikenbitti');

form2.Etiket1.Caption:=form9.ValueListEditor1.cells[1,3];
form2.Metin1.Caption:=form9.ValueListEditor1.cells[1,2];
form2.Dugme1.Caption:=form9.ValueListEditor1.cells[1,1];
form2.Onay1.Caption:=form9.ValueListEditor1.cells[1,4];
form2.Liste1.Caption:=form9.ValueListEditor1.cells[1,5];
form2.Acilir1.Caption:=form9.ValueListEditor1.cells[1,6];
form2.M1.Caption:=form9.ValueListEditor1.cells[1,7];
end;

procedure TForm9.IlkOku;
begin
 if form3.ComboBoxEx1.ItemIndex=1 then begin    //eng
   Form9.Varsaylan2.Checked:=false;
   Form9.Seenek1.Checked:=false;
   Form9.Seenek11.Checked:=false;
   Form9.Seenek21.Checked:=true;
   Form9.Seenek22.Checked:=true;
   end else if form3.ComboBoxEx1.ItemIndex=0 then begin    //tr
   Form9.Varsaylan2.Checked:=false;
   Form9.Seenek21.Checked:=false;
   Form9.Seenek22.Checked:=false;
   Form9.Seenek1.Checked:=true;
   Form9.Seenek11.Checked:=true;
   end;
   oku;
end;

procedure TForm9.FormShow(Sender: TObject);
begin
if form2.rke1.Checked then begin
form9.Caption:=loadstr(170);
form9.ValueListEditor1.TitleCaptions.Clear;
form9.ValueListEditor1.TitleCaptions.add(loadstr(60));
form9.ValueListEditor1.TitleCaptions.add(loadstr(61));
form9.ValueListEditor1.Repaint;
end
else
begin
form9.Caption:=loadstr(1170);
form9.ValueListEditor1.TitleCaptions.Clear;
form9.ValueListEditor1.TitleCaptions.add(loadstr(1060));
form9.ValueListEditor1.TitleCaptions.add(loadstr(1061));
form9.ValueListEditor1.Repaint;
end;
end;

procedure TForm9.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key=VK_ESCAPE then close;
end;

procedure TForm9.ValueListEditor1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var col,row,ararakam:integer;dil,kull:string;
begin
ValueListEditor1.MouseToCell(x,y,col,row);
if form2.rke1.Checked then
  begin dil:='Referans: ';
        kull:='Açýklama: ';
        ararakam:=0;
  end else
  begin dil:='Reference: ';
        kull:='Definition: ';
        ararakam:=1000;
  end;
eskihint:=loadstr(ararakam+115);//ValueListEditor1.Hint;
        if row>0 then
        begin
            if form2.rke1.Checked then
                if Referans_degerleri[row,2]='' then kull:='' else kull:=kull+Referans_degerleri[row,2]
            else
                if Referans_degerleri[row,3]='' then kull:='' else kull:=kull+Referans_degerleri[row,3];
                ValueListEditor1.Hint:=dil+Referans_degerleri[row,1]+#13+kull;
        end
        else
        begin
        ValueListEditor1.Hint:='';
        end;
end;

procedure TForm9.Varsaylan1Click(Sender: TObject);
begin
 Varsaylan2.Checked:=true;
 Seenek1.Checked:=false;
 Seenek11.Checked:=false;
 Seenek22.Checked:=false;
 Seenek21.Checked:=false;
 oku;
end;

procedure TForm9.Seenek1Click(Sender: TObject);
begin
 Varsaylan2.Checked:=False;
 Seenek1.Checked:=true;
 Seenek11.Checked:=true;
 Seenek21.Checked:=false;
 Seenek22.Checked:=false;
 oku;
end;

procedure TForm9.Seenek21Click(Sender: TObject);
begin
 Varsaylan2.Checked:=False;
 Seenek1.Checked:=false;
 Seenek11.Checked:=false;
 Seenek21.Checked:=true;
 Seenek22.Checked:=true;
 oku;
end;

procedure TForm9.Seenek11Click(Sender: TObject);
var str1,str2:string;
begin
if form2.rke1.Checked then begin
str1:=loadstr(162);
str2:=loadstr(4);
end
else
begin
str1:=loadstr(1162);
str2:=loadstr(1004);
end;

if Application.MessageBox(pchar(str1),pchar(str2),MB_OKCANCEL+MB_DEFBUTTON2)=idok then begin
 Varsaylan2.Checked:=False;
 Seenek1.Checked:=true;
 Seenek11.Checked:=true;
 Seenek21.Checked:=false;
 Seenek22.Checked:=false;
 kaydet;
end;
end;

procedure TForm9.Seenek22Click(Sender: TObject);
var str1,str2:string;
begin
if form2.rke1.Checked then begin
str1:=loadstr(162);
str2:=loadstr(4);
end
else
begin
str1:=loadstr(1162);
str2:=loadstr(1004);
end;

if Application.MessageBox(pchar(str1),pchar(str2),MB_OKCANCEL+MB_DEFBUTTON2)=idok then begin
 Varsaylan2.Checked:=False;
 Seenek1.Checked:=false;
 Seenek11.Checked:=false;
 Seenek21.Checked:=true;
 Seenek22.Checked:=true;
 kaydet;
end;
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form2.ComboBox1.Text:=form2.komutlistesi('Form');
form2.grid;
end;

procedure TForm9.Edit1KeyPress(Sender: TObject; var Key: Char);
var i,j:integer;
    myRect: TGridRect;
begin
 i:=-1;       //sadece ilk kolonda arama oluyor...
  form9.ValueListEditor1.FindRow((edit1.Text+key),i);
  if i=-1 then 
  begin
    for i:=1 to form9.ValueListEditor1.RowCount-1 do
      if lowercase(edit1.Text+key)=lowercase(form9.ValueListEditor1.Cells[1,i]) then  break;
  end;
  if i=form9.ValueListEditor1.RowCount then exit;
  myRect.Left := 1;
  myRect.Top := i;
  myRect.Right := 1;
  myRect.Bottom := i;
  form9.ValueListEditor1.Selection := myRect;
  form9.ValueListEditor1.SetFocus;
  MessageBeep(1);
  PostMessage(ValueListEditor1.Handle,WM_VSCROLL,SB_TOP,0);
  for j:=0 to i-2 do
   PostMessage(ValueListEditor1.Handle,WM_VSCROLL,SB_LINEDOWN,0);
end;

procedure TForm9.Button1Click(Sender: TObject);
begin
//oku;     //eski deðerlere döner mi?
close;
end;

end.
