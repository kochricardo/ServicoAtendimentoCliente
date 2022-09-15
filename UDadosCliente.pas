unit UDadosCliente;

interface

uses
  SysUtils, classes;

type
  TCanalVenda = (Farma,Alimentar,Hospitalar);

  TCliente = class(TObject)
  private
    FCodigo : integer;
    FDigito : integer;
    FCdEmpresa: integer;
    FRazaoSocial : string;
    FCnpj : string;
    FEndereco : string;
    FNumero : string;
    FBairro : string;
    FCidade : string;
    FEstado : string;
    FDataUltimaCompra : TDate;
    FDataVencAlvara : TDate;
    FSituacao : string;
    FSetor    : integer;
    FDistrito    : integer;
    FNomeRepresentante : string;
    FEmailNFe1 : string;
    FEmailNFe2 : string;
    FEmailSac : string;
    FTipo: integer;
    FContato: string;
    FEmailSetor: string;
    FEmailDistrito: string;
    FCanalVenda: TCanalVenda;
    FEntregador: string;
    FEtiquetaEntrega: string;
    FCdTransportador: integer;
    FTelefoneContato: string;
    FEmailTransportador: string;

    function getCodigo: integer;
    procedure setCodigo(const Value: integer);
    function getRazaoSocial: string;
    procedure setRazaoSocial(const Value: string);
    function getCidade: string;
    procedure setCidade(const Value: string);
    function getEstado: string;
    procedure setEstado(const Value: string);
    function getDataUltCompra: TDate;
    procedure setDataUltCompra(const Value: TDate);
    function getDataVencAlvara: TDate;
    procedure setDataVencAlvara(const Value: TDate);
    function getSituacaoCliente: string;
    procedure setSitucaoCliente(const Value: string);
    function getSetor: integer;
    procedure setSetor(const Value: integer);
    function getCNPJ: string;
    procedure setCNPJ(const Value: string);
    function getDigito: integer;
    procedure setDigito(const Value: integer);
    function getNomeRep: string;
    procedure setNomeRep(const Value: string);
    function getEndereco: string;
    procedure setEndereco(const Value: string);
    function getEmailNFe1: string;
    function getEmailNFe2: string;
    procedure setEmailNFe1(const Value: string);
    procedure setEmailNFe2(const Value: string);
    function getTipoCliente: integer;
    procedure setTipoCliente(const Value: integer);
    function getDistrito: integer;
    procedure setDistrito(const Value: integer);
    function getCdEmpresa: integer;
    procedure setCdEmpresa(const Value: integer);
    function getContato: string;
    procedure setContato(const Value: string);
    function getEmailDistrito: string;
    function getEmailSetor: string;
    procedure setEmailDistrito(const Value: string);
    procedure setEmailSetor(const Value: string);
    function getCanalVenda: TCanalVenda;
    procedure setCanalVenda(const Value: TCanalVenda);
    function Getentregador: String;
    procedure Setentregador(const Value: String);
    function GetetiquetaEntrega: String;
    procedure SetetiquetaEntrega(const Value: String);
    function GetcdTransportador: integer;
    procedure SetcdTransportador(const Value: integer);
    function getEmailSac: string;
    procedure setEmailSac(const Value: string);
    function GetTelefoneContato: String;
    procedure SetTelefoneContato(const Value: String);
    function getBairro: string;
    function getNumero: string;
    procedure setBairro(const Value: string);
    procedure setNumero(const Value: string);
    function getEmailTransportador: string;
    procedure setEmailTransportador(const Value: string);

  public
    isGravarEmailCliente: Boolean;
    isGravarTelefoneCliente: Boolean;
    isAtualizarEmailCliente: Boolean;
    isAtualizarTelefoneCliente: Boolean;

    property codigo:integer read getCodigo write setCodigo;
    property digito:integer read getDigito write setDigito;
    property cdEmpresa: integer read getCdEmpresa write setCdEmpresa;
    property razaoSocial: string read getRazaoSocial write setRazaoSocial;
    property endereco: string read getEndereco write setEndereco;
    property numero: string read getNumero write setNumero;
    property bairro: string read getBairro write setBairro;
    property cidade: string read getCidade write setCidade;
    property estado: string read getEstado write setEstado;
    property dataUltimaCompra: TDate read getDataUltCompra write setDataUltCompra;
    property dataVencAlvara: TDate read getDataVencAlvara write setDataVencAlvara;
    property situacaoCliente: string read getSituacaoCliente write setSitucaoCliente;
    property setor: integer read getSetor write setSetor;
    property distrito: integer read getDistrito write setDistrito;
    property cnpj: string read getCNPJ write setCNPJ;
    property nomeRepresentante: string read getNomeRep write setNomeRep;
    property emailNFe1:string read getEmailNFe1 write setEmailNFe1;
    property emailNFe2:string read getEmailNFe2 write setEmailNFe2;
    property emailSac:string read getEmailSac write setEmailSac;
    property tipo: integer read getTipoCliente write setTipoCliente;
    property contato: string read getContato write setContato;
    property emailSetor: string read getEmailSetor write setEmailSetor;
    property emailDistrito: string read getEmailDistrito write setEmailDistrito;
    property canalVenda: TCanalVenda read getCanalVenda write setCanalVenda;
    property entregador: String read Getentregador write Setentregador;
    property etiquetaEntrega: String read GetetiquetaEntrega write SetetiquetaEntrega;
    property cdTransportador: integer read GetcdTransportador write SetcdTransportador;
    property telefoneContato: String read GetTelefoneContato write SetTelefoneContato;
    property emailTransportador: string read getEmailTransportador write setEmailTransportador;

    constructor create;
    procedure free;overload;
    procedure limparDados;
  end;

