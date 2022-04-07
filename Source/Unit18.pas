unit Unit18;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, chart, StdCtrls, ExtCtrls;
Type
  Tanim = Packed Record
    x       : DWORD;
    y       : DWORD;
    Kirmizi : Word;
    Yesil   : Word;
    Mavi    : Word;
    Alfa    : Word;
  End;

type
  TForm18 = class(TForm)
    ColorBox1: TColorBox;
    ColorBox2: TColorBox;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
    RenkTanimlari : Array [0..1] Of Tanim;
    Dortgen       : GRADIENT_RECT;
  public
    { Public declarations }
  end;


var
  Form18: TForm18;

Function GradientFill(DC : hDC; pVertex : Pointer; dwNumVertex : DWORD; pMesh : Pointer; dwNumMesh, dwMode: DWORD) : DWord; stdcall; external 'msimg32.dll';

implementation

uses Unit4;

{$R *.dfm}

procedure TForm18.FormCreate(Sender: TObject);
const N=100;
var  Region : hRgn;
begin
  inherited;
  BeginPath(Canvas.Handle);
  SetBKMode(Canvas.Handle,Transparent);

  with canvas do begin
    Font.Style := [fsBold];
    Font.name := 'verdana';
    Font.Size := 60;
    TextOut(20,70,'Yunus');
    Font.Style := Font.Style-[fsbold];
    Font.Size := 8;
    //TextOut(10,130,'Freeware Visual Programming Simulation');
  end;
  EndPath(canvas.handle);
  Region := PathToRegion(Canvas.Handle);

   SetWindowRgn(Handle,Region , True);
   
  RenkTanimlari[0].x   := 1;
  RenkTanimlari[0].y   := 1;
  RenkTanimlari[0].Alfa:= $ff00;
  RenkTanimlari[1].x   := width;
  RenkTanimlari[1].y   := height;
  RenkTanimlari[1].Alfa:= $ff00;
  Dortgen.UpperLeft    := 0;
  Dortgen.LowerRight   := 1;
end;

procedure TForm18.FormPaint(Sender: TObject);
begin
  RenkTanimlari[0].Kirmizi:=GetRValue(ColorBox1.Selected) SHL 8;
  RenkTanimlari[0].Yesil  :=GetGValue(ColorBox1.Selected) SHL 8;
  RenkTanimlari[0].Mavi   :=GetBValue(ColorBox1.Selected) SHL 8;
  RenkTanimlari[1].Kirmizi:=GetRValue(ColorBox2.Selected) SHL 8;
  RenkTanimlari[1].Yesil  :=GetGValue(ColorBox2.Selected) SHL 8;
  RenkTanimlari[1].Mavi   :=GetBValue(ColorBox2.Selected) SHL 8;
GradientFill(Canvas.Handle,@RenkTanimlari[0],2,@Dortgen,1,GRADIENT_FILL_RECT_v);
end;

end.



