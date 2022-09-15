unit UFDadosTransbordoCarga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, UDadosOcorrencia;

type
  TFDadosTransbordoCarga = class(TForm)
    StatusBar1: TStatusBar;
    gbxDadosTransbordo: TGroupBox;
    memInformacaoTransbordo: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDadosTransbordoCarga: TFDadosTransbordoCarga;

implementation

{$R *.dfm}

procedure TFDadosTransbordoCarga.FormActivate(Sender: TObject);
begin
  memInformacaoTransbordo.Text:=ocorrencia.item.dsTransbordoCarga;
  memInformacaoTransbordo.SetFocus;
end;

procedure TFDadosTransbordoCarga.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FDadosTransbordoCarga:=nil;
  Action:=caFree;
end;

procedure TFDadosTransbordoCarga.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

end.
