unit Unit15;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, Buttons, StdCtrls;

type
  TForm15 = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Timer1: TTimer;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    procedure Kapat1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
 hucre=record
  deger:integer;
  bos:boolean;
 end;

var
  Form15: TForm15;
  dizi:array[1..25] of hucre;
  sayac,b:byte;
  zaman:TTime;

implementation

uses Unit2;

{$R *.DFM}

procedure tusdoldur;
var a:integer;
begin
 repeat
  a:=random(24)+1;
  if dizi[a].bos  then
   begin
    dizi[a].bos:=false;
    dizi[a].deger:=a;
    inc(b);
    inc(sayac)
   end
   else
    tusdoldur; 
 until (sayac=25) or (b=5);
end;

function adrakam(ad:string):integer;
var gecici:string;i:integer;
begin
 for i:=length(ad) downto 0 do begin
  if ad[i] in ['0'..'9'] then
   gecici:=ad[i]+gecici; 
 end;
 adrakam:=strtoint(gecici);
end;

procedure TForm15.Kapat1Click(Sender: TObject);
begin
close
end;

function kontrol(gecici:string):integer;
var toplam:integer;
begin
        toplam:=0;
         case strtoint(gecici) of
         1:toplam:=ord(dizi[2].deger<>0)+ord(dizi[6].deger<>0)+
                   ord(dizi[7].deger<>0);
         2:toplam:=ord(dizi[1].deger<>0)+ord(dizi[6].deger<>0)+
                   ord(dizi[7].deger<>0)+ord(dizi[8].deger<>0)+
                   ord(dizi[3].deger<>0);
         3:toplam:=ord(dizi[2].deger<>0)+ord(dizi[4].deger<>0)+
                   ord(dizi[7].deger<>0)+ord(dizi[8].deger<>0)+
                   ord(dizi[9].deger<>0);
         4:toplam:=ord(dizi[3].deger<>0)+ord(dizi[5].deger<>0)+
                   ord(dizi[8].deger<>0)+ord(dizi[9].deger<>0)+
                   ord(dizi[10].deger<>0);
         5:toplam:=ord(dizi[4].deger<>0)+ord(dizi[9].deger<>0)+
                   ord(dizi[10].deger<>0);
         6:toplam:=ord(dizi[1].deger<>0)+ord(dizi[2].deger<>0)+
                   ord(dizi[7].deger<>0)+ord(dizi[11].deger<>0)+
                   ord(dizi[12].deger<>0);
         7:toplam:=ord(dizi[1].deger<>0)+ord(dizi[2].deger<>0)+
                   ord(dizi[3].deger<>0)+ord(dizi[6].deger<>0)+
                   ord(dizi[11].deger<>0)+ord(dizi[12].deger<>0)+
                   ord(dizi[13].deger<>0)+
                   ord(dizi[8].deger<>0);
         8:toplam:=ord(dizi[2].deger<>0)+ord(dizi[3].deger<>0)+
                   ord(dizi[4].deger<>0)+ord(dizi[7].deger<>0)+
                   ord(dizi[9].deger<>0)+ord(dizi[12].deger<>0)+
                   ord(dizi[13].deger<>0)+
                   ord(dizi[14].deger<>0);
         9:toplam:=ord(dizi[3].deger<>0)+ord(dizi[4].deger<>0)+
                   ord(dizi[5].deger<>0)+ord(dizi[8].deger<>0)+
                   ord(dizi[10].deger<>0)+ord(dizi[15].deger<>0)+
                   ord(dizi[13].deger<>0)+
                   ord(dizi[14].deger<>0);
         10:toplam:=ord(dizi[4].deger<>0)+ord(dizi[5].deger<>0)+
                   ord(dizi[9].deger<>0)+ord(dizi[14].deger<>0)+
                   ord(dizi[15].deger<>0);
         11:toplam:=ord(dizi[6].deger<>0)+ord(dizi[7].deger<>0)+
                   ord(dizi[12].deger<>0)+ord(dizi[16].deger<>0)+
                   ord(dizi[17].deger<>0);
         12:toplam:=ord(dizi[6].deger<>0)+ord(dizi[7].deger<>0)+
                   ord(dizi[8].deger<>0)+ord(dizi[11].deger<>0)+
                   ord(dizi[13].deger<>0)+ord(dizi[16].deger<>0)+
                   ord(dizi[17].deger<>0)+
                   ord(dizi[18].deger<>0);
         13:toplam:=ord(dizi[7].deger<>0)+ord(dizi[8].deger<>0)+
                   ord(dizi[9].deger<>0)+ord(dizi[12].deger<>0)+
                   ord(dizi[14].deger<>0)+ord(dizi[17].deger<>0)+
                   ord(dizi[18].deger<>0)+
                   ord(dizi[19].deger<>0);
         14:toplam:=ord(dizi[8].deger<>0)+ord(dizi[9].deger<>0)+
                   ord(dizi[10].deger<>0)+ord(dizi[13].deger<>0)+
                   ord(dizi[15].deger<>0)+ord(dizi[18].deger<>0)+
                   ord(dizi[19].deger<>0)+
                   ord(dizi[20].deger<>0);
         15:toplam:=ord(dizi[9].deger<>0)+ord(dizi[10].deger<>0)+
                   ord(dizi[14].deger<>0)+ord(dizi[19].deger<>0)+
                   ord(dizi[20].deger<>0);
         16:toplam:=ord(dizi[11].deger<>0)+ord(dizi[12].deger<>0)+
                   ord(dizi[17].deger<>0)+ord(dizi[21].deger<>0)+
                   ord(dizi[22].deger<>0);
         17:toplam:=ord(dizi[11].deger<>0)+ord(dizi[12].deger<>0)+
                   ord(dizi[13].deger<>0)+ord(dizi[16].deger<>0)+
                   ord(dizi[18].deger<>0)+ord(dizi[21].deger<>0)+
                   ord(dizi[22].deger<>0)+
                   ord(dizi[23].deger<>0);
         18:toplam:=ord(dizi[12].deger<>0)+ord(dizi[13].deger<>0)+
                   ord(dizi[14].deger<>0)+ord(dizi[17].deger<>0)+
                   ord(dizi[19].deger<>0)+ord(dizi[22].deger<>0)+
                   ord(dizi[23].deger<>0)+
                   ord(dizi[24].deger<>0);
         19:toplam:=ord(dizi[13].deger<>0)+ord(dizi[14].deger<>0)+
                   ord(dizi[15].deger<>0)+ord(dizi[18].deger<>0)+
                   ord(dizi[20].deger<>0)+ord(dizi[23].deger<>0)+
                   ord(dizi[24].deger<>0)+
                   ord(dizi[25].deger<>0);
         20:toplam:=ord(dizi[14].deger<>0)+ord(dizi[15].deger<>0)+
                   ord(dizi[19].deger<>0)+ord(dizi[24].deger<>0)+
                   ord(dizi[25].deger<>0);
         21:toplam:=ord(dizi[16].deger<>0)+ord(dizi[17].deger<>0)+
                   ord(dizi[22].deger<>0);
         22:toplam:=ord(dizi[16].deger<>0)+ord(dizi[17].deger<>0)+
                   ord(dizi[18].deger<>0)+ord(dizi[21].deger<>0)+
                   ord(dizi[23].deger<>0);
         23:toplam:=ord(dizi[17].deger<>0)+ord(dizi[18].deger<>0)+
                   ord(dizi[19].deger<>0)+ord(dizi[22].deger<>0)+
                   ord(dizi[24].deger<>0);
         24:toplam:=ord(dizi[18].deger<>0)+ord(dizi[19].deger<>0)+
                   ord(dizi[20].deger<>0)+ord(dizi[23].deger<>0)+
                   ord(dizi[25].deger<>0);
         25:toplam:=ord(dizi[19].deger<>0)+ord(dizi[20].deger<>0)+
                   ord(dizi[24].deger<>0);
         end;
