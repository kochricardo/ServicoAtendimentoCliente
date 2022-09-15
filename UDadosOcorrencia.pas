unit UDadosOcorrencia;

interface

uses
  Classes, Sysutils,DateUtils, UParametroSistema;

type
  TRecallLote = record
    cdRecall: integer;
    dtAvisoRecall: TDate;
    dtRetornoFabricRecall: TDate;
    dsMotivoRecall: string;
    nmUsuarioRegistro: string;
    dtRegistro: TDateTime;

    procedure limparDados;
  end;

  TDadosMensagem = record
    emailDestinatario: string;
    listaEmailCopia: string;
    dsTipoOcorrencia: string;
    dsSubTipoOcorrencia: string;
    dsSolucionador: string;
    nrNFe: string;
    dataEmissaoNFe: string;
    dsProduto: string;
    dsObservacao: string;
    isEnviarMensagemRecolhimentoMercadoria: Boolean;
    isEnviarMensagemForaPrazoRegistro: Boolean;
    isEnviarMensagemProdutoTermolabil: Boolean;

    procedure limparDados;
  end;

  TContatoEmail = record
    dsEmailSolucionador: string;
    dsEmailSupervisor: string;
    dsEmailRepresentante: string;
    dsEmailCoordenador: string;
    dsEmailCopia: string;
    dsEmailCopiaExtra: string;

    procedure limparDados;
  end;

  TConsultaOcorrencia = record
    cdCliente: integer;
    cdOcorrencia: integer;
    nrNFe: integer;
    cdSetor: integer;
    cdStatusSolucao: integer;
    cdStatusCausa: integer;
    dsDataRegistro: string;
    dsNomeArquivo: string;

    procedure limparDados;
  end;

  TRecorrencia = record
    cdOcorrencia: integer;
    cdItem: integer;
    cdRecorrencia: integer;
    descRecorrencia: string;
    idTipoRecorrencia: string;
    dataRecorrencia: TDateTime;
    dataLimiteSolucao: TDateTime;
    isRegistrarPendentes: Boolean;

    procedure limparDados;
  end;

  TSolucaoPendente = record
    cdOcorrencia: integer;
    emailDoSolucionador: string;
    dataRegistro: TDateTime;
    dataLimiteSolucao: TDateTime;

    procedure limparDados;
  end;

  TCausaItem = class(TObject)
  private
    FCdSubTipoCausa: integer;
    FDsSubTipoCausa: string;
    FDsTransporte: string;
    FDsCausa: widestring;
    FDataCausa: TDate;
    FDsAcaoTomada: widestring;

    function getCdSubTipoCausa: integer;
    function getDsAcaoTomada: string;
    function getDsCausa: string;
    function getDataCausa: TDate;
    function getDsSubTipoCausa: string;
    function getDsTransporte: string;
    procedure setCdSubTipoCausa(const Value: integer);
    procedure setDsAcaoTomada(const Value: string);
    procedure setDsCausa(const Value: string);
    procedure setDataCausa(const Value: TDate);
    procedure setDsSubTipoCausa(const Value: string);
    procedure setDsTransporte(const Value: string);
  public
    property cdSubTipoCausa: integer read getCdSubTipoCausa write setCdSubTipoCausa;
    property dsSubTipoCausa: string read getDsSubTipoCausa write setDsSubTipoCausa;
    property dsTransporte: string read getDsTransporte write setDsTransporte;
    property dsCausa: string read getDsCausa write setDsCausa;
    property dataCausa: TDate read getDataCausa write setDataCausa;
    property dsAcaoTomada: string read getDsAcaoTomada write setDsAcaoTomada;

    procedure limparDados;
    procedure free; overload;
    destructor destroy; override;
    constructor create;overload;
  end;

  TSolucaoItem = class(TObject)
  private
    FCdTipoSolucao: integer;
    FDsTipoSolucao: string;
    FDsSolucao: widestring;
    FIdFilmagem: Boolean;
    FIdFilmagemVisivel: Boolean;
    FNrCamera: integer;
    FCdConferente: integer;
    FIdContagemEstoque: Boolean;
    FCdSituacaoEstoque: integer;
    FIdGravacaoTlv: Boolean;
    FIdGravacaoCorreta: string;
    FDataSolucao: TDate;
    FDsTransporte: string;
    FCdSituacaoEmbalagem: integer;
    FDsSituacaoEmbalagem: string;
    FIdRecolherMercadoria: string;

    function getCdConferente: integer;
    function getCdTipoSolucao: integer;
    function getDataSolucao: TDate;
    function getDsTipoSolucao: string;
    function getDsTransporte: string;
    function getIdContagemEstoque: Boolean;
    function getCdSituacaoEstoque: integer;
    function getIdFilmagem: Boolean;
    function getIdFilmagemVisivel: Boolean;
    function getIdGravacaoCorreta: string;
    function getIdGravacaoTlv: Boolean;
    function getNrCamera: integer;
    procedure setCdConferente(const Value: integer);
    procedure setCdTipoSolucao(const Value: integer);
    procedure setDataSolucao(const Value: TDate);
    procedure setDsTipoSolucao(const Value: string);
    procedure setDsTransporte(const Value: string);
    procedure setIdContagemEstoque(const Value: Boolean);
    procedure setCdSituacaoEstoque(const Value: integer);
    procedure setIdFilmagem(const Value: Boolean);
    procedure setIdFilmagemVisivel(const Value: Boolean);
    procedure setIdGravacaoCorreta(const Value: string);
    procedure setIdGravacaoTlv(const Value: Boolean);
    procedure setNrCamera(const Value: integer);
    function getCdSituacaoEmbalagem: integer;
    function getDsSituacaoEmbalagem: string;
    function getdsSolucao: string;
    procedure setCdSituacaoEmbalagem(const Value: integer);
    procedure setDsSituacaoEmbalagem(const Value: string);
    procedure setDsSolucao(const Value: string);
    function getIdRecolherMercadoria: string;
    procedure setIdRecolherMercadoria(const Value: string);
  public
    property cdSubTipoSolucao: integer read getCdTipoSolucao write setCdTipoSolucao;
    property dsSubTipoSolucao: string read getDsTipoSolucao write setDsTipoSolucao;
    property dsSolucao: string read getdsSolucao write setDsSolucao;
    property idFilmagem: Boolean read getIdFilmagem write setIdFilmagem;
    property idFilmagemVisivel: Boolean read getIdFilmagemVisivel write setIdFilmagemVisivel;
    property nrCamera: integer read getNrCamera write setNrCamera;
    property cdConferente: integer read getCdConferente write setCdConferente;
    property idContagemEstoque: Boolean read getIdContagemEstoque write setIdContagemEstoque;
    property cdSituacaoEstoque: integer read getCdSituacaoEstoque write setCdSituacaoEstoque;
    property idGravacaoTlv: Boolean read getIdGravacaoTlv write setIdGravacaoTlv;
    property idGravacaoCorreta: string read getIdGravacaoCorreta write setIdGravacaoCorreta;
    property dataSolucao: TDate read getDataSolucao write setDataSolucao;
    property dsTransporte: string read getDsTransporte write setDsTransporte;
    property cdSituacaoEmbalagem: integer read getCdSituacaoEmbalagem write setCdSituacaoEmbalagem;
    property dsSituacaoEmbalagem: string read getDsSituacaoEmbalagem write setDsSituacaoEmbalagem;
    property idRecolherMercadoria: string read getIdRecolherMercadoria write setIdRecolherMercadoria;

    procedure limparDados;
    procedure free; overload;
    destructor destroy; override;
    constructor create;overload;
  end;

  TItemOcorrencia = class(TObject)
  private
    FSequencia: integer;
    FCdEmpresa: integer;
    FIdEmpresaNFe: integer;
    FNrNFe: integer;
    FNrNFeControle: integer;
    FNrSerieNFe: integer;
    FDataEmissao: TDate;
    FCdCaminhao: integer;
    FCdCaminhaoSecundario: integer;
    FCdOrigemPedido: integer;
    FDsOrigemPedido: string;
    FCdProduto: integer;
    FDigitoProduto: integer;
    FDsProduto: string;
    FQuantProduto: integer;
    FCdTipoProduto: integer;
    FDsTipoProduto: string;
    FLote: string;
    FDataValidadeProduto: TDate;
    FPrazoValidade: integer;
    FCdSituacaoEmbalagem: integer;
    FDsSituacaoEmbalagem: string;
    FCdTipoOcorrencia: integer;
    FDsTipoOcorrencia: string;
    FCdSubTipoOcorrencia: integer;
    FDsSubTipoOcorrencia: string;
    FDescricaoOcorrencia: WideString;
    FCdSolucionador: integer;
    FNomeSolucionador: string;
    FCdGerenteSolucionador: integer;
    FNomeGerenteSolucionador: string;
    FNrMatriculaRepresentante: integer;
    FNrMatriculaGerenteRepresentante: integer;
    FQuantDiasPrazoSolucao: integer;
    FCdSetor: integer;
    FNomeRepresentante: string;
    FCdDistrito: integer;
    FCdTransportador: integer;
    FNomeTransportador: string;
    FDsTransbordoCarga: WideString;
    FCdStatusSolucao: integer;
    FDsStatusSolucao: string;
    FCdStatusCausa: integer;
    FDsStatusCausa: string;
    FDataLimite: TDate;
    FCdAreaOrigem: integer;
    FDsAreaOrigem: string;
    FIdRecolherMercadoria: Boolean;
    FIdSolucionadorGAM: Boolean;
    FIdEmissaoDentroPrazo48Horas: Boolean;
    FIdAlertarRegistroForaDoPrazo: Boolean;
    FCdOperadorLogistico: integer;
    FDsDigitadorPedido: string;
    FDsMotivoCancelamento: WideString;
    FIdNecessitaOrdemDeColeta: Boolean;
    FIdEnviarMensagemProdutoTermolabil: Boolean;
    FCdClienteEntrega: integer;
    FCfop: integer;
    FCst: string;
    FVlrUnitarioMercadoria: Double;
    FVlrUnitarioBcIcms: Double;
    FVlrUnitarioIcms: Double;
    FVlrUnitarioBcST: Double;
    FVlrUnitarioST: Double;
    FcdMotivoCancelamento: integer;

    function getItem: integer;
    procedure setitem(const Value: integer);
    function getCdAreaOrigem: integer;
    function getCdDistrito: integer;
    function getCdEmpresa: integer;
    function getCdGerenteSolucionador: integer;
    function getCdOrigemPedido: integer;
    function getCdProduto: integer;
    function getCdSetor: integer;
    function getCdSituacaoEmbalagem: integer;
    function getCdSolucionador: integer;
    function getCdStatusCausa: integer;
    function getCdStatusSolucao: integer;
    function getCdSubTipoOcorrencia: integer;
    function getCdTipoOcorrencia: integer;
    function getCdTipoProduto: integer;
    function getCdTransportador: integer;
    function getDataEmissao: TDate;
    function getDataLimite: TDate;
    function getDataValidadeProduto: TDate;
    function getDescricaoOcorrencia: WideString;
    function getDsAreaOrigem: string;
    function getDsOrigemPedido: string;
    function getDsProduto: string;
    function getDsSituacaoEmbalagem: string;
    function getDsStatusCausa: string;
    function getDsStatusSolucao: string;
    function getDsSubTipoOcorrencia: string;
    function getDsTipoOcorrencia: string;
    function getDsTipoProduto: string;
    function getDsTransbordoCarga: WideString;
    function getNomeSolucionador: string;
    function getNomeTransportador: string;
    function getNrMatriculaGerenteRepresentante: integer;
    function getNrMatriculaRepresentante: integer;
    function getNrNFe: integer;
    function getNrSerieNFe: integer;
    function getPrazoValidade: integer;
    function getQuantProduto: integer;
    procedure setCdAreaOrigem(const Value: integer);
    procedure setCdDistrito(const Value: integer);
    procedure setCdEmpresa(const Value: integer);
    procedure setCdGerenteSolucionador(const Value: integer);
    procedure setCdOrigemPedido(const Value: integer);
    procedure setCdProduto(const Value: integer);
    procedure setCdSetor(const Value: integer);
    procedure setCdSituacaoEmbalagem(const Value: integer);
    procedure setCdSolucionador(const Value: integer);
    procedure setCdStatusCausa(const Value: integer);
    procedure setCdStatusSolucao(const Value: integer);
    procedure setCdSubTipoOcorrencia(const Value: integer);
    procedure setCdTipoOcorrencia(const Value: integer);
    procedure setCdTipoProduto(const Value: integer);
    procedure setCdTransportador(const Value: integer);
    procedure setDataEmissao(const Value: TDate);
    procedure setDataLimite(const Value: TDate);
    procedure setDataValidadeProduto(const Value: TDate);
    procedure setDescricaoOcorrencia(const Value: WideString);
    procedure setDsAreaOrigem(const Value: string);
    procedure setDsOrigemPedido(const Value: string);
    procedure setDsProduto(const Value: string);
    procedure setDsSituacaoEmbalagem(const Value: string);
    procedure setDsStatusCausa(const Value: string);
    procedure setDsStatusSolucao(const Value: string);
    procedure setDsSubTipoOcorrencia(const Value: string);
    procedure setDsTipoOcorrencia(const Value: string);
    procedure setDsTipoProduto(const Value: string);
    procedure setDsTransbordoCarga(const Value: WideString);
    procedure setNomeSolucionador(const Value: string);
    procedure setNomeTransportador(const Value: string);
    procedure setNrMatriculaGerenteRepresentante(const Value: integer);
    procedure setNrMatriculaRepresentante(const Value: integer);
    procedure setNrNFe(const Value: integer);
    procedure setNrSerieNFe(const Value: integer);
    procedure setPrazoValidade(const Value: integer);
    procedure setQuantProduto(const Value: integer);
    function getLote: string;
    procedure setLote(const Value: string);
    function getDigitoProduto: integer;
    procedure setDigitoProduto(const Value: integer);
    function getNomeGerenteSolucionador: string;
    procedure setNomeGerenteSolucionador(const Value: string);
    function getQuantDiasPrazoSolucao: integer;
    procedure setQuantDiasPrazoSolucao(const Value: integer);
    function getCdCaminaho: integer;
    procedure setCdCaminhao(const Value: integer);
    function getNomeRépresentante: string;
    procedure setNomeRépresentante(const Value: string);
    function getCdCaminhaoSecundario: integer;
    procedure setCdCaminhaoSecundario(const Value: integer);
    function getNrNFeControle: integer;
    procedure setNrNFeControle(const Value: integer);
    function getIdRecolherMercadoria: Boolean;
    procedure setIdRecolherMercadoria(const Value: Boolean);
    function getIdSolucionadorGAM: Boolean;
    procedure setIdSolucionadorGAM(const Value: Boolean);
    function getIdEmissaoDentroPrazo48Horas: Boolean;
    procedure setIdEmissaoDentroPrazo48Horas(const Value: Boolean);
    function getIdAlertarRegistroForaDoPrazo: Boolean;
    procedure setIdAlertarRegistroForaDoPrazo(const Value: Boolean);
    function getcdOperadorLogistico: integer;
    function getdsDigitadorPedido: string;
    procedure setcdOperadorLogistico(const Value: integer);
    procedure setdsDigitadorPedido(const Value: string);
    function getDsMotivoCancelamento: WideString;
    procedure setDsMotivoCancelamento(const Value: WideString);
    function getIdNecessitaOrdemDeColeta: Boolean;
    procedure setIdNecessitaOrdemDeColeta(const Value: Boolean);
    function getIdEnviarMensagemProdutoTermolabil: Boolean;
    procedure setIdEnviarMensagemProdutoTermolabil(const Value: Boolean);
    function getCdClienteEntrega: integer;
    procedure setCdClienteEntrega(const Value: integer);
    function getIdEmpresaNFe: integer;
    procedure setIdEmpresaNFe(const Value: integer);
    function getCfop: integer;
    function getCst: string;
    function getVlrUnitarioBcIcms: Double;
    function getVlrUnitarioBcST: Double;
    function getVlrUnitarioIcms: Double;
    function getVlrUnitarioMercadoria: Double;
    function getVlrUnitarioST: Double;
    procedure setCfop(const Value: integer);
    procedure setCst(const Value: string);
    procedure setVlrUnitarioBcIcms(const Value: Double);
    procedure setVlrUnitarioBcST(const Value: Double);
    procedure setVlrUnitarioIcms(const Value: Double);
    procedure setVlrUnitarioMercadoria(const Value: Double);
    procedure setVlrUnitarioST(const Value: Double);
    procedure setcdMotivoCancelamento(const Value: integer);
    function getcdMotivoCancelamento: integer;
  public
    solucao : TSolucaoItem;
    causa: TCausaItem;
    contatoEmail: TContatoEmail;

    property nrSequencia: integer read getItem write setitem;
    property cdEmpresa: integer read getCdEmpresa write setCdEmpresa;
    property idEmpresaNFe: integer read getIdEmpresaNFe write setIdEmpresaNFe;
    property nrNFe: integer read getNrNFe write setNrNFe;
    property nrNFeControle: integer read getNrNFeControle write setNrNFeControle;
    property nrSerieNFe: integer read getNrSerieNFe write setNrSerieNFe;
    property dataEmissao: TDate read getDataEmissao write setDataEmissao;
    property cdCaminhao: integer read getCdCaminaho write setCdCaminhao;
    property cdCaminhaoSecundario: integer read getCdCaminhaoSecundario write setCdCaminhaoSecundario;
    property cdOrigemPedido: integer read getCdOrigemPedido write setCdOrigemPedido;
    property dsOrigemPedido: string read getDsOrigemPedido write setDsOrigemPedido;
    property cdProduto: integer read getCdProduto write setCdProduto;
    property digitoProduto: integer read getDigitoProduto write setDigitoProduto;
    property dsProduto: string read getDsProduto write setDsProduto;
    property quantProduto: integer read getQuantProduto write setQuantProduto;
    property cdTipoProduto: integer read getCdTipoProduto write setCdTipoProduto;
    property dsTipoProduto: string read getDsTipoProduto write setDsTipoProduto;
    property dsLote: string read getLote write setLote;
    property dataValidadeProduto: TDate read getDataValidadeProduto write setDataValidadeProduto;
    property periodoValidade: integer read getPrazoValidade write setPrazoValidade;
    property cdSituacaoEmbalagem: integer read getCdSituacaoEmbalagem write setCdSituacaoEmbalagem;
    property dsSituacaoEmbalagem: string read getDsSituacaoEmbalagem write setDsSituacaoEmbalagem;
    property cdTipoOcorrencia: integer read getCdTipoOcorrencia write setCdTipoOcorrencia;
    property dsTipoOcorrencia: string read getDsTipoOcorrencia write setDsTipoOcorrencia;
    property cdSubTipoOcorrencia: integer read getCdSubTipoOcorrencia write setCdSubTipoOcorrencia;
    property dsSubTipoOcorrencia: string read getDsSubTipoOcorrencia write setDsSubTipoOcorrencia;
    property descricaoOcorrencia: WideString read getDescricaoOcorrencia write setDescricaoOcorrencia;
    property cdSolucionador: integer read getCdSolucionador write setCdSolucionador;
    property nomeSolucionador: string read getNomeSolucionador write setNomeSolucionador;
    property cdGerenteSolucionador: integer read getCdGerenteSolucionador write setCdGerenteSolucionador;
    property nomeGerenteSolucionador: string read getNomeGerenteSolucionador write setNomeGerenteSolucionador;
    property nrMatriculaRepresentante: integer read getNrMatriculaRepresentante write setNrMatriculaRepresentante;
    property nrMatriculaGerenteRepresentante: integer read getNrMatriculaGerenteRepresentante write setNrMatriculaGerenteRepresentante;
    property quantDiasPrazoSolucao: integer read getQuantDiasPrazoSolucao write setQuantDiasPrazoSolucao;
    property cdSetor: integer read getCdSetor write setCdSetor;
    property nomeRepresentante: string read getNomeRépresentante write setNomeRépresentante;
    property cdDistrito: integer read getCdDistrito write setCdDistrito;
    property cdTransportador: integer read getCdTransportador write setCdTransportador;
    property nomeTransportador: string read getNomeTransportador write setNomeTransportador;
    property dsTransbordoCarga: WideString read getDsTransbordoCarga write setDsTransbordoCarga;
    property cdStatusSolucao: integer read getCdStatusSolucao write setCdStatusSolucao;
    property dsStatusSolucao: string read getDsStatusSolucao write setDsStatusSolucao;
    property cdStatusCausa: integer read getCdStatusCausa write setCdStatusCausa;
    property dsStatusCausa: string read getDsStatusCausa write setDsStatusCausa;
    property dataLimite: TDate read getDataLimite write setDataLimite;
    property cdAreaOrigem: integer read getCdAreaOrigem write setCdAreaOrigem;
    property dsAreaOrigem: string read getDsAreaOrigem write setDsAreaOrigem;
    property isRecolherMercadoria: Boolean read getIdRecolherMercadoria write setIdRecolherMercadoria;
    property isSolucionadorGAM: Boolean read getIdSolucionadorGAM write setIdSolucionadorGAM;
    property isEmissaoDentroPrazo48Horas: Boolean read getIdEmissaoDentroPrazo48Horas write setIdEmissaoDentroPrazo48Horas;
    property isAlertarRegistroForaDoPrazo: Boolean read getIdAlertarRegistroForaDoPrazo write setIdAlertarRegistroForaDoPrazo;
    property cdOperadorLogistico: integer read getcdOperadorLogistico write setcdOperadorLogistico;
    property dsDigitadorPedido: string read getdsDigitadorPedido write setdsDigitadorPedido;
    property dsMotivoCancelamento: WideString read getDsMotivoCancelamento write setDsMotivoCancelamento;
    property isNecessitaOrdemDeColeta: Boolean read getIdNecessitaOrdemDeColeta write setIdNecessitaOrdemDeColeta;
    property isEnviarMensagemProdutoTermolabil: Boolean read getIdEnviarMensagemProdutoTermolabil write setIdEnviarMensagemProdutoTermolabil;
    property cdClienteEntrega: integer read getCdClienteEntrega write setCdClienteEntrega;
    property cdMotivoCancelamento: integer read getcdMotivoCancelamento write setcdMotivoCancelamento;

    property Cfop: integer read getCfop write setCfop;
    property Cst: string read getCst write setCst;
    property VlrUnitarioMercadoria: Double read getVlrUnitarioMercadoria write setVlrUnitarioMercadoria;
    property VlrUnitarioBcIcms: Double read getVlrUnitarioBcIcms write setVlrUnitarioBcIcms;
    property VlrUnitarioIcms: Double read getVlrUnitarioIcms write setVlrUnitarioIcms;
    property VlrUnitarioBcST: Double read getVlrUnitarioBcST write setVlrUnitarioBcST;
    property VlrUnitarioST: Double read getVlrUnitarioST write setVlrUnitarioST;


    procedure calcularPeriodoValidade;
    procedure calcularDataLimiteSolucao;
    procedure carregarTipoProduto;
    { limpa apenas os dados do tipo, subtipo, etc }
    procedure limparTipoOcorrencia(isLimparSolucionador:Boolean);
    { limpa apenas os dados do produto, mantendo as informações principais da ocorrencia }
    procedure limparDadosParcial;
    procedure limparDados;

    procedure free; overload;
    constructor create;
  end;

  TOcorrencia = class(TObject)
  private
    FCdOcorrencia: integer;
    FCdEmpresa: integer;
    FCdCliente: integer;
    FCdCodigoDigito: integer;
    FCdUsuario: integer;
    FDsOcorrencia: WideString;
    FCdPrioridade: integer;
    FDataRegistro: TDateTime;
    FDataLimite: TDate;
    FCdStatusSolucao: integer;
    FCdStatusCausa: integer;
    FContato: string;
    FTelefone: string;
    FRazaoSocial: string;
    FDsPrioridade: string;
    FDsStatusSolucao: string;
    FDsStatusCausa: string;
    FEmailContato: string;
    FCdMeioDeOrigemDoContato: integer;
    FIdSituacaoOrdemColeta: string;
    FDataEmissaoOrdemDeColeta: TDateTime;
    FIdOcorrenciaIntegral: Boolean;
    FCdDestinoEmailOrdemDeColeta: integer;   { 0= Todos 1=Cliente 2=Transportador }
    FdsArquivoOcorrencia :String;
    FcdMotivoCancelamento: integer;

    function getNumero: integer;
    procedure setNumero(const Value: integer);
    function getCdCliente: integer;
    function getCdEmpresa: integer;
    function getCdPrioridade: integer;
    function getCdStatusCausa: integer;
    function getCdStatusSolucao: integer;
    function getCdUsuario: integer;
    function getDataLimite: TDate;
    function getDataRegistro: TDateTime;
    function getDescricao: WideString;
    procedure setCdCliente(const Value: integer);
    procedure setCdEmpresa(const Value: integer);
    procedure setCdPrioridade(const Value: integer);
    procedure setCdStatusCausa(const Value: integer);
    procedure setCdUsuario(const Value: integer);
    procedure setDescricao(const Value: WideString);
    procedure setStatusSolucao(const Value: integer);
    procedure setDataLimite(const Value: TDate);
    procedure setDataRegistro(const Value: TDateTime);
    function getContato: string;
    procedure setContato(const Value: string);
    function getTelefone: string;
    procedure setTelefone(const Value: string);
    function getDsPrioridade: string;
    function getDsStatusCausa: string;
    function getDsStatusSolucao: string;
    function getRazaoSocial: string;
    procedure setDsPrioridade(const Value: string);
    procedure setDsStatusCausa(const Value: string);
    procedure setDsStatusSolucao(const Value: string);
    procedure setRazaoSocial(const Value: string);
    function getCodigoDigito: integer;
    procedure setCodigoDigito(const Value: integer);
    function getEmailContato: string;
    procedure setEmailContato(const Value: string);
    function getCdMeioDeOrigemDoContato: integer;
    procedure setCdMeioDeOrigemDoContato(const Value: integer);
    function getIdSituacaoOrdemColeta: string;
    procedure setIdSituacaoOrdemColeta(const Value: string);
    function getDataEmissaoOrdemDeColeta: TDateTime;
    procedure setDataEmissaoOrdemDeColeta(const Value: TDateTime);
    function getIdOcorrenciaIntegral: Boolean;
    procedure setIdOcorrenciaIntegral(const Value: Boolean);
    function getCdDestinoEmailOrdemDeColeta: integer;
    procedure SetCdDestinoEmailOrdemDeColeta(const Value: integer);
    function getdsArquivoOcorrencia: String;
    procedure SetdsArquivoOcorrencia(const Value: String);
    procedure setcdMotivoCancelamento(const Value: integer);
  public
    item: TItemOcorrencia;

    property cdOcorrencia: integer read getNumero write setNumero;
    property cdEmpresa: integer read getCdEmpresa write setCdEmpresa;
    property cdCliente: integer read getCdCliente write setCdCliente;
    property codigoDigito: integer read getCodigoDigito write setCodigoDigito;
    property cdUsuario: integer read getCdUsuario write setCdUsuario;
    property descricao: WideString read getDescricao write setDescricao;
    property cdPrioridade: integer read getCdPrioridade write setCdPrioridade;
    property dataRegistro: TDateTime read getDataRegistro write setDataRegistro;
    property dataLimite: TDate read getDataLimite write setDataLimite;
    property cdStatusSolucao: integer read getCdStatusSolucao write setStatusSolucao;
    property cdStatusCausa: integer read getCdStatusCausa write setCdStatusCausa;
    property contato: string read getContato write setContato;
    property telefone: string read getTelefone write setTelefone;
    property razaoSocial: string read getRazaoSocial write setRazaoSocial;
    property dsPrioridade: string read getDsPrioridade write setDsPrioridade;
    property dsStatusSolucao: string read getDsStatusSolucao write setDsStatusSolucao;
    property dsStatusCausa: string read getDsStatusCausa write setDsStatusCausa;
    property emailContato: string read getEmailContato write setEmailContato;
    property cdMeioDeOrigemDoContato: integer read getCdMeioDeOrigemDoContato write setCdMeioDeOrigemDoContato;
    property idSituacaoOrdemColeta: string read getIdSituacaoOrdemColeta write setIdSituacaoOrdemColeta;
    property dataEmissaoOrdemDeColeta:TDateTime read getDataEmissaoOrdemDeColeta write setDataEmissaoOrdemDeColeta;
    property isOcorrenciaIntegral: Boolean read getIdOcorrenciaIntegral write setIdOcorrenciaIntegral;
    property cdDestinoEmailOrdemDeColeta: integer read getCdDestinoEmailOrdemDeColeta write SetCdDestinoEmailOrdemDeColeta;
    property dsArquivoOcorrencia: String read getdsArquivoOcorrencia write SetdsArquivoOcorrencia;
    property cdMotivoCancelamento: integer read FcdMotivoCancelamento write setcdMotivoCancelamento;


    procedure validarDataLimite;
    procedure limparDados;
    procedure free;overload;
    destructor destroy; override;
    constructor create;overload;
  end;

