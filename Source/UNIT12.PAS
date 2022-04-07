unit Unit12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls,ShlObj, ShellAPI, CommCtrl,
  Menus, ToolWin, ImgList, FileCtrl,  IniFiles;

type
  TForm12 = class(TForm)
    ListView1: TListView;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    OpenDialog1: TOpenDialog;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    Ekle1: TMenuItem;
    Sil1: TMenuItem;
    Vazge1: TMenuItem;
    Kapat1: TMenuItem;
    altr1: TMenuItem;
    N1: TMenuItem;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure InitLVImageList(ListView: TListView);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure tikla(Sender: TObject);
    procedure Vazge1Click(Sender: TObject);
    procedure Ekle1Click(Sender: TObject);
    procedure Sil1Click(Sender: TObject);
    procedure Kapat1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure ListView1Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure altr1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;
  eskiKapasite:integer;

implementation

uses Unit2;

{$R *.dfm}

function GetShellImage(szFileName: string): Integer;
var
  FileInfo: TSHFileInfo;
begin
  SHGetFileInfo(PChar(szFileName),
                0,
                FileInfo,
                SizeOf(FileInfo),
                SHGFI_SYSICONINDEX or SHGFI_USEFILEATTRIBUTES);
 Result := FileInfo.iIcon;
end;


procedure TForm12.InitLVImageList(ListView: TListView);
var
  FileInfo: TSHFileInfo;
  ImageListHandle: THandle;
begin
  ImageListHandle := SHGetFileInfo('C:\', 0, FileInfo,
                                   SizeOf(FileInfo),
                                   SHGFI_SYSICONINDEX or SHGFI_SMALLICON);

       Form12.ImageList1.Handle := ImageListHandle;  //sistem ikonlarý depolanýr
       Form12.ImageList1.ShareImages := TRUE;
       
  SendMessage(ListView.Handle, LVM_SETIMAGELIST, LVSIL_SMALL, ImageListHandle);

  ImageListHandle := SHGetFileInfo('C:\', 0, FileInfo,
                                    SizeOf(FileInfo),
                                    SHGFI_SYSICONINDEX or SHGFI_LARGEICON);

  SendMessage(ListView.Handle, LVM_SETIMAGELIST, LVSIL_NORMAL, ImageListHandle);
end;

procedure TForm12.SpeedButton4Click(Sender: TObject);
begin
close
end;

procedure TForm12.SpeedButton1Click(Sender: TObject);
var
   ListItem: TListItem;
begin
OpenDialog1.Execute;
if OpenDialog1.FileName<>'' then
 begin
    with ListView1 do begin
     ListItem:= items.Add;
     ListItem.Caption:=OpenDialog1.FileName;
     ListItem.ImageIndex := GetShellImage(OpenDialog1.FileName);
    end;
 end;
end;

procedure TForm12.FormCreate(Sender: TObject);
begin
InitLVImageList(ListView1);
eskiKapasite:=form2.ImageList3.Count;
Form12.OnShow(self);    //ikonlar gözükmüyor yoksa... 2 kere olursa sorunsuz
Form12.OnShow(self);
end;

procedure TForm12.SpeedButton2Click(Sender: TObject);
begin
if ListView1.ItemIndex<>-1 then
   ListView1.Items[ListView1.ItemIndex].Delete;
end;

procedure TForm12.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_ESCAPE then close;
end;

procedure TForm12.tikla(Sender: TObject);
begin
    ShellExecute(0,'open',pchar(ListView1.Items[(sender as TMenuItem).MenuIndex-2].Caption),NIL,NIL,SW_SHOWNORMAL);
end;

procedure TForm12.FormShow(Sender: TObject);
var
    ayarini:TIniFile;
    dizin:string;
    ListItem: TListItem;
    adet,i:integer;
    menu:TMenuItem;
    VersionInfo: TOSVersionInfo;
    igrenc:integer;