kontrol:=toplam;
end;

procedure TForm15.SpeedButton1Click(Sender: TObject);
var ad,gecici:string;i,sil:integer;
begin
if timer1.Enabled=false then begin
  timer1.Enabled:=true;
  zaman:=now();
  end;
ad:=(sender as Tspeedbutton).name; //basýlan tuþun numarasýný al...
  for i:=length(ad) downto 0 do begin
   if ad[i] in ['0'..'9'] then
    gecici:=ad[i]+gecici;
  end;

        if dizi[strtoint(gecici)].deger=0 then //mayýna mý bastýn?
        begin
          if kontrol(gecici)=0 then //patlat...
          begin
                //under construction !?!          
          end;
        (sender as TSpeedButton).caption:=inttostr(kontrol(gecici));
         MessageBeep(1);
         sil:=0;
         for i:=0 to ComponentCount-1 do //kaç tane boþ kaldý?
          if components[i] is TSpeedButton then 
           if (components[i] as TSpeedButton).caption='' then inc(sil);
         if sil=5 then begin
          if form2.rke1.Checked then
          label1.caption:=label1.caption+#13+'KAZANDIN...'
          else
          label1.caption:=label1.caption+#13+'WON...';
          timer1.Enabled:=false;
         for i:=0 to ComponentCount-1 do  //iþ bitti
         begin
         if components[i] is TSpeedButton then begin
         (components[i] as TSpeedButton).enabled:=false;
         sil:=adrakam( (components[i] as TSpeedButton).name);
         if dizi[sil].bos=false then (components[i] as TSpeedButton).caption:='X';
          end;
         end;
         end;
        end
        else
        begin
         (sender as TSpeedButton).caption:='X';
         MessageBeep(2);
         for i:=0 to ComponentCount-1 do
         begin
         if components[i] is TSpeedButton then begin
         (components[i] as TSpeedButton).enabled:=false;
         sil:=adrakam( (components[i] as TSpeedButton).name);
         if dizi[sil].bos=false then (components[i] as TSpeedButton).caption:='X';
          end;
         end;
         timer1.Enabled:=false;
          if form2.rke1.Checked then
          label1.caption:='Kaybettin...'
          else
          label1.caption:='Lost...';
          BitBtn1.Caption:='L'; //:(
        end;
end;

procedure TForm15.FormCreate(Sender: TObject);
var i:integer;
begin
randomize;
b:=0;
sayac:=0;
label1.Caption:='';
BitBtn1.Caption:='J';           //:)
for i:=1 to 25 do begin
 dizi[i].bos:=true;
 dizi[i].deger:=0;
 end;
tusdoldur;
        for i:=0 to ComponentCount-1 do
        begin
         if components[i] is TSpeedButton then begin
          (components[i] as TSpeedButton).caption:='';
          (components[i] as TSpeedButton).enabled:=true;
          end;
        end;
end;

procedure TForm15.Timer1Timer(Sender: TObject);
begin
label1.caption:=timetostr(now()-zaman);
end;

procedure TForm15.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_ESCAPE then close
end;

end.