var
  ocorrencia : TOcorrencia;
  recorrencia: TRecorrencia;
  solucaoPendente: TSolucaoPendente;

implementation

{ TOcorrencia }

constructor TOcorrencia.create;
begin
  inherited;

  item:=TItemOcorrencia.create;
  item.limparDados;
end;

destructor TOcorrencia.destroy;
begin
  inherited Destroy;
end;

procedure TOcorrencia.free;
begin
  item.free;

  inherited free;
end;

function TOcorrencia.getCdCliente: integer;
begin
  Result:=FCdCliente;
end;

function TOcorrencia.getCdDestinoEmailOrdemDeColeta: integer;
begin
  Result:=FCdDestinoEmailOrdemDeColeta;
end;

function TOcorrencia.getCdEmpresa: integer;
begin
  Result:=FCdEmpresa;
end;

function TOcorrencia.getCdMeioDeOrigemDoContato: integer;
begin
  Result:=FCdMeioDeOrigemDoContato;
end;

function TOcorrencia.getCdPrioridade: integer;
begin
  Result:=FCdPrioridade;
end;

function TOcorrencia.getCdStatusCausa: integer;
begin
  Result:=FCdStatusCausa;
end;

function TOcorrencia.getCdStatusSolucao: integer;
begin
  Result:=FCdStatusSolucao;
