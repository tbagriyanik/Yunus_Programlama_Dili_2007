unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls, inifiles, Spin,filectrl, Menus, printers;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button6: TButton;
    BitBtn5: TBitBtn;
    PopupMenu1: TPopupMenu;
    VarsaylanDeerler1: TMenuItem;
    varsayilanayardosyasyenile1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label10: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    ComboBoxEx1: TComboBoxEx;
    SpinEdit1: TSpinEdit;
    Edit1: TEdit;
    Button4: TButton;
    Edit2: TEdit;
    Button5: TButton;
    CheckBox8: TCheckBox;
    TrackBar1: TTrackBar;
    CheckBox9: TCheckBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit6: TEdit;
    Edit7: TEdit;
    BitBtn4: TBitBtn;
    CheckBox4: TCheckBox;
    BitBtn3: TBitBtn;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    ColorDialog1: TColorDialog;
    FontDialog1: TFontDialog;
    ColorDialog2: TColorDialog;
    FontDialog2: TFontDialog;
    SpinEdit2: TSpinEdit;
    Label4: TLabel;
    Label5: TLabel;
    SpinEdit3: TSpinEdit;
    Label19: TLabel;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    RadioGroup1: TRadioGroup;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Label12Click(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
    procedure Edit2DblClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Label18Click(Sender: TObject);
    procedure VarsaylanDeerler1Click(Sender: TObject);
    procedure varsayilanayardosyasyenile1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit1, Unit2, Unit5, Unit9, Unit6 ;

{$R *.DFM}

procedure TForm3.Button3Click(Sender: TObject); //uygula
var gecici:TComponent;
    dizin:string;
    ayar:Tinifile;
begin
form5.StatusBar1.SimplePanel:=false;
form5.FormCreate(self);
form5.RichEdit1.color:=label6.color;
form5.RichEdit1.Font:=label6.Font;
//form5.RichEdit1.SelForeColor:=clWhite-form5.RichEdit1.Font.color;
//form5.RichEdit1.SelBackColor:=clWhite-form5.RichEdit1.color;

application.HintColor:=label9.color;
screen.HintFont:=label9.font;
application.HintHidePause:=strtoint(edit6.text);
application.HintPause:=strtoint(edit7.text);
Application.HintShortCuts:=CheckBox4.Checked;

dizin:=ExtractFilePath(Application.ExeName);
if FileExists(dizin+'\varsayilan.ayar') then begin
ayar:=TIniFile.Create(dizin+'\varsayilan.ayar');    //Global ayar bilgileri
ayar.writeinteger('Form_2','Varsayilan_Dil', form3.ComboBoxEx1.ItemIndex);
ayar.writeinteger('Form_2','Varsayilan_Aralik', form3.SpinEdit1.Value);
ayar.WriteBool('Form_3','IzgarayaDaya',form3.CheckBox10.Checked);
ayar.WriteBool('Form_3','OtoYardim',form3.CheckBox11.Checked);
ayar.writeinteger('Form_3','Grid', form3.SpinEdit2.Value);
     sizeBorder:=form3.SpinEdit3.Value;
     form1.Refresh;
ayar.writeinteger('Form_3','Boyutla', form3.SpinEdit3.Value);
ayar.WriteString('Form_3','Delphi',form3.edit1.text);
ayar.WriteString('Form_3','VB',form3.edit2.text);
ayar.WriteBool('Form_3','ExcelGorunur',form3.CheckBox8.Checked);
ayar.WriteBool('Form_3','YapiskanSecim',form3.CheckBox9.Checked);
//ayar.WriteBool('Form_3','Ipucu',form3.CheckBox4.Checked);   //etkisiz
ayar.writeinteger('Form_3','Oncelik', form3.TrackBar1.Position);
ayar.writeinteger('Form_3','Yazici', form3.ComboBox1.ItemIndex);
ayar.Free;
end;


 if (form3.CheckBox1.Checked) then begin
  SetWindowPos(Form2.handle, HWND_TOPMOST,Form2.Left, Form2.Top, Form2.Width, Form2.Height,0);
     end
   else
  SetWindowPos(Form2.handle, HWND_NOTOPMOST,Form2.Left, Form2.Top, Form2.Width, Form2.Height,0);

form2.Herzamanstte1.Checked:=form3.CheckBox1.Checked;

        if form1.ComponentCount<>0 then begin
        gecici:=form1.Components[form1.componentcount-1];
        if gecici is TShape then gecici.free;
        end;

        if not(fileexists(form3.edit1.text)) then
         form3.edit1.Color:=$008080FF
         else
         form3.edit1.Color:=clWindow;
        if not(fileexists(form3.edit2.text)) then
         form3.edit2.Color:=$008080FF
         else
         form3.edit2.Color:=clWindow;

if ComboBox1.ItemIndex>0 then Printer.PrinterIndex:=ComboBox1.ItemIndex;
form3.BringToFront;
end;

procedure TForm3.Button1Click(Sender: TObject); //tamam
begin
Button3Click(self);
close;
end;

procedure TForm3.FormShow(Sender: TObject);
var ararakam:integer;
    ayarini:TIniFile;
    dizin:string;
begin
//if proje='yeni' then exit;
PageControl1.ActivePageIndex:=0;
Label6.Font:=form5.RichEdit1.font;
label6.Color:=form5.RichEdit1.Color;
label12.Color:=form5.RichEdit1.Color;
label13.Color:=form5.RichEdit1.Color;
label18.Color:=form5.RichEdit1.Color;
label9.Color:=application.HintColor;
label9.font:=screen.HintFont;
edit6.text:=inttostr(application.HintHidePause);
edit7.text:=inttostr(application.HintPause);

if FileExists((klasorproje)+'.ayar') then begin
     ayarini:=tinifile.create((klasorproje)+'.ayar');
     form3.label12.Font.Color:=colortorgb(ayarini.readinteger('Form_3','Olay_Arkaplan_rengi',-99));
     form3.label13.Font.Color:=colortorgb(ayarini.readinteger('Form_3','Aciklama_Arkaplan_rengi',-99));
     form3.label18.Font.Color:=colortorgb(ayarini.readinteger('Form_3','Metin_rengi',-99));
     form3.CheckBox1.Checked:=ayarini.ReadBool('Form_3','Ustte',false);
     form3.RadioGroup1.ItemIndex:=ayarini.ReadInteger('Form_3','Etiket',0);
     form3.CheckBox3.Checked:=ayarini.ReadBool('Form_3','Tasarim',false);
form3.CheckBox4.Checked:=ayarini.ReadBool('Form_3','Ipucu',false);
     form3.CheckBox5.Checked:=ayarini.ReadBool('Form_3','Renkli',false);
     form3.CheckBox6.Checked:=ayarini.ReadBool('Form_3','Ses',false);
     form3.CheckBox7.Checked:=ayarini.ReadBool('Form_3','DerlemePenceresi',false);
     ayarini.Free;
 end
 else
 begin
     dizin:=ExtractFilePath(Application.ExeName);
     if FileExists(dizin+'\varsayilan.ayar') then begin
     ayarini:=TIniFile.Create(dizin+'\varsayilan.ayar');    //Global ayar bilgileri
     form3.label12.Font.Color:=colortorgb(ayarini.readinteger('Form_3','Olay_Arkaplan_rengi',-99));
     form3.label13.Font.Color:=colortorgb(ayarini.readinteger('Form_3','Aciklama_Arkaplan_rengi',-99));
     form3.label18.Font.Color:=colortorgb(ayarini.readinteger('Form_3','Metin_rengi',-99));
     form3.CheckBox1.Checked:=ayarini.ReadBool('Form_3','Ustte',false);
     form3.RadioGroup1.ItemIndex:=ayarini.ReadInteger('Form_3','Etiket',0);
     form3.CheckBox3.Checked:=ayarini.ReadBool('Form_3','Tasarim',false);
form3.CheckBox4.Checked:=ayarini.ReadBool('Form_3','Ipucu',false);
     form3.CheckBox5.Checked:=ayarini.ReadBool('Form_3','Renkli',false);
     form3.CheckBox6.Checked:=ayarini.ReadBool('Form_3','Ses',false);
     form3.CheckBox7.Checked:=ayarini.ReadBool('Form_3','DerlemePenceresi',false);
     ayarini.Free;
     end;
 end;
dizin:=ExtractFilePath(Application.ExeName);
if FileExists(dizin+'\varsayilan.ayar') then begin
ayarini:=TIniFile.Create(dizin+'\varsayilan.ayar');    //Global ayar bilgileri
        form3.ComboBoxEx1.ItemIndex:=ayarini.Readinteger('Form_2','Varsayilan_Dil',-1);
        form3.SpinEdit1.Value:=ayarini.Readinteger('Form_2','Varsayilan_Aralik',0);
        form3.CheckBox10.Checked:=ayarini.readBool('Form_3','IzgarayaDaya',false);
        form3.CheckBox11.Checked:=ayarini.readBool('Form_3','OtoYardim',true);
        form3.SpinEdit2.Value:=ayarini.ReadInteger('Form_3','Grid',1);
        form3.SpinEdit3.Value:=ayarini.ReadInteger('Form_3','Boyutla',1);
        sizeBorder:=form3.SpinEdit3.Value;
        form3.edit1.text:=ayarini.ReadString('Form_3','Delphi','');
        if not(fileexists(form3.edit1.text)) then
         form3.edit1.Color:=$008080FF
         else
         form3.edit1.Color:=clWindow;
        form3.edit2.text:=ayarini.ReadString('Form_3','VB','');
        if not(fileexists(form3.edit2.text)) then
         form3.edit2.Color:=$008080FF
         else
         form3.edit2.Color:=clWindow;
        form3.CheckBox8.Checked:=ayarini.readBool('Form_3','ExcelGorunur',false);
        form3.CheckBox9.Checked:=ayarini.readBool('Form_3','YapiskanSecim',false);
        form3.TrackBar1.Position:=ayarini.ReadInteger('Form_3','Oncelik',-1);
        form3.ComboBox1.ItemIndex:=ayarini.Readinteger('Form_3','Yazici',-1);
ayarini.Free;
end;

if form2.rke1.Checked then ararakam:=0 else ararakam:=1000;
form3.ComboBoxEx1.ItemsEx[0].Caption:=(LoadStr(ararakam+35));
form3.ComboBoxEx1.ItemsEx[1].Caption:=(LoadStr(ararakam+36));

end;

procedure TForm3.Button2Click(Sender: TObject); //vazgeç
begin
FormShow(self);
close;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
FontDialog1.Font:=form5.RichEdit1.Font;
FontDialog1.Execute;
label6.Font:=FontDialog1.Font;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
colorDialog1.color:=label6.color;
colorDialog1.Execute;
label6.color:=colorDialog1.color;
label12.color:=colorDialog1.color;
label13.color:=colorDialog1.color;
label18.color:=colorDialog1.color;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
colorDialog2.color:=label9.color;
colorDialog2.Execute;
label9.color:=colorDialog2.color;
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
begin
FontDialog2.Font:=label9.Font;
FontDialog2.Execute;
label9.Font:=FontDialog2.Font;
end;

procedure TForm3.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8]) then begin
  key:=#0;
 end;
