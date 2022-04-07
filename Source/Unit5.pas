unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Menus, Clipbrd, ToolWin,  inifiles,
  SynEdit,  SynEditHighlighter, SynHighlighterVB, SynAutoCorrect,
  SynCompletionProposal, usimpleIDEdebugger,ImgList,SynEditRegexSearch,
  SynEditMiscClasses, SynEditSearch, SynEditOptionsDialog, System.ImageList;

type
  TForm5 = class(TForm)
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    Kes2: TMenuItem;
    Kopyala2: TMenuItem;
    Yaptr2: TMenuItem;
    Sil2: TMenuItem;
    TmnSe2: TMenuItem;
    GeriAl1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Bul1: TMenuItem;
    HataPenceresi1: TMenuItem;
    N3: TMenuItem;
    Kodablonu1: TMenuItem;
    DugmeTiknaninca1: TMenuItem;
    FormYuklenince1: TMenuItem;
    EgerDegilse1: TMenuItem;
    Donder1: TMenuItem;
    Sart1: TMenuItem;
    WhileRepeat1: TMenuItem;
    SatrSil1: TMenuItem;
    KodTamamla1: TMenuItem;
    Yap1: TMenuItem;
    Renklendir1: TMenuItem;
    PopupMenu2: TPopupMenu;
    emizle1: TMenuItem;
    HatalSatraGit1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ListBox1: TListBox;
    BenchmarkSil1: TMenuItem;
    Hatalarsil1: TMenuItem;
    KodPenceresi1: TMenuItem;
    N4: TMenuItem;
    DurakNoktas1: TMenuItem;
    Ekle1: TMenuItem;
    mnSil1: TMenuItem;
    Edit1: TMenuItem;
    N5: TMenuItem;
    RichEdit1: TSynEdit;
    SynAutoComplete1: TSynAutoComplete;
    SynAutoCorrect1: TSynAutoCorrect;
    SynVBSyn1: TSynVBSyn;
    imglActions: TImageList;
    imglGutterGlyphs: TImageList;
    bookmark: TImageList;
    Yinele1: TMenuItem;
    SynEditSearch1: TSynEditSearch;
    SynEditRegexSearch1: TSynEditRegexSearch;
    SynEditOptionsDialog1: TSynEditOptionsDialog;
    Deitir1: TMenuItem;
    leriBul1: TMenuItem;
    GeriBul1: TMenuItem;
    SynCompletionProposal1: TSynCompletionProposal;
    scpDemo: TSynCompletionProposal;
    procedure GeriAl1Click(Sender: TObject);
    procedure Kes2Click(Sender: TObject);
    procedure Kopyala2Click(Sender: TObject);
    procedure Yaptr2Click(Sender: TObject);
    procedure TmnSe2Click(Sender: TObject);
    procedure Bul1Click(Sender: TObject);
    procedure Sil2Click(Sender: TObject);
    procedure HataPenceresi1Click(Sender: TObject);
    procedure DugmeTiknaninca1Click(Sender: TObject);
    procedure FormYuklenince1Click(Sender: TObject);
    procedure EgerDegilse1Click(Sender: TObject);
    procedure Donder1Click(Sender: TObject);
    procedure Sart1Click(Sender: TObject);
    procedure WhileRepeat1Click(Sender: TObject);
    procedure SatrSil1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Yap1Click(Sender: TObject);
    procedure Renklendir1Click(Sender: TObject);
    procedure emizle1Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure RichEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure RichEdit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure KodTamamla1Click(Sender: TObject);
    procedure HatalSatraGit1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure KodPenceresi1Click(Sender: TObject);
    procedure Hatalarsil1Click(Sender: TObject);
    procedure BenchmarkSil1Click(Sender: TObject);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure Ekle1Click(Sender: TObject);
    procedure mnSil1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Yinele1Click(Sender: TObject);
    procedure RichEdit1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SynEdit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RichEdit1ReplaceText(Sender: TObject; const ASearch,
      AReplace: String; Line, Column: Integer;
      var Action: TSynReplaceAction);
    procedure Deitir1Click(Sender: TObject);
    procedure leriBul1Click(Sender: TObject);
    procedure GeriBul1Click(Sender: TObject);
    procedure RichEdit1GutterClick(Sender: TObject; Button: TMouseButton;
      X, Y, Line: Integer; Mark: TSynEditMark);
    procedure FormDestroy(Sender: TObject);
    procedure SynCompletionProposal1Execute(Kind: SynCompletionType;
      Sender: TObject; var CurrentInput: String; var x, y: Integer;
      var CanExecute: Boolean);
    procedure RichEdit1SpecialLineColors(Sender: TObject; Line: Integer;
      var Special: Boolean; var FG, BG: TColor);
  private
    { Private declarations }
    fCurrentLine: integer;
    fDebugger: TSampleDebugger;
    procedure DebuggerBreakpointChange(Sender: TObject; ALine: integer);
    procedure DebuggerCurrentLineChange(Sender: TObject);
    procedure DebuggerStateChange(Sender: TObject; OldState,
      NewState: TDebuggerState);
    procedure DebuggerYield(Sender: TObject);
    procedure DoSearchReplaceText(AReplace: boolean; ABackwards: boolean);
    procedure ShowSearchReplaceDialog(AReplace: boolean);
    procedure PaintGutterGlyphs(ACanvas: TCanvas; AClip: TRect; FirstLine,
      LastLine: integer);
 public
    { Public declarations }
    procedure aciklama;
    procedure SetCurrentLine(ALine: integer);
    procedure ApplicationEvents1Idle(Sender: TObject;
    var Done: Boolean);
  end;

