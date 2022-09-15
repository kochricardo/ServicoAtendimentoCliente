unit UParametroSistema;

interface

uses
  SysUtils, Variants, Classes;

const
  DATA_FUTURA_PADRAO = '01/01/2039';
  DATA_INICIO_ENVIO_EMAIL_AUTOMATICO = '17/11/2016'; { SS.: 15791 }
  VERSAO_SISTEMA = '3.105.0';
  NM_SMTP_MSG_INTERNA = 'mail.gam.com.br';
  NM_SMTP_MSG_EXTERNA = 'smtp.gmail.com';

type
  TDadosContaEmail = record
    servidorMsgInterna: string;
    servidorMsgExterna: string;
    conta: string;
    senha: string;
    email: string;
    dataEnvioAutomatico: string;

    procedure limparDados;
  end;

  TTabelaPesquisa = record
    dcnot: string;
    dcios: string;
    dcilo: string;
    dcord: string;
    dcNFeDadosAdicionais: string;

    procedure limparDados;
  end;

  TFiltroConsulta = record
    idFiltro : integer; { 0=codigo,1=cnpj,2=duplicata,3=NFe,4=razao social }
    dsFiltro : string;

    procedure limparDados;
  end;

  TDadosEmpresa = record
    dataSistema : Tdate;
    horaSistema : string;
    dataHora: TDateTime;
    versaoSistema : string;

    procedure limparDados;
  end;

  TDimensaoTela = class(TObject)
    FTopo    : integer;
    FEsquerda   : integer;
    FLargura  : integer;
    FAltura : integer;
  private
    function getAltura: integer;
    function getEsquerda: integer;
    function getTopo: integer;
    procedure setAltura(const Value: integer);
    procedure setLargura(const Value: integer);
    procedure setEsquerda(const Value: integer);
    procedure setTopo(const Value: integer);
    function getLargura: integer;
  public
    property topo: integer read getTopo write setTopo;
    property esquerda: integer read getEsquerda write setEsquerda;
    property largura: integer read getLargura write setLargura;
    property altura: integer read getAltura write setAltura;

    procedure free;overload;
    constructor create;overload;
  end;

  TPastaSistema = class(TObject)
  private
    FPastaPrincipal : string;
    FPastaDocRave : string;
    FPastaRelatorio : string;

    function getPastaDocRave: string;
    function getPastaPrincipal: string;
    function getPastaRelatorio: string;
    procedure setPastadocRave(const Value: string);
    procedure setPastaPrincipal(const Value: string);
    procedure setPastaRelatorio(const Value: string);
  public
    property principal: string read getPastaPrincipal write setPastaPrincipal;
    property docRave: string read getPastaDocRave write setPastadocRave;
    property relatorio: string read getPastaRelatorio write setPastaRelatorio;

    procedure free;overload;
    constructor create;overload;
  end;

var
  tamanhoTela : TDimensaoTela;
  filtroConsulta : TFiltroConsulta;
  dadosEmpresa : TDadosEmpresa;
  pastaSistema: TPastaSistema;
  tabelaPesquisa: TTabelaPesquisa;
  dadosEmail: TDadosContaEmail;

implementation

{ TDimensaoTela }

constructor TDimensaoTela.create;
begin
  inherited Create;
end;

procedure TDimensaoTela.free;
begin
  inherited Free;
end;

function TDimensaoTela.getAltura: integer;
begin
  Result:=FAltura;
end;

function TDimensaoTela.getLargura: integer;
begin
  Result:=FLargura;
end;

function TDimensaoTela.getEsquerda: integer;
begin
  Result:=FEsquerda;
end;

function TDimensaoTela.getTopo: integer;
begin
  Result:=FTopo;
end;

procedure TDimensaoTela.setAltura(const Value: integer);
begin
  FAltura:=Value;
end;

procedure TDimensaoTela.setLargura(const Value: integer);
begin
  FLargura:=Value;
end;

procedure TDimensaoTela.setEsquerda(const Value: integer);
begin
  FEsquerda:=Value;
end;

procedure TDimensaoTela.setTopo(const Value: integer);
begin
  FTopo:=Value;
end;

{ TFiltroConsulta }

procedure TFiltroConsulta.limparDados;
begin
  idFiltro:=0;
  dsFiltro:='';
end;

{ TDadosEmpresa }

procedure TDadosEmpresa.limparDados;
begin
  dataSistema:=Date;
  horaSistema:='';
  dataHora:=Now;
  versaoSistema:='';
end;

{ TPastaSistema }

constructor TPastaSistema.create;
begin
  inherited;

end;

procedure TPastaSistema.free;
begin
  inherited free;
end;

function TPastaSistema.getPastaDocRave: string;
begin
  Result:=FPastaDocRave;
end;

function TPastaSistema.getPastaPrincipal: string;
begin
  Result:=FPastaPrincipal;
end;

function TPastaSistema.getPastaRelatorio: string;
begin
  Result:=FPastaRelatorio;
end;

procedure TPastaSistema.setPastadocRave(const Value: string);
begin
  FPastaDocRave:=Value;
end;

procedure TPastaSistema.setPastaPrincipal(const Value: string);
begin
  FPastaPrincipal:=Value;
end;

procedure TPastaSistema.setPastaRelatorio(const Value: string);
begin
  FPastaRelatorio:=Value;
end;

{ TTabelaPesquisa }

procedure TTabelaPesquisa.limparDados;
begin
  dcnot:='';
  dcios:='';
  dcilo:='';
  dcord:='';
  dcNFeDadosAdicionais:=''
end;

{ TDadosContaEmail }

procedure TDadosContaEmail.limparDados;
begin
  servidorMsgInterna:='';
  servidorMsgExterna:='';
  conta:='';
  senha:='';
  email:='';
  dataEnvioAutomatico:='';
end;

end.