begin
   VersionInfo.dwOSVersionInfoSize := Sizeof(TOSVersionInfo);

   GetVersionEx(VersionInfo);
   igrenc:=0;
   Case VersionInfo.dwPlatformID of
     VER_PLATFORM_WIN32S:        igrenc:=0;
     VER_PLATFORM_WIN32_WINDOWS: igrenc:=0;
     VER_PLATFORM_WIN32_NT:      igrenc:=5;
   End;

ListView1.Clear;
dizin:=ExtractFilePath(Application.ExeName);
if FileExists(dizin+'\varsayilan.ayar') then begin
ayarini:=TIniFile.Create(dizin+'\varsayilan.ayar');    //ayar bilgileri
adet:=ayarini.ReadInteger('Form_12','Araclar',0);

for i:=form2.Aralar1.Count-1 downto 2 do form2.Aralar1.Delete(i);

form2.ImageList3.AddImages(ImageList1); //sistem ikonlarý ana menüye eklenir

for i:=1 to adet do begin
    with ListView1 do begin
     ListItem:= items.Add;
     ListItem.Caption:=ayarini.ReadString('Form_12',inttostr(i),'');
     ListItem.ImageIndex := GetShellImage(ayarini.ReadString('Form_12',inttostr(i),''));
    end;
  menu := TMenuItem.Create(form2.Aralar1);
  menu.Caption := inttostr(i)+' '+ExtractFilename(ListView1.Items[i-1].Caption);
  if ListView1.Items[i-1].Caption='' then menu.Visible:=false;
  menu.ImageIndex:=eskiKapasite+GetShellImage(ayarini.ReadString('Form_12',inttostr(i),''))+igrenc; //grr

  menu.OnClick:=tikla;
  form2.aralar1.insert(i+1,Menu);
 end;
ayarini.Free;
end;
end;

procedure TForm12.SpeedButton3Click(Sender: TObject);
var
    dizin:string;
    ayar:Tinifile;
    i:integer;
begin
dizin:=ExtractFilePath(Application.ExeName);
if FileExists(dizin+'\varsayilan.ayar') then begin
        ayar:=TIniFile.Create(dizin+'\varsayilan.ayar');    //ayar bilgileri
        ayar.writeinteger('Form_12','Araclar',ListView1.Items.Count);
          for i:=1 to ListView1.Items.Count do
           if fileexists(ListView1.Items[i-1].Caption) then 
            ayar.WriteString('Form_12',inttostr(i), ListView1.Items[i-1].Caption)
           else
            ayar.WriteString('Form_12',inttostr(i), '');
        ayar.Free;
        form12.OnShow(self);
end;
close;
end;

procedure TForm12.Vazge1Click(Sender: TObject);
begin
SpeedButton3.OnClick(self);
end;

procedure TForm12.Ekle1Click(Sender: TObject);
begin
SpeedButton1.OnClick(self);
end;

procedure TForm12.Sil1Click(Sender: TObject);
begin
SpeedButton2.OnClick(self);
end;

procedure TForm12.Kapat1Click(Sender: TObject);
begin
SpeedButton4.OnClick(self);
end;

procedure TForm12.PopupMenu1Popup(Sender: TObject);
begin
if ListView1.SelCount<>0 then Sil1.Enabled:=true else Sil1.Enabled:=false;
if ListView1.SelCount<>0 then altr1.Enabled:=true else altr1.Enabled:=false;
end;

procedure TForm12.ListView1Change(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
if ListView1.SelCount<>0 then SpeedButton2.Enabled:=true else SpeedButton2.Enabled:=false;
end;

procedure TForm12.altr1Click(Sender: TObject);
var InsertItem : TListItem;
begin
  with ListView1 do
    InsertItem := Items[Selected.Index];
ShellExecute(0,nil,pchar(InsertItem.Caption),nil,nil,SW_SHOW);
end;

end.