var
  Form5: TForm5;
    LookupList ,ototam1,ototam2 : TStringList;

    SyntaxHighlight: boolean;
    fSearchFromCaret: boolean;

    fBreakpoints: TList;
    fCurrentLine: integer;
    fDebuggerState: TDebuggerState;
    fLineToStop: integer;
    fNextInstruction: integer;
    fWantedState: TDebuggerState;

  gbSearchBackwards: boolean;
  gbSearchCaseSensitive: boolean;
  gbSearchFromCaret: boolean =true;
  gbSearchSelectionOnly: boolean;
  gbSearchTextAtCaret: boolean;
  gbSearchWholeWords: boolean;
  gbSearchRegex: boolean;

  gsSearchText: string;
  gsSearchTextHistory: string;
  gsReplaceText: string;
  gsReplaceTextHistory: string;

  eskiyeri:integer;
  sagtus:Boolean;
  silin,gec:boolean;
  eskirenk:TColor;
  renkli:boolean;
  ototamam:boolean;
  hangisi,ara:string;
  karet:integer;
  BreakPointListesi: array [1..256] of integer;

  STextNotFound: string = 'Text not found';

implementation

uses Unit2, Unit3, Unit1, Unit8, Unit16, Unit9, ValEdit, dlgSearchText,
  SynEditTextBuffer, dlgConfirmReplace,dlgReplacetExt,SynEditTypes, SynEditMiscProcs;

{$R *.DFM}

{ TGutterMarkDrawPlugin }

type
  TDebugSupportPlugin = class(TSynEditPlugin)
  protected
    fForm: TForm5;
    procedure AfterPaint(ACanvas: TCanvas; const AClip: TRect;
      FirstLine, LastLine: integer); override;
    procedure LinesInserted(FirstLine, Count: integer); override;
    procedure LinesDeleted(FirstLine, Count: integer); override;
  public
    constructor Create(AForm: TForm5);
  end;

procedure TDebugSupportPlugin.AfterPaint(ACanvas: TCanvas;
  const AClip: TRect; FirstLine, LastLine: integer);
begin
  inherited;
  fForm.PaintGutterGlyphs(ACanvas, AClip, FirstLine, LastLine);
end;

constructor TDebugSupportPlugin.Create(AForm: TForm5);
begin
  inherited Create(AForm.RichEdit1);
  fForm := AForm;
end;


procedure TForm5.ApplicationEvents1Idle(Sender: TObject;
  var Done: Boolean);
const
  CapPanel  = 1;  NumPanel  = 2;
  ScrlPanel = 3;  DatePanel = 4;
var sil:string;
    i:integer;
begin
if (RichEdit1.Modified)and(caption[1]<>'*') then caption:='*'+caption
else if (RichEdit1.Modified=false)and(caption[1]='*') then
begin
sil:=caption;   //direkt silemedik
delete(sil,1,1);
caption:=sil;
end;
  with StatusBar1 do
  begin
    if GetKeyState(VK_CAPITAL) <> 0 then
      StatusBar1.Panels[CapPanel].Text := 'CAPS'
    else
      StatusBar1.Panels[CapPanel].Text := '';
    if GetKeyState(VK_NUMLOCK) <> 0 then
      StatusBar1.Panels[NumPanel].Text := 'NUM'
    else
      StatusBar1.Panels[NumPanel].Text := '';
   if RichEdit1.InsertMode then
    begin
      StatusBar1.Panels[3].Bevel:= pbRaised;
      StatusBar1.Panels[ScrlPanel].Text := 'INS'
      end
    else begin
      StatusBar1.Panels[3].Bevel:= pbLowered;
      StatusBar1.Panels[ScrlPanel].Text := 'OVR';
      end;

   StatusBar1.Panels[DatePanel].Text := FormatDateTime('D mmmm YYYYY, hh:nn:ss', now);
  end;
if form5.StatusBar1.SimplePanel then exit;
with form5.StatusBar1.Canvas do begin

        if form2.ToolButton7.enabled then begin
        pen.Style:=psSolid;
        brush.Style:=bsSolid;
        brush.Color:=cl3DLight;
        Rectangle(5,5,15,15);
        Font.Size:=7;
        Font.Style:=Font.Style+[fsBold];
        Font.Name:='small fonts';
        font.Color:=clred;
        pen.Style:=psClear;
        brush.Style:=bsClear;
        TextOut(8,4,'r');
        end;

     if (form16.ListView1.FindCaption(-1,inttostr(RichEdit1.CaretY+1),false,false,false)<>NIL) then
        begin
        pen.Style:=psSolid;
        brush.Style:=bsSolid;
        brush.Color:=cl3DLight;
        Rectangle(5+30,5,15+30,15);
        Font.Size:=7;
        Font.Style:=Font.Style-[fsBold];
        Font.Name:='small fonts';
        font.Color:=clred;
        pen.Style:=psClear;
        brush.Style:=bsClear;
        TextOut(8+30,4,'b');
        end;
end; //with
end;

procedure TForm5.GeriAl1Click(Sender: TObject);
begin
RichEdit1.Undo;
end;

