unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm13 = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;
  tamamTusu : boolean;
implementation

uses Unit2;

{$R *.dfm}

procedure TForm13.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key = #27 then close;
     if key = #13 then Button1Click(self);
end;

procedure TForm13.Button2Click(Sender: TObject);
begin
close;
end;

procedure TForm13.Button1Click(Sender: TObject);
begin
tamamTusu:=true;
close;
end;

procedure TForm13.FormShow(Sender: TObject);
begin
tamamTusu:=false;
LabeledEdit1.SetFocus;
end;

procedure TForm13.Button3Click(Sender: TObject);
begin
form2.sil3Click(self);
close;
end;

end.