end;

function TOcorrencia.getCdUsuario: integer;
begin
  Result:=FCdUsuario;
end;

function TOcorrencia.getContato: string;
begin
  Result:=FContato;
end;

function TOcorrencia.getDataEmissaoOrdemDeColeta: TDateTime;
begin
  Result:=FDataEmissaoOrdemDeColeta;
end;

function TOcorrencia.getDataLimite: TDate;
begin
  Result:=FDataLimite;
end;

function TOcorrencia.getDataRegistro: TDateTime;
begin
  Result:=FDataRegistro;
end;

function TOcorrencia.getDescricao: WideString;
begin
  Result:=FDsOcorrencia;
end;

function TOcorrencia.getdsArquivoOcorrencia: String;
begin
 result:=FdsArquivoOcorrencia;
end;

function TOcorrencia.getCodigoDigito: integer;
begin
  Result:=FCdCodigoDigito;
end;

function TOcorrencia.getDsPrioridade: string;
begin
  Result:=FDsPrioridade;
end;

function TOcorrencia.getDsStatusCausa: string;
begin
  Result:=FDsStatusCausa;
end;

function TOcorrencia.getDsStatusSolucao: string;
begin
  Result:=FDsStatusSolucao;
end;

function TOcorrencia.getEmailContato: string;
begin
  Result:=FEmailContato;