procedure TForm5.Kes2Click(Sender: TObject);
begin
RichEdit1.CutToClipboard;
end;

procedure TForm5.Kopyala2Click(Sender: TObject);
begin
RichEdit1.CopyToClipboard;
end;

procedure TForm5.Yaptr2Click(Sender: TObject);
begin
RichEdit1.PasteFromClipboard;
end;

procedure TForm5.TmnSe2Click(Sender: TObject);
begin
RichEdit1.SelectAll;
end;

procedure TForm5.Bul1Click(Sender: TObject);
begin
ShowSearchReplaceDialog(FALSE);
end;

procedure TForm5.Sil2Click(Sender: TObject);
begin
RichEdit1.ClearSelection;
end;

procedure TForm5.Yinele1Click(Sender: TObject);
begin
RichEdit1.Redo;
end;

procedure TForm5.HataPenceresi1Click(Sender: TObject);
begin
form5.Show;
        if form5.PageControl1.ActivePageIndex=1 then begin
         form5.PageControl1.ActivePageIndex:=0;
         if  form5.RichEdit1.enabled then form5.RichEdit1.SetFocus;
        end
        else
        begin
         form5.PageControl1.ActivePageIndex:=1;
        end;
end;

function imlecSatir(curs:integer):integer; //imlec hangi satýrda?
begin
result:=Form5.RichEdit1.CaretY;
end;

procedure TForm5.DugmeTiknaninca1Click(Sender: TObject);
var line:integer;
begin
Line := imlecSatir(RichEdit1.SelStart)-1;
RichEdit1.Lines.insert(line,form2.komutlistesi('Dugme')+'X '+form2.komutlistesi('Tiklaninca'));
RichEdit1.Lines.insert(line+1,'');
RichEdit1.Lines.insert(line+2,form2.komutlistesi('bitti'));
RichEdit1.Carety:=line+2;
end;

procedure TForm5.FormYuklenince1Click(Sender: TObject);
var line:integer;
begin
Line := imlecSatir(RichEdit1.SelStart)-1;
RichEdit1.Lines.insert(line,form2.komutlistesi('Form')+' '+form2.komutlistesi('Yuklenince'));
RichEdit1.Lines.insert(line+1,'');
RichEdit1.Lines.insert(line+2,form2.komutlistesi('bitti'));
RichEdit1.Carety:=line+2;
end;

procedure TForm5.EgerDegilse1Click(Sender: TObject);
var line:integer;
begin
Line := imlecSatir(RichEdit1.SelStart)-1;
RichEdit1.Lines.insert(line,form2.komutlistesi('Eger'));
RichEdit1.Lines.insert(line+1,'');
RichEdit1.Lines.insert(line+2,form2.komutlistesi('Egerbitti'));
RichEdit1.Carety:=line+1;
RichEdit1.Caretx:=length(RichEdit1.LineText)+1;
end;

procedure TForm5.Donder1Click(Sender: TObject);
var line:integer;
begin
Line := imlecSatir(RichEdit1.SelStart)-1;
RichEdit1.Lines.insert(line,form2.komutlistesi('Donder'));
RichEdit1.Lines.insert(line+1,'');
RichEdit1.Lines.insert(line+2,form2.komutlistesi('Donderbitti'));
RichEdit1.Carety:=line+1;
RichEdit1.Caretx:=length(RichEdit1.LineText)+2;
end;

procedure TForm5.Sart1Click(Sender: TObject);
var line:integer;
begin
Line := imlecSatir(RichEdit1.SelStart)-1;
RichEdit1.Lines.insert(line,'Durum');              //under construction!?!
RichEdit1.Lines.insert(line+1,':');
RichEdit1.Lines.insert(line+2,'Degilse');
RichEdit1.Lines.insert(line+3,'');
RichEdit1.Lines.insert(line+4,'Durumbitti');
RichEdit1.Carety:=line+1;
RichEdit1.Caretx:=length(RichEdit1.LineText)+2;
end;

procedure TForm5.WhileRepeat1Click(Sender: TObject);
var line:integer;
begin
Line := imlecSatir(RichEdit1.SelStart)-1;
RichEdit1.Lines.insert(line,form2.komutlistesi('iken'));
RichEdit1.Lines.insert(line+1,'');
RichEdit1.Lines.insert(line+2,form2.komutlistesi('ikenbitti'));
RichEdit1.Carety:=line+1;
RichEdit1.Caretx:=length(RichEdit1.LineText)+2;
end;

procedure TForm5.SatrSil1Click(Sender: TObject);
begin
if RichEdit1.CaretY<RichEdit1.Lines.Count then
//RichEdit1.UndoList.AddChange(crDelete,RichEdit1.CaretX,RichEdit1.CaretX+length(RichEdit1.lines[RichEdit1.CaretY]));
RichEdit1.Lines.Delete(RichEdit1.CaretY-1);
RichEdit1.CaretX:=0;
end;

procedure TForm5.PopupMenu1Popup(Sender: TObject);
begin
if RichEdit1.ReadOnly then
begin
        Kes2.Enabled:=false;
        Sil2.Enabled:=false;
        GeriAl1.Enabled:=false;

        if (RichEdit1.SelLength>0) then
           Kopyala2.Enabled:=true
           else
           Kopyala2.Enabled:=false;

        Yaptr2.Enabled:=false;
        SatrSil1.Enabled:=false;
        yap1.Enabled:=false;
        Kodablonu1.Enabled:=false;
        KodTamamla1.Enabled:=false;
        exit;
