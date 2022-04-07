unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, unit2;

type
  TForm8 = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  derleDurdur:boolean;
implementation

uses Unit3, Unit5;

{$R *.DFM}

procedure TForm8.Button1Click(Sender: TObject);
begin
  if (form5.PageControl1.ActivePageIndex=0)and(CheckBox1.Checked) then
     form5.PageControl1.ActivePageIndex:=1
   else begin
     form5.PageControl1.ActivePageIndex:=0;
     if  form5.RichEdit1.enabled then  form5.RichEdit1.SetFocus;
     end;
derleDurdur:=true;
close;
end;

procedure TForm8.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_ESCAPE then close;
end;

procedure TForm8.FormShow(Sender: TObject);
begin
if form2.rke1.Checked then begin
form8.Caption:=loadstr(58);
form8.Button1.Caption:=loadstr(59);
CheckBox1.Caption:=loadstr(31);
end
else
begin
form8.Caption:=loadstr(1058);
form8.Button1.Caption:=loadstr(1059);
CheckBox1.Caption:=loadstr(1031);
end;
CheckBox1.Checked:=(form5.PageControl1.ActivePageIndex=1);
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
if form3.CheckBox3.Checked=false then form2.ToolButton9Click(self);
end;

end.
