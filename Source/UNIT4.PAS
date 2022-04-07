unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, jpeg, Shellapi, Gauges;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Image1: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Label5Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label5MouseLeave(Sender: TObject);
    procedure Label6MouseLeave(Sender: TObject);
    procedure Label6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit15, Unit10;

{$R *.DFM}

procedure TForm4.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_ESCAPE then close;
end;

procedure TForm4.Label5Click(Sender: TObject);
begin
ShellExecute(0, nil, 'http://yunus.sourceforge.net', nil, nil, SW_SHOWDEFAULT);
end;

procedure TForm4.Label6Click(Sender: TObject);
begin
ShellExecute(0, nil, 'mailto:tbagriyanik@mynet.com?subject=Yunus', nil, nil, SW_SHOWDEFAULT);
end;

procedure TForm4.Label5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
label5.Font.Color:=clPurple;
end;

procedure TForm4.Label5MouseLeave(Sender: TObject);
begin
label5.Font.Color:=clnavy;
end;

procedure TForm4.Label6MouseLeave(Sender: TObject);
begin
label6.Font.Color:=clnavy;
end;

procedure TForm4.Label6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
label6.Font.Color:=clPurple;
end;

procedure TForm4.FormCreate(Sender: TObject);
var
  Size, Size2: DWord;
  Pt, Pt2: Pointer;
begin
  Brush.Color:=clBlack;
  Brush.Style:=bsDiagCross; //hoþ efekt
  Size := GetFileVersionInfoSize ( PChar (ParamStr (0)), Size2);
  if Size > 0 then
  begin
    GetMem (Pt, Size);
    try
       GetFileVersionInfo (PChar (ParamStr (0)), 0, Size, Pt);
       // show the fixed information
       VerQueryValue (Pt, '\', Pt2, Size2);
       with TVSFixedFileInfo (Pt2^) do
       label4.Caption:= 'Yunus '+IntToStr (HiWord (dwFileVersionMS))
                       +'.'+IntToStr (LoWord (dwFileVersionMS));
       Application.Title := label4.Caption;
    finally
      FreeMem (Pt);
    end;
  end;
SetCurrentDir(extractfilepath(Application.exename));
end;

procedure TForm4.Image1Click(Sender: TObject);
begin
form7.timer1.Enabled :=true;
form7.timer2.Enabled :=true;
form7.ShowModal;
end;

procedure TForm4.Panel1Click(Sender: TObject);
begin
close
end;

procedure TForm4.Label4Click(Sender: TObject);
begin
close
end;

procedure TForm4.Label7Click(Sender: TObject);
begin
close
end;

procedure TForm4.FormPaint(Sender: TObject);
var
  lf : TLogFont;
  tf : TFont;
begin
  with Form4.Canvas do begin
    Brush.Color:=clCream;
    Font.Name := 'Verdana';
    Font.Size := 24;
    tf := TFont.Create;
    tf.Assign(Font);
    tf.Color:=clSilver;
    GetObject(tf.Handle, sizeof(lf), @lf);
    lf.lfQuality:=100;
    lf.lfOutPrecision:=0;
    lf.lfEscapement := 700;
    lf.lfOrientation := 400;
    tf.Handle := CreateFontIndirect(lf);
    Font.Assign(tf);
    tf.Free;
    TextOut(3, height-13   , 'Yunus');
  end;
end;

procedure TForm4.FormDblClick(Sender: TObject);
begin
form15.show
end;

end.