end;

function TOcorrencia.getIdOcorrenciaIntegral: Boolean;
begin
  Result:=FIdOcorrenciaIntegral;
end;

function TOcorrencia.getIdSituacaoOrdemColeta: string;
begin
  Result:=FIdSituacaoOrdemColeta;
end;

function TOcorrencia.getNumero: integer;
begin
  Result:=FCdOcorrencia;
end;

function TOcorrencia.getRazaoSocial: string;
begin
  Result:=FRazaoSocial;
end;

function TOcorrencia.getTelefone: string;
begin
  Result:=FTelefone;
end;

procedure TOcorrencia.validarDataLimite;
begin
  if dataLimite < item.dataLimite then
    dataLimite:=item.dataLimite;
end;

procedure TOcorrencia.limparDados;
begin
  cdOcorrencia:=0;
  cdUsuario:=0;
  cdEmpresa:=0;
  cdCliente:=0;
  codigoDigito:=0;
  descricao:=' ';
  cdPrioridade:=1;
  dataRegistro:=Date;
  dataLimite:=Date;
  cdStatusSolucao:=1;
  cdStatusCausa:=1;
  contato:='';
  telefone:='';
  razaoSocial:='';
  dsPrioridade:='';
  dsStatusSolucao:='';
  dsStatusCausa:='';
  emailContato:='';
  cdMeioDeOrigemDoContato:=0;
  idSituacaoOrdemColeta:='N';
  dataEmissaoOrdemDeColeta:=Date;
  isOcorrenciaIntegral:=False;
  cdDestinoEmailOrdemDeColeta:=0;
  dsArquivoOcorrencia :='';

  item.limparDados;
end;

procedure TOcorrencia.setCdCliente(const Value: integer);
begin
  FCdCliente:=Value;
end;

procedure TOcorrencia.SetCdDestinoEmailOrdemDeColeta(const Value: integer);
begin
  FCdDestinoEmailOrdemDeColeta:=Value;
end;

procedure TOcorrencia.setCdEmpresa(const Value: integer);
begin
  FCdEmpresa:=Value;
end;

procedure TOcorrencia.setCdMeioDeOrigemDoContato(const Value: integer);
begin
  FCdMeioDeOrigemDoContato:=Value;
end;

procedure TOcorrencia.setcdMotivoCancelamento(const Value: integer);
begin
  FcdMotivoCancelamento := Value;
end;

procedure TOcorrencia.setCdPrioridade(const Value: integer);
begin
  FCdPrioridade:=Value;
end;

procedure TOcorrencia.setCdStatusCausa(const Value: integer);
begin
  FCdStatusCausa:=Value;
end;

procedure TOcorrencia.setCdUsuario(const Value: integer);
begin
  FCdUsuario:=Value;
end;

procedure TOcorrencia.setContato(const Value: string);
begin
  FContato:=Trim(Value);
end;

procedure TOcorrencia.setDataEmissaoOrdemDeColeta(const Value: TDateTime);
begin
  FDataEmissaoOrdemDeColeta:=Value;
