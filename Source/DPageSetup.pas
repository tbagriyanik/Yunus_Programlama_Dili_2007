unit DPageSetup;

{$I SynEdit.inc}

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, ToolWin, ImgList, ActnList, Dialogs,
  SynEditPrintTypes, SynEditPrint, SynEditPrintMargins,
  SynEditPrintHeaderFooter;

type
  TPageSetupDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    PageControl: TPageControl;
    Margins: TTabSheet;
    HeaderFooter: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    CBMirrorMargins: TCheckBox;
    EditLeft: TEdit;
    EditRight: TEdit;
    EditTop: TEdit;
    EditBottom: TEdit;
    EditGutter: TEdit;
    EditHeader: TEdit;
    EditFooter: TEdit;
    EditHFInternalMargin: TEdit;
    EditLeftHFTextIndent: TEdit;
    EditRightHFTextIndent: TEdit;
    CBUnits: TComboBox;
    GroupBox1: TGroupBox;
    REHeaderLeft: TRichEdit;
    REHeaderCenter: TRichEdit;
    REHeaderRight: TRichEdit;
    CBHeaderMirror: TCheckBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    GroupBox2: TGroupBox;
    CBHeaderLine: TCheckBox;
    CBHeaderBox: TCheckBox;
    CBHeaderShadow: TCheckBox;
    HeaderLineColorBtn: TButton;
    HeaderShadowColorBtn: TButton;
    PBHeaderLine: TPaintBox;
    PBHeaderShadow: TPaintBox;
    GroupBox3: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    REFooterLeft: TRichEdit;
    REFooterCenter: TRichEdit;
    REFooterRight: TRichEdit;
    CBFooterMirror: TCheckBox;
    GroupBox4: TGroupBox;
    PBFooterLine: TPaintBox;
    PBFooterShadow: TPaintBox;
    CBFooterLine: TCheckBox;
    CBFooterBox: TCheckBox;
    CBFooterShadow: TCheckBox;
    FooterLineColorBtn: TButton;
    FooterShadowColorBtn: TButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    PageNumCmd: TAction;
    PagesCmd: TAction;
    TimeCmd: TAction;
    DateCmd: TAction;
    FontCmd: TAction;
    BoldCmd: TAction;
    ItalicCmd: TAction;
    UnderlineCmd: TAction;
    CBLineNumbers: TCheckBox;
    CBLineNumbersInMargin: TCheckBox;
    CBHighlight: TCheckBox;
    CBColors: TCheckBox;
    CBWrap: TCheckBox;
    FontDialog: TFontDialog;
    TitleCmd: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton6: TToolButton;
    ToolButton10: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    Image2: TImage;
    Image1: TImage;
    procedure PageNumCmdExecute(Sender: TObject);
    procedure PagesCmdExecute(Sender: TObject);
    procedure TimeCmdExecute(Sender: TObject);
    procedure DateCmdExecute(Sender: TObject);
    procedure FontCmdExecute(Sender: TObject);
    procedure BoldCmdExecute(Sender: TObject);
    procedure ItalicCmdExecute(Sender: TObject);
    procedure UnderlineCmdExecute(Sender: TObject);
    procedure REHeaderLeftEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBFooterLineEnter(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure HeaderLineColorBtnClick(Sender: TObject);
    procedure PBHeaderLinePaint(Sender: TObject);
    procedure HeaderShadowColorBtnClick(Sender: TObject);
    procedure FooterLineColorBtnClick(Sender: TObject);
    procedure FooterShadowColorBtnClick(Sender: TObject);
    procedure REHeaderLeftSelectionChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CBUnitsChange(Sender: TObject);
    procedure TitleCmdExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Editor: TRichEdit;
    CharPos: TPoint;
    OldStart: Integer;
    FMargins: TSynEditPrintMargins;
    FInternalCall: Boolean;
    procedure SetOptions;
    procedure UpdateCursorPos;
    procedure SelectLine(LineNum: Integer);
    function CurrText: TTextAttributes;
    procedure SetMargins(SynEditMargins: TSynEditPrintMargins);
    procedure GetMargins(SynEditMargins: TSynEditPrintMargins);
    procedure SelectNone;
  public
    { Public declarations }
    procedure SetValues(SynEditPrint: TSynEditPrint);
    procedure GetValues(SynEditPrint: TSynEditPrint);
    procedure AddLines(HeadFoot: THeaderFooter; AEdit: TRichEdit;
      Al: TALignment);
  end;

var
  PageSetupDlg: TPageSetupDlg;

implementation

uses
  RichEdit, ShellAPI, Messages, Unit3, Unit2;

{$R *.DFM}

procedure TPageSetupDlg.FormCreate(Sender: TObject);
begin
  FMargins := TSynEditPrintMargins.Create;
  FInternalCall := False;
end;

procedure TPageSetupDlg.FormDestroy(Sender: TObject);
begin
  FMargins.Free;
end;

procedure TPageSetupDlg.FormShow(Sender: TObject);
begin
  Editor := REHeaderLeft;
  PageControl.ActivePage := Margins;
  SetOptions;
  UpdateCursorPos;
  image2.Visible:=form2.rke1.Checked;
  image1.Visible:=not(form2.rke1.Checked);
end;

procedure TPageSetupDlg.SetOptions;
begin
  PageNumCmd.Enabled := Editor.Focused;
  PagesCmd.Enabled := Editor.Focused;
  TimeCmd.Enabled := Editor.Focused;
  DateCmd.Enabled := Editor.Focused;
  TitleCmd.Enabled := Editor.Focused;
  FontCmd.Enabled := false;//Editor.Focused;
  BoldCmd.Enabled := false;//Editor.Focused;
  ItalicCmd.Enabled := false;//Editor.Focused;
  UnderlineCmd.Enabled := false;//Editor.Focused;
end;

procedure TPageSetupDlg.REHeaderLeftEnter(Sender: TObject);
begin
  Editor := Sender as TRichEdit;
  SetOptions;
end;

procedure TPageSetupDlg.CBFooterLineEnter(Sender: TObject);
begin
  SetOptions;
end;

procedure TPageSetupDlg.REHeaderLeftSelectionChange(Sender: TObject);
begin
  UpdateCursorPos;
end;

procedure TPageSetupDlg.UpdateCursorPos;
begin
  CharPos.Y := SendMessage(Editor.Handle, EM_EXLINEFROMCHAR, 0, Editor.SelStart);
  CharPos.X := (Editor.SelStart - SendMessage(Editor.Handle, EM_LINEINDEX, CharPos.Y, 0));
end;

procedure TPageSetupDlg.SelectLine(LineNum: Integer);
begin
  OldStart := Editor.SelStart;
  Editor.SelStart := SendMessage(Editor.Handle, EM_LINEINDEX, LineNum, 0);
  Editor.SelLength := Length(Editor.Lines[LineNum]);
end;

procedure TPageSetupDlg.SelectNone;
begin
  Editor.SelStart := OldStart;
  Editor.SelLength := 0;
end;

function TPageSetupDlg.CurrText: TTextAttributes;
begin
  Result := Editor.SelAttributes;
end;

procedure TPageSetupDlg.PageNumCmdExecute(Sender: TObject);
begin
  Editor.SelText := '$PAGENUM$';
end;

procedure TPageSetupDlg.PagesCmdExecute(Sender: TObject);
begin
  Editor.SelText := '$PAGECOUNT$';
end;

procedure TPageSetupDlg.TimeCmdExecute(Sender: TObject);
begin
  Editor.SelText := '$TIME$';
end;

procedure TPageSetupDlg.DateCmdExecute(Sender: TObject);
begin
  Editor.SelText := '$DATE$';
end;

procedure TPageSetupDlg.TitleCmdExecute(Sender: TObject);
begin
  Editor.SelText := '$TITLE$';
end;

procedure TPageSetupDlg.FontCmdExecute(Sender: TObject);
begin
  SelectLine(CharPos.y);
  FontDialog.Font.Assign(CurrText);
  if FontDialog.Execute then
    CurrText.Assign(FontDialog.Font);
  SelectNone;
end;

procedure TPageSetupDlg.BoldCmdExecute(Sender: TObject);
begin
  SelectLine(CharPos.y);
  if fsBold in CurrText.Style then
    CurrText.Style := CurrText.Style - [fsBold]
  else
    CurrText.Style := CurrText.Style + [fsBold];
  SelectNone;
end;

procedure TPageSetupDlg.ItalicCmdExecute(Sender: TObject);
begin
  SelectLine(CharPos.y);
  if fsItalic in CurrText.Style then
    CurrText.Style := CurrText.Style - [fsItalic]
  else
    CurrText.Style := CurrText.Style + [fsItalic];
  SelectNone;
end;

procedure TPageSetupDlg.UnderlineCmdExecute(Sender: TObject);
begin
  SelectLine(CharPos.y);
  if fsUnderLine in CurrText.Style then
    CurrText.Style := CurrText.Style - [fsUnderLine]
  else
    CurrText.Style := CurrText.Style + [fsUnderLine];
  SelectNone;
end;

procedure TPageSetupDlg.PageControlChange(Sender: TObject);
begin
  if PageControl.ActivePage = HeaderFooter then
    SetOptions;
end;

procedure TPageSetupDlg.PBHeaderLinePaint(Sender: TObject);
begin
  with (Sender as TPaintBox).Canvas do begin
    Brush.Color := (Sender as TPaintBox).Color;
    FillRect((Sender as TPaintBox).ClientRect);
    Pen.Style := psDot;
    Brush.Style := bsClear;
    Rectangle(0, 0, (Sender as TPaintBox).Width, (Sender as TPaintBox).Height);
  end;
end;

procedure TPageSetupDlg.HeaderLineColorBtnClick(Sender: TObject);
begin
  form3.ColorDialog1.Color := PBHeaderLine.Color;
  if form3.ColorDialog1.Execute then
    PBHeaderLine.Color := form3.ColorDialog1.Color;
end;

procedure TPageSetupDlg.HeaderShadowColorBtnClick(Sender: TObject);
begin
  form3.ColorDialog1.Color := PBHeaderShadow.Color;
  if form3.ColorDialog1.Execute then
    PBHeaderShadow.Color := form3.ColorDialog1.Color;
end;

procedure TPageSetupDlg.FooterLineColorBtnClick(Sender: TObject);
begin
  form3.ColorDialog1.Color := PBFooterLine.Color;
  if form3.ColorDialog1.Execute then
    PBFooterLine.Color := form3.ColorDialog1.Color;
end;

procedure TPageSetupDlg.FooterShadowColorBtnClick(Sender: TObject);
begin
  form3.ColorDialog1.Color := PBFooterShadow.Color;
  if form3.ColorDialog1.Execute then
    PBFooterShadow.Color := form3.ColorDialog1.Color;
end;

procedure TPageSetupDlg.GetMargins(SynEditMargins: TSynEditPrintMargins);
var
  CurEdit: TEdit;
  function StringToFloat(Edit: TEdit): Double;
  begin
    CurEdit := Edit;
    Result := StrToFloat(Edit.Text);
  end;
begin
  with SynEditMargins do begin
    if not FInternalCall then
      UnitSystem := TUnitSystem(CBUnits.ItemIndex);
    try
      Left := StringToFloat(EditLeft);
      Right := StringToFloat(EditRight);
      Top := StringToFloat(EditTop);
      Bottom := StringToFloat(EditBottom);
      Gutter := StringToFloat(EditGutter);
      Header := StringToFloat(EditHeader);
      Footer := StringToFloat(EditFooter);
      LeftHFTextIndent := StringToFloat(EditLeftHFTextIndent);
      RightHFTextIndent := StringToFloat(EditRightHFTextIndent);
      HFInternalMargin := StringToFloat(EditHFInternalMargin);
    except
      MessageDlg('Invalid number!', mtError, [mbOk], 0);
      CurEdit.SetFocus;
    end;
    MirrorMargins := CBMirrorMargins.Checked;
  end;
end;

procedure TPageSetupDlg.SetMargins(SynEditMargins: TSynEditPrintMargins);
begin
  with SynEditMargins do begin
    CBUnits.ItemIndex := Ord(UnitSystem);
    EditLeft.Text := FloatToStr(Left);
    EditRight.Text := FloatToStr(Right);
    EditTop.Text := FloatToStr(Top);
    EditBottom.Text := FloatToStr(Bottom);
    EditGutter.Text := FloatToStr(Gutter);
    EditHeader.Text := FloatToStr(Header);
    EditFooter.Text := FloatToStr(Footer);
    EditLeftHFTextIndent.Text := FloatToStr(LeftHFTextIndent);
    EditRightHFTextIndent.Text := FloatToStr(RightHFTextIndent);
    EditHFInternalMargin.Text := FloatToStr(HFInternalMargin);
    CBMirrorMargins.Checked := MirrorMargins;
  end;
end;

procedure TPageSetupDlg.CBUnitsChange(Sender: TObject);
begin
  FInternalCall := True;
  GetMargins(FMargins);
  FInternalCall := False;
  FMargins.UnitSystem := TUnitSystem(CBUnits.ItemIndex);
  SetMargins(FMargins);
end;

procedure TPageSetupDlg.AddLines(HeadFoot: THeaderFooter; AEdit: TRichEdit;
  Al: TALignment);
var
  i: Integer;
  AFont: TFont;
begin
  Editor := AEdit;
  AFont := TFont.Create;
  for i := 0 to Editor.Lines.Count - 1 do begin
    SelectLine(i);
    AFont.Assign(CurrText);
    HeadFoot.Add(Editor.Lines[i], AFont, Al, i + 1);
  end;
  AFont.Free;
end;

procedure TPageSetupDlg.GetValues(SynEditPrint: TSynEditPrint);
begin
  GetMargins(SynEditPrint.Margins);
  SynEditPrint.LineNumbers := CBLineNumbers.Checked;
  SynEditPrint.LineNumbersInMargin := CBLineNumbersInMargin.Checked;
  SynEditPrint.Highlight := CBHighlight.Checked;
  SynEditPrint.Colors := CBColors.Checked;
  SynEditPrint.Wrap := CBWrap.Checked;

  SynEditPrint.Header.FrameTypes := [];
  if CBHeaderLine.Checked then
    SynEditPrint.Header.FrameTypes := SynEditPrint.Header.FrameTypes + [ftLine];
  if CBHeaderBox.Checked then
    SynEditPrint.Header.FrameTypes := SynEditPrint.Header.FrameTypes + [ftBox];
  if CBHeaderShadow.Checked then
    SynEditPrint.Header.FrameTypes := SynEditPrint.Header.FrameTypes + [ftShaded];
  SynEditPrint.Header.LineColor := PBHeaderLine.Color;
  SynEditPrint.Header.ShadedColor := PBHeaderShadow.Color;
  SynEditPrint.Header.MirrorPosition := CBHeaderMirror.Checked;

  SynEditPrint.Footer.FrameTypes := [];
  if CBFooterLine.Checked then
    SynEditPrint.Footer.FrameTypes := SynEditPrint.Footer.FrameTypes + [ftLine];
  if CBFooterBox.Checked then
    SynEditPrint.Footer.FrameTypes := SynEditPrint.Footer.FrameTypes + [ftBox];
  if CBFooterShadow.Checked then
    SynEditPrint.Footer.FrameTypes := SynEditPrint.Footer.FrameTypes + [ftShaded];
  SynEditPrint.Footer.LineColor := PBFooterLine.Color;
  SynEditPrint.Footer.ShadedColor := PBFooterShadow.Color;
  SynEditPrint.Footer.MirrorPosition := CBFooterMirror.Checked;

  SynEditPrint.Header.Clear;
  AddLines(SynEditPrint.Header, REHeaderLeft, taLeftJustify);
  AddLines(SynEditPrint.Header, REHeaderCenter, taCenter);
  AddLines(SynEditPrint.Header, REHeaderRight, taRightJustify);

  SynEditPrint.Footer.Clear;
  AddLines(SynEditPrint.Footer, REFooterLeft, taLeftJustify);
  AddLines(SynEditPrint.Footer, REFooterCenter, taCenter);
  AddLines(SynEditPrint.Footer, REFooterRight, taRightJustify);
end;

procedure TPageSetupDlg.SetValues(SynEditPrint: TSynEditPrint);
var
  i: Integer;
  AItem: THeaderFooterItem;
  LNum: Integer;
begin
  REHeaderLeft.Lines.Clear;
  REHeaderCenter.Lines.Clear;
  REHeaderRight.Lines.Clear;
  REFooterLeft.Lines.Clear;
  REFooterCenter.Lines.Clear;
  REFooterRight.Lines.Clear;
  SetMargins(SynEditPrint.Margins);
  CBLineNumbers.Checked := SynEditPrint.LineNumbers;
  CBLineNumbersInMargin.Checked := SynEditPrint.LineNumbersInMargin;
  CBHighlight.Checked := SynEditPrint.Highlight;
  CBColors.Checked := SynEditPrint.Colors;
  CBWrap.Checked := SynEditPrint.Wrap;

  REHeaderLeft.Font := SynEditPrint.Header.DefaultFont;
  REHeaderCenter.Font := SynEditPrint.Header.DefaultFont;
  REHeaderRight.Font := SynEditPrint.Header.DefaultFont;
  REFooterLeft.Font := SynEditPrint.Footer.DefaultFont;
  REFooterCenter.Font := SynEditPrint.Footer.DefaultFont;
  REFooterRight.Font := SynEditPrint.Footer.DefaultFont;

  CBHeaderLine.Checked := ftLine in SynEditPrint.Header.FrameTypes;
  CBHeaderBox.Checked := ftBox in SynEditPrint.Header.FrameTypes;
  CBHeaderShadow.Checked := ftShaded in SynEditPrint.Header.FrameTypes;
  PBHeaderLine.Color := SynEditPrint.Header.LineColor;
  PBHeaderShadow.Color := SynEditPrint.Header.ShadedColor;
  CBHeaderMirror.Checked := SynEditPrint.Header.MirrorPosition;

  CBFooterLine.Checked := ftLine in SynEditPrint.Footer.FrameTypes;
  CBFooterBox.Checked := ftBox in SynEditPrint.Footer.FrameTypes;
  CBFooterShadow.Checked := ftShaded in SynEditPrint.Footer.FrameTypes;
  PBFooterLine.Color := SynEditPrint.Footer.LineColor;
  PBFooterShadow.Color := SynEditPrint.Footer.ShadedColor;
  CBFooterMirror.Checked := SynEditPrint.Footer.MirrorPosition;

  SynEditPrint.Header.FixLines;
  for i := 0 to SynEditPrint.Header.Count - 1 do begin
    AItem := SynEditPrint.Header.Get(i);
    case AItem.Alignment of
      taLeftJustify: Editor := REHeaderLeft;
      taCenter: Editor := REHeaderCenter;
      taRightJustify: Editor := REHeaderRight;
    end;
    LNum := Editor.Lines.Add(AItem.Text);
    SelectLine(LNum);
    CurrText.Assign(AItem.Font);
    SelectNone;
  end;

  SynEditPrint.Footer.FixLines;
  for i := 0 to SynEditPrint.Footer.Count - 1 do begin
    AItem := SynEditPrint.Footer.Get(i);
    case AItem.Alignment of
      taLeftJustify: Editor := REFooterLeft;
      taCenter: Editor := REFooterCenter;
      taRightJustify: Editor := REFooterRight;
    end;
    LNum := Editor.Lines.Add(AItem.Text);
    SelectLine(LNum);
    CurrText.Assign(AItem.Font);
    SelectNone;
  end;
end;

procedure TPageSetupDlg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=VK_ESCAPE then close
end;

end.