end;

procedure TForm3.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8]) then begin
  key:=#0;
 end;
end;

procedure TForm3.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_ESCAPE then close;
if key=VK_RETURN then button1.OnClick(self);
end;

procedure TForm3.Label12Click(Sender: TObject);
begin
colorDialog1.color:=label12.font.color;
colorDialog1.Execute;
label12.font.color:=colorDialog1.color;
end;

procedure TForm3.Label13Click(Sender: TObject);
begin
colorDialog1.color:=label13.font.color;
colorDialog1.Execute;
label13.font.color:=colorDialog1.color;
end;

procedure TForm3.Label18Click(Sender: TObject);
begin
colorDialog1.color:=label18.font.color;
colorDialog1.Execute;
label18.font.color:=colorDialog1.color;
end;

procedure TForm3.Button4Click(Sender: TObject);
var
   Drv2   : integer;
   Drv1   : set of 0..25;
   surucu : string;
   ara    : integer;
begin
dcc32:='';
if Form2.rke1.Checked then ara:=0 else ara:=1000;
if Application.MessageBox(pchar(LoadStr(305+ara)),pchar(LoadStr(306+ara)),MB_YESNO+MB_DEFBUTTON2)=IDYES	 then
begin
 screen.Cursor:=crHourGlass;
   DWORD( Drv1 ) := Windows.GetLogicalDrives;
    for Drv2 := 2 to 25 do  //0 ve 1 disket
     if Drv2 in Drv1 then begin
          surucu:=Chr( Drv2 + Ord( 'A' )) + ':\';
          if GetDriveType(pchar(surucu))=DRIVE_FIXED then
           Form2.FindFile(surucu,'dcc32.exe');
           if dcc32 <> '' then break;
      end;
 screen.Cursor:=crDefault;
  if dcc32 <> '' then edit1.Text:=dcc32+'dcc32.exe' else
   begin
   ShowMessage('dcc32.exe '+ LoadStr(304+ara));
   end;

        if not(fileexists(form3.edit1.text)) then
         form3.edit1.Color:=$008080FF
         else
         form3.edit1.Color:=clWindow;
 end;