var
  cliente : TCliente;

implementation

{ TCliente }

constructor TCliente.create;
begin
  inherited;
end;

procedure TCliente.free;
begin
  inherited destroy;
end;

procedure TCliente.limparDados;
begin
  isGravarEmailCliente:=False;
  isGravarTelefoneCliente:=False;
  isAtualizarEmailCliente:=False;
  isAtualizarTelefoneCliente:=False;

  codigo:=0;
  digito:=0;
  cdEmpresa:=0;
  razaoSocial:='';
  endereco:='';
  numero:='';
  bairro:='';
  cidade:='';
  estado:='';
  dataUltimaCompra:=Date;
  dataVencAlvara:=Date;
  setor:=0;
  distrito:=0;
  cnpj:='';
  nomeRepresentante:='';
  emailNFe1:='';
  emailNFe2:='';
  emailSac:='';
  tipo:=0;
  contato:='';
  emailSetor:='';
  emailDistrito:='';
  canalVenda:=Farma;
  entregador:='';
  etiquetaEntrega:='';
  cdTransportador:=0;
  telefoneContato:='';
  emailTransportador:='';
end;

function TCliente.getBairro: string;
begin
  Result:=FBairro;
end;

function TCliente.getCanalVenda: TCanalVenda;
begin
  Result:=FCanalVenda;
end;

function TCliente.getCdEmpresa: integer;
begin
  Result:=FCdEmpresa;
end;

function TCliente.GetcdTransportador: integer;
begin
  Result:=FCdTransportador;
end;

function TCliente.getCidade: string;
begin
  Result:=FCidade;
end;

function TCliente.getCNPJ: string;
begin
  Result:=FCnpj;
end;

function TCliente.getCodigo: integer;
begin
  Result:=FCodigo;
end;

function TCliente.getContato: string;
begin
  Result:=FContato;
end;

function TCliente.getDataUltCompra: TDate;
begin
  Result:=FDataUltimaCompra;
end;

function TCliente.getDataVencAlvara: TDate;
begin
  Result:=FDataVencAlvara;
end;

function TCliente.getDigito: integer;
begin
  Result:=FDigito;
end;

function TCliente.getDistrito: integer;
begin
  Result:=FDistrito;
end;

function TCliente.getEmailDistrito: string;
begin
  Result:=FEmailDistrito;
end;

function TCliente.getEmailNFe1: string;
begin
  Result:=FEmailNFe1;
end;

function TCliente.getEmailNFe2: string;
begin
  Result:=FEmailNFe2;
end;

function TCliente.getEmailSac: string;
begin
  Result:=FEmailSac;
end;

function TCliente.getEmailSetor: string;
begin
  Result:=FEmailSetor;
end;

function TCliente.getEmailTransportador: string;
begin
  Result:=FEmailTransportador;
