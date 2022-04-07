unit Unit16;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus;

type
  TForm16 = class(TForm)
    ListView1: TListView;
    PopupMenu1: TPopupMenu;
    Ekle1: TMenuItem;
    Sil1: TMenuItem;
    N1: TMenuItem;
    Kapat1: TMenuItem;
    mnSil1: TMenuItem;
    StayonTop1: TMenuItem;
    Dzenle1: TMenuItem;
    Git1: TMenuItem;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Kapat1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure ListView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ekle1Click(Sender: TObject);
    procedure Sil1Click(Sender: TObject);
    procedure mnSil1Click(Sender: TObject);
    procedure StayonTop1Click(Sender: TObject);
    procedure Dzenle1Click(Sender: TObject);
    procedure Git1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

uses Unit2, Unit5, Unit17, Unit1;

{$R *.dfm}

procedure TForm16.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_ESCAPE then close
end;

procedure TForm16.Kapat1Click(Sender: TObject);
begin
close
end;

procedure TForm16.PopupMenu1Popup(Sender: TObject);
begin
if ListView1.SelCount<>0 then begin
 Dzenle1.Enabled:=true;
 Sil1.Enabled:=true;
 Git1.Enabled:=true;
end else begin
 Dzenle1.Enabled:=false;
 Sil1.Enabled:=false;
 Git1.Enabled:=false;
end;
if ListView1.Items.Count<>0 then mnSil1.Enabled:=true else mnSil1.Enabled:=false;
end;

procedure TForm16.ListView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_RETURN then Dzenle1Click(self);
if key=VK_DELETE then sil1Click(self);
if key=VK_INSERT then Ekle1Click(self);
end;

procedure TForm16.Ekle1Click(Sender: TObject);
var degeri,sat:string;
    ListItem: TListItem;
    ararakam, bozuk: integer;
begin
form17.LabeledEdit1.Text:='';
form17.LabeledEdit2.Text:='-';
form17.showmodal;
if (tamamTusu2=false) then exit;
degeri:=form17.LabeledEdit1.Text;
try
    if (degeri<>'') then begin
        val(degeri,ararakam,bozuk);

        if (bozuk<>0)or(ararakam<1)or(ararakam>form5.RichEdit1.Lines.Capacity)or
           (form16.ListView1.FindCaption(-1,inttostr(ararakam),false,false,false)<>NIL) then
          exit;
        listitem:=ListView1.items.add;
        ListItem.Caption:=degeri;
        if form17.LabeledEdit2.Text='' then form17.LabeledEdit2.Text:='-';
        listitem.SubItems.add(form17.LabeledEdit2.Text);
        form5.RichEdit1.Lines[ararakam-1]:=form5.RichEdit1.Lines[ararakam-1]+'-'; //basit çözüm
        sat:=form5.RichEdit1.Lines[ararakam-1];
        Delete(sat,length(sat),1);
        form5.RichEdit1.Lines[ararakam-1]:=sat;
    end;
except
        //do nothing
end;
end;

procedure TForm16.Sil1Click(Sender: TObject);
var sat:string;
    satno:integer;
begin
if ListView1.SelCount=0 then exit;
satno:=strtoint(ListView1.Items[ListView1.ItemIndex].Caption)-1;
try
        form5.RichEdit1.Lines[satno]:=form5.RichEdit1.Lines[satno]+'-'; //basit çözüm
        sat:=form5.RichEdit1.Lines[satno];
        Delete(sat,length(sat),1);
        form5.RichEdit1.Lines[satno]:=sat;
except
  on E:Exception do begin
  form2.StatusBar1.SimpleText:=E.ClassName+' : '+E.Message;
  form2.ListBox1.Items.Add(E.ClassName+' : '+E.Message);
  end;
end;
ListView1.Items.Delete(ListView1.ItemIndex);
end;

procedure TForm16.mnSil1Click(Sender: TObject);
begin
form5.mnSil1Click(self);
end;

procedure TForm16.StayonTop1Click(Sender: TObject);
begin
 if (StayonTop1.Checked) then begin
  SetWindowPos(Form16.handle, HWND_TOPMOST,Form16.Left, Form16.Top, Form16.Width, Form16.Height,0);
     end
   else
  SetWindowPos(Form16.handle, HWND_NOTOPMOST,Form16.Left, Form16.Top, Form16.Width, Form16.Height,0);
end;

procedure TForm16.Dzenle1Click(Sender: TObject);
var ad,degeri,sat:string;
    listitem:TListitem;
    ararakam, bozuk: integer;
begin
if ListView1.SelCount=0 then exit;
ad:= ListView1.Selected.Caption;
 if ListView1.FindCaption(-1,lowercase(ad),false,false,false)<>NIL then begin
   ListItem:= ListView1.FindCaption(-1,lowercase(ad),false,false,false);
   if lowercase(listitem.caption)=lowercase(ad) then degeri:=listitem.SubItems[0];
 end;

form17.LabeledEdit1.Text:=ad;
form17.LabeledEdit2.Text:=degeri;
form17.showmodal;

if (tamamTusu2=false) then exit;
       ListItem :=ListView1.FindCaption(-1,lowercase(ad),false,false,false);
       ad       :=form17.LabeledEdit1.Text;
       degeri   :=form17.LabeledEdit2.Text;
       if degeri='' then degeri:='-';
       if (ad<>'') then begin
       val(ad,ararakam,bozuk);
         if (bozuk<>0)or(ararakam<1)or(ararakam>form5.RichEdit1.Lines.Capacity) then  exit;
       ListItem.Caption:=ad;
       listitem.SubItems.Text:=degeri;
           //sonuna nedense CRLF ekliyodu
           
        form5.RichEdit1.Lines[ararakam-1]:=form5.RichEdit1.Lines[ararakam-1]+'-'; //basit çözüm
        sat:=form5.RichEdit1.Lines[ararakam-1];
        Delete(sat,length(sat),1);
        form5.RichEdit1.Lines[ararakam-1]:=sat;
        end;
end;

procedure TForm16.Git1Click(Sender: TObject);
var a:integer;
    bozuk: integer;
begin
val(ListView1.Selected.Caption,a,bozuk); //ne iþ yaa...
//  if (bozuk<>0) then exit;
form5.RichEdit1.CaretX:= 0;
form5.RichEdit1.CaretY:= a-1;
form5.Show;
end;

end.