end;

procedure TForm3.Button5Click(Sender: TObject);
var
   Drv2   : integer;
   Drv1   : set of 0..25;
   surucu : string;
   ara :integer;
begin
dcc32:='';
if Form2.rke1.Checked then ara:=0 else ara:=1000;
if Application.MessageBox(pchar(LoadStr(305+ara)),pchar(LoadStr(306+ara)),MB_YESNO+MB_DEFBUTTON2)=IDYES	 then
begin
screen.Cursor:=crHourGlass;
   DWORD( Drv1 ) := Windows.GetLogicalDrives;
    for Drv2 := 2 to 25 do  //0 ve 1 disket
     if Drv2 in Drv1 then begin
          surucu:=Chr( Drv2 + Ord( 'A' )) + ':\';
          if GetDriveType(pchar(surucu))=DRIVE_FIXED then
           Form2.FindFile(surucu,'link.exe');
           if dcc32 <> '' then break;
      end;
screen.Cursor:=crDefault;
  if dcc32 <> '' then edit2.Text:=dcc32+'link.exe' else
   begin
   ShowMessage('Link.exe '+LoadStr(304+ara));
   end;
        if not(fileexists(form3.edit2.text)) then
         form3.edit2.Color:=$008080FF
         else
         form3.edit2.Color:=clWindow;

  end;