end;

function TCliente.getEndereco: string;
begin
  Result:=FEndereco;
end;

function TCliente.Getentregador: String;
begin
  Result:=FEntregador;
end;

function TCliente.getEstado: string;
begin
  Result:=FEstado;
end;

function TCliente.GetetiquetaEntrega: String;
begin
  Result:=FEtiquetaEntrega;
end;

function TCliente.getNomeRep: string;
begin
  Result:=FNomeRepresentante;
end;

function TCliente.getNumero: string;
begin
  Result:=FNumero;
end;

function TCliente.getRazaoSocial: string;
begin
  Result:=FRazaoSocial;
end;

function TCliente.getSetor: integer;
begin
  Result:=FSetor;
end;

function TCliente.getSituacaoCliente: string;
begin
  Result:=FSituacao;
end;

function TCliente.GetTelefoneContato: String;
begin
  Result:=FTelefoneContato;
end;

function TCliente.getTipoCliente: integer;
begin
  Result:=FTipo;
end;

procedure TCliente.setBairro(const Value: string);
begin
  FBairro:=Value;
end;

procedure TCliente.setCanalVenda(const Value: TCanalVenda);
begin
  FCanalVenda:=Value;
end;

procedure TCliente.setCdEmpresa(const Value: integer);
begin
  FCdEmpresa:=Value;
end;

procedure TCliente.SetcdTransportador(const Value: integer);
begin
  FCdTransportador:=Value;
end;

procedure TCliente.setCidade(const Value: string);
begin
  FCidade:=trim(Value);
end;

procedure TCliente.setCNPJ(const Value: string);
begin
  FCnpj:=trim(value);
end;

procedure TCliente.setCodigo(const Value: integer);
begin
  FCodigo:=Value;
end;

procedure TCliente.setContato(const Value: string);
begin
  FContato:=Trim(Value);
end;

procedure TCliente.setDataUltCompra(const Value: TDate);
begin
  FDataUltimaCompra:=Value;
end;

procedure TCliente.setDataVencAlvara(const Value: TDate);
begin
  FDataVencAlvara:=Value;
end;

procedure TCliente.setDigito(const Value: integer);
begin
  FDigito:=Value;
end;

procedure TCliente.setDistrito(const Value: integer);
begin
  FDistrito:=Value;
end;

procedure TCliente.setEmailDistrito(const Value: string);
begin
  FEmailDistrito:=Trim(Value);
end;

procedure TCliente.setEmailNFe1(const Value: string);
begin
  FEmailNFe1:=Value;
end;

procedure TCliente.setEmailNFe2(const Value: string);
begin
  FEmailNFe2:=Value;
end;

procedure TCliente.setEmailSac(const Value: string);
begin
  FEmailSac:=Trim(Value);
end;

procedure TCliente.setEmailSetor(const Value: string);
begin
  FEmailSetor:=Trim(Value);
end;

procedure TCliente.setEmailTransportador(const Value: string);
begin
  FEmailTransportador:=Trim(Value);
end;

procedure TCliente.setEndereco(const Value: string);
begin
  FEndereco:=Value;
end;

procedure TCliente.Setentregador(const Value: String);
begin
  FEntregador:=Value;
end;

procedure TCliente.setEstado(const Value: string);
begin
  FEstado:=trim(Value);
end;

procedure TCliente.SetetiquetaEntrega(const Value: String);
begin
  FEtiquetaEntrega:=Value;
end;

procedure TCliente.setNomeRep(const Value: string);
begin
  FNomeRepresentante:=trim(Value);
end;

procedure TCliente.setNumero(const Value: string);
begin
  FNumero:=Value;
end;

procedure TCliente.setRazaoSocial(const Value: string);
begin
  FRazaoSocial:=trim(Value);
end;

procedure TCliente.setSetor(const Value: integer);
begin
  FSetor:=Value;
end;

procedure TCliente.setSitucaoCliente(const Value: string);
begin
  FSituacao:=trim(Value);
end;

procedure TCliente.SetTelefoneContato(const Value: String);
begin
  FTelefoneContato:=trim(Value);
end;

procedure TCliente.setTipoCliente(const Value: integer);
begin
  FTipo:=Value;
end;

end.