end;

procedure TOcorrencia.setDataLimite(const Value: TDate);
begin
  FDataLimite:=Value;
end;

procedure TOcorrencia.setDataRegistro(const Value: TDateTime);
begin
  FDataRegistro:=Value;
end;

procedure TOcorrencia.setDescricao(const Value: WideString);
begin
  FDsOcorrencia:=Value;
end;

procedure TOcorrencia.SetdsArquivoOcorrencia(const Value: String);
begin
  FdsArquivoOcorrencia:=Value;
end;

procedure TOcorrencia.setCodigoDigito(const Value: integer);
begin
  FCdCodigoDigito:=Value;
end;

procedure TOcorrencia.setDsPrioridade(const Value: string);
begin
  FDsPrioridade:=Trim(Value);
end;

procedure TOcorrencia.setDsStatusCausa(const Value: string);
begin
  FDsStatusCausa:=Trim(Value);
end;

procedure TOcorrencia.setDsStatusSolucao(const Value: string);
begin
  FDsStatusSolucao:=Trim(Value);
end;

procedure TOcorrencia.setEmailContato(const Value: string);
begin
  FEmailContato:=Trim(Value);
end;

procedure TOcorrencia.setIdOcorrenciaIntegral(const Value: Boolean);
begin
  FIdOcorrenciaIntegral:=Value;
end;

procedure TOcorrencia.setIdSituacaoOrdemColeta(const Value: string);
begin
  FIdSituacaoOrdemColeta:=Value;
end;

procedure TOcorrencia.setNumero(const Value: integer);
begin
  FCdOcorrencia:=Value;
end;

procedure TOcorrencia.setRazaoSocial(const Value: string);
begin
  FRazaoSocial:=Trim(Value);
end;

procedure TOcorrencia.setStatusSolucao(const Value: integer);
begin
  FCdStatusSolucao:=Value;
end;

procedure TOcorrencia.setTelefone(const Value: string);
begin
  FTelefone:=Trim(Value);
end;

{ TItemOcorrencia }

procedure TItemOcorrencia.calcularDataLimiteSolucao;
var
  i: integer;
  periodoSolucao: array of Tdate;
  diaDaSemana: integer;
  dataReferencia: TDate;
  dataTemp: TDate;
begin
  dataReferencia:=dadosEmpresa.dataSistema;

  SetLength(periodoSolucao,quantDiasPrazoSolucao);
  for I:= Low(periodoSolucao) to High(periodoSolucao) do
  begin
    dataReferencia:=IncDay(dataReferencia);
    if DayOfWeek(dataReferencia) = 7 then
      dataReferencia:=IncDay(dataReferencia,2);

    periodoSolucao[i]:=dataReferencia;
  end;

  dataLimite:=dataReferencia;
end;

procedure TItemOcorrencia.calcularPeriodoValidade;
begin
  periodoValidade:=0;
  if dataValidadeProduto < strtodate(DATA_FUTURA_PADRAO) then
    periodoValidade:=MonthsBetween(dataEmissao,dataValidadeProduto);
end;

procedure TItemOcorrencia.carregarTipoProduto;
begin
  case cdTipoProduto of
    1 : dsTipoProduto:='MEDICAMENTO';
    2,3 : dsTipoProduto:='PERFUMARIA';
  end;
end;

constructor TItemOcorrencia.create;
begin
  inherited;

  solucao:=TSolucaoItem.create;
  causa:=TCausaItem.create;
end;

procedure TItemOcorrencia.free;
begin
  solucao.free;
  causa.free;

  inherited free;
end;

function TItemOcorrencia.getCdAreaOrigem: integer;
begin
  Result:=FCdAreaOrigem;
end;

function TItemOcorrencia.getCdCaminaho: integer;
begin
  Result:=FCdCaminhao;
end;

function TItemOcorrencia.getCdCaminhaoSecundario: integer;
begin
  Result:=FCdCaminhaoSecundario;
end;

function TItemOcorrencia.getCdClienteEntrega: integer;
begin
  Result:=FCdClienteEntrega;
end;

function TItemOcorrencia.getCdDistrito: integer;
begin
  Result:=FCdDistrito;
end;

function TItemOcorrencia.getCdEmpresa: integer;
begin
  Result:=FCdEmpresa;
end;

function TItemOcorrencia.getCdGerenteSolucionador: integer;
begin
  Result:=FCdGerenteSolucionador;
end;

function TItemOcorrencia.getcdMotivoCancelamento: integer;
begin
 Result:=FcdMotivoCancelamento;
end;

function TItemOcorrencia.getcdOperadorLogistico: integer;
begin
  Result:=FCdOperadorLogistico;
end;

function TItemOcorrencia.getCdOrigemPedido: integer;
begin
  Result:=FCdOrigemPedido;
end;

function TItemOcorrencia.getCdProduto: integer;
begin
  Result:=FCdProduto;
end;

function TItemOcorrencia.getCdSetor: integer;
begin
  Result:=FCdSetor;
end;

function TItemOcorrencia.getCdSituacaoEmbalagem: integer;
begin
  Result:=FCdSituacaoEmbalagem;
end;

function TItemOcorrencia.getCdSolucionador: integer;
begin
  Result:=FCdSolucionador;
end;

function TItemOcorrencia.getCdStatusCausa: integer;
begin
  Result:=FCdStatusCausa;
end;

function TItemOcorrencia.getCdStatusSolucao: integer;
begin
  Result:=FCdStatusSolucao;
end;

function TItemOcorrencia.getCdSubTipoOcorrencia: integer;
begin
  Result:=FCdSubTipoOcorrencia;
end;

function TItemOcorrencia.getCdTipoOcorrencia: integer;
begin
  Result:=FCdTipoOcorrencia;
end;

function TItemOcorrencia.getCdTipoProduto: integer;
begin
  Result:=FCdTipoProduto;
end;

function TItemOcorrencia.getCdTransportador: integer;
begin
  Result:=FCdTransportador;
end;

function TItemOcorrencia.getCfop: integer;
begin
  Result:=FCfop;
end;

function TItemOcorrencia.getCst: string;
begin
  Result:=FCst;
end;

function TItemOcorrencia.getDataEmissao: TDate;
begin
  Result:=FDataEmissao;
end;

function TItemOcorrencia.getDataLimite: TDate;
begin
  Result:=FDataLimite;
end;

function TItemOcorrencia.getDataValidadeProduto: TDate;
begin
  Result:=FDataValidadeProduto;
end;

function TItemOcorrencia.getDescricaoOcorrencia: WideString;
begin
  Result:=FDescricaoOcorrencia;
end;

function TItemOcorrencia.getDigitoProduto: integer;
begin
  Result:=FDigitoProduto;
end;

function TItemOcorrencia.getDsAreaOrigem: string;
begin
  Result:=FDsAreaOrigem;
end;

function TItemOcorrencia.getdsDigitadorPedido: string;
begin
  Result:=FDsDigitadorPedido;
end;

function TItemOcorrencia.getDsMotivoCancelamento: WideString;
begin
  Result:=FDsMotivoCancelamento;
end;

function TItemOcorrencia.getDsOrigemPedido: string;
begin
  Result:=FDsOrigemPedido;
end;

function TItemOcorrencia.getDsProduto: string;
begin
  Result:=FDsProduto;
end;

function TItemOcorrencia.getDsSituacaoEmbalagem: string;
begin
  Result:=FDsSituacaoEmbalagem;
end;

function TItemOcorrencia.getDsStatusCausa: string;
begin
  Result:=FDsStatusCausa;
end;

function TItemOcorrencia.getDsStatusSolucao: string;
begin
  Result:=FDsStatusSolucao;
end;

function TItemOcorrencia.getDsSubTipoOcorrencia: string;
begin
  Result:=FDsSubTipoOcorrencia;
end;

function TItemOcorrencia.getDsTipoOcorrencia: string;
begin
  Result:=FDsTipoOcorrencia;
end;

function TItemOcorrencia.getDsTipoProduto: string;
begin
  Result:=FDsTipoProduto;
end;

function TItemOcorrencia.getDsTransbordoCarga: WideString;
begin
  Result:=FDsTransbordoCarga;
end;

function TItemOcorrencia.getIdAlertarRegistroForaDoPrazo: Boolean;
begin
  Result:=FIdAlertarRegistroForaDoPrazo;
end;

function TItemOcorrencia.getIdEmissaoDentroPrazo48Horas: Boolean;
begin
  Result:=FIdEmissaoDentroPrazo48Horas;
end;

function TItemOcorrencia.getIdEmpresaNFe: integer;
begin
  Result:=FIdEmpresaNFe;
end;