end;

procedure TForm3.Edit1DblClick(Sender: TObject);
var baslik:string;
begin
  if fileexists(edit1.Text) then
  baslik:=ExtractFilePath(edit1.Text)
  else
  baslik:='';
if SelectDirectory( baslik, [sdAllowCreate, sdPerformCreate, sdPrompt], 1000) then
 if baslik[length(baslik)]='\' then
  Edit1.Text := baslik+'dcc32.exe'
  else
  Edit1.Text := baslik+'\dcc32.exe';

        if not(fileexists(form3.edit1.text)) then
         form3.edit1.Color:=$008080FF
         else
         form3.edit1.Color:=clWindow;
end;

procedure TForm3.Edit2DblClick(Sender: TObject);
var baslik:string;
begin
  if fileexists(edit2.Text) then
  baslik:=ExtractFilePath(edit2.Text)
  else
  baslik:='';
if SelectDirectory(baslik, [sdAllowCreate, sdPerformCreate, sdPrompt], 1000) then
 if baslik[length(baslik)]='\' then
  Edit2.Text := baslik+'link.exe'
  else
  Edit2.Text := baslik+'\link.exe';

        if not(fileexists(form3.edit2.text)) then
         form3.edit2.Color:=$008080FF
         else
         form3.edit2.Color:=clWindow;
end;

procedure TForm3.Button6Click(Sender: TObject);
var ara:integer;
begin
if Form2.rke1.Checked then ara:=0 else ara:=1000;
if Application.MessageBox(pchar(LoadStr(307+ara)),pchar(LoadStr(309+ara)),MB_YESNO+MB_DEFBUTTON2)=IDYES	 then
begin
  form1.UnRegisterExtension('.proje', 'Yunus Proje Dosyasi', Application.ExeName);
  ShowMessage(LoadStr(308+ara));
end;
end;

procedure TForm3.VarsaylanDeerler1Click(Sender: TObject);
var ayarini:TIniFile;
    dizin:string;
    Fontu:TFont;
    ara:integer;
begin
if Form2.rke1.Checked then ara:=0 else ara:=1000;
if Application.MessageBox(pchar(LoadStr(310+ara)),pchar(LoadStr(309+ara)),MB_YESNO+MB_DEFBUTTON2)=IDYES	 then
begin
     dizin:=ExtractFilePath(Application.ExeName);
     if FileExists(dizin+'\varsayilan.ayar') then begin
     ayarini:=TIniFile.Create(dizin+'\varsayilan.ayar');    //Global ayar bilgileri
    Fontu:=TFont.Create;
     Fontu.Name:=ayarini.ReadString('Form_5','Yazitipi','');
     Fontu.Size:=ayarini.Readinteger('Form_5','Yazitipi_Size',-99);
     Fontu.color:=colortorgb(ayarini.Readinteger('Form_5','Yazi_rengi',-99));
     Fontu.Style   := TFontStyles(Byte(ayarini.ReadInteger('Form_5', 'Stil', Byte(form5.RichEdit1.Font.Style))));
     Fontu.CharSet := TFontCharSet(ayarini.ReadInteger('Form_5', 'CharSet', form5.RichEdit1.Font.CharSet));
