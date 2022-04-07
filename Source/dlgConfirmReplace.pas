unit dlgConfirmReplace;

{$I SynEdit.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TConfirmReplaceDialog = class(TForm)
    btnReplace: TButton;
    lblConfirmation: TLabel;
    btnSkip: TButton;
    btnCancel: TButton;
    btnReplaceAll: TButton;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  public
  SAskReplaceText : string;
    procedure PrepareShow(AEditorRect: TRect; X, Y1, Y2: integer;
      AReplaceText: string);
  end;

var
  ConfirmReplaceDialog: TConfirmReplaceDialog;
implementation

uses Unit2;


{$R *.DFM}

{ TConfirmReplaceDialog }

procedure TConfirmReplaceDialog.FormCreate(Sender: TObject);
begin
  Image1.Picture.Icon.Handle := LoadIcon(0, IDI_QUESTION);
end;

procedure TConfirmReplaceDialog.FormDestroy(Sender: TObject);
begin
  ConfirmReplaceDialog := nil;
end;

procedure TConfirmReplaceDialog.PrepareShow(AEditorRect: TRect;
  X, Y1, Y2: integer; AReplaceText: string);
var
  nW, nH: integer;
begin
{  ConfirmReplaceDialog.caption             := form2.Language1.TranslateUserMessage('sCaption');
  ConfirmReplaceDialog.btnReplace.Caption  := form2.Language1.TranslateUserMessage('sButton1');
  ConfirmReplaceDialog.btnSkip.Caption     := form2.Language1.TranslateUserMessage('sButton2');
  ConfirmReplaceDialog.btnCancel.Caption   := form2.Language1.TranslateUserMessage('sButton3');
  ConfirmReplaceDialog.btnReplaceAll.Caption  := form2.Language1.TranslateUserMessage('sButton4');
  SAskReplaceText     := form2.Language1.TranslateUserMessage('sasktext');
  lblConfirmation.Caption := Format(SAskReplaceText, [AReplaceText]);}
  nW := AEditorRect.Right - AEditorRect.Left;
  nH := AEditorRect.Bottom - AEditorRect.Top;

  if nW <= Width then
    X := AEditorRect.Left - (Width - nW) div 2
  else begin
    if X + Width > AEditorRect.Right then
      X := AEditorRect.Right - Width;
  end;
  if Y2 > AEditorRect.Top + MulDiv(nH, 2, 3) then
    Y2 := Y1 - Height - 4
  else
    Inc(Y2, 4);
  SetBounds(X, Y2, Width, Height);
end;

procedure TConfirmReplaceDialog.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_ESCAPE then close;

end;

end.