function TItemOcorrencia.getIdEnviarMensagemProdutoTermolabil: Boolean;
begin
  Result:=FIdEnviarMensagemProdutoTermolabil;
end;

function TItemOcorrencia.getIdNecessitaOrdemDeColeta: Boolean;
begin
  Result:=FIdNecessitaOrdemDeColeta;
end;

function TItemOcorrencia.getIdRecolherMercadoria: Boolean;
begin
  Result:=FIdRecolherMercadoria;
end;

function TItemOcorrencia.getIdSolucionadorGAM: Boolean;
begin
  Result:=FIdSolucionadorGAM;
end;

function TItemOcorrencia.getItem: integer;
begin
  Result:=FSequencia;
end;

function TItemOcorrencia.getLote: string;
begin
  Result:=FLote;
end;

function TItemOcorrencia.getNomeGerenteSolucionador: string;
begin
  Result:=FNomeGerenteSolucionador;
end;

function TItemOcorrencia.getNomeRépresentante: string;
begin
  Result:=FNomeRepresentante;
end;

function TItemOcorrencia.getNomeSolucionador: string;
begin
  Result:=FNomeSolucionador;
end;

function TItemOcorrencia.getNomeTransportador: string;
begin
  Result:=FNomeTransportador;
end;

function TItemOcorrencia.getNrMatriculaGerenteRepresentante: integer;
begin
  Result:=FNrMatriculaGerenteRepresentante;
end;

function TItemOcorrencia.getNrMatriculaRepresentante: integer;
begin
  Result:=FNrMatriculaRepresentante;
end;

function TItemOcorrencia.getNrNFe: integer;
begin
  Result:=FNrNFe;
end;

function TItemOcorrencia.getNrNFeControle: integer;
begin
  Result:=FNrNFeControle;
end;

function TItemOcorrencia.getNrSerieNFe: integer;
begin
  Result:=FNrSerieNFe;
end;

function TItemOcorrencia.getPrazoValidade: integer;
begin
  Result:=FPrazoValidade;
end;

function TItemOcorrencia.getQuantDiasPrazoSolucao: integer;
begin
  Result:=FQuantDiasPrazoSolucao;
end;

function TItemOcorrencia.getQuantProduto: integer;
begin
  Result:=FQuantProduto;
end;

function TItemOcorrencia.getVlrUnitarioBcIcms: Double;
begin
  Result:=FVlrUnitarioBcIcms;
end;

function TItemOcorrencia.getVlrUnitarioBcST: Double;
begin
  Result:=FVlrUnitarioBcST;
end;

function TItemOcorrencia.getVlrUnitarioIcms: Double;
begin
  Result:=FVlrUnitarioIcms;
end;

function TItemOcorrencia.getVlrUnitarioMercadoria: Double;
begin
  Result:=FVlrUnitarioMercadoria;
end;

function TItemOcorrencia.getVlrUnitarioST: Double;
begin
  Result:=FVlrUnitarioST;
end;

procedure TItemOcorrencia.limparDados;
begin
  nrSequencia:=0;
  cdEmpresa:=0;
  idEmpresaNFe:=0;
  nrNFe:=0;
  nrNFeControle:=0;
  nrSerieNFe:=0;
  dataEmissao:=0;
  cdCaminhao:=0;
  cdCaminhaoSecundario:=0;
  cdOrigemPedido:=999999;
  dsOrigemPedido:='';
  cdProduto:=0;
  digitoProduto:=0;
  dsProduto:='';
  quantProduto:=0;
  dsTipoProduto:='';
  dsTipoProduto:='';
  dsLote:='';
  dataValidadeProduto:=Date;
  periodoValidade:=0;
  cdSituacaoEmbalagem:=0;
  dsSituacaoEmbalagem:='';
  cdTipoOcorrencia:=0;
  dsTipoOcorrencia:='';
  cdSubTipoOcorrencia:=0;
  dsSubTipoOcorrencia:='';
  descricaoOcorrencia:=' ';
  cdSolucionador:=0;
  nomeSolucionador:='';
  cdGerenteSolucionador:=0;
  nomeGerenteSolucionador:='';
  quantDiasPrazoSolucao:=0;
  nrMatriculaRepresentante:=0;
  nrMatriculaGerenteRepresentante:=0;
  cdSetor:=0;
  nomeRepresentante:='';
  cdDistrito:=0;
  cdTransportador:=0;
  nomeTransportador:=' ';
  dsTransbordoCarga:=' ';
  cdStatusSolucao:=1;
  dsStatusSolucao:='Pendente';
  cdStatusCausa:=1;
  dsStatusCausa:='Pendente';
  dataLimite:=Date;
  cdAreaOrigem:=0;
  dsAreaOrigem:=' ';
  isRecolherMercadoria:=False;
  isSolucionadorGAM:=False;
  isEmissaoDentroPrazo48Horas:=False;
  isAlertarRegistroForaDoPrazo:=False;
  cdOperadorLogistico:=0;
  dsDigitadorPedido:='SEM INFORMACAO';
  dsMotivoCancelamento:='';
  isNecessitaOrdemDeColeta:=False;
  isEnviarMensagemProdutoTermolabil:=False;
  cdClienteEntrega:=0;
  Cfop:=0;
  Cst:='';
  VlrUnitarioMercadoria:=0;
  VlrUnitarioBcIcms:=0;
  VlrUnitarioIcms:=0;
  VlrUnitarioBcST:=0;
  VlrUnitarioST:=0;

  solucao.limparDados;
  causa.limparDados;
  contatoEmail.limparDados;
end;

procedure TItemOcorrencia.limparDadosParcial;
begin
  nrSequencia:=0;
  cdProduto:=0;
  digitoProduto:=0;
  dsProduto:='';
  quantProduto:=0;
  dsTipoProduto:='';
  dsTipoProduto:='';
  dsLote:='';
  dataValidadeProduto:=Date;
  periodoValidade:=0;
  cdSituacaoEmbalagem:=0;
  dsSituacaoEmbalagem:='';
  cdTipoOcorrencia:=0;
  dsTipoOcorrencia:='';
  cdSubTipoOcorrencia:=0;
  dsSubTipoOcorrencia:='';
  descricaoOcorrencia:=' ';
  cdSolucionador:=0;
  nomeSolucionador:='';
  cdGerenteSolucionador:=0;
  quantDiasPrazoSolucao:=0;
  nrMatriculaRepresentante:=0;
  nomeGerenteSolucionador:='';
  nrMatriculaGerenteRepresentante:=0;
  cdStatusSolucao:=1;
  dsStatusSolucao:='Pendente';
  cdStatusCausa:=1;
  dsStatusCausa:='Pendente';
  dataLimite:=Date;
  cdAreaOrigem:=0;
  dsAreaOrigem:=' ';
  isRecolherMercadoria:=False;
  isAlertarRegistroForaDoPrazo:=False;
  cdOperadorLogistico:=0;
  dsDigitadorPedido:='SEM INFORMACAO';
  dsMotivoCancelamento:='';
  isNecessitaOrdemDeColeta:=False;
  isEnviarMensagemProdutoTermolabil:=False;

  solucao.limparDados;
  causa.limparDados;
  contatoEmail.limparDados;
end;

procedure TItemOcorrencia.limparTipoOcorrencia(isLimparSolucionador:Boolean);
begin
  cdTipoOcorrencia:=0;
  dsTipoOcorrencia:='';
  cdSubTipoOcorrencia:=0;
  dsSubTipoOcorrencia:='';
  cdSituacaoEmbalagem:=0;
  dsSituacaoEmbalagem:='';
  if not isLimparSolucionador then
  begin
    cdSolucionador:=0;
    nomeSolucionador:='';
    cdGerenteSolucionador:=0;
    nomeGerenteSolucionador:='';
  end;
  quantDiasPrazoSolucao:=0;
  isRecolherMercadoria:=False;
  solucao.limparDados;
  causa.limparDados;
end;

procedure TItemOcorrencia.setCdAreaOrigem(const Value: integer);
begin
  FCdAreaOrigem:=Value;
end;

procedure TItemOcorrencia.setCdCaminhao(const Value: integer);
begin
  FCdCaminhao:=Value;
end;

procedure TItemOcorrencia.setCdCaminhaoSecundario(const Value: integer);
begin
  FCdCaminhaoSecundario:=Value;
end;

procedure TItemOcorrencia.setCdClienteEntrega(const Value: integer);
begin
  FCdClienteEntrega:=Value;
end;

procedure TItemOcorrencia.setCdDistrito(const Value: integer);
begin
  FCdDistrito:=Value;
end;

procedure TItemOcorrencia.setCdEmpresa(const Value: integer);
begin
  FCdEmpresa:=Value;
end;

procedure TItemOcorrencia.setCdGerenteSolucionador(const Value: integer);
begin
  FCdGerenteSolucionador:=Value;
end;

