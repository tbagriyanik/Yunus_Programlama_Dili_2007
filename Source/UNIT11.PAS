unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Menus, clipbrd;

type
  TForm11 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    RichEdit1: TRichEdit;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    Kes2: TMenuItem;
    Kopyala2: TMenuItem;
    Yaptr2: TMenuItem;
    Sil2: TMenuItem;
    TmnSe2: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    GeriAl1: TMenuItem;
    DosyadanYkle1: TMenuItem;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RichEdit1Change(Sender: TObject);
    procedure GeriAl1Click(Sender: TObject);
    procedure Kes2Click(Sender: TObject);
    procedure Kopyala2Click(Sender: TObject);
    procedure Yaptr2Click(Sender: TObject);
    procedure Sil2Click(Sender: TObject);
    procedure TmnSe2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DosyadanYkle1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses Unit1, Unit2;

{$R *.dfm}

procedure TForm11.Button1Click(Sender: TObject);
begin
     if (form1.Components[form2.combobox1.ItemIndex] is Tlistbox) then
        (form1.Components[form2.combobox1.ItemIndex] as Tlistbox).Items:=form11.RichEdit1.Lines;

     if (form1.Components[form2.combobox1.ItemIndex] is TRichEdit) then begin
        (form1.Components[form2.combobox1.ItemIndex] as TRichEdit).lines.Text:=form11.RichEdit1.Lines.Text;
        form2.ValueListEditor1.Cells[1,1]:=form11.RichEdit1.Text;
        end;

     if (form1.Components[form2.combobox1.ItemIndex] is TComboBox) then
        (form1.Components[form2.combobox1.ItemIndex] as TComboBox).Items:=form11.RichEdit1.Lines;
close;
end;

procedure TForm11.Button2Click(Sender: TObject);
begin
close;
end;

procedure TForm11.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in shift)and(key=VK_RETURN) then Button1Click(self);
if key=VK_ESCAPE then Button2Click(self);
end;

procedure TForm11.FormDeactivate(Sender: TObject);
begin
Button2Click(self);
end;

procedure TForm11.FormShow(Sender: TObject);
begin
RichEdit1.ClearUndo;
RichEdit1.SetFocus;
RichEdit1Change(self);
end;

procedure TForm11.RichEdit1Change(Sender: TObject);
begin
   if form2.rke1.Checked then
        Label1.Caption:=inttostr(RichEdit1.Lines.Count)+' satýr'
   else
        Label1.Caption:=inttostr(RichEdit1.Lines.Count)+' line(s)';
end;

procedure TForm11.GeriAl1Click(Sender: TObject);
begin
RichEdit1.Undo;
end;

procedure TForm11.Kes2Click(Sender: TObject);
begin
RichEdit1.CutToClipboard;
end;

procedure TForm11.Kopyala2Click(Sender: TObject);
begin
RichEdit1.CopyToClipboard;
end;

procedure TForm11.Yaptr2Click(Sender: TObject);
begin
RichEdit1.PasteFromClipboard;
end;

procedure TForm11.Sil2Click(Sender: TObject);
begin
RichEdit1.ClearSelection;
end;

procedure TForm11.TmnSe2Click(Sender: TObject);
begin
RichEdit1.SelectAll;
end;

procedure TForm11.PopupMenu1Popup(Sender: TObject);
begin
 GeriAl1.Enabled:=RichEdit1.CanUndo;
if (richedit1.SelLength>0) then begin
        Kopyala2.Enabled:=true;
        Kes2.Enabled:=true;
        Sil2.Enabled:=true;
end
else
begin
        Kopyala2.Enabled:=false;
        Kes2.Enabled:=false;
        Sil2.Enabled:=false;
end;
        if Clipboard.HasFormat(CF_TEXT) then
         Yaptr2.Enabled:=true
         else
         Yaptr2.Enabled:=false;
end;

procedure TForm11.DosyadanYkle1Click(Sender: TObject);
begin
if form2.rke1.Checked then ararakam:=0 else ararakam:=1000;
OpenDialog1.Title:=loadstr(ararakam+152);
OpenDialog1.Filter:=loadstr(ararakam+214)+'|*.txt|'+loadstr(ararakam+154)+'|*.*';
OpenDialog1.Execute;
if OpenDialog1.FileName<>'' then
   RichEdit1.Lines.LoadFromFile(OpenDialog1.FileName);
end;

end.
