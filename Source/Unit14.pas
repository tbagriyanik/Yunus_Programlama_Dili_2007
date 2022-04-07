unit Unit14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ValEdit, ComCtrls, ToolWin, ExtCtrls, DBCtrls, DBGrids,
  StdCtrls, DB, DBClient, unit2, ShellCtrls, FileCtrl,  DirOutln,
  Menus, clipbrd, Mask, XMLIntf, msxmldom, XMLDoc, xmldom, Provider,
  SynEditHighlighter, SynHighlighterSQL, SynEdit;

type
  TForm14 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Splitter1: TSplitter;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Splitter2: TSplitter;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton6: TToolButton;
    Panel1: TPanel;
    Splitter3: TSplitter;
    FileListBox1: TFileListBox;
    DriveComboBox1: TDriveComboBox;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    ValueListEditor1: TValueListEditor;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    RichEdit2: TRichEdit;
    ToolButton9: TToolButton;
    PopupMenu1: TPopupMenu;
    Paste1: TMenuItem;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    Undo1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Uygula1: TMenuItem;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    DirectoryListBox1: TDirectoryListBox;
    PopupMenu2: TPopupMenu;
    FilterComboBox1: TFilterComboBox;
    azele1: TMenuItem;
    Yeni1: TMenuItem;
    Kaydet1: TMenuItem;
    Kapat1: TMenuItem;
    oalt1: TMenuItem;
    Sil1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    CheckBox4: TCheckBox;
    Label2: TLabel;
    PopupMenu3: TPopupMenu;
    XML1: TMenuItem;
    ClientDataSetcds1: TMenuItem;
    A1: TMenuItem;
    DataSetProvider1: TDataSetProvider;
    RichEdit1: TSynEdit;
    SynSQLSyn1: TSynSQLSyn;
    procedure ToolButton4Click(Sender: TObject);
    procedure FileListBox1DblClick(Sender: TObject);
    procedure FileListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ValueListEditor1SelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure DriveComboBox1Change(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Undo1Click(Sender: TObject);
    procedure Cut1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure Uygula1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure RichEdit1Change(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure ClientDataSetcds1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure richedit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;
  FilelistBox_dosyaadi:string;

implementation

{$R *.dfm}

procedure Tur_oku(sira:integer);
const
  Turler: array[ftUnknown..ftFMTBCD] of string [11] =
    ('Unknown', 'String', 'Smallint', 'Integer',
    'Word', 'Boolean', 'Float', 'Currency', 'BCD',
    'Date', 'Time', 'DateTime', 'Bytes', 'VarBytes',
    'AutoInc', 'Blob', 'Memo', 'Graphic', 'FmtMemo',
    'ParadoxOle', 'DBaseOle', 'TypedBinary',
    'Cursor', 'FixedChar', 'WideString', 'Largeint',
    'ADT', 'Array', 'Reference', 'DataSet', 'OraBlob',
    'OraClob', 'Variant', 'Interface', 'IDispatch',
    'Guid', 'TimeStamp', 'FMTBcd');
var i: integer;
    dbimage: TDBImage;
    dbedit:  TDBEdit;
    dbcheck: TDBCheckBox;
    dbmemo:  TDBMemo;
begin
 with form14 do begin
 LabeledEdit1.Text:=ClientDataSet1.Fields[sira].FieldName;
 LabeledEdit6.Text:=inttostr(ClientDataSet1.Fields[sira].DisplayWidth);
 LabeledEdit5.Text:=ClientDataSet1.Fields[sira].DefaultExpression;
 
 ClientDataSet1.IndexDefs.Update;
 for I := 0 to ClientDataSet1.IndexDefs.Count - 1 do
          if ClientDataSet1.IndexDefs.Items[I].Fields = ClientDataSet1.Fields[sira].FieldName then
          begin
           CheckBox1.Checked:=true;
           break;
          end
          else
          begin
           CheckBox1.Checked:=false;
          end;

 CheckBox2.Checked:=ClientDataSet1.Fields[sira].Visible;
 CheckBox3.Checked:=ClientDataSet1.Fields[sira].Required;
 CheckBox4.Checked:=ClientDataSet1.Fields[sira].ReadOnly;
 label2.Visible:=true;

 //recreate etmek garip gelebilir ama mecbur kaldým, Exception oluþturuyordu
(Form14.FindComponent('DBImage1') as TDBImage).Free;
(Form14.FindComponent('DBEdit1') as TDBEdit).Free;
(Form14.FindComponent('DBCheck1') as TDBCheckBox).Free;
(Form14.FindComponent('DBMemo1') as TDBMemo).Free;

 dbimage:=TDBImage.Create(form14);
 dbimage.Visible:=false;
 dbimage.Parent:=TabSheet1;
 dbimage.Top:=186;
 dbimage.Left:=180;
 dbimage.height:=111;
 dbimage.width:=134;
 dbimage.DataSource:=DataSource1;
 dbimage.Name:='DBImage1';
 dbimage.ReadOnly:=true;
 dbimage.Center:=false;
 dbimage.Anchors:=dbimage.Anchors+[akright,akbottom];

 dbedit:=TDBEdit.Create(form14);
 dbedit.Visible:=false;
 dbedit.Parent:=TabSheet1;
 dbedit.Top:=186;
 dbedit.Left:=180;
 dbedit.DataSource:=DataSource1;
 dbedit.Name:='DBEdit1';
 dbedit.ReadOnly:=true;
 dbedit.Anchors:=dbedit.Anchors+[akright];

 dbcheck:=TDBCheckBox.Create(form14);
 dbcheck.Visible:=false;
 dbcheck.Parent:=TabSheet1;
 dbcheck.Top:=186;
 dbcheck.Left:=180;
 dbcheck.DataSource:=DataSource1;
 dbcheck.Name:='DBCheck1';
 dbcheck.ReadOnly:=true;

 dbmemo:=TDBMemo.Create(form14);
 dbmemo.Visible:=false;
 dbmemo.Parent:=TabSheet1;
 dbmemo.Top:=186;
 dbmemo.Left:=180;
 dbmemo.height:=111;
 dbmemo.width:=134;
 dbmemo.DataSource:=DataSource1;
 dbmemo.Name:='DBMemo1';
 dbmemo.ReadOnly:=true;
 dbmemo.ScrollBars:=ssBoth;
 dbmemo.Anchors:=dbmemo.Anchors+[akright,akbottom];

 if  (turler[ClientDataSet1.Fields[sira].datatype]='String')
  or (turler[ClientDataSet1.Fields[sira].datatype]='Smallint')
  or (turler[ClientDataSet1.Fields[sira].datatype]='Integer')
  or (turler[ClientDataSet1.Fields[sira].datatype]='Word')
  or (turler[ClientDataSet1.Fields[sira].datatype]='Float')
  or (turler[ClientDataSet1.Fields[sira].datatype]='Currency')
  or (turler[ClientDataSet1.Fields[sira].datatype]='BCD')
  or (turler[ClientDataSet1.Fields[sira].datatype]='Date')
  or (turler[ClientDataSet1.Fields[sira].datatype]='Time')
  or (turler[ClientDataSet1.Fields[sira].datatype]='DateTime')
  or (turler[ClientDataSet1.Fields[sira].datatype]='AutoInc')
  then
  begin
    (FindComponent('DBEdit1')as TDBEdit).DataField:=ClientDataSet1.Fields[sira].FieldName;
    (FindComponent('DBEdit1')as TDBEdit).Visible:=true;
  end;
 if  (turler[ClientDataSet1.Fields[sira].datatype]='Memo')
  or (turler[ClientDataSet1.Fields[sira].datatype]='FmtMemo')
  then
  begin
    (FindComponent('DBMemo1')as TDBmemo).DataField:=ClientDataSet1.Fields[sira].FieldName;
    (FindComponent('DBMemo1')as TDBmemo).Visible:=true;
  end;
 if  (turler[ClientDataSet1.Fields[sira].datatype]='Graphic')
  or (turler[ClientDataSet1.Fields[sira].datatype]='Blob')
  or (turler[ClientDataSet1.Fields[sira].datatype]='TypedBinary')
  then
  begin
    (FindComponent('DBImage1')as TDBImage).DataField:=ClientDataSet1.Fields[sira].FieldName;
    (FindComponent('DBImage1')as TDBImage).Visible:=true;
  end;
 if  (turler[ClientDataSet1.Fields[sira].datatype]='Boolean')
  then
  begin
    (FindComponent('DBCheck1')as TDBCheckBox).DataField:=ClientDataSet1.Fields[sira].FieldName;
    (FindComponent('DBCheck1')as TDBCheckBox).Caption:=ClientDataSet1.Fields[sira].AsString;
    (FindComponent('DBCheck1')as TDBCheckBox).Visible:=true;
  end;

 end;
end;

procedure oku2;
const
  Turler: array[ftUnknown..ftFMTBCD] of string [11] =
    ('Unknown', 'String', 'Smallint', 'Integer',
    'Word', 'Boolean', 'Float', 'Currency', 'BCD',
    'Date', 'Time', 'DateTime', 'Bytes', 'VarBytes',
    'AutoInc', 'Blob', 'Memo', 'Graphic', 'FmtMemo',
    'ParadoxOle', 'DBaseOle', 'TypedBinary',
    'Cursor', 'FixedChar', 'WideString', 'Largeint',
    'ADT', 'Array', 'Reference', 'DataSet', 'OraBlob',
    'OraClob', 'Variant', 'Interface', 'IDispatch',
    'Guid', 'TimeStamp', 'FMTBcd');
  hepsi: string =
    'Unknown'+ #13+'String'+  #13+ 'Smallint'+  #13+ 'Integer'+  #13+
    'Word'+  #13+ 'Boolean'+  #13+'Float'+  #13+ 'Currency'+  #13+ 'BCD'+  #13+
    'Date'+  #13+ 'Time'+  #13+ 'DateTime'+  #13+'Bytes'+  #13+ 'VarBytes'+  #13+
    'AutoInc'+  #13+ 'Blob'+  #13+ 'Memo'+  #13+ 'Graphic'+  #13+ 'FmtMemo'+  #13+
    'ParadoxOle'+  #13+'DBaseOle'+  #13+ 'TypedBinary'+  #13+
    'Cursor'+  #13+ 'FixedChar'+  #13+  'WideString'+  #13+  'Largeint'+  #13+
    'ADT'+  #13+  'Array'+  #13+  'Reference'+  #13+  'DataSet'+  #13+  'OraBlob'+  #13+
    'OraClob'+  #13+  'Variant'+  #13+  'Interface'+  #13+  'IDispatch'+  #13+
    'Guid'+  #13+  'TimeStamp'+  #13+  'FMTBcd';

var i: integer;
begin
 with form14 do begin
(Form14.FindComponent('DBImage1') as TDBImage).Free;
(Form14.FindComponent('DBEdit1') as TDBEdit).Free;
(Form14.FindComponent('DBCheck1') as TDBCheckBox).Free;
(Form14.FindComponent('DBMemo1') as TDBMemo).Free;
ClientDataSet1.Active:=false;
ClientDataSet1.LoadFromFile(FileListBox1.FileName);
ClientDataSet1.Active:=true;
if form2.rke1.Checked then
    form14.Caption:='Veritabaný - '+FileListBox1.FileName
 else
    form14.Caption:='Database - '+FileListBox1.FileName;

FilelistBox_dosyaadi:=FileListBox1.FileName;
ValueListEditor1.Strings.Clear;

for i:=0 to ClientDataSet1.FieldCount-1 do begin
 ValueListEditor1.InsertRow(ClientDataSet1.Fields[i].FieldName,turler[ClientDataSet1.Fields[i].datatype],true);
 ValueListEditor1.ItemProps[i].EditStyle:=esPickList;
 ValueListEditor1.ItemProps[i].PickList.text:=hepsi;
end;
if ClientDataSet1.Active then
begin
 ToolButton5.Enabled:=true;
 ToolButton9.Enabled:=true;
end
else
begin
 ToolButton5.Enabled:=false;
 ToolButton9.Enabled:=false;
end;
if (length(RichEdit1.Lines.Text)<>0)and(ClientDataSet1.Active) then
  ToolButton10.Enabled:=true
else
  ToolButton10.Enabled:=false;
 ToolButton3.Enabled:=true;
 ToolButton2.Enabled:=true;
end;
end;

procedure Tur_yaz;
var i: integer;
    s1,s2:string;
  place : integer;
//  ana: TDOM;
begin
 with form14 do begin
//  ClientDataSet1.Fields[0].FieldName:=LabeledEdit1.Text;
{     if ClientDataSet1.Fields[sira].IsIndexField then begin
      Indx := ClientDataSet1.IndexDefs.Indexof(ClientDataSet1.Fields[sira].Name);
      if Indx > -1 then
 //       if ixPrimary in ClientDataSet1.IndexDefs[Indx].Options then
        CheckBox1.Checked:=true
       else
        CheckBox1.Checked:=false;
      end;
   CheckBox2.Checked:=ClientDataSet1.Fields[sira].Visible;
   CheckBox3.Checked:=ClientDataSet1.Fields[sira].Required;
  for i:=0 to ClientDataSet1.FieldCount-1 do begin
 LabeledEdit1.Text:=ClientDataSet1.Fields[sira].FieldName;
 LabeledEdit6.Text:=inttostr(ClientDataSet1.Fields[sira].DisplayWidth);
 LabeledEdit5.Text:=ClientDataSet1.Fields[sira].DefaultExpression;
  end;                                                            }
 if ClientDataSet1.active=false then exit;
 if FilelistBox_dosyaadi='' then exit;
// XMLDocument1.SaveToFile.Node.AttributeNodes.
 ClientDataSet1.Fields[0].DisplayWidth :=  strtoint(LabeledEdit6.Text);
 ClientDataSet1.Fields[0].DefaultExpression :=  LabeledEdit5.Text;

if lowercase(trim(LabeledEdit1.Text))=lowercase(trim(ClientDataSet1.Fields[0].FieldName)) then exit;

    RichEdit2.Lines.LoadFromFile(FileListBox1.FileName);
   for i := 0 to RichEdit2.Lines.Count -1 do begin
    s1 := RichEdit2.Lines[i];
    s2 := RichEdit2.Lines[i];
    Repeat
      Place := pos(ClientDataSet1.Fields[0].FieldName, s1);
      if place > 0 then begin
        Delete(s1, Place, Length(ClientDataSet1.Fields[0].FieldName));
        Insert(LabeledEdit1.Text, s1, Place);
        Delete(s2, Place, Length(ClientDataSet1.Fields[0].FieldName));
        Insert(LabeledEdit1.Text, s2, Place);
        RichEdit2.Lines[i] := s2;
      end; //if-then
    until place = 0;
  end;
    RichEdit2.Lines.SaveToFile(FileListBox1.FileName);
        oku2;
        tur_oku(0); //ilk alan özellikleri alýnýr
 end;
end;

procedure TForm14.FileListBox1DblClick(Sender: TObject);
begin
oku2;
tur_oku(0); //ilk alan özellikleri alýnýr
end;

procedure TForm14.FileListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key = VK_RETURN)and(FileListBox1.FileName<>'') then FileListBox1DblClick(self);
if key = VK_INSERT then ToolButton1Click(self);
if key = VK_DELETE then ToolButton2Click(self);
end;

procedure TForm14.FormCreate(Sender: TObject);
begin
ValueListEditor1.Strings.Clear;
end;

procedure TForm14.ValueListEditor1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
if ValueListEditor1.Cells[ACol,arow]='' then exit;
tur_oku (arow-1);
end;

procedure TForm14.DriveComboBox1Change(Sender: TObject);
begin
FileListBox1.Update;
end;

procedure TForm14.ToolButton2Click(Sender: TObject);
var F:TExTFile;a,b:string;
begin
if form2.rke1.Checked then
begin
 a:='Emin Misiniz?';b:='Dosya Silme';
end
else
begin
 a:='Are you sure?';b:='Delete File';
end;
  if FileListBox1.FileName<>'' then begin
   AssignFile(F, FileListBox1.FileName);
   if Application.MessageBox(pchar(a),pchar(b),MB_OKCANCEL + MB_DEFBUTTON2)=IDOK then
    Erase(F);
    FileListBox1.Update;
  end;
end;

procedure TForm14.FormShow(Sender: TObject);
begin
if form2.rke1.Checked then
 form14.Caption:='Veritabaný'
else
 form14.Caption:='Database';
if ClientDataSet1.FileName<>'' then
  form14.Caption:=form14.Caption+' - '+ClientDataSet1.FileName;

if ClientDataSet1.Active then
begin
 ToolButton5.Enabled:=true;
 ToolButton9.Enabled:=true;
end
else
begin
 ToolButton5.Enabled:=false;
 ToolButton9.Enabled:=false;
end;
if (length(RichEdit1.lines.Text)<>0)and(ClientDataSet1.Active) then
  ToolButton10.Enabled:=true
else
  ToolButton10.Enabled:=false;
end;

procedure TForm14.ToolButton9Click(Sender: TObject);
begin
(Form14.FindComponent('DBImage1') as TDBImage).Free;
(Form14.FindComponent('DBEdit1') as TDBEdit).Free;
(Form14.FindComponent('DBCheck') as TDBCheckBox).Free;
(Form14.FindComponent('DBMemo1') as TDBMemo).Free;
ClientDataSet1.Active:=false;
ClientDataSet1.FileName:='';
FilelistBox_dosyaadi:='';
if form2.rke1.Checked then
    form14.Caption:='Veritabaný'
 else
    form14.Caption:='Database';

ValueListEditor1.Strings.Clear;
LabeledEdit1.Text:='';
LabeledEdit6.Text:='';
LabeledEdit5.Text:='';
CheckBox1.Checked:=false;
CheckBox2.Checked:=false;
CheckBox3.Checked:=false;
CheckBox4.Checked:=false;
 label2.Visible:=false;
if ClientDataSet1.Active then
begin
 ToolButton5.Enabled:=true;
 ToolButton9.Enabled:=true;
end
else
begin
 ToolButton5.Enabled:=false;
 ToolButton9.Enabled:=false;
end;
if (length(RichEdit1.lines.Text)<>0)and(ClientDataSet1.Active) then
  ToolButton10.Enabled:=true
else
  ToolButton10.Enabled:=false;
end;

procedure TForm14.FileListBox1Change(Sender: TObject);
var s:TFileStream;
    Fhandle: integer;
begin
if FileListBox1.FileName='' then
begin
 ToolButton3.Enabled:=false;
 ToolButton2.Enabled:=false;
end
else
begin
 ToolButton3.Enabled:=true;
 ToolButton2.Enabled:=true;
end;
  if FileListBox1.FileName<>'' then begin
        S := TFileStream.Create(FileListBox1.FileName, fmOpenRead );
        FHandle := FileOpen(FileListBox1.FileName, 0);
        FileListBox1.Hint:=extractfilename(FileListBox1.FileName)+#13+FormatFloat('#,##0.00',s.Size / 1024)+' KB'+#13
         +FormatDateTime('D mmmm YYYYY, hh:nn:ss', FileDateToDateTime(FileAge(FileListBox1.FileName)))
         +'|';
        fileclose(Fhandle);
        s.Free;
  end;
end;

procedure TForm14.PopupMenu1Popup(Sender: TObject);
begin
if RichEdit1.SelLength<>0 then begin
  Cut1.Enabled:=true;
  Copy1.Enabled:=true;
end
else
begin
  Cut1.Enabled:=false;
  Copy1.Enabled:=false;
end;
  Undo1.Enabled:=not(RichEdit1.CanUndo);
  Paste1.Enabled:=Clipboard.HasFormat(CF_TEXT);
if (length(RichEdit1.lines.Text)<>0)and(ClientDataSet1.Active) then
  Uygula1.Enabled:=true
else
  Uygula1.Enabled:=false;
if (length(RichEdit1.lines.Text)<>0)and(ClientDataSet1.Active) then
  ToolButton10.Enabled:=true
else
  ToolButton10.Enabled:=false;
end;

procedure TForm14.Undo1Click(Sender: TObject);
begin
RichEdit1.Undo;
end;

procedure TForm14.Cut1Click(Sender: TObject);
begin
RichEdit1.CutToClipboard;
end;

procedure TForm14.Copy1Click(Sender: TObject);
begin
RichEdit1.CopyToClipboard;
end;

procedure TForm14.Paste1Click(Sender: TObject);
begin
RichEdit1.PasteFromClipboard;
end;

Procedure FileCopy(Const SourceFileName, TargetFileName: String );
Var
  S, T: TFileStream;
Begin
  S := TFileStream.Create(sourcefilename, fmOpenRead );
  try
    T := TFileStream.Create(targetfilename, fmOpenWrite or fmCreate);
   try
     T.CopyFrom(S, S.Size ) ;
   finally
     T.Free;
   end;
  finally
   S.Free;
  end;
end;

procedure TForm14.ToolButton3Click(Sender: TObject);
var numara:integer;devam:Boolean;
    dosya:string;
begin
devam:=true;
numara:=1;
while devam do begin
      dosya:=ExtractFilePath(FileListBox1.FileName)+'Copy'+inttostr(numara)+'_'+ExtractFileName(FileListBox1.FileName);
      if FileExists(dosya) then
       begin
         devam:=true;
         inc(numara);
        end else begin
         FileCopy(FileListBox1.FileName,dosya);
         FileListBox1.Update;
         devam:=false;
       end;
end;
end;

procedure TForm14.RichEdit1Change(Sender: TObject);
begin
if (length(RichEdit1.lines.Text)<>0)and(ClientDataSet1.Active) then
  ToolButton10.Enabled:=true
else
  ToolButton10.Enabled:=false;
end;

procedure TForm14.ToolButton12Click(Sender: TObject);
begin
DriveComboBox1.Update;
FileListBox1.Update;
DirectoryListBox1.Update;
end;

procedure TForm14.ToolButton4Click(Sender: TObject);
begin
close
end;

procedure TForm14.PopupMenu2Popup(Sender: TObject);
begin
    azele1.Enabled:= ToolButton12.Enabled;
    Yeni1.Enabled:=  ToolButton1.Enabled;
    Kaydet1.Enabled:=ToolButton5.Enabled;
    Kapat1.Enabled:= ToolButton9.Enabled;
    oalt1.Enabled:=  ToolButton3.Enabled;
    Sil1.Enabled:=   ToolButton2.Enabled;
    if FileListBox1.FileName<>'' then a1.Enabled:=true else a1.Enabled:=false;
end;

procedure TForm14.ToolButton1Click(Sender: TObject);
begin
//////////////////////////////////////////////////////////////
 Application.MessageBox('Under Construction','Unfinished',MB_OK+MB_ICONEXCLAMATION);
//////////////////////////////////////////////////////////////
end;

procedure TForm14.Uygula1Click(Sender: TObject);
begin
  ClientDataSet1.Close;
  ClientDataSet1.CommandText := RichEdit1.Lines.Text;
  ClientDataSet1.Open;
end;

procedure TForm14.ToolButton5Click(Sender: TObject);
begin
tur_yaz;
//////////////////////////////////////////////////////////////
 Application.MessageBox('Under Construction','Unfinished',MB_OK+MB_ICONEXCLAMATION);
//////////////////////////////////////////////////////////////
end;

procedure TForm14.ClientDataSetcds1Click(Sender: TObject);
begin
//////////////////////////////////////////////////////////////
 Application.MessageBox('Under Construction','Unfinished',MB_OK+MB_ICONEXCLAMATION);
//////////////////////////////////////////////////////////////
end;

procedure TForm14.A1Click(Sender: TObject);
begin
FileListBox1DblClick(self);
end;

procedure TForm14.richedit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (length(RichEdit1.Lines.Text)<>0)and(ClientDataSet1.Active) then
  ToolButton10.Enabled:=true
else
  ToolButton10.Enabled:=false;
end;

procedure TForm14.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_ESCAPE then close;
end;

end.