end;

GeriAl1.Enabled:=(RichEdit1.UndoList.CanUndo);
Yinele1.Enabled:=(RichEdit1.RedoList.CanUndo);

        Yaptr2.Enabled:=RichEdit1.CanPaste;

        SatrSil1.Enabled:=true;
        yap1.Enabled:=true;
        Kodablonu1.Enabled:=true;
        KodTamamla1.Enabled:=true;

if (RichEdit1.SelLength>0) then begin
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
end;

procedure TForm5.Yap1Click(Sender: TObject);    //(un)comment
var line1,line2,eskiyer,i:integer;gecici:string;
begin
 eskiyer:=RichEdit1.SelStart;
 Line1 := imlecSatir(RichEdit1.SelStart)-1;

 if length(RichEdit1.Lines.Text)<>0 then
 begin
 if RichEdit1.SelLength=0 then
 line2:=line1 else
 Line2:=imlecSatir(RichEdit1.SelEnd)-1;

  for i:=line1 to line2 do begin
   gecici:=trim(RichEdit1.lines[i]);
   if length(trim(gecici))=0 then continue;
   if form2.mid(gecici,1,1)= '''' then begin
   delete(gecici,1,1);
   RichEdit1.SelStart:=eskiyer;
   RichEdit1.Lines[i]:=gecici;
   continue;
   end
   else begin
   gecici:=''''+gecici;
   RichEdit1.SelStart:=eskiyer;
   RichEdit1.Lines[i]:=''''+RichEdit1.Lines[i];
   end;
  end;
  end;
      //   showmessage(format('%d - %d',[line1,line2]));
end;

procedure TForm5.Renklendir1Click(Sender: TObject);
begin
Renklendir1.Checked:=not(Renklendir1.Checked);
renkli:=Renklendir1.Checked;
RichEdit1.WordWrap:=Renklendir1.Checked;
end;

procedure TForm5.emizle1Click(Sender: TObject);
begin
ListBox1.Clear;
end;

procedure TForm5.PopupMenu2Popup(Sender: TObject);
begin
if ListBox1.Items.Count=0 then
begin
Hatalarsil1.Enabled:=false;
BenchmarkSil1.Enabled:=false;
emizle1.Enabled:=false;
end
else
begin
Hatalarsil1.Enabled:=true;
BenchmarkSil1.Enabled:=true;
emizle1.Enabled:=true;
end;
if ListBox1.ItemIndex=-1 then HatalSatraGit1.Enabled:=false else HatalSatraGit1.Enabled:=true;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
DugmeTiknaninca1.Caption:=form2.komutlistesi('Dugme')+' '+form2.komutlistesi('Tiklaninca');
FormYuklenince1.Caption:=form2.komutlistesi('Form')+' '+form2.komutlistesi('Yuklenince');
EgerDegilse1.Caption:=form2.komutlistesi('Eger')+' '+form2.komutlistesi('Egerbitti');
Donder1.Caption:=form2.komutlistesi('Donder')+' '+form2.komutlistesi('Donderbitti');
WhileRepeat1.Caption:=form2.komutlistesi('iken')+' '+form2.komutlistesi('ikenbitti');
end;

procedure TForm5.FormCreate(Sender: TObject);
var
  Settings: TStringList;
begin
  fCurrentLine := -1;
  fDebugger := TSampleDebugger.Create;
  with fDebugger do begin
    OnBreakpointChange := DebuggerBreakpointChange;
    OnCurrentLineChange := DebuggerCurrentLineChange;
    OnStateChange := DebuggerStateChange;
    OnYield := DebuggerYield;
  end;

  TDebugSupportPlugin.Create(Self);

  Settings := TStringList.Create;
  try
    SynVBSyn1.EnumUserSettings(Settings);
    if Settings.Count > 0 then
      SynVBSyn1.UseUserSettings(Settings.Count - 1);
  finally
    Settings.Free;
  end;
//  RichEdit1.Text := SampleSource;

renkli:=true;
Application.OnIdle:= ApplicationEvents1Idle;
  LookupList := TStringList.Create;
  ototam1 := TStringList.Create;
  ototam2 := TStringList.Create;
  LookupList.Add('TESTFUNCTION');
  LookupList.Add('MAX');
  LookupList.Add('MIN');
  SynCompletionProposal1.EndOfTokenChr := '';
  with ototam1 do
  begin
    Clear;
    Add('Create()');
    Add('Destroy');
    Add('Add()');
    Add('ClearLine');
    Add('Delete');
    Add('First');
    Add('GetMarksForLine');
    Add('Insert()');
    Add('Last');
    Add('Place()');
    Add('Remove()');
    Add('WMCaptureChanged()');
    Add('WMCopy()');
    Add('WMCut()');
    Add('WMDropFiles()');
    Add('WMEraseBkgnd()');
    Add('WMGetDlgCode()');
    Add('WMHScroll()');
    Add('WMPaste()');
  end;

  with ototam2 do
  begin
    Clear;
    Add('constructor \column{}\style{+B}Create\style{-B}(AOwner: TCustomSynEdit)');
    Add('destructor \column{}\style{+B}Destroy\style{-B}');
    Add('function \column{}\style{+B}Add\style{-B}(Item: TSynEditMark): Integer');
    Add('procedure \column{}\style{+B}ClearLine\style{-B}(line: integer)');
    Add('procedure \column{}\style{+B}Delete\style{-B}(Index: Integer)');
    Add('function \column{}\style{+B}First\style{-B}: TSynEditMark');
    Add('procedure \column{}\style{+B}GetMarksForLine\style{-B}(line: integer; var Marks: TSynEditMarks)');
    Add('procedure \column{}\style{+B}Insert\style{-B}(Index: Integer; Item: TSynEditMark)');
    Add('function \column{}\style{+B}Last\style{-B}: TSynEditMark');
    Add('procedure \column{}\style{+B}Place\style{-B}(mark: TSynEditMark)');
    Add('function \column{}\style{+B}Remove\style{-B}(Item: TSynEditMark): Integer');
    Add('procedure \column{}\style{+B}WMCaptureChanged\style{-B}(var Msg: TMessage); message WM_CAPTURECHANGED');
    Add('procedure \column{}\style{+B}WMCopy\style{-B}(var Message: TMessage); message WM_COPY');
    Add('procedure \column{}\style{+B}WMCut\style{-B}(var Message: TMessage); message WM_CUT');
    Add('procedure \column{}\style{+B}WMDropFiles\style{-B}(var Msg: TMessage); message WM_DROPFILES');
    Add('procedure \column{}\style{+B}WMEraseBkgnd\style{-B}(var Msg: TMessage); message WM_ERASEBKGND');
    Add('procedure \column{}\style{+B}WMGetDlgCode\style{-B}(var Msg: TWMGetDlgCode); message WM_GETDLGCODE');
    Add('procedure \column{}\style{+B}WMHScroll\style{-B}(var Msg: TWMScroll); message WM_HSCROLL');
    Add('procedure \column{}\style{+B}WMPaste\style{-B}(var Message: TMessage); message WM_PASTE');
  end;
  scpDemo.InsertList.AddStrings(ototam1);
  scpDemo.ItemList.AddStrings(ototam2);
end;

procedure TForm5.KodTamamla1Click(Sender: TObject);
begin
scpDemo.ActivateCompletion
end;

procedure TForm5.HatalSatraGit1Click(Sender: TObject);
begin
ListBox1DblClick(self);
end;

procedure TForm5.FormActivate(Sender: TObject);
begin
aktifpencere:=false;
form2.ToolButton5.ImageIndex:=3;
if form2.rke1.Checked then ararakam:=0 else ararakam:=1000;
form2.ToolButton5.Hint:=loadstr(ararakam+50);
if PageControl1.ActivePageIndex=0 then
 if  form5.RichEdit1.enabled then RichEdit1.SetFocus;
end;


procedure TForm5.KodPenceresi1Click(Sender: TObject);
begin
form5.PageControl1.ActivePageIndex:=0;
if  form5.RichEdit1.enabled then form5.RichEdit1.SetFocus;
end;

procedure TForm5.Hatalarsil1Click(Sender: TObject);
var i:integer;satir:string;
begin
        for i:=ListBox1.Items.Count-1 downto 0 do begin
        satir:=ListBox1.Items[i];
        if form2.mid(satir,1,form2.bul(satir,':')-1)='Benchmark' then continue;
        ListBox1.Items.Delete(i);
        end;
end;

procedure TForm5.BenchmarkSil1Click(Sender: TObject);
var i:integer;satir:string;
begin
        for i:=ListBox1.Items.Count-1 downto 0 do begin
        satir:=ListBox1.Items[i];
        if form2.mid(satir,1,form2.bul(satir,':')-1)='Benchmark' then ListBox1.Items.Delete(i);
        end;
end;

procedure TForm5.ListBox1DblClick(Sender: TObject);     //hata penceresi
var a:integer;satir:string;
begin
if (ListBox1.Itemindex<>-1) then begin
satir:=ListBox1.Items[ListBox1.Itemindex];
if form2.mid(satir,1,form2.bul(satir,':')-1)='Benchmark' then exit;
a:=strtoint(form2.mid(satir,1,form2.bul(satir,':')-1));
RichEdit1.CaretX:= 0;
RichEdit1.CaretY:= a;
form5.PageControl1.ActivePageIndex:=0;
if  form5.RichEdit1.enabled then form5.RichEdit1.SetFocus;
end;
end;

procedure TForm5.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var satir:string;
begin
  With ( Control As TListBox ).Canvas Do
  Begin
   satir:=( Control As TListBox).Items[Index];
   if form2.mid(satir,1,form2.bul(satir,':')-1)='Benchmark' then
      begin
        Font.Color  := clWhite;
        Brush.Color := clNavy;
      End else
      Begin
        Font.Color  := clwhite;
        Brush.Color := clred;
      End;
    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, ( Control As TListBox).Items[Index]);
  End;
end;

procedure TForm5.Ekle1Click(Sender: TObject);
var sat:string;
begin
if Length(trim(RichEdit1.LineText))=0 then exit;
  fDebugger.ToggleBreakpoint(RichEdit1.CaretY);
{if Length(RichEdit1.Lines.Text)=0 then exit;
 RichEdit1.Lines[RichEdit1.CaretY]:=RichEdit1.Lines[RichEdit1.CaretY]+'-'; //basit çözüm
 sat:=RichEdit1.Lines[RichEdit1.CaretY];
 Delete(sat,length(sat),1);
 RichEdit1.Lines[RichEdit1.CaretY]:=sat;
 if (form16.ListView1.FindCaption(-1,inttostr(RichEdit1.CaretY+1),false,false,false)=NIL) then
     begin
        listitem:=form16.ListView1.items.add;
        ListItem.Caption:=inttostr(RichEdit1.CaretY+1);
        listitem.SubItems.Text:=('-');
     end
     else
     begin
        listitem:=form16.ListView1.FindCaption(-1,inttostr(RichEdit1.CaretY+1),false,false,false);
        form16.ListView1.Items.Delete(ListItem.Index);
     end;}
end;

procedure TForm5.Edit1Click(Sender: TObject);
begin
form16.show;
end;

procedure TForm5.mnSil1Click(Sender: TObject);
var i:integer;
    sat:string;
begin
if RichEdit1.Lines.Count<1 then exit;
Screen.Cursor:=crHourGlass;

form2.StatusBar1.Visible:=false;
form2.Panel1.Visible:=true;
form2.ProgressBar1.Position:=1;
form2.ProgressBar1.Max:=RichEdit1.Lines.Count;

Form16.ListView1.Items.Clear;
    for i:=0 to RichEdit1.Lines.Count-1 do begin
    form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1;
      if (form16.ListView1.FindCaption(-1,inttostr(i+1),false,false,false)=NIL) then
       begin
        form5.RichEdit1.Lines[i]:=form5.RichEdit1.Lines[i]+'-'; //basit çözüm
        sat:=form5.RichEdit1.Lines[i];
        Delete(sat,length(sat),1);
        form5.RichEdit1.Lines[i]:=sat;
        end;
    end;

form2.StatusBar1.Visible:=true;
form2.Panel1.Visible:=false;
Screen.Cursor:=crDefault;

  fDebugger.ClearAllBreakpoints;
end;

procedure TForm5.aciklama;
var
 i:integer;
 kull,sonuc:string;
begin
 i:=-1;
 if form3.CheckBox11.Checked=false then exit; //yardým çýkmasýn

 StatusBar1.SimplePanel:=false;
 if (length(RichEdit1.Lines.Text)=0) then exit;
 if (length(RichEdit1.WordAtCursor)=0) then exit;
 sonuc:=RichEdit1.WordAtCursor;
 form9.ValueListEditor1.FindRow(lowercase(sonuc),i);
 if i=-1 then
   begin
    for i:=1 to form9.ValueListEditor1.RowCount-1 do
     begin
      if lowercase(sonuc)=lowercase(form9.ValueListEditor1.Cells[1,i]) then
       break;
     end;
   end;
            if form2.rke1.Checked then
                if Referans_degerleri[i,2]='' then kull:='' else kull:=Referans_degerleri[i,2]
            else
                if Referans_degerleri[i,3]='' then kull:='' else kull:=Referans_degerleri[i,3];
if kull<>'' then
 begin
  StatusBar1.SimpleText:=kull;
  StatusBar1.SimplePanel:=true;
 end;
end;

procedure TForm5.RichEdit1KeyPress(Sender: TObject; var Key: Char);
begin
// if (key='.') then begin        ototamam:=true; end;
end;

procedure TForm5.RichEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//if ototamam then begin RichEdit1.Completion.DropDown(cmIdentifers,true); ototamam:=false; end;
end;

procedure TForm5.RichEdit1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
aciklama;
end;

procedure TForm5.SynEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  aciklama;
end;

procedure TForm5.DoSearchReplaceText(AReplace, ABackwards: boolean);
var
  Options: TSynSearchOptions;
begin
  Statusbar1.SimpleText := '';
  if AReplace then
    Options := [ssoPrompt, ssoReplace, ssoReplaceAll]
  else
    Options := [];
  if ABackwards then
    Include(Options, ssoBackwards);
  if gbSearchCaseSensitive then
    Include(Options, ssoMatchCase);
  if not fSearchFromCaret then
    Include(Options, ssoEntireScope);
  if gbSearchSelectionOnly then
    Include(Options, ssoSelectedOnly);
  if gbSearchWholeWords then
    Include(Options, ssoWholeWord);

//  if gbSearchRegex then     RichEdit1.SearchEngine := SynEditRegexSearch  else    RichEdit1.SearchEngine := SynEditSearch;

  if RichEdit1.SearchReplace(gsSearchText, gsReplaceText, Options) = 0 then
  begin
    MessageBeep(MB_ICONASTERISK);
    Statusbar1.SimpleText := STextNotFound;
    if ssoBackwards in Options then
      RichEdit1.BlockEnd := RichEdit1.BlockBegin
    else
      RichEdit1.BlockBegin := RichEdit1.BlockEnd;
    RichEdit1.CaretXY := RichEdit1.BlockBegin;
  end;

  if ConfirmReplaceDialog <> nil then
    ConfirmReplaceDialog.Free;
end;

procedure TForm5.PaintGutterGlyphs(ACanvas: TCanvas; AClip: TRect;
  FirstLine, LastLine: integer);
var
  LH, X, Y: integer;
  LI: TDebuggerLineInfos;
  ImgIndex: integer;
begin
  if fDebugger <> nil then
  begin
    FirstLine := RichEdit1.RowToLine(FirstLine);
    LastLine := RichEdit1.RowToLine(LastLine);
    X := 14;
    LH := RichEdit1.LineHeight;
    while FirstLine <= LastLine do
    begin
      Y := (LH - imglGutterGlyphs.Height) div 2
           + LH * (RichEdit1.LineToRow(FirstLine) - RichEdit1.TopLine);
      LI := fDebugger.GetLineInfos(FirstLine);
      if dlCurrentLine in LI then begin
        if dlBreakpointLine in LI then
          ImgIndex := 2
        else
          ImgIndex := 1;
      end else if dlExecutableLine in LI then begin
        if dlBreakpointLine in LI then
          ImgIndex := 3
        else
          ImgIndex := 0;
      end else begin
        if dlBreakpointLine in LI then
          ImgIndex := 3          //4 idi
        else
          ImgIndex := -1;
      end;
      if ImgIndex >= 0 then
        imglGutterGlyphs.Draw(ACanvas, X, Y, ImgIndex);
      Inc(FirstLine);
    end;
  end;
end;

procedure TForm5.SetCurrentLine(ALine: integer);
begin
 if fCurrentLine <> ALine then begin
    RichEdit1.InvalidateLine(fCurrentLine);
    fCurrentLine := ALine;
    if (fCurrentLine > 0) and (RichEdit1.CaretY <> fCurrentLine) then
//      RichEdit1.CaretXY := Point(1, fCurrentLine);
    RichEdit1.InvalidateLine(fCurrentLine);
  end;
end;

procedure TForm5.ShowSearchReplaceDialog(AReplace: boolean);
var
  dlg: TTextSearchDialog;
begin
  Statusbar1.SimpleText := '';
  if AReplace then
    dlg := TTextReplaceDialog.Create(Self)
  else
    dlg := TTextSearchDialog.Create(Self);
  with dlg do try
    // assign search options
    SearchBackwards := gbSearchBackwards;
    SearchCaseSensitive := gbSearchCaseSensitive;
    SearchFromCursor := gbSearchFromCaret;
    SearchInSelectionOnly := gbSearchSelectionOnly;
    // start with last search text
    if RichEdit1.SelText<>'' then
     SearchText:=RichEdit1.SelText
    else
     SearchText := gsSearchText;
    if gbSearchTextAtCaret then begin
      // if something is selected search for that text
      if RichEdit1.SelAvail and (RichEdit1.BlockBegin.Line = RichEdit1.BlockEnd.Line)
      then
        SearchText := RichEdit1.SelText
      else
        SearchText := RichEdit1.GetWordAtRowCol(RichEdit1.CaretXY);
    end;
    SearchTextHistory := gsSearchTextHistory;
    if AReplace then with dlg as TTextReplaceDialog do begin
      ReplaceText := gsReplaceText;
      ReplaceTextHistory := gsReplaceTextHistory;
    end;
    SearchWholeWords := gbSearchWholeWords;
    if ShowModal = mrOK then begin
      gbSearchBackwards := SearchBackwards;
      gbSearchCaseSensitive := SearchCaseSensitive;
      gbSearchFromCaret := SearchFromCursor;
      gbSearchSelectionOnly := SearchInSelectionOnly;
      gbSearchWholeWords := SearchWholeWords;
     // gbSearchRegex := SearchRegularExpression;
      gsSearchText := SearchText;
      gsSearchTextHistory := SearchTextHistory;
      if AReplace then with dlg as TTextReplaceDialog do begin
        gsReplaceText := ReplaceText;
        gsReplaceTextHistory := ReplaceTextHistory;
      end;
      fSearchFromCaret := gbSearchFromCaret;
      if gsSearchText <> '' then begin
        DoSearchReplaceText(AReplace, gbSearchBackwards);
        fSearchFromCaret := TRUE;
      end;
    end;
  finally
    dlg.Free;
  end;
end;

procedure TForm5.RichEdit1ReplaceText(Sender: TObject; const ASearch,
  AReplace: String; Line, Column: Integer; var Action: TSynReplaceAction);
var
  APos: TPoint;
  EditRect: TRect;
begin
  if ASearch = AReplace then
    Action := raSkip
  else begin
    APos := RichEdit1.ClientToScreen(
      RichEdit1.RowColumnToPixels(
      RichEdit1.BufferToDisplayPos(
        BufferCoord(Column, Line) ) ) );
    EditRect := ClientRect;
    EditRect.TopLeft := ClientToScreen(EditRect.TopLeft);
    EditRect.BottomRight := ClientToScreen(EditRect.BottomRight);

    if ConfirmReplaceDialog = nil then
      ConfirmReplaceDialog := TConfirmReplaceDialog.Create(Application);
    ConfirmReplaceDialog.PrepareShow(EditRect, APos.X, APos.Y,
      APos.Y + RichEdit1.LineHeight, ASearch);
    case ConfirmReplaceDialog.ShowModal of
      mrYes: Action := raReplace;
      mrYesToAll: Action := raReplaceAll;
      mrNo: Action := raSkip;
      else Action := raCancel;
    end;
  end;
end;

procedure TForm5.Deitir1Click(Sender: TObject);
begin
  ShowSearchReplaceDialog(TRUE);
end;

procedure TForm5.leriBul1Click(Sender: TObject);
begin
  DoSearchReplaceText(FALSE, FALSE);
end;

procedure TForm5.GeriBul1Click(Sender: TObject);
begin
  DoSearchReplaceText(FALSE, truE);
end;

procedure TForm5.RichEdit1GutterClick(Sender: TObject;
  Button: TMouseButton; X, Y, Line: Integer; Mark: TSynEditMark);
begin
  if fDebugger <> nil then
    fDebugger.ToggleBreakpoint(RichEdit1.RowToLine(Line));   
end;

procedure TForm5.FormDestroy(Sender: TObject);
begin
  LookupList.Free;
  ototam1.Free;
  ototam2.Free;
end;

procedure TForm5.SynCompletionProposal1Execute(Kind: SynCompletionType;
  Sender: TObject; var CurrentInput: String; var x, y: Integer;
  var CanExecute: Boolean);
var locline, lookup: String;
    TmpX, savepos, StartX,
    ParenCounter,
    TmpLocation    : Integer;
    FoundMatch     : Boolean;
begin
  with TSynCompletionProposal(Sender).Editor do
  begin
    locLine := LineText;

    //go back from the cursor and find the first open paren
    TmpX := CaretX;
    if TmpX > length(locLine) then
      TmpX := length(locLine)
    else dec(TmpX);
    FoundMatch := False;
    TmpLocation := 0;
    while (TmpX > 0) and not(FoundMatch) do
    begin
      if LocLine[TmpX] = ',' then
      begin
        inc(TmpLocation);
        dec(TmpX);
      end else if LocLine[TmpX] = ')' then
      begin
        //We found a close, go till it's opening paren
        ParenCounter := 1;
        dec(TmpX);
        while (TmpX > 0) and (ParenCounter > 0) do
        begin
          if LocLine[TmpX] = ')' then inc(ParenCounter)
          else if LocLine[TmpX] = '(' then dec(ParenCounter);
          dec(TmpX);
        end;
        if TmpX > 0 then dec(TmpX);  //eat the open paren
      end else if locLine[TmpX] = '(' then
      begin
        //we have a valid open paren, lets see what the word before it is
        StartX := TmpX;
        while (TmpX > 0) and not(locLine[TmpX] in TSynValidStringChars) do
          Dec(TmpX);
        if TmpX > 0 then
        begin
          SavePos := TmpX;
          While (TmpX > 0) and (locLine[TmpX] in TSynValidStringChars) do
            dec(TmpX);
          inc(TmpX);
          lookup := Uppercase(Copy(LocLine, TmpX, SavePos - TmpX + 1));
          FoundMatch := LookupList.IndexOf(Lookup) > -1;
          if not(FoundMatch) then
          begin
            TmpX := StartX;
            dec(TmpX);
          end;
        end;
      end else dec(TmpX)
    end;
  end;

  CanExecute := FoundMatch;

  if CanExecute then
  begin
    TSynCompletionProposal(Sender).Form.CurrentIndex := TmpLocation;
    if Lookup <> TSynCompletionProposal(Sender).PreviousToken then
    begin
      TSynCompletionProposal(Sender).ItemList.Clear;

      if Lookup = 'TESTFUNCTION' then
      begin
        TSynCompletionProposal(Sender).ItemList.Add('"FirstParam: integer", "SecondParam: integer", "ThirdParam: string"');
      end else if Lookup = 'MIN' then
      begin
        TSynCompletionProposal(Sender).ItemList.Add('"A: integer", "B: integer"');
      end else if Lookup = 'MAX' then
      begin
        TSynCompletionProposal(Sender).ItemList.Add('"A: integer", "B: integer"');
      end;
    end;
  end else TSynCompletionProposal(Sender).ItemList.Clear;
end;

procedure TForm5.DebuggerBreakpointChange(Sender: TObject; ALine: integer);
begin
  if (ALine >= 1) and (ALine <= RichEdit1.Lines.Count) then
  begin
    RichEdit1.InvalidateGutterLine(ALine);
    RichEdit1.InvalidateLine(ALine);
  end
  else
    RichEdit1.Invalidate;
end;

procedure TForm5.DebuggerCurrentLineChange(Sender: TObject);
begin
  if (fDebugger <> nil) and not fDebugger.IsRunning then
    SetCurrentLine(fDebugger.CurrentLine)
  else
    SetCurrentLine(-1);
end;

procedure TForm5.DebuggerStateChange(Sender: TObject; OldState,
  NewState: TDebuggerState);
var
  s: string;
begin
  case NewState of
    dsRunning: s := 'Program is running';
    dsPaused: s := 'Program is paused';
  else
    s := 'Ready';
  end;
  Statusbar1.SimpleText := ' ' + s;
end;

procedure TForm5.DebuggerYield(Sender: TObject);
begin
  UpdateActions;
  Application.ProcessMessages;
end;

procedure TForm5.RichEdit1SpecialLineColors(Sender: TObject; Line: Integer;
  var Special: Boolean; var FG, BG: TColor);
var
  LI: TDebuggerLineInfos;
begin
  if fDebugger <> nil then begin
    LI := fDebugger.GetLineInfos(Line);
    if dlCurrentLine in LI then begin
      Special := TRUE;
      FG := clWhite;
      BG := clBlue;
    end else if dlBreakpointLine in LI then begin
      Special := TRUE;
      FG := clWhite;
      if dlExecutableLine in LI then
        BG := clRed
      else
        BG := clGray;
    end;
  end;
end;

procedure TDebugSupportPlugin.LinesDeleted(FirstLine, Count: integer);
begin
  inherited;

end;

procedure TDebugSupportPlugin.LinesInserted(FirstLine, Count: integer);
begin
  inherited;

end;

end.