procedure TItemOcorrencia.setcdMotivoCancelamento(const Value: integer);
begin
  FcdMotivoCancelamento := Value;
end;

procedure TItemOcorrencia.setcdOperadorLogistico(const Value: integer);
begin
  FCdOperadorLogistico:=Value;
end;

procedure TItemOcorrencia.setCdOrigemPedido(const Value: integer);
begin
  FCdOrigemPedido:=Value;
end;

procedure TItemOcorrencia.setCdProduto(const Value: integer);
begin
  FCdProduto:=Value;
end;

procedure TItemOcorrencia.setCdSetor(const Value: integer);
begin
  FCdSetor:=Value;
end;

procedure TItemOcorrencia.setCdSituacaoEmbalagem(const Value: integer);
begin
  FCdSituacaoEmbalagem:=Value;
end;

procedure TItemOcorrencia.setCdSolucionador(const Value: integer);
begin
  FCdSolucionador:=Value;
end;

procedure TItemOcorrencia.setCdStatusCausa(const Value: integer);
begin
  FCdStatusCausa:=Value;
end;

procedure TItemOcorrencia.setCdStatusSolucao(const Value: integer);
begin
  FCdStatusSolucao:=Value;
end;

procedure TItemOcorrencia.setCdSubTipoOcorrencia(const Value: integer);
begin
  FCdSubTipoOcorrencia:=Value;
end;

procedure TItemOcorrencia.setCdTipoOcorrencia(const Value: integer);
begin
  FCdTipoOcorrencia:=Value;
end;

procedure TItemOcorrencia.setCdTipoProduto(const Value: integer);
begin
  FCdTipoProduto:=Value;

  { carrega a descrição do tipo da mercadoria }
  carregarTipoProduto;
end;

procedure TItemOcorrencia.setCdTransportador(const Value: integer);
begin
  FCdTransportador:=Value;
end;

procedure TItemOcorrencia.setCfop(const Value: integer);
begin
  FCfop:=Value;
end;

procedure TItemOcorrencia.setCst(const Value: string);
begin
  FCst:=Value;
end;

procedure TItemOcorrencia.setDataEmissao(const Value: TDate);
begin
  FDataEmissao:=Value;
end;

procedure TItemOcorrencia.setDataLimite(const Value: TDate);
begin
  FDataLimite:=Value;
end;

procedure TItemOcorrencia.setDataValidadeProduto(const Value: TDate);
begin
  FDataValidadeProduto:=Value;

  { calcula periodo entre a emissao da nfe e a validade do lote }
  calcularPeriodoValidade;
end;

procedure TItemOcorrencia.setDescricaoOcorrencia(const Value: WideString);
begin
  FDescricaoOcorrencia:=Value;
end;

procedure TItemOcorrencia.setDigitoProduto(const Value: integer);
begin
  FDigitoProduto:=Value;
end;

procedure TItemOcorrencia.setDsAreaOrigem(const Value: string);
begin
  FDsAreaOrigem:=trim(Value);
end;

procedure TItemOcorrencia.setdsDigitadorPedido(const Value: string);
begin
  FDsDigitadorPedido:=Trim(Value);
end;

procedure TItemOcorrencia.setDsMotivoCancelamento(const Value: WideString);
begin
  FDsMotivoCancelamento:=Value;
end;

procedure TItemOcorrencia.setDsOrigemPedido(const Value: string);
begin
  FDsOrigemPedido:=trim(Value);
end;

procedure TItemOcorrencia.setDsProduto(const Value: string);
begin
  FDsProduto:=trim(Value);
end;

procedure TItemOcorrencia.setDsSituacaoEmbalagem(const Value: string);
begin
  FDsSituacaoEmbalagem:=trim(Value);
end;

procedure TItemOcorrencia.setDsStatusCausa(const Value: string);
begin
  FDsStatusCausa:=trim(Value);
end;

procedure TItemOcorrencia.setDsStatusSolucao(const Value: string);
begin
  FDsStatusSolucao:=trim(Value);
end;

procedure TItemOcorrencia.setDsSubTipoOcorrencia(const Value: string);
begin
  FDsSubTipoOcorrencia:=trim(Value);
end;

procedure TItemOcorrencia.setDsTipoOcorrencia(const Value: string);
begin
  FDsTipoOcorrencia:=trim(Value);
end;

procedure TItemOcorrencia.setDsTipoProduto(const Value: string);
begin
  FDsTipoProduto:=trim(Value);
end;

procedure TItemOcorrencia.setDsTransbordoCarga(const Value: WideString);
begin
  FDsTransbordoCarga:=UpperCase(Value);
end;

procedure TItemOcorrencia.setIdAlertarRegistroForaDoPrazo(const Value: Boolean);
begin
  FIdAlertarRegistroForaDoPrazo:=Value;
end;

procedure TItemOcorrencia.setIdEmissaoDentroPrazo48Horas(const Value: Boolean);
begin
  FIdEmissaoDentroPrazo48Horas:=Value;
end;

procedure TItemOcorrencia.setIdEmpresaNFe(const Value: integer);
begin
  FIdEmpresaNFe:=Value;
end;

procedure TItemOcorrencia.setIdEnviarMensagemProdutoTermolabil(
  const Value: Boolean);
begin
  FIdEnviarMensagemProdutoTermolabil:=Value;
end;

procedure TItemOcorrencia.setIdNecessitaOrdemDeColeta(const Value: Boolean);
begin
  FIdNecessitaOrdemDeColeta:=Value;
end;

procedure TItemOcorrencia.setIdRecolherMercadoria(const Value: Boolean);
begin
  FIdRecolherMercadoria:=Value;
end;

procedure TItemOcorrencia.setIdSolucionadorGAM(const Value: Boolean);
begin
  FIdSolucionadorGAM:=Value;
end;

procedure TItemOcorrencia.setitem(const Value: integer);
begin
  FSequencia:=Value;
end;

procedure TItemOcorrencia.setLote(const Value: string);
begin
  FLote:=trim(Value);
end;

procedure TItemOcorrencia.setNomeGerenteSolucionador(const Value: string);
begin
  FNomeGerenteSolucionador:=Trim(Value);
end;

procedure TItemOcorrencia.setNomeRépresentante(const Value: string);
begin
  FNomeRepresentante:=Trim(Value);
end;

procedure TItemOcorrencia.setNomeSolucionador(const Value: string);
begin
  FNomeSolucionador:=trim(Value);
end;

procedure TItemOcorrencia.setNomeTransportador(const Value: string);
begin
  FNomeTransportador:=trim(Value);
end;

procedure TItemOcorrencia.setNrMatriculaGerenteRepresentante(
  const Value: integer);
begin
  FNrMatriculaGerenteRepresentante:=Value;
end;

procedure TItemOcorrencia.setNrMatriculaRepresentante(const Value: integer);
begin
  FNrMatriculaRepresentante:=Value;
end;

procedure TItemOcorrencia.setNrNFe(const Value: integer);
begin
  FNrNFe:=Value;
end;

procedure TItemOcorrencia.setNrNFeControle(const Value: integer);
begin
  FNrNFeControle:=Value;
end;

procedure TItemOcorrencia.setNrSerieNFe(const Value: integer);
begin
  FNrSerieNFe:=Value;
end;

procedure TItemOcorrencia.setPrazoValidade(const Value: integer);
begin
  FPrazoValidade:=Value;
end;

procedure TItemOcorrencia.setQuantDiasPrazoSolucao(const Value: integer);
begin
 FQuantDiasPrazoSolucao:=Value;
end;

procedure TItemOcorrencia.setQuantProduto(const Value: integer);
begin
  FQuantProduto:=Value;
end;

procedure TItemOcorrencia.setVlrUnitarioBcIcms(const Value: Double);
begin
  FVlrUnitarioBcIcms:=Value;
end;

procedure TItemOcorrencia.setVlrUnitarioBcST(const Value: Double);
begin
  FVlrUnitarioBcST:=Value;
end;

procedure TItemOcorrencia.setVlrUnitarioIcms(const Value: Double);
begin
  FVlrUnitarioIcms:=Value;
end;

procedure TItemOcorrencia.setVlrUnitarioMercadoria(const Value: Double);
begin
  FVlrUnitarioMercadoria:=Value;
end;

procedure TItemOcorrencia.setVlrUnitarioST(const Value: Double);
begin
  FVlrUnitarioST:=Value;
end;

{ TConsultaOcorrencia }

procedure TConsultaOcorrencia.limparDados;
begin
  cdCliente:=0;
  cdOcorrencia:=0;
  nrNFe:=0;
  cdSetor:=0;
  cdStatusSolucao:=0;
  cdStatusCausa:=0;
  dsDataRegistro:='';
  dsNomeArquivo:='';
end;

{ TSolucaoItem }