Label6.Font:=Fontu;
label6.Color:=colortorgb( ayarini.readinteger('Form_5','Arkaplan_rengi',-99));
label12.Color:=label6.Color;
label13.Color:=label6.Color;
label18.Color:=label6.Color;
     Fontu.Name:=ayarini.ReadString('Form_3','Yazitipi','');
     Fontu.Size:=ayarini.Readinteger('Form_3','Yazitipi_Size',-99);
     Fontu.Color:=ayarini.readinteger('Form_3','IpucuYaziRengi',colortorgb(screen.HintFont.Color));
     Fontu.Style   := TFontStyles(Byte(ayarini.ReadInteger('Form_3', 'Stil', Byte(screen.HintFont.Style))));
     Fontu.CharSet := TFontCharSet(ayarini.ReadInteger('Form_3', 'CharSet', screen.HintFont.CharSet));
label9.font:=Fontu;
Fontu.Free;

label9.Color:=colortorgb( ayarini.readinteger('Form_3','Ipucu_rengi',-99));
edit6.text:=inttostr(ayarini.readInteger('Form_3','Ipucu_suresi',-99));
edit7.text:=inttostr(ayarini.readInteger('Form_3','Ipucu_cikma_suresi',-99));

     label12.Font.Color:=colortorgb(ayarini.readinteger('Form_3','Olay_Arkaplan_rengi',-99));
     label13.Font.Color:=colortorgb(ayarini.readinteger('Form_3','Aciklama_Arkaplan_rengi',-99));
     label18.Font.Color:=colortorgb(ayarini.readinteger('Form_3','Metin_rengi',-99));
     CheckBox1.Checked:=ayarini.ReadBool('Form_3','Ustte',false);
     form3.RadioGroup1.ItemIndex:=ayarini.ReadInteger('Form_3','Etiket',0);
     CheckBox3.Checked:=ayarini.ReadBool('Form_3','Tasarim',false);
     CheckBox4.Checked:=ayarini.ReadBool('Form_3','Ipucu',false);
     CheckBox5.Checked:=ayarini.ReadBool('Form_3','Renkli',false);
     CheckBox6.Checked:=ayarini.ReadBool('Form_3','Ses',false);
     CheckBox7.Checked:=ayarini.ReadBool('Form_3','DerlemePenceresi',false);
     CheckBox8.Checked:=ayarini.readBool('Form_3','ExcelGorunur',false);
     CheckBox9.Checked:=ayarini.readBool('Form_3','YapiskanSecim',false);
     CheckBox10.Checked:=ayarini.readBool('Form_3','IzgarayaDaya',false);
     CheckBox11.Checked:=ayarini.readBool('Form_3','OtoYardim',false);
     ComboBoxEx1.ItemIndex:=ayarini.Readinteger('Form_2','Varsayilan_Dil',-1);
     ComboBox1.ItemIndex:=ayarini.Readinteger('Form_3','Yazici',-1);
     SpinEdit1.Value:=ayarini.Readinteger('Form_2','Varsayilan_Aralik',0);
     form3.SpinEdit2.Value:=ayarini.ReadInteger('Form_3','Grid',1);
     form3.SpinEdit3.Value:=ayarini.ReadInteger('Form_3','Boyutla',1);
     sizeBorder:=form3.SpinEdit3.Value;
     edit1.text:=ayarini.ReadString('Form_3','Delphi','');
     edit2.text:=ayarini.ReadString('Form_3','VB','');
     TrackBar1.Position:=ayarini.ReadInteger('Form_3','Oncelik',-1);

     ayarini.Free;
     end;
    end; 
end;

procedure TForm3.varsayilanayardosyasyenile1Click(Sender: TObject);
var    ara:integer;
begin
if Form2.rke1.Checked then ara:=0 else ara:=1000;
 if Application.MessageBox(pchar(LoadStr(311+ara)),pchar(LoadStr(309+ara)),MB_YESNO+MB_DEFBUTTON2)=IDYES	 then
  form6.Memo1.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+'\varsayilan.ayar');
end;

procedure TForm3.BitBtn5Click(Sender: TObject);
begin
PopupMenu1.Popup(BitBtn5.left+form3.Left+3,BitBtn5.Top+BitBtn5.Height+form3.top+21);
end;

end.
