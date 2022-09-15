unit UTelefoneAtendimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes;

type
  TFDadosLigacao = class(TObject)
  private
    FCodigoLigacao : integer;
    FNrTelefone: string;
    FCodigoCliente : integer;
    FIdIniciarLigacao: Boolean;

    function getCodigoCliente: integer;
    function getCodigoLigacao: integer;
    function getNrTelefone: string;
    procedure setCodigoCliente(const Value: integer);
    procedure setCodigoLigacao(const Value: integer);
    procedure setNrTelefone(const Value: string);
    function getIdIniciarLigacao: Boolean;
    procedure setIdIniciarLigacao(const Value: Boolean);
  public
    property codigoLigacao: integer read getCodigoLigacao write setCodigoLigacao;
    property nrTelefone: string read getNrTelefone write setNrTelefone;
    property codigoCliente: integer read getCodigoCliente write setCodigoCliente;
    property isIniciarLigacao: Boolean read getIdIniciarLigacao write setIdIniciarLigacao;

    procedure limparDados;
    constructor create;
    destructor destroy;
  end;
var
  dadosLigacao : TFDadosLigacao;

implementation

{ FDadosLigacao }

constructor TFDadosLigacao.create;
begin
  inherited;

  limparDados;
end;

destructor TFDadosLigacao.destroy;
begin
  inherited destroy;

end;

function TFDadosLigacao.getCodigoCliente: integer;
begin
  Result:=FCodigoCliente;
end;

function TFDadosLigacao.getCodigoLigacao: integer;
begin
  Result:=FCodigoLigacao;
end;

function TFDadosLigacao.getIdIniciarLigacao: Boolean;
begin
  Result:=FIdIniciarLigacao;
end;

function TFDadosLigacao.getNrTelefone: string;
begin
  Result:=FNrTelefone;
end;

procedure TFDadosLigacao.limparDados;
begin
  codigoLigacao:=0;
  nrTelefone:='';
  codigoCliente:=0;
  isIniciarLigacao:=False;
end;

procedure TFDadosLigacao.setCodigoCliente(const Value: integer);
begin
  FCodigoCliente:=Value;
end;

procedure TFDadosLigacao.setCodigoLigacao(const Value: integer);
begin
  FCodigoLigacao:=Value;
end;

procedure TFDadosLigacao.setIdIniciarLigacao(const Value: Boolean);
begin
  FIdIniciarLigacao:=Value;
end;

procedure TFDadosLigacao.setNrTelefone(const Value: string);
begin
  FNrTelefone:=Trim(Value);
end;

end.
