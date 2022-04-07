unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TDerleme = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  public
    constructor Create(satirno: integer; kimden:string);
  end;

var _satir:integer;
    _kim:string;

implementation

{ derleme }

uses unit2;

constructor TDerleme.Create(satirno: integer; kimden:string);
begin
 _satir:=satirno;
 _kim:=kimden;
  inherited Create(false);
end;

procedure TDerleme.Execute;
var
    bitti:boolean;
begin
bitti:=false;
repeat
  form2.calistir(_satir,_kim);
  bitti:=true;
until  (Terminated)or(bitti);
end;

end.
