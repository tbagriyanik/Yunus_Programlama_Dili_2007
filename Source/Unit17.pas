unit Unit17;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm17 = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;
  tamamTusu2:boolean;
implementation

{$R *.dfm}

procedure TForm17.Button2Click(Sender: TObject);
begin
close
end;

procedure TForm17.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key = #27 then close;
     if key = #13 then Button1Click(self);
end;

procedure TForm17.Button1Click(Sender: TObject);
begin
tamamTusu2:=true;
close;
end;

procedure TForm17.FormShow(Sender: TObject);
begin
tamamTusu2:=false;
form17.LabeledEdit1.SetFocus;
end;

procedure TForm17.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_ESCAPE then close;

end;

end.