constructor TSolucaoItem.create;
begin
  inherited;

  limparDados;
end;

destructor TSolucaoItem.destroy;
begin

  inherited;
end;

procedure TSolucaoItem.free;
begin
  inherited free;
end;

function TSolucaoItem.getCdConferente: integer;
begin
  Result:=FCdConferente;
end;

function TSolucaoItem.getCdSituacaoEmbalagem: integer;
begin
  Result:=FCdSituacaoEmbalagem;
end;

function TSolucaoItem.getCdTipoSolucao: integer;
begin
  Result:=FCdTipoSolucao;
end;

function TSolucaoItem.getDataSolucao: TDate;
begin
  Result:=FDataSolucao;
end;

function TSolucaoItem.getDsSituacaoEmbalagem: string;
begin
  Result:=FDsSituacaoEmbalagem;
end;

function TSolucaoItem.getdsSolucao: string;
begin
  Result:=FDsSolucao;
end;

function TSolucaoItem.getDsTipoSolucao: string;
begin
  Result:=FDsTipoSolucao;
end;

function TSolucaoItem.getDsTransporte: string;
begin
  Result:=FDsTransporte;
end;

function TSolucaoItem.getIdContagemEstoque: Boolean;
begin
  Result:=FIdContagemEstoque;
end;

function TSolucaoItem.getCdSituacaoEstoque: integer;
begin
  Result:=FCdSituacaoEstoque;
end;

function TSolucaoItem.getIdFilmagem: Boolean;
begin
  Result:=FIdFilmagem;
end;

function TSolucaoItem.getIdFilmagemVisivel: Boolean;
begin
  Result:=FIdFilmagemVisivel;
end;

function TSolucaoItem.getIdGravacaoCorreta: string;
begin
  Result:=FIdGravacaoCorreta;
end;

function TSolucaoItem.getIdGravacaoTlv: Boolean;
begin
  Result:=FIdGravacaoTlv;
end;

function TSolucaoItem.getIdRecolherMercadoria: string;
begin
  Result:=FIdRecolherMercadoria;
end;

function TSolucaoItem.getNrCamera: integer;
begin
  Result:=FNrCamera;
end;

procedure TSolucaoItem.limparDados;
begin
  cdSubTipoSolucao:=0;
  dsSubTipoSolucao:='';
  dsSolucao:=' ';
  idFilmagem:=False;
  idFilmagemVisivel:=False;
  nrCamera:=0;
  cdConferente:=0;
  idContagemEstoque:=False;
  cdSituacaoEstoque:=0;
  idGravacaoTlv:=False;
  idGravacaoCorreta:='0';
  dataSolucao:=StrToDate(DATA_FUTURA_PADRAO);
  dsTransporte:='Z';
  cdSituacaoEmbalagem:=0;
  dsSituacaoEmbalagem:='';
  idRecolherMercadoria:='N';
end;

procedure TSolucaoItem.setCdConferente(const Value: integer);
begin
  FCdConferente:=Value;
end;

procedure TSolucaoItem.setCdSituacaoEmbalagem(const Value: integer);
begin
  FCdSituacaoEmbalagem:=Value;
end;

procedure TSolucaoItem.setCdTipoSolucao(const Value: integer);
begin
  FCdTipoSolucao:=Value;
end;

procedure TSolucaoItem.setDataSolucao(const Value: TDate);
begin
  FDataSolucao:=Value;
end;

procedure TSolucaoItem.setDsSituacaoEmbalagem(const Value: string);
begin
  FDsSituacaoEmbalagem:=Trim(Value);
end;

procedure TSolucaoItem.setDsSolucao(const Value: string);
begin
  FDsSolucao:=Value;
end;

procedure TSolucaoItem.setDsTipoSolucao(const Value: string);
begin
  FDsTipoSolucao:=trim(Value);
end;

procedure TSolucaoItem.setDsTransporte(const Value: string);
begin
  FDsTransporte:=trim(Value);
end;

procedure TSolucaoItem.setIdContagemEstoque(const Value: Boolean);
begin
  FIdContagemEstoque:=Value;
end;

procedure TSolucaoItem.setCdSituacaoEstoque(const Value: integer);
begin
  FCdSituacaoEstoque:=Value;
end;

procedure TSolucaoItem.setIdFilmagem(const Value: Boolean);
begin
  FIdFilmagem:=Value;
end;

procedure TSolucaoItem.setIdFilmagemVisivel(const Value: Boolean);
begin
  FIdFilmagemVisivel:=Value;
end;

procedure TSolucaoItem.setIdGravacaoCorreta(const Value: string);
begin
  FIdGravacaoCorreta:=Value;
end;

procedure TSolucaoItem.setIdGravacaoTlv(const Value: Boolean);
begin
  FIdGravacaoTlv:=Value;
end;

procedure TSolucaoItem.setIdRecolherMercadoria(const Value: string);
begin
  FIdRecolherMercadoria:=UpperCase(Value);
end;

procedure TSolucaoItem.setNrCamera(const Value: integer);
begin
  FNrCamera:=Value;
end;

{ TCausaItem }

constructor TCausaItem.create;
begin
  inherited;
end;

destructor TCausaItem.destroy;
begin
  inherited Destroy;
end;

procedure TCausaItem.free;
begin
  inherited free;
end;

function TCausaItem.getCdSubTipoCausa: integer;
begin
  Result:=FCdSubTipoCausa;
end;

function TCausaItem.getDsAcaoTomada: string;
begin
  Result:=FDsAcaoTomada;
end;

function TCausaItem.getDsCausa: string;
begin
  Result:=FDsCausa;
end;

function TCausaItem.getDataCausa: TDate;
begin
  Result:=FDataCausa;
end;

function TCausaItem.getDsSubTipoCausa: string;
begin
  Result:=FDsSubTipoCausa;
end;

function TCausaItem.getDsTransporte: string;
begin
  Result:=FDsTransporte;
end;

procedure TCausaItem.limparDados;
begin
  cdSubTipoCausa:=0;
  dsSubTipoCausa:='';
  dsTransporte:='Z';
  dsCausa:=' ';
  dataCausa:=StrToDate(DATA_FUTURA_PADRAO);
  dsAcaoTomada:=' ';
end;

procedure TCausaItem.setCdSubTipoCausa(const Value: integer);
begin
  FCdSubTipoCausa:=Value;
end;

procedure TCausaItem.setDsAcaoTomada(const Value: string);
begin
  FDsAcaoTomada:=Value;
end;

procedure TCausaItem.setDsCausa(const Value: string);
begin
  FDsCausa:=Value;
end;

procedure TCausaItem.setDataCausa(const Value: TDate);
begin
  FDataCausa:=Value;
end;

procedure TCausaItem.setDsSubTipoCausa(const Value: string);
begin
  FDsSubTipoCausa:=Value;
end;

procedure TCausaItem.setDsTransporte(const Value: string);
begin
  FDsTransporte:=Value;
end;

{ TRecorrencia }

procedure TRecorrencia.limparDados;
begin
  cdOcorrencia:=0;
  cdItem:=0;
  cdRecorrencia:=0;
  descRecorrencia:='';
  idTipoRecorrencia:='';
  dataRecorrencia:=StrToDate(DATA_FUTURA_PADRAO);
  dataLimiteSolucao:=StrToDate(DATA_FUTURA_PADRAO);
  isRegistrarPendentes:=False;
end;

{ TContatoEmail }

procedure TContatoEmail.limparDados;
begin
  dsEmailSolucionador:='';
  dsEmailSupervisor:='';
  dsEmailRepresentante:='';
  dsEmailCoordenador:='';
  dsEmailCopia:='';
  dsEmailCopiaExtra:='';
end;

{ TDadosMensagem }

procedure TDadosMensagem.limparDados;
var
  i: integer;
begin
  emailDestinatario:='';
  listaEmailCopia:='';
  dsTipoOcorrencia:='';
  dsSubTipoOcorrencia:='';
  dsSolucionador:='';
  dsProduto:='';
  nrNFe:='';
  dataEmissaoNFe:='';
  dsObservacao:='';
  isEnviarMensagemRecolhimentoMercadoria:=False;
  isEnviarMensagemForaPrazoRegistro:=False;
  isEnviarMensagemProdutoTermolabil:=False;
end;

{ TSolucaoPendente }

procedure TSolucaoPendente.limparDados;
begin
  cdOcorrencia:=0;
  emailDoSolucionador:='';
  dataRegistro:=Date;
  dataLimiteSolucao:=Date;
end;

{ TRecallLote }

procedure TRecallLote.limparDados;
begin
  cdRecall:=0;
  dtAvisoRecall:=Date;
  dtRetornoFabricRecall:=Date;
  dsMotivoRecall:='';
  nmUsuarioRegistro:='';
  dtRegistro:=Date;
end;

end.

