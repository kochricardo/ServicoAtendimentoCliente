unit UTelaSistema;

interface

uses
  Classes,Menus;

type
  TTelaSistema = record
    codigo : integer;
    descri��o : string;
    nomeMenu: TMenuItem;
  end;

  procedure InicializarDadosTelaSistema;

var
  telaLiberada : array[0..100] of TTelaSistema;

implementation

{ TTelaSistema }

procedure InicializarDadosTelaSistema;
var
  i: integer;
begin
  for i:= 0 to 99 do
  begin
    telaLiberada[i].codigo:=0;
    telaLiberada[i].descri��o:='';
    telaLiberada[i].nomeMenu:=nil;
  end;
end;

end.
