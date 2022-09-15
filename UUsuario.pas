unit UUsuario;

interface

uses
  Classes, Sysutils;

type
  TSitucao = (ativo,inativo,desconhecida);

  TAmbiente = (Producao,Homologacao);

  TTelefonia = class
  private
    FServidorVoip: string;
    FNrRamalVoip: integer;
    function getNrRamalVoip: integer;
    function getServidorVoip: string;
    procedure setNrRamalVoip(const Value: integer);
    procedure setServidorVoip(const Value: string);


  public
    property nrRamalVoip: integer read getNrRamalVoip write setNrRamalVoip;
    property servidor: string read getServidorVoip write setServidorVoip;


    procedure limparDados;
    procedure free;overload;
    constructor create;overload;
  end;

  TUsuario = class
  private
    FMatricula: integer;
    FLogin: string;
    FNomeCompleto: string;
    FSenha: string;
    FCodigo: integer;
    FSituacao: TSitucao;
    FAmbiente: TAmbiente;

    function getLogin: string;
    function getMatricula: integer;
    function getNomeCompleto: string;
    procedure setLogin(const Value: string);
    procedure setMatricula(const Value: integer);
    procedure setNomeCompleto(const Value: string);
    function getSenha: string;
    procedure setSenha(const Value: string);
    function getCodigo: integer;
    procedure setCodigo(const Value: integer);
    function getSituacao: TSitucao;
    procedure setSituacao(const Value: TSitucao);
    function getAmbiente: TAmbiente;
    procedure setAmbiente(const Value: TAmbiente);
  public
    isAcessoLiberado: Boolean;
    isControleGeralDoSistema: Boolean;
    telefonia: TTelefonia;

    property matricula: integer read getMatricula write setMatricula;
    property login: string read getLogin write setLogin;
    property senha: string read getSenha write setSenha;
    property nomeCompleto: string read getNomeCompleto write setNomeCompleto;
    property codigo: integer read getCodigo write setCodigo;
    property situacao: TSitucao read getSituacao write setSituacao;
    property ambiente: TAmbiente read getAmbiente write setAmbiente;

    procedure limparDados;
    procedure free;overload;
    constructor create;overload;
  end;

  function strToSituacao(str:string):TSitucao;
var
  usuario: TUsuario;

implementation

function strToSituacao(str:string):TSitucao;
begin
  case str[1] of
    'A' : Result:=ativo;
    'I' : Result:=inativo;
    else
      Result:=desconhecida;
  end;
end;

{ TUsuario }

constructor TUsuario.create;
begin
  inherited Create;

  telefonia:=TTelefonia.create;
  limparDados;
end;

procedure TUsuario.free;
begin
  inherited Free;

end;

function TUsuario.getAmbiente: TAmbiente;
begin
  Result:=FAmbiente;
end;

function TUsuario.getCodigo: integer;
begin
  Result:=FCodigo;
end;

function TUsuario.getLogin: string;
begin
  Result:=FLogin;
end;

function TUsuario.getMatricula: integer;
begin
  Result:=FMatricula;
end;

function TUsuario.getNomeCompleto: string;
begin
  Result:=FNomeCompleto;
end;

function TUsuario.getSenha: string;
begin
  Result:=FSenha;
end;

function TUsuario.getSituacao: TSitucao;
begin
  Result:=FSituacao;
end;

procedure TUsuario.limparDados;
begin
  isAcessoLiberado:=False;
  isControleGeralDoSistema:=False;
  matricula:=0;
  login:='';
  senha:='';
  nomeCompleto:='';
  codigo:=0;
  situacao:=desconhecida;
  ambiente:=Homologacao;
end;

procedure TUsuario.setAmbiente(const Value: TAmbiente);
begin
  FAmbiente:=Value;
end;

procedure TUsuario.setCodigo(const Value: integer);
begin
  FCodigo:=Value;
end;

procedure TUsuario.setLogin(const Value: string);
begin
  FLogin:=UpperCase(Trim(Value));
end;

procedure TUsuario.setMatricula(const Value: integer);
begin
  FMatricula:=Value;
end;

procedure TUsuario.setNomeCompleto(const Value: string);
begin
  FNomeCompleto:=UpperCase(Trim(Value));
end;

procedure TUsuario.setSenha(const Value: string);
begin
  FSenha:=Value;
end;

procedure TUsuario.setSituacao(const Value: TSitucao);
begin
  FSituacao:=Value;
end;

{ TTelefonia }

constructor TTelefonia.create;
begin
  inherited;

  limparDados;
end;

procedure TTelefonia.free;
begin
  inherited free;
end;

function TTelefonia.getNrRamalVoip: integer;
begin
  Result:=FNrRamalVoip;
end;

function TTelefonia.getServidorVoip: string;
begin
  Result:=FServidorVoip;
end;

procedure TTelefonia.limparDados;
begin
  servidor:='';
  nrRamalVoip:=0;
end;

procedure TTelefonia.setNrRamalVoip(const Value: integer);
begin
  FNrRamalVoip:=Value;
end;

procedure TTelefonia.setServidorVoip(const Value: string);
begin
  FServidorVoip:=Trim(Value);
end;

end.
