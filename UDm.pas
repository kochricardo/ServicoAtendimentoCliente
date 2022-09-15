unit UDm;

interface

uses
  SysUtils, Classes, DBXOracle, DB, SqlExpr, UtilConexao, DBClient, SimpleDS,
  DBXCommon,UTelefoneAtendimento, UParametroSistema, UDadosCliente, UDadosOcorrencia,
  UUtils, UUsuario, UMsgPadrao, USendEmail, RpRender, RpRenderPDF, RpDefine,
  RpBase, RpSystem, UTelaSistema, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, TConnect, FMTBcd, Provider;

type
  TDM = class(TDataModule)
    conexaoProducao: TSQLConnection;
    conexaoHistorico: TSQLConnection;
    sqlConsultaFilaLigacao: TSimpleDataSet;
    dsConsultaFilaLigacao: TDataSource;
    sqlConsultaFilaLigacaoID: TFMTBCDField;
    sqlConsultaFilaLigacaoTELEFONE: TWideStringField;
    sqlConsultaFilaLigacaoHORARIO: TSQLTimeStampField;
    sqlConsultaFilaLigacaoCODIGO: TWideStringField;
    sqlConsultaFilaLigacaoRAZAO_SOCIAL: TWideStringField;
    sqlControleLigacao: TSimpleDataSet;
    dsControleLigacao: TDataSource;
    sqlControleLigacaoDS_TIPO_ATENDIMENTO: TWideStringField;
    sqlControleLigacaoTOTAL: TFMTBCDField;
    sqlConsultaCliente: TSimpleDataSet;
    sqlConsultaClienteNROC_C: TFMTBCDField;
    sqlConsultaClienteDIGC_C: TFMTBCDField;
    sqlConsultaClienteNOMP_P: TWideStringField;
    sqlConsultaClienteMUNP_P: TWideStringField;
    sqlConsultaClienteUFEP_P: TWideStringField;
    sqlConsultaClienteDUCC_C: TSQLTimeStampField;
    sqlConsultaClienteDVAP_P: TSQLTimeStampField;
    sqlConsultaClienteNROV_C: TFMTBCDField;
    sqlConsultaClienteID_SITUACAO_CLIENTE: TWideStringField;
    sqlConsultaClienteCGCP_P: TFMTBCDField;
    sqlConsultaClienteNOMV_V: TWideStringField;
    sqlConsultaClienteENDP_P: TWideStringField;
    sqlConsultaClienteDS_EMAIL_NFE_PRINCIPAL: TWideStringField;
    sqlConsultaClienteDS_EMAIL_NFE_COPIA: TWideStringField;
    sqlConsultaClienteTIPC_C: TFMTBCDField;
    sqlConsultaClienteDISTRITO: TFMTBCDField;
    dsConsultaCliente: TDataSource;
    dsOcorrencia: TDataSource;
    cdsItemOcorrencia: TClientDataSet;
    dsItemOcorrencia: TDataSource;
    cdsItemOcorrencianrSequencia: TIntegerField;
    cdsItemOcorrenciacdEmpresa: TIntegerField;
    cdsItemOcorrencianrNFe: TIntegerField;
    cdsItemOcorrencianrSerieNFe: TIntegerField;
    cdsItemOcorrenciadataEmissao: TDateField;
    cdsItemOcorrenciacdOrigemPedido: TIntegerField;
    cdsItemOcorrenciadsOrigemPedido: TStringField;
    cdsItemOcorrenciacdProduto: TIntegerField;
    cdsItemOcorrenciadsProduto: TStringField;
    cdsItemOcorrenciaquantProduto: TIntegerField;
    cdsItemOcorrenciacdTipoProduto: TIntegerField;
    cdsItemOcorrenciadsTipoProduto: TStringField;
    cdsItemOcorrenciadataValidadeProduto: TDateField;
    cdsItemOcorrenciaprazoValidade: TIntegerField;
    cdsItemOcorrenciacdSituacaoEmbalagem: TIntegerField;
    cdsItemOcorrenciadsSituacaoEmbalagem: TStringField;
    cdsItemOcorrenciacdTipoOcorrencia: TIntegerField;
    cdsItemOcorrenciadsTipoOcorrencia: TStringField;
    cdsItemOcorrenciacdSubTipoOcorrencia: TIntegerField;
    cdsItemOcorrenciadsSubTipoOcorrencia: TStringField;
    cdsItemOcorrenciadescricaoOcorrencia: TWideStringField;
    cdsItemOcorrenciacdSolucionador: TIntegerField;
    cdsItemOcorrencianomeSolucionador: TStringField;
    cdsItemOcorrenciacdGerenteSolucionador: TIntegerField;
    cdsItemOcorrencianrMatriculaRepresentante: TIntegerField;
    cdsItemOcorrencianrMatriculaGerenteRepresentante: TIntegerField;
    cdsItemOcorrenciacdSetor: TIntegerField;
    cdsItemOcorrenciacdDistrito: TIntegerField;
    cdsItemOcorrenciacdTransportador: TIntegerField;
    cdsItemOcorrencianomeTransportador: TStringField;
    cdsItemOcorrenciadsTransbordoCarga: TWideStringField;
    cdsItemOcorrenciacdStatusSolucao: TIntegerField;
    cdsItemOcorrenciadsStatusSolucao: TStringField;
    cdsItemOcorrenciacdStatusCausa: TIntegerField;
    cdsItemOcorrenciadsStatusCausa: TStringField;
    cdsItemOcorrenciadataLimite: TDateField;
    cdsItemOcorrenciacdAreaOrigem: TIntegerField;
    cdsItemOcorrenciadsAreaOrigem: TStringField;
    cdsOcorrencia: TClientDataSet;
    cdsOcorrenciacdOcorrencia: TIntegerField;
    cdsOcorrenciacdEmpresa: TIntegerField;
    cdsOcorrenciacdCliente: TIntegerField;
    cdsOcorrenciacdUsuario: TIntegerField;
    cdsOcorrenciacdPrioridade: TIntegerField;
    cdsOcorrenciadataLimite: TDateField;
    cdsOcorrenciacdStatusSolucao: TIntegerField;
    cdsOcorrenciaidItem: TDataSetField;
    sqlConsultaClienteCD_EMPRESA_ESTOQUE: TFMTBCDField;
    cdsOcorrenciacdStatusCausa: TIntegerField;
    sqlConsultaPedido: TSimpleDataSet;
    sqlConsultaNFe: TSimpleDataSet;
    sqlConsultaDuplicata: TSimpleDataSet;
    dsGenerica: TDataSource;
    sqlItemNFe_PedidoCompra: TSimpleDataSet;
    dsItemNFe: TDataSource;
    cdsTipoOcorrencia: TClientDataSet;
    dsTipoOcorrencia: TDataSource;
    cdsTipoOcorrenciaCD_TIPO_OCORRENCIA: TIntegerField;
    cdsTipoOcorrenciaNM_TIPO_OCORRENCIA: TStringField;
    cdsTipoOcorrenciaID_CAUSA: TStringField;
    cdsTipoOcorrenciaID_FILMAGEM: TStringField;
    cdsTipoOcorrenciaID_ESTOQUE: TStringField;
    cdsSubTipoOcorrencia: TClientDataSet;
    dsSubTipoOcorrencia: TDataSource;
    cdsSubTipoOcorrenciaCD_TIPO_OCORRENCIA: TIntegerField;
    cdsSubTipoOcorrenciaCD_SUBTIPO_OCORRENCIA: TIntegerField;
    cdsSubTipoOcorrenciaNM_SUBTIPO_OCORRENCIA: TStringField;
    cdsSituacaoEmbalagem: TClientDataSet;
    dsSituacaoEmbalagem: TDataSource;
    cdsSituacaoEmbalagemCD_SITUACAO_EMBALAGEM: TIntegerField;
    cdsSituacaoEmbalagemDS_SITUACAO_EMBALAGEM: TStringField;
    dsSolucionador: TDataSource;
    cdsSolucionador: TClientDataSet;
    cdsSolucionadorNR_MATRIC_SOLUCIONADOR: TIntegerField;
    cdsSolucionadorNM_SOLUCIONADOR: TStringField;
    cdsSolucionadorCD_DEPTO: TIntegerField;
    cdsSolucionadorDS_DEPTO: TStringField;
    cdsSolucionadorCD_GERENTE_AREA: TIntegerField;
    cdsSolucionadorNM_GERENTE_AREA: TStringField;
    cdsSolucionadorQTD_DIAS_SOLUCAO: TIntegerField;
    cdsOcorrenciadsContato: TStringField;
    cdsSolucionadorCD_GERENTE_DEPTO: TIntegerField;
    cdsSolucionadorNM_GERENTE_DEPTO: TStringField;
    cdsStatusSolucao: TClientDataSet;
    dsStatusSolucao: TDataSource;
    cdsStatusSolucaoCD_STATUS_OCORRENCIA: TIntegerField;
    cdsStatusSolucaoNM_STATUS_OCORRENCIA: TStringField;
    cdsStatusCausa: TClientDataSet;
    dsStatusCausa: TDataSource;
    cdsStatusCausaCD_ST_CAUSA: TIntegerField;
    cdsStatusCausaNM_ST_CAUSA: TStringField;
    sqlConsultaOcorrencia: TSimpleDataSet;
    dsConsultaOcorrencia: TDataSource;
    cdsSolucaoItem: TClientDataSet;
    dsSolucaoItem: TDataSource;
    cdsItemOcorrenciaIdSolucao: TDataSetField;
    cdsSolucaoItemcdOcorrencia: TIntegerField;
    cdsSolucaoItemcdItemOcorrencia: TIntegerField;
    cdsSolucaoItemcdSubTipoCausa: TIntegerField;
    cdsSolucaoItemcdSubTipoSolucao: TIntegerField;
    cdsSolucaoItemdsSubTipoCausaItemOcorrencia: TStringField;
    cdsSolucaoItemdsSubTipoSolucaoItemOcorrencia: TStringField;
    cdsSolucaoItemnrCamera: TIntegerField;
    cdsSolucaoItemcdConferente: TIntegerField;
    cdsSolucaoItemdsTranspRespSolucao: TStringField;
    cdsSolucaoItemcdSituacaoEmbalagem: TIntegerField;
    cdsSolucaoItemdataRegistroCausa: TDateField;
    cdsSolucaoItemdataRegistroSolucao: TDateField;
    cdsSolucaoItemdsTranspRespCausa: TStringField;
    cdsSolucaoItemidFilamgem: TBooleanField;
    cdsSolucaoItemidImagemVisivel: TBooleanField;
    cdsSolucaoItemidContagemEstoque: TBooleanField;
    cdsSolucaoItemidEscutaGravacaoTlv: TBooleanField;
    cdsSolucaoItemidResultadoGravacaoTlv: TBooleanField;
    cdsSolucaoItemnomeConferente: TStringField;
    cdsSolucaoItemdsSituacaoEmbalagem: TStringField;
    cdsSolucaoItemdsSolucaoItemOcorrencia: TMemoField;
    cdsSolucaoItemdsCausaItem: TMemoField;
    cdsSolucaoItemdsAcaoCausa: TMemoField;
    cdsOcorrenciarazaoSocial: TStringField;
    cdsOcorrenciadsPrioridade: TStringField;
    cdsOcorrenciadsStatusSolucao: TStringField;
    cdsOcorrenciadsStatusCausa: TStringField;
    cdsOcorrenciadescricao: TMemoField;
    cdsItemOcorrenciadsLoteProduto: TStringField;
    cdsOcorrenciacodigoDigito: TIntegerField;
    cdsSolucao: TClientDataSet;
    dsSolucao: TDataSource;
    cdsSolucaoCD_SOLUCAO: TIntegerField;
    cdsSolucaoDS_SOLUCAO: TStringField;
    cdsSolucaoCD_SUBTIPO_SOLUCAO: TIntegerField;
    cdsSolucaoCD_TIPO_OCORRENCIA: TIntegerField;
    cdsSolucaoCD_SUBTIPO_OCORRENCIA: TIntegerField;
    cdsSolucaoID_CAUSA: TBooleanField;
    cdsSolucaoID_FILMAGEM: TBooleanField;
    cdsSolucaoID_ESTOQUE: TBooleanField;
    cdsSolucaoID_TELEVENDAS: TBooleanField;
    cdsOcorrenciadataRegistro: TDateTimeField;
    dsCausa: TDataSource;
    cdsCausa: TClientDataSet;
    cdsCausaCD_CAUSA: TIntegerField;
    cdsCausaDS_CAUSA: TStringField;
    cdsCausaCD_SUBTIPO_CAUSA: TIntegerField;
    cdsCausaCD_TIPO_OCORRENCIA: TIntegerField;
    cdsCausaCD_SUBTIPO_OCORRENCIA: TIntegerField;
    cdsTipoOcorrenciaCD_DEPTO_PADRAO: TIntegerField;
    cdsSolucaoID_TRANSP_RESPONSAVEL: TBooleanField;
    cdsSolucaoID_EMBALAGEM: TBooleanField;
    cdsSolucaoID_SUBTIPO_OCORRENCIA: TBooleanField;
    cdsTipoOcorrenciaID_TELEVENDAS: TStringField;
    cdsTipoOcorrenciaID_TRANSP_RESPONSAVEL: TStringField;
    cdsTipoOcorrenciaID_EMBALAGEM: TStringField;
    cdsTipoOcorrenciaID_SUBTIPO_OCORRENCIA: TStringField;
    cdsSolucaoItemcdSituacaoEstoque: TIntegerField;
    cdsSolucaoItemdsSituacaoEstoque: TStringField;
    cdsItemOcorrencianmGerenteSolucionador: TStringField;
    cdsItemOcorrencianomeRepresentante: TStringField;
    sqlGenericaCadastro: TSimpleDataSet;
    dsGenericaCadastro: TDataSource;
    cdsListaSolucao: TClientDataSet;
    dsListaSolucao: TDataSource;
    dsListaCausa: TDataSource;
    cdsListaCausa: TClientDataSet;
    cdsListaCausaCD_CAUSA: TIntegerField;
    cdsListaCausaDS_CAUSA: TStringField;
    cdsListaSolucaoCD_SOLUCAO: TIntegerField;
    cdsListaSolucaoDS_SOLUCAO: TStringField;
    cdsListaDepartamento: TClientDataSet;
    dsListaDepartamento: TDataSource;
    cdsListaDepartamentoCD_DEPTO: TIntegerField;
    cdsListaDepartamentoDS_DEPTO: TStringField;
    cdsListaDepartamentoNR_MATRIC_GERENTE_DEPTO: TIntegerField;
    cdsListaUsuario: TClientDataSet;
    dsListaUsuario: TDataSource;
    cdsListaUsuarioNR_MATRICULA: TIntegerField;
    cdsListaUsuarioNM_USUARIO: TStringField;
    cdsListaUsuarioCD_FUNCAO: TIntegerField;
    cdsListaUsuarioCD_EMPRESA: TIntegerField;
    cdsListaUsuarioNM_FUNCAO: TStringField;
    dsListaAreaDepto: TDataSource;
    cdsListaAreaDepto: TClientDataSet;
    cdsListaAreaDeptoCD_AREA_DEPTO: TIntegerField;
    cdsListaAreaDeptoCD_DEPTO: TIntegerField;
    cdsListaAreaDeptoDS_AREA_DEPTO: TStringField;
    cdsListaAreaDeptoQTD_DIAS_SOLUCAO: TIntegerField;
    cdsListaAreaDeptoNR_MATRIC_GERENTE_AREA: TIntegerField;
    dsRecorrenciaItem: TDataSource;
    cdsRecorrenciaItem: TClientDataSet;
    cdsRecorrenciaItemCD_RECORRENCIA: TIntegerField;
    cdsRecorrenciaItemDS_RECORRENCIA: TStringField;
    cdsRecorrenciaItemDT_RECORRENCIA: TDateTimeField;
    cdsRecorrenciaItemDS_TIPO_RECORRENCIA: TStringField;
    cdsItemOcorrenciaidRecorrencia: TDataSetField;
    cdsRecorrenciaItemCD_ITEM_OCORRENCIA: TIntegerField;
    sqlListaDeConferente: TSimpleDataSet;
    dsListaConferente: TDataSource;
    sqlListaDeConferenteNR_MATRICULA: TFMTBCDField;
    sqlListaDeConferenteNM_USUARIO: TWideStringField;
    cdsItemOcorrenciadsEmailSolucionador: TStringField;
    cdsItemOcorrenciadsEmailSupervisor: TStringField;
    cdsItemOcorrenciadsEmailRepresentante: TStringField;
    cdsItemOcorrenciadsEmailCoordenador: TStringField;
    cdsSolucionadorDS_EMAIL_SOLUCIONADOR: TStringField;
    cdsSolucionadorDS_EMAIL_GERENTE_AREA: TStringField;
    cdsSolucionadorDS_EMAIL_GERENTE_DEPTO: TStringField;
    cdsItemOcorrenciadsEmailCopia: TStringField;
    cdsItemOcorrenciadsEmailCopiaExtra: TStringField;
    sqlRelatorio: TSimpleDataSet;
    dsRelatorio: TDataSource;
    cdsListaEmpresa: TClientDataSet;
    dsListaEmpresa: TDataSource;
    cdsListaEmpresaCD_EMPRESA: TIntegerField;
    cdsListaEmpresaNM_EMPRESA: TStringField;
    cdsGeradorRelatorio: TClientDataSet;
    cdsGeradorRelatoriodataRegistro: TStringField;
    cdsGeradorRelatoriocdTipoOcorrencia: TIntegerField;
    cdsGeradorRelatoriocdSubTipoOcorrencia: TIntegerField;
    cdsGeradorRelatoriocdSolucao: TIntegerField;
    cdsGeradorRelatoriodsTipoOcorrencia: TStringField;
    cdsGeradorRelatoriodsSubTipoOcorrencia: TStringField;
    cdsGeradorRelatoriodsSolucao: TStringField;
    cdsGeradorRelatoriodsCausa: TStringField;
    cdsGeradorRelatoriocdCausa: TIntegerField;
    cdsGeradorRelatorioidExisteFilmagem: TStringField;
    cdsGeradorRelatorioidFilmagemVisivel: TStringField;
    cdsGeradorRelatorioidConfereEstoque: TStringField;
    cdsGeradorRelatorioidSituacaoEstoque: TStringField;
    cdsGeradorRelatorioidGravacaoTlv: TStringField;
    cdsGeradorRelatorioidAtendimentoCorreto: TStringField;
    sqlListaRedeCliente: TSimpleDataSet;
    dsListaRedeCliente: TDataSource;
    sqlListaRedeClienteCODIGO: TFMTBCDField;
    sqlListaRedeClienteREDE: TWideStringField;
    cdsTipoOcorrenciaID_SOLUCAO: TStringField;
    cdsListaAreaOrigem: TClientDataSet;
    dsListaAreaOrigem: TDataSource;
    cdsListaAreaOrigemCD_AREA_ORIGEM: TIntegerField;
    cdsListaAreaOrigemDS_AREA_ORIGEM: TStringField;
    cdsSolucionadorCD_AREA_ORIGEM: TIntegerField;
    cdsItemOcorrencianrMatriculaGerenteCanal: TIntegerField;
    cdsTipoOcorrenciaID_RECOLHER_MERCADORIA: TStringField;
    cdsItemOcorrenciaidRecolherMercadoria: TBooleanField;
    cdsSolucaoID_RECOLHE_MERCADORIA: TBooleanField;
    cdsItemOcorrenciadigitoProduto: TIntegerField;
    RvSystem: TRvSystem;
    RvRenderPDF: TRvRenderPDF;
    cdsListaGerenteDepto: TClientDataSet;
    cdsListaGerenteDeptoNR_MATRICULA: TIntegerField;
    cdsListaGerenteDeptoNM_GERENTE: TStringField;
    dsListaGerenteDepto: TDataSource;
    cdsListaSupervisorArea: TClientDataSet;
    cdsListaSupervisorAreaNR_MATRICULA: TIntegerField;
    cdsListaSupervisorAreaNM_SUPERVISOR: TStringField;
    dsListaSupervisorArea: TDataSource;
    cdsListaEmailUsuario: TClientDataSet;
    dsListaEmailusuario: TDataSource;
    cdsListaEmailUsuarioNM_USUARIO: TStringField;
    cdsListaEmailUsuarioDS_EMAIL: TStringField;
    sqlConsultaClienteENTREGADOR: TFMTBCDField;
    sqlConsultaClienteETIQUETA: TWideStringField;
    sqlConsultaClienteCD_TRANSPORTADOR: TFMTBCDField;
    sqlListaEntregador: TSimpleDataSet;
    dsListaEntregador: TDataSource;
    cdsSolucionadorCD_EMPRESA: TIntegerField;
    sqlListaEntregadorDS_ETIQUETA: TWideStringField;
    sqlListaEntregadorCD_ENTREGA_CAMINHAO_SECUNDARIO: TFMTBCDField;
    sqlConsultaClienteCANC_C: TFMTBCDField;
    sqlControleLigacaoCD_TIPO_ATENDIMENTO: TFMTBCDField;
    sqlConsultaClienteDS_EMAIL_SAC: TWideStringField;
    sqlConsultaClienteNM_CONTATO_SAC: TWideStringField;
    sqlConsultaClienteNR_TELEFONE: TWideStringField;
    cdsOcorrenciadsEmailCliente: TStringField;
    sqlConsultaClienteDS_LOGRADOURO: TWideStringField;
    sqlConsultaClienteNR_LOGRADOURO: TWideStringField;
    sqlConsultaClienteNM_BAIRRO: TWideStringField;
    sqlConsultaClienteNM_CIDADE: TWideStringField;
    sqlConsultaClienteID_ESTADO: TWideStringField;
    cdsItemOcorrenciaIdAlertarRegistroForaPrazo: TBooleanField;
    sqlConsultaOcorrenciaPrazoExpirado: TSimpleDataSet;
    dsConsultaOcorrenciaPrazoExpirado: TDataSource;
    cdsListaUsuarioNM_USUARIO_MATRICULA: TStringField;
    cdsItemOcorrenciacdOperadorLogistico: TIntegerField;
    cdsItemOcorrenciadsDigitadorPedido: TStringField;
    cdsOcorrenciacdMeioDeContato: TIntegerField;
    cdsItemOcorrenciadsMotivoCancelamento: TStringField;
    cdsItemOcorrencianrOrdemDevolucao: TIntegerField;
    cdsItemOcorrenciadsDetalheDevolucao: TStringField;
    cdsItemOcorrenciadsSituacaoDevolucao: TStringField;
    cdsOcorrenciaidMostrarAvisoDevolucao: TBooleanField;
    cdsOcorrenciaidSituacaoOrdemColeta: TStringField;
    cdsItemOcorrenciaidNecessitaOrdemColeta: TBooleanField;
    cdsSolucaoItemidRecolheMercadoria: TStringField;
    cdsItemOcorrenciaidAlertarProdutoTermolabil: TBooleanField;
    cdsOcorrenciadtEmissaoOrdemDeColeta: TDateTimeField;
    cdsSolucaoID_ACEITE: TStringField;
    cdsOcorrenciaidOcorrenciaIntegral: TBooleanField;
    cdsOcorrenciacdDestinoEmailOrdemDeColeta: TIntegerField;
    cdsOcorrenciadsNomeArquivo: TStringField;
    cdsItemOcorrenciacdClienteEntrega: TIntegerField;
    cdsItemOcorrenciaidSelecionado: TStringField;
    cdsItemOcorrenciaidEmpresaNFe: TIntegerField;
    _IdFTP: TIdFTP;
    cdsItemOcorrenciaCfop: TIntegerField;
    cdsItemOcorrenciacst: TStringField;
    cdsItemOcorrenciavlrUnitarioMercadoria: TFloatField;
    cdsItemOcorrenciavlrUnitarioBcIcms: TFloatField;
    cdsItemOcorrenciavlrUnitarioIcms: TFloatField;
    cdsItemOcorrenciavlrUnitarioBcST: TFloatField;
    cdsItemOcorrenciavlrUnitarioST: TFloatField;
    _LocalConexao: TLocalConnection;
    _sqlGenerica: TSQLQuery;
    _dspGenerica: TDataSetProvider;
    sqlMotivoCancelamento: TSimpleDataSet;
    dsMotivoCancelamento: TDataSource;
    cdsMotivoCancelamento: TClientDataSet;
    cdsMotivoCancelamentoCD_SAC_MOTIVO_CANCELAMENTO: TFMTBCDField;
    cdsMotivoCancelamentoDS_SAC_MOTIVO_CANCELAMENTO: TWideStringField;
    procedure conexaoProducaoAfterConnect(Sender: TObject);
    procedure conexaoHistoricoAfterConnect(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    procedure criarDataSetLocal;
    procedure carregaSituacaoEmbalagem;
    procedure execGravarItemOcorrencia;
    procedure execGravarOcorrencia;
    procedure carregaStatusCausa;
    procedure alterarStatusCausaOcorrenciaLocal(cdStatus: integer);
    procedure alterarStatusCausaItemLocal(cdStatus: integer);
    procedure execConsultaSolucaoItem;
    procedure gravarCausaItemOcorrencia;
    procedure alterarStatusSolucaoOcorrencia(cdStatus: integer;isCancelarOrdemDeEntrega:Boolean;PidSituacaoOrdemColeta:String);
    procedure alterarStatusCausaOcorrencia(cdStatus: integer);
    procedure carregaListaUsuario;
    procedure carregaListaDepartamento;
    procedure execConsultaRecorrenciaItem;
    procedure gravarDestinatarioMensagem(dsDestManual:string; indice: Integer);
    procedure gravarRecorrencia;
    procedure carregarDadosRecorrencia(dsObservacao,idTipoRec:string);
    procedure alterarStatusCausaListaConsultaOcorrencia(cdStatus: integer);
    procedure alterarStatusSolucaoListaConsultaOcorrencia(cdStatus: integer);
    procedure excluirOcorrenciaRegistrada(cdOcorrencia: integer);
    procedure excluirItemOcorrenciaRegistrada(cdOcorrencia: integer);
    procedure gravarDadosSupervisorArea(nrMatricula: integer; dsNome: string);
    procedure gravarDadosGerenteDepto(nrMatricula: integer; dsNome: string);
    function getDadosSolucaoItemExcluido: String;
    procedure gravarListaEmailUsuario(dsNome, dsemail: string);
    procedure alterarTelefoneCliente(cliente: TCliente);
    procedure insertEmailContatoSacCliente(cliente: TCliente);
    procedure alterarEmailSacCliente(cliente: TCliente);
    procedure cancelarItemOcorrenciaRegistrada(cdOcorrencia,nrItem,PcdMotivoCancelamento:integer;
                                               dsMotivoCancelamento:WideString);
    procedure cancelarOcorrenciaRegistrada(cdOcorrencia,pcMotivoCancelamento:integer; dsObservacaoCancelamento: WideString);
    procedure cancelarSolucaoCausaItemOcorrenciaRegistrada(
      cdOcorrencia: integer);
    procedure execConsultarProcessamentoDeDevolucaoDoItem;
    { Private declarations }
  public

    procedure consultarMotivoCancelamento(PnrMotivo: integer);

    procedure reenviarOrdemDeColeta(cdOcorrencia,cdDestinatario :integer; dsEmail:string);
    function getIdNessidadeEmissaoOrdemDeColeta: String;
    function getOcorrenciaRegistradaDaNFe(cdEmpresa,nrNFe,nrSerieNFe,cdMercadoria:integer): integer;
    function isProtocoloGravado(nrProtocolo: integer): Boolean;
    function getEmailDoDestinatario(cdIdenticadorDestinatario,cdTipoDestinatario,cdCategoriaEmail:integer): string;
    procedure marcarMercadoriaComAvisoDeRecall;
    function getInfRegistroDeRecallDoLote(cdMercadoria: integer;
      dsLote: string): TRecallLote;
    procedure execConsultaOcorrenciaComPrazoExpirado;

    procedure alterarStatusLigacaoPorTelefone(ligacao: TFDadosLigacao;
      idStatus: integer);
    procedure excluirRecorrencia;
    procedure consultarAcessoTelaSistema(cdSistema:integer);
    procedure validarPermissaoAcessoSistema(cdSistema: integer);
    procedure consultarLoginUsuario;
    procedure carregaCausaOcorrencia(isAtivarLista:Boolean;dsTipoOcorrencia,dsSubTipoOcorrencia,dsCausa:string);
    procedure carregaSolucaoOcorrencia(isAtivarLista:Boolean;dsTipoOcorrencia,dsSubTipoOcorrencia,dsSolucao:string);


    procedure cadastrarMotivoCancelamento(PcdMotivo: integer; PDescricaoMotivo, PUsuario: string);

    procedure carregarListaDeEntregador(cdSetor: string);
    procedure gerarRelatorioListaSolucaoCadastrada(cdTipoOc,
      cdSubTipoOc: integer);
    procedure gerarRelatorioListaCausaCadastrada(cdTipoOc,
      cdSubTipoOc: integer);

    function getEmailExtra(nomeSolucionador: string): string;

    function isExisteTabela(dsTabela: string): Boolean;
    procedure gravarLogProcesso(dsTabela,dsInformacaoAnterior,dsAlteracao: string);

    procedure iniciarListaSupervisorArea;
    procedure iniciarListaGerente;

    procedure excluirSolucaoCausaItemOcorrenciaRegistrada(cdOcorrencia,
      cdItem: integer);
    procedure execReAbrirOcorrencia(isTodosItem: Boolean);

    procedure execCancelarOcorrenciaRegistrada(cdOcorrencia,
                                               nrItem,PcdMotivoCancelamento: integer;
                                               dsObservacaoCancelamento: WideString);
    procedure execExcluirOcorrenciaRegistrada(cdOcorrencia:integer);
    function getVersaoSistema: string;

    procedure gerarRelatorioDeRecorrencia(dataInicial,dataFinal: TDate);

    function getCNPJCliente(cdCliente: integer): string;
    procedure execAlterarSolucionadorItemOcorrencia;
    procedure gravarNovoSolucionadorItemOcorrenciaLocal(
      itemOcorrencia: TItemOcorrencia);

    function getCodigoSubTipoCausaFixa(cdTipoOcorrencia,
      cdSubTipoOcorrencia: string): integer;
    function getCodigoSubTipoSolucaoFixa(cdTipoOcorrencia,
      cdSubTipoOcorrencia: string): integer;
    function getMatriculaGerenteArea(nrMatricSetor: string): integer;
    procedure carregaListaAreaDeOrigem;
    procedure carregarListaRedeCliente(isAtivar:Boolean);
    procedure ordenarDadosRelatorio(idOrdenacao: integer);
    procedure carregarDataSetGeradorRelatorio;
    procedure carregaListaCausa(isAtivarLista:Boolean);
    procedure carregaListaSolucao(isAtivarLista:Boolean);
    procedure carregaSubTipoOcorrencia(isAtivarLista:Boolean;dsTipoOcorrencia:string);
    procedure carregaTipoOcorrencia(isAtivarLista:Boolean);
    procedure carregaStatusSolucao(isAtivarLista:Boolean);
    procedure carregaListaAreaDepartamento(isAtivarLista:Boolean);
    procedure carregaSolucionador(isAtivarLista:Boolean);
    procedure carregarListaEmpresa(isAtivarLista:Boolean);

    procedure enviarEmailDeCancelamentoOcorrencia;
    procedure enviarEmailRecorrencia;
    procedure enviarEmailOcorrencia(isEnviarItemAtual,isOcorrenciaIntegral:Boolean; dsDestManual:string);
    procedure cadastrarRecorrencia(dsObservacao,idTipoRec:string);

    procedure excluirItemOcorrencia;
    procedure reprocessarSequenciaItemOcorrencia;

    procedure excluirDadosSolucionador(nrMatricula: integer);
    procedure alterarDadosSolucionador(nrMatricula, cdDepto,
      cdAreaDepto: integer; dsEmail, idSituacao: string);
    procedure cadastrarSolucionador(nrMatricula, cdDepto, cdAreaDepto: integer;
      nomeSolucionador, dsEmail, idSituacao: string);

    procedure excluirDadosAreaDepartamento(cdAreaDepto: integer);
    procedure alterarDadosAreaDepartamento(cdAreaDepto, prazoSolucao, cdDepto,
      nrMatriculaSupervisor,cdAreaOrigem: integer; descAreaDepto: string);
    procedure cadastrarAreaDepartamento(cdAreaDepto, prazoSolucao, cdDepto,
      nrMatriculaSupervisor,cdAreaOrigem: integer; descAreaDepto: string);

    procedure excluirDadosDepartamento(cdDepto: integer);
    procedure alterarDadosDepartamento(cdDepto, nrMatriculaGerente : integer;
      descDepto: string);

    procedure AlterarMotivoCancelamento(PcdMotivo:integer;PDescricaoMotivo,PUsuario:string);

    procedure cadastrarDepartamento(cdDepto, nrMatriculaGerente: integer;
      descDepto: string);

    procedure excluirDadosSubTipoOcXCausa(cdSubTipoCausa: integer);
    procedure cadastrarCausaXSubTipoOcorrencia(cdSubTipocausa,cdSubTipoOcorrencia,cdCausa,cdTipoOcorrencia:integer);
    procedure alterarDadosSubTipoOcXCausa(cdSubTipoOcXCausa, cdCausa: integer);

    procedure excluirDadosCausaOcorrencia(cdCausa: integer);
    procedure alterarDadosCausa(cdCausa: integer; descCausa,
      idSituacao: string);
    procedure cadastrarCausaOcorrencia(cdCausa: integer; descCausa,
      idSituacao: string);

    procedure excluirDadosSubTipoOcXSolucao(cdSubTipoSolucao: integer);
    procedure alterarDadosSubTipoOcXSolucao(cdSubTipoOcXSolucao,
      cdSolucao: integer ;idAceite:string);
    procedure cadastrarSolucaoXSubTipoOcorrencia(cdSubTipoSolucao,cdSubTipoOcorrencia,
      cdSolucao,cdTipoOcorrencia:integer;idAceite:string);

    procedure excluirDadosSolucaoOcorrencia(cdSolucao: integer);
    procedure alterarDadosSolucao(cdSolucao: integer; descSolucao,
      idSituacao: string);
    procedure cadastrarSolucaoOcorrencia(cdSolucao: integer; descSolucao,
      idSituacao: string);

    procedure excluirDadosSubTipoOcorrencia(cdTipoOc, cdSubTipoOc: integer);
    procedure alterarDadosSubTipoOcorrencia(cdTipoOc, cdSubTipoOc: integer;
      descSubTipoOc, idSituacao: string);
    procedure cadastrarSubTipoOcorrencia(cdTipoOc,cdSubTipoOc:integer;descSubTipoOc,idSituacao:string);

    procedure excluirDadosTipoOcorrencia(cdTipoOcorrencia: integer);
    procedure alterarCadastroTipoOcorrencia(cdTipoOc, cdDepto: integer;
      descTipoOc, IdSolucao,Idcausa, idFilmagem, idEstoque, idGravTlv, idAtivo, idTransp,
      idEmb, idSubTipoOc, idRecolherMerc: string);
    procedure cadastrarTipoOcorrencia(cdTipoOc,cdDepto:integer;descTipoOc,IdSolucao,Idcausa,
      idFilmagem,idEstoque,idGravTlv,idAtivo,idTransp,idEmb,idSubTipoOc,idRecolherMerc:string);

    procedure excluirDadosSituacaoEmbalagem(cdSituacaoEmb: integer);
    procedure alterarDadosSituacaoEmbalagem(cdSituacaoEmb: integer;
      descSituacaoEmb: string);
    procedure cadastrarSituacaoEmbalagem(cdSituacaoEmb: integer;
      descSituacaoEmb: string);

    procedure excluirDadosStatusOcorrencia(cdStatus: integer);
    procedure alterarDadosStatusOcorrencia(cdStatus: integer;
      descStatus: string);
    procedure cadastrarStatusOcorrencia(cdStatusOcorrencia:integer;descStatusOcorrencia:string);

    procedure excluirDadosAreaOrigem(cdAreaOrigem: integer);
    procedure alterarDadosAreaOrigem(cdAreaOrigem:integer;dsAreaOrigem, idPadrao: string);
    procedure cadastrarAreaOrigem(cdAreaOrigem:integer;dsAreaOrigem,idPadrao:string);

    function getCodigoSequencial(dsCampo, dsTabela,dsCampoCondicao,dsCondicao: string): integer;

    function getEmailSolucionador(nrMatricula,nomeSolucionador: string): string;
    procedure consultarDadosSolucionador(nrMatricula: integer);
    procedure consultarDadosAreaDepto(codigo: integer);
    procedure consultarDadosDepartamento(codigo: integer);
    procedure consultarDadosSetorPesquisaSatisfacao;
    procedure consultarDadosPerguntaPesquisaSatisfacao;
    procedure consultarDadosPesquisaSatisfacao;
    procedure consultarDadosCausaXSubTipoOcorrencia(codigo: integer);
    procedure consultarDadosCausaOcorrencia(codigo: integer; desc: string);
    procedure consultarDadosSolucaoXSubTipoOcorrencia(codigo: integer);
    procedure consultarDadosSolucaoOcorrencia(codigo: integer; desc: string);
    procedure consultarDadosSubTipoOcorrencia(cdTipo,cdSubTipo:integer;desc:string);
    procedure consultarDadosTipoOcorrencia(codigo,deptoResponsavel: integer; desc: string);
    procedure consultarDadosSituacaoEmbalagem(codigo: integer; desc: string);
    procedure consultarDadosStatusOcorrencia(codigo: integer; desc: string);
    procedure consultarDadosAreaOrigem(codigo:integer;desc:string);

    function isProdutoOncologicoLocalizado: Boolean;
    function isProdutoRefrigeradoLocalizado: Boolean;
    function getSequencialItem: integer;
    function getNovoNumeroOcorrencia: integer;
    function getTelefoneIdentificacaoCliente(cdCliente: string): string;

    procedure atualizarDadosOcorrenciaLocal;

    procedure execFiltroAreaSolucionador(cdDepto: integer);
    procedure execFiltroListaUsuario(isGerente,isSupervisor: Boolean);
    procedure execFiltroSolucionador(cdEmpresa,cdDepto:integer;dsMatricSolucionador:string;
      isSolucionadorPadrao,isDistrito,isPrimeiraPesquisa,isListarTodos:Boolean);
    procedure execFiltroCausaItemOcorrencia(cdTipoOcorrencia,
      cdSubTipoOcorrencia: integer);
    procedure execFiltroSolucaoItemOcorrencia(cdTipoOcorrencia,
      cdSubTipoOcorrencia,cdSolucao: integer);
    procedure execFiltroSubTipoOcorrencia(id:integer;dsTipoOcorrencia: string);overload;
    procedure execFiltroSubTipoOcorrencia(cdTipoOcorrencia: integer);overload;
    procedure inicializarDataSetLocal(isLimparOcorrencia,isEmissaoDentroPrazo48Horas,
      isControlarTipoOcorrencia:Boolean);
    procedure gravarNovaOcorrencia;

    procedure execConsultarItemOcorrencia;
    procedure execConsultaOcorrencia(dadosConsulta:TConsultaOcorrencia;isSomenteMesAtual:Boolean);

    procedure consultarDadosAdicionaisNFe;
    procedure consultarDadosTransportador;
    procedure localizaProdutoLista(dsCampoConsulta, dsFiltro: string);
    procedure listaTipoVolumeItemNFe;
    procedure listaItemPedido;
    procedure listarItemNFe;
    procedure consultaDuplicata(nrDuplicata, cdCliente: integer);
    procedure consultaNFe(nrNFe, cdCliente: integer;dataEmissao:string);
    procedure consultaPedidoCompra(nrPedido, cdCliente: integer);
    procedure consultarListaDeConferente;

    procedure execProcessoGravarCausaItem;
    procedure execProcessoGravarSolucaoItem();

    procedure atualizarStatusCausaOcorrencia(isSomenteLocal,isReaberturaOcorrencia:Boolean);
    procedure atualizarStatusSolucaoOcorrencia(isSomenteLocal,isReaberturaOcorrencia:Boolean);
    procedure alterarStatusCausaItemOcorrencia(cdOcorrencia,nrSequencia,cdStatus: integer);

    procedure alterarStatusSolucaoOcorrenciaLocal(cdStatus: integer);
    procedure alterarStatusSolucaoItemLocal(cdStatus: integer ;isReaberturaOcorrencia:Boolean);
    procedure alterarStatusSolucaoItemOcorrencia(cdOcorrencia,nrSequencia,cdStatus:integer);
    procedure gravarSolucaoItemOcorrencia(isSolucaoPadrao,isCausaPadrao:Boolean);
    procedure gravarNovoItemOcorrenciaLocal(itemOcorrencia:TItemOcorrencia);
    procedure gravarOcorrenciaLocal;

    procedure insertTelefoneCliente(idTipoTelefone,dsTelefone: string; cliente: TCliente);
    procedure consultarCliente;
    procedure execControledeLigacao;
    procedure consultaFiladeEspera(idTipoLigacao:string);
    procedure alterarStatusLigacao(ligacao: TFDadosLigacao; idStatus: integer);
    procedure ordenarGridD(dsDataSet: TClientDataSet; nmColuna: string);
    procedure ordenarGridS(dsDataSet: TSimpleDataSet; nmColuna: string);
    procedure atualizarDataSetLocalGeral;
    procedure carregaDataSistema;
    procedure carregaConexao;

   procedure iniciarListaMotivoCancelamento;

   function criaQueryGenerica: TSQLQuery;


    { Public declarations }
  end;

var
  DM: TDM;
  dadosMensagem: array of TDadosMensagem;

implementation

{$R *.dfm}

function TDM.criaQueryGenerica: TSQLQuery;
var
  bQuery: TSQLQuery;
begin
  bQuery := TSQLQuery.Create(nil);
  bQuery.SQLConnection := dm.conexaoProducao;
  bQuery.DisableControls;
  result := bQuery;
end;



procedure TDM.consultarLoginUsuario;
var
  sqlDados: TSimpleDataSet;
  sqlTxt : TStringList;
begin
  sqlTxt:=TStringList.Create;
  sqlDados:=TSimpleDataSet.Create(nil);
  sqlDados.Connection:=conexaoProducao;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT NM_USUARIO,NR_MATRICULA,CD_USUARIO,DS_LOGIN,DS_PASSWD,CD_EMPRESA,ID_ATIVO ');
    sqlTxt.Add('FROM ACESSO.DC_USUARIO WHERE DS_LOGIN = :DS_LOGIN');

    try
      sqlDados.Close;
      sqlDados.DataSet.CommandText:=sqlTxt.Text;
      sqlDados.DataSet.ParamByName('DS_LOGIN').AsString:=usuario.login;
      sqlDados.Open;

      if not sqlDados.IsEmpty then
      begin
        usuario.login:= copy(sqlDados.FieldByName('DS_LOGIN').AsString,1,10);
        usuario.matricula:= sqlDados.FieldByName('NR_MATRICULA').AsInteger;
        usuario.senha:= sqlDados.FieldByName('DS_PASSWD').AsString;
        usuario.nomeCompleto:= sqlDados.FieldByName('NM_USUARIO').AsString;
        usuario.codigo:= sqlDados.FieldByName('CD_USUARIO').AsInteger;
        usuario.situacao:= strToSituacao(sqlDados.FieldByName('ID_ATIVO').AsString);
      end;
    except
      on E:Exception do
        raise Exception.Create('Erro ao carregar dados da empresa. Erro: '+E.Message);
    end;
  finally
    sqlTxt.Free;
    sqlDados.Close;
    sqlDados.Free;
  end;
end;

procedure TDM.validarPermissaoAcessoSistema(cdSistema:integer);
var
  sqlDados: TSimpleDataSet;
  sqlTxt : TStringList;
begin
  sqlTxt:=TStringList.Create;
  sqlDados:=TSimpleDataSet.Create(nil);
  sqlDados.Connection:=conexaoProducao;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT 1 FROM ACESSO.V_ACESSO_SISTEMA ');
    sqlTxt.Add('WHERE NR_MATRICULA = :NR_MATRICULA AND CD_SISTEMA = :CD_SISTEMA ');

    try
      sqlDados.Close;
      sqlDados.DataSet.CommandText:=sqlTxt.Text;
      sqlDados.DataSet.ParamByName('NR_MATRICULA').AsString:=IntToStr(usuario.matricula);
      sqlDados.DataSet.ParamByName('CD_SISTEMA').AsString:=IntToStr(cdSistema);
      sqlDados.Open;

      if not sqlDados.IsEmpty then
        usuario.isAcessoLiberado:=True;
    except
      on E:Exception do
        raise Exception.Create('Erro ao carregar dados da empresa. Erro: '+E.Message);
    end;
  finally
    sqlTxt.Free;
    sqlDados.Close;
    sqlDados.Free;
  end;
end;

procedure TDM.consultarAcessoTelaSistema(cdSistema:integer);
var
  sqlDados: TSimpleDataSet;
  sqlTxt : TStringList;
  i : integer;
begin
  sqlTxt:=TStringList.Create;
  sqlDados:=TSimpleDataSet.Create(nil);
  sqlDados.Connection:=conexaoProducao;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT CD_TELA, NM_TELA, DS_TELA ');
    sqlTxt.Add('FROM ACESSO.V_ACESSO_TELA ');
    sqlTxt.Add('WHERE NR_MATRICULA = :NR_MATRICULA AND CD_SISTEMA = :CD_SISTEMA ');
    sqlTxt.Add('ORDER BY CD_TELA ');

    try
      sqlDados.Close;
      sqlDados.DataSet.CommandText:=sqlTxt.Text;
      sqlDados.DataSet.ParamByName('NR_MATRICULA').AsString:=IntToStr(usuario.matricula);
      sqlDados.DataSet.ParamByName('CD_SISTEMA').AsString:=IntToStr(cdSistema);
      sqlDados.Open;

      i:=0;
      while not sqlDados.Eof do
      begin
        telaLiberada[i].codigo:=sqlDados.FieldByName('CD_TELA').AsInteger;
        telaLiberada[i].descrição:=sqlDados.FieldByName('CD_TELA').AsString;
        inc(i);
        sqlDados.Next;
      end;

    except
      on E:Exception do
        raise Exception.Create('Erro ao carregar dados da empresa. Erro: '+E.Message);
    end;
  finally
    sqlTxt.Free;
    sqlDados.Close;
    sqlDados.Free;
  end;
end;

procedure TDM.atualizarDataSetLocalGeral;
begin
  try
    carregaTipoOcorrencia(False);
    carregaSubTipoOcorrencia(False,'');
    carregaSituacaoEmbalagem;
    carregaSolucionador(False);
    carregaStatusSolucao(False);
    carregaStatusCausa;
    carregaSolucaoOcorrencia(False,'','','');
    carregaCausaOcorrencia(False,'','','');
    carregaListaCausa(False);
    carregaListaSolucao(False);
    carregaListaUsuario;
    carregaListaDepartamento;
    carregaListaAreaDepartamento(False);
    carregarListaEmpresa(False);
    carregaListaAreaDeOrigem;

  except
    on E:Exception do
      raise Exception.Create('Erro ao atualizar dados locais.');
  end;
end;

procedure TDM.carregaConexao;
begin
  try
    conexaoProducao.Connected:=false;
    conexaoProducao.Params.LoadFromFile(loadConexao(1));
    conexaoProducao.Connected:=true;
  except
    on E:Exception do
      raise Exception.CreateFmt('Erro ao conectar %s. Detalhes: %s',[conexaoProducao.Params.Values['dataBase'],E.Message]);
  end;

  try
    criarDataSetLocal;

    { carrega dataSet de dados }
    atualizarDataSetLocalGeral;

    { carregar data Sistema }
    carregaDataSistema;
  except
    on E:Exception do
      raise Exception.CreateFmt('Erro ao criar DataSet Local.Detalhes: %s',[e.Message]);
  end;

  try
    conexaoHistorico.Connected:=false;
    conexaoHistorico.Params.LoadFromFile(loadConexao(2));
    conexaoHistorico.Connected:=true;
  except
    on E:Exception do
      raise Exception.CreateFmt('Erro ao conectar %s. Detalhes: %s',[conexaoHistorico.Params.Values['dataBase'],E.Message]);
  end;

end;

procedure TDM.conexaoHistoricoAfterConnect(Sender: TObject);
begin
  conexaoHistorico.Execute('ALTER SESSION SET NLS_SORT = ASCII7',nil,nil);
  conexaoHistorico.Execute('ALTER SESSION SET NLS_date_format=''dd/mm/RRRR''',nil,nil);
  conexaoHistorico.Execute('ALTER SESSION SET NLS_NUMERIC_CHARACTERS=''.,''',nil,nil);
end;

procedure TDM.conexaoProducaoAfterConnect(Sender: TObject);
begin
  conexaoProducao.Execute('ALTER SESSION SET NLS_SORT = ASCII7',nil,nil);
  conexaoProducao.Execute('ALTER SESSION SET NLS_date_format=''dd/mm/RRRR''',nil,nil);
  conexaoProducao.Execute('ALTER SESSION SET NLS_NUMERIC_CHARACTERS=''.,''',nil,nil);
end;

procedure TDM.carregarListaEmpresa(isAtivarLista:Boolean);
var
  sqlData : TSimpleDataSet;
begin
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;

  cdsListaEmpresa.Close;
  cdsListaEmpresa.CreateDataSet;
  cdsListaEmpresa.Edit;
  cdsListaEmpresaCD_EMPRESA.AsInteger:=0;
  cdsListaEmpresaNM_EMPRESA.AsString:='GAM - GERAL';
  cdsListaEmpresa.Post;
  try
    sqlData.Close;
    sqlData.DataSet.CommandText:='SELECT CD_EMPRESA, NM_EMPRESA, ID_UNIDADE_FEDERACAO ' +
                                 'FROM ACESSO.DC_EMPRESA WHERE ID_EMPRESA_FISICA = ''S'' '+
                                 'ORDER BY CD_EMPRESA';
    sqlData.Open;
    while not sqlData.eof do
    begin
      if not cdsListaEmpresa.Active then
        cdsListaEmpresa.Open;

      cdsListaEmpresa.Append;
      cdsListaEmpresaCD_EMPRESA.AsInteger:=sqlData.FieldByName('CD_EMPRESA').AsInteger;
      cdsListaEmpresaNM_EMPRESA.AsString:=sqlData.FieldByName('NM_EMPRESA').AsString + ' ' + sqlData.FieldByName('ID_UNIDADE_FEDERACAO').AsString;
      cdsListaEmpresa.Post;

      sqlData.Next;
    end;

    if not isAtivarLista then
      cdsListaEmpresa.Close;
  finally
    sqlData.Close;
    sqlData.Free;
  end;
end;

procedure TDM.carregarListaRedeCliente(isAtivar:Boolean);
begin
  try
    sqlListaRedeCliente.Close;
    if isAtivar then
      sqlListaRedeCliente.Open;
  except
    on E:Exception do
      raise Exception.CreateFmt('Erro ao consultar lista de "Redes de Clientes"',[E.Message]);
  end;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  conexaoProducao.Close;
  conexaoHistorico.Close;
end;

procedure TDM.criarDataSetLocal;
begin
  cdsOcorrencia.Close;
  cdsOcorrencia.CreateDataSet;
  {
  cdsItemOcorrencia.Close;
  cdsItemOcorrencia.CreateDataSet;

  cdsSolucaoItem.Close;
  cdsSolucaoItem.CreateDataSet;
  }
end;

procedure TDM.carregaDataSistema;
var
  sqlData : TSimpleDataSet;
  dataHora: string;
begin
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;
  try
    try
      sqlData.Close;
      sqlData.DataSet.CommandText:='SELECT DT_PEDIDO DATA, SYSDATE HORA FROM ACESSO.DC_EMPRESA WHERE CD_EMPRESA = 1';
      sqlData.Open;

      dadosEmpresa.dataSistema:=sqlData.FieldByName('DATA').AsDateTime;
      dadosEmpresa.horaSistema:=FormatDateTime('HH:MM:SS',sqlData.FieldByName('HORA').AsDateTime);
      { formata data + hora ( dt_pedido + hora do SO )}
      dataHora:=format('%s %s',[formatdatetime('dd/mm/yyyy',dadosEmpresa.dataSistema),dadosEmpresa.horaSistema]);

      dadosEmpresa.dataHora   :=StrToDateTimeDef(dataHora,sqlData.FieldByName('HORA').AsDateTime);
    except
      on E:Exception do
        raise Exception.CreateFmt('Erro ao carregar data do sistema. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlData.Close;
    sqlData.Free;
  end;
end;

procedure TDM.carregaTipoOcorrencia(isAtivarLista:Boolean);
var
  sqlData : TSimpleDataSet;
  sqltxt : TStringList;
begin
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;
  sqltxt:=TStringList.Create;

  cdsTipoOcorrencia.Close;
  cdsTipoOcorrencia.CreateDataSet;
  try
    sqltxt.Clear;
    sqlTxt.Add('SELECT CD_TIPO_OCORRENCIA, NM_TIPO_OCORRENCIA,');
    sqlTxt.Add('ID_CAUSA, ID_FILMAGEM, ID_ESTOQUE, ID_TELEVENDAS, ');
    sqlTxt.Add('ID_TRANSP_RESP, ID_EMBALAGEM, ID_SUBTIPO_OCORRENCIA, CD_DEPTO, ID_SOLUCAO, ID_RECOLHE_MERCADORIA ');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_TIPO_OCORRENCIA ');
    sqlTxt.Add('WHERE ID_ATIVO = ''S'' AND CD_TIPO_OCORRENCIA > 0 ');
    sqlTxt.Add('ORDER BY NM_TIPO_OCORRENCIA');
    sqlData.Close;
    sqlData.DataSet.CommandText:=sqltxt.Text;
    sqlData.Open;
    while not sqlData.eof do
    begin
      if not cdsTipoOcorrencia.Active then
        cdsTipoOcorrencia.Open;

      cdsTipoOcorrencia.Append;
      cdsTipoOcorrenciaCD_TIPO_OCORRENCIA.AsInteger:=sqlData.FieldByName('CD_TIPO_OCORRENCIA').AsInteger;
      cdsTipoOcorrenciaNM_TIPO_OCORRENCIA.AsString:=sqlData.FieldByName('NM_TIPO_OCORRENCIA').AsString;
      cdsTipoOcorrenciaID_CAUSA.AsString:=sqlData.FieldByName('ID_CAUSA').AsString;
      cdsTipoOcorrenciaID_FILMAGEM.AsString:=sqlData.FieldByName('ID_FILMAGEM').AsString;
      cdsTipoOcorrenciaID_ESTOQUE.AsString:=sqlData.FieldByName('ID_ESTOQUE').AsString;
      cdsTipoOcorrenciaID_TELEVENDAS.AsString:=sqlData.FieldByName('ID_TELEVENDAS').AsString;
      cdsTipoOcorrenciaID_TRANSP_RESPONSAVEL.AsString:=sqlData.FieldByName('ID_TRANSP_RESP').AsString;
      cdsTipoOcorrenciaID_EMBALAGEM.AsString:=sqlData.FieldByName('ID_EMBALAGEM').AsString;
      cdsTipoOcorrenciaID_SUBTIPO_OCORRENCIA.AsString:=sqlData.FieldByName('ID_SUBTIPO_OCORRENCIA').AsString;
      cdsTipoOcorrenciaCD_DEPTO_PADRAO.AsInteger:=sqlData.FieldByName('CD_DEPTO').AsInteger;
      cdsTipoOcorrenciaID_SOLUCAO.AsString:=sqlData.FieldByName('ID_SOLUCAO').AsString;
      cdsTipoOcorrenciaID_RECOLHER_MERCADORIA.AsString:=sqlData.FieldByName('ID_RECOLHE_MERCADORIA').AsString;
      cdsTipoOcorrencia.Post;

      sqlData.Next;
    end;
     if not isAtivarLista then
       cdsTipoOcorrencia.Close;
  finally
    sqltxt.Free;
    sqlData.Close;
    sqlData.Free;
  end;
end;

procedure TDM.carregaSubTipoOcorrencia(isAtivarLista:Boolean;dsTipoOcorrencia:string);
var
  sqlData : TSimpleDataSet;
  sqlTxt : TStringList;
  s:string;
begin
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;
  sqlTxt:=TStringList.Create;

  cdsSubTipoOcorrencia.Close;
  cdsSubTipoOcorrencia.CreateDataSet;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT SUB.CD_TIPO_OCORRENCIA,SUB.CD_SUBTIPO_OCORRENCIA, SUB.NM_SUBTIPO_OCORRENCIA, TIPO.NM_TIPO_OCORRENCIA ');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_SUBTIPO_OCORRENCIA SUB,GAMSAC.DC_SAC_TIPO_OCORRENCIA TIPO ');
    sqlTxt.Add('WHERE SUB.ID_ATIVO = ''S'' AND SUB.CD_TIPO_OCORRENCIA > 0 ');
    sqlTxt.Add('AND SUB.CD_TIPO_OCORRENCIA = TIPO.CD_TIPO_OCORRENCIA ');
    if dsTipoOcorrencia <> EmptyStr then
      sqlTxt.Add('AND SUB.CD_TIPO_OCORRENCIA IN (' + dsTipoOcorrencia + ') ' );
    sqlTxt.Add('ORDER BY NM_SUBTIPO_OCORRENCIA');

    sqlData.Close;
    sqlData.DataSet.CommandText:=sqlTxt.Text;
    sqlData.Open;
    while not sqlData.eof do
    begin
      if not cdsSubTipoOcorrencia.Active then
        cdsSubTipoOcorrencia.Open;

      cdsSubTipoOcorrencia.Append;
      cdsSubTipoOcorrenciaCD_TIPO_OCORRENCIA.AsInteger:=sqlData.FieldByName('CD_TIPO_OCORRENCIA').AsInteger;
      cdsSubTipoOcorrenciaCD_SUBTIPO_OCORRENCIA.AsInteger:=sqlData.FieldByName('CD_SUBTIPO_OCORRENCIA').AsInteger;
      if dsTipoOcorrencia <> EmptyStr then
        cdsSubTipoOcorrenciaNM_SUBTIPO_OCORRENCIA.AsString:=format('%s [%s]',[sqlData.FieldByName('NM_SUBTIPO_OCORRENCIA').AsString,sqlData.FieldByName('NM_TIPO_OCORRENCIA').AsString])
      else
        cdsSubTipoOcorrenciaNM_SUBTIPO_OCORRENCIA.AsString:=sqlData.FieldByName('NM_SUBTIPO_OCORRENCIA').AsString;
      cdsSubTipoOcorrencia.Post;

      sqlData.Next;
    end;
    if not isAtivarLista then
      cdsSubTipoOcorrencia.Close;
  finally
    sqlTxt.Free;
    sqlData.Close;
    sqlData.Free;
  end;
end;

procedure TDM.carregaListaAreaDeOrigem;
var
  sqlData : TSimpleDataSet;
begin
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;

  cdsListaAreaOrigem.Close;
  cdsListaAreaOrigem.CreateDataSet;
  try
    sqlData.Close;
    sqlData.DataSet.CommandText:='SELECT CD_AREA_ORIGEM, DS_AREA_ORIGEM ' +
                                 'FROM GAMSAC.DC_SAC_AREA_ORIGEM_OCORRENCIA ' +
                                 'ORDER BY DS_AREA_ORIGEM ';
    sqlData.Open;
    while not sqlData.eof do
    begin
      if not cdsListaAreaOrigem.Active then
        cdsListaAreaOrigem.Open;

      cdsListaAreaOrigem.Append;
      cdsListaAreaOrigemCD_AREA_ORIGEM.AsInteger:=sqlData.FieldByName('CD_AREA_ORIGEM').AsInteger;
      cdsListaAreaOrigemDS_AREA_ORIGEM.AsString:=sqlData.FieldByName('DS_AREA_ORIGEM').AsString;
      cdsListaAreaOrigem.Post;

      sqlData.Next;
    end;
  finally
    sqlData.Close;
    sqlData.Free;
  end;
end;

procedure TDM.carregaStatusSolucao(isAtivarLista:Boolean);
var
  sqlData : TSimpleDataSet;
begin
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;

  cdsStatusSolucao.Close;
  cdsStatusSolucao.CreateDataSet;
  try
    sqlData.Close;
    sqlData.DataSet.CommandText:='SELECT CD_ST_OCORRENCIA, NM_ST_OCORRENCIA ' +
                                 'FROM GAMSAC.DC_SAC_ST_OCORRENCIA ' +
                                 'ORDER BY NM_ST_OCORRENCIA ';
    sqlData.Open;
    while not sqlData.eof do
    begin
      if not cdsStatusSolucao.Active then
        cdsStatusSolucao.Open;

      cdsStatusSolucao.Append;
      cdsStatusSolucaoCD_STATUS_OCORRENCIA.AsInteger:=sqlData.FieldByName('CD_ST_OCORRENCIA').AsInteger;
      cdsStatusSolucaoNM_STATUS_OCORRENCIA.AsString:=sqlData.FieldByName('NM_ST_OCORRENCIA').AsString;
      cdsStatusSolucao.Post;

      sqlData.Next;
    end;
    if not isAtivarLista then
      cdsStatusSolucao.Close;
  finally
    sqlData.Close;
    sqlData.Free;
  end;
end;

procedure TDM.carregaStatusCausa;
var
  sqlData : TSimpleDataSet;
begin
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;

  cdsStatusCausa.Close;
  cdsStatusCausa.CreateDataSet;
  try
    sqlData.Close;
    sqlData.DataSet.CommandText:='SELECT CD_ST_OCORRENCIA, NM_ST_OCORRENCIA ' +
                                 'FROM GAMSAC.DC_SAC_ST_OCORRENCIA ' +
                                 'ORDER BY NM_ST_OCORRENCIA ';
    sqlData.Open;
    while not sqlData.eof do
    begin
      if not cdsStatusCausa.Active then
        cdsStatusCausa.Open;

      cdsStatusCausa.Append;
      cdsStatusCausaCD_ST_CAUSA.AsInteger:=sqlData.FieldByName('CD_ST_OCORRENCIA').AsInteger;
      cdsStatusCausaNM_ST_CAUSA.AsString:=sqlData.FieldByName('NM_ST_OCORRENCIA').AsString;
      cdsStatusCausa.Post;

      sqlData.Next;
    end;
    cdsStatusCausa.Close;
  finally
    sqlData.Close;
    sqlData.Free;
  end;
end;

procedure TDM.carregaSituacaoEmbalagem;
var
  sqlData : TSimpleDataSet;
begin
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;

  cdsSituacaoEmbalagem.Close;
  cdsSituacaoEmbalagem.CreateDataSet;
  try
    sqlData.Close;
    sqlData.DataSet.CommandText:='SELECT CD_SITUACAO_EMBALAGEM,DS_SITUACAO_EMBALAGEM ' +
                                 'FROM GAMSAC.DC_SAC_SITUACAO_EMBALAGEM ' +
                                 'WHERE CD_SITUACAO_EMBALAGEM > 0 ' +
                                 'ORDER BY DS_SITUACAO_EMBALAGEM';
    sqlData.Open;
    while not sqlData.eof do
    begin
      if not cdsSituacaoEmbalagem.Active then
        cdsSituacaoEmbalagem.Open;

      cdsSituacaoEmbalagem.Append;
      cdsSituacaoEmbalagemCD_SITUACAO_EMBALAGEM.AsInteger:=sqlData.FieldByName('CD_SITUACAO_EMBALAGEM').AsInteger;
      cdsSituacaoEmbalagemDS_SITUACAO_EMBALAGEM.AsString:=sqlData.FieldByName('DS_SITUACAO_EMBALAGEM').AsString;
      cdsSituacaoEmbalagem.Post;

      sqlData.Next;
    end;
    cdsSituacaoEmbalagem.Close;
  finally
    sqlData.Close;
    sqlData.Free;
  end;
end;

procedure TDM.carregaListaCausa(isAtivarLista:Boolean);
var
  sqlData : TSimpleDataSet;
begin
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;

  cdsListaCausa.Close;
  cdsListaCausa.CreateDataSet;
  try
    sqlData.Close;
    sqlData.DataSet.CommandText:='SELECT CD_CAUSA,DS_CAUSA ' +
                                 'FROM GAMSAC.DC_SAC_CAUSA ' +
                                 'WHERE CD_CAUSA > 0 AND ID_ATIVO = ''S'' ' +
                                 'ORDER BY DS_CAUSA';
    sqlData.Open;
    while not sqlData.eof do
    begin
      if not cdsListaCausa.Active then
        cdsListaCausa.Open;

      cdsListaCausa.Append;
      cdsListaCausaCD_CAUSA.AsInteger:=sqlData.FieldByName('CD_CAUSA').AsInteger;
      cdsListaCausaDS_CAUSA.AsString:=sqlData.FieldByName('DS_CAUSA').AsString;
      cdsListaCausa.Post;

      sqlData.Next;
    end;
    if not isAtivarLista then
      cdsListaCausa.Close;
  finally
    sqlData.Close;
    sqlData.Free;
  end;
end;

procedure TDM.carregaListaSolucao(isAtivarLista:Boolean);
var
  sqlData : TSimpleDataSet;
begin
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;

  cdsListaSolucao.Close;
  cdsListaSolucao.CreateDataSet;
  try
    sqlData.Close;
    sqlData.DataSet.CommandText:='SELECT CD_SOLUCAO,DS_SOLUCAO ' +
                                 'FROM GAMSAC.DC_SAC_SOLUCAO ' +
                                 'WHERE CD_SOLUCAO > 0 AND ID_ATIVO = ''S'' ' +
                                 'ORDER BY DS_SOLUCAO';
    sqlData.Open;
    while not sqlData.eof do
    begin
      if not cdsListaSolucao.Active then
        cdsListaSolucao.Open;

      cdsListaSolucao.Append;
      cdsListaSolucaoCD_SOLUCAO.AsInteger:=sqlData.FieldByName('CD_SOLUCAO').AsInteger;
      cdsListaSolucaoDS_SOLUCAO.AsString:=sqlData.FieldByName('DS_SOLUCAO').AsString;
      cdsListaSolucao.Post;

      sqlData.Next;
    end;
    if not isAtivarLista then
      cdsListaSolucao.Close;
  finally
    sqlData.Close;
    sqlData.Free;
  end;
end;

procedure TDM.carregaSolucaoOcorrencia(isAtivarLista:Boolean;dsTipoOcorrencia,dsSubTipoOcorrencia,dsSolucao:string);
var
  sqlData : TSimpleDataSet;
  sqlTxt : TStringList;

begin
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;
  sqlTxt:=TStringList.Create;

  cdsSolucao.Close;
  cdsSolucao.CreateDataSet;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT SOL.CD_SOLUCAO, SOL.DS_SOLUCAO, ST_SOL.CD_SUBTIPO_SOLUCAO,');
    sqlTxt.Add(' TP_OC.ID_CAUSA, TP_OC.ID_FILMAGEM, TP_OC.ID_ESTOQUE,TP_OC.ID_TELEVENDAS,');
    sqlTxt.Add(' TP_OC.ID_TRANSP_RESP, TP_OC.ID_EMBALAGEM, TP_OC.ID_SUBTIPO_OCORRENCIA, ');
    sqlTxt.Add(' ST_OC.CD_SUBTIPO_OCORRENCIA, TP_OC.CD_TIPO_OCORRENCIA,TP_OC.ID_RECOLHE_MERCADORIA,ST_SOL.ID_ACEITE ');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_SUBTIPO_SOLUCAO ST_SOL');
    sqlTxt.Add('JOIN GAMSAC.DC_SAC_SOLUCAO SOL ON ST_SOL.CD_SOLUCAO = SOL.CD_SOLUCAO ');
    sqlTxt.Add(' AND SOL.ID_ATIVO = ''S'' AND SOL.CD_SOLUCAO > 0 ');
    sqlTxt.Add('JOIN GAMSAC.DC_SAC_SUBTIPO_OCORRENCIA ST_OC ON ST_SOL.CD_SUBTIPO_OCORRENCIA = ST_OC.CD_SUBTIPO_OCORRENCIA');
    sqlTxt.Add(' AND ST_SOL.CD_TIPO_OCORRENCIA = ST_OC.CD_TIPO_OCORRENCIA AND ST_OC.ID_ATIVO = ''S'' AND ST_OC.CD_TIPO_OCORRENCIA > 0 ');
    sqlTxt.Add('JOIN GAMSAC.DC_SAC_TIPO_OCORRENCIA TP_OC ON ST_SOL.CD_TIPO_OCORRENCIA = TP_OC.CD_TIPO_OCORRENCIA ');
    sqlTxt.Add(' AND TP_OC.ID_ATIVO = ''S'' AND TP_OC.CD_TIPO_OCORRENCIA > 0 ');
    sqlTxt.Add('WHERE ST_SOL.CD_TIPO_OCORRENCIA > 0 ');
    if dsTipoOcorrencia <> EmptyStr then
    begin
      sqlTxt.Add('AND ST_SOL.CD_TIPO_OCORRENCIA IN ('+ dsTipoOcorrencia+') ');
      if dsSubTipoOcorrencia <> EmptyStr then
        sqlTxt.Add('AND ST_SOL.CD_SUBTIPO_OCORRENCIA IN ('+ dsSubTipoOcorrencia+') ');
      if dsSolucao <> EmptyStr then
        sqlTxt.Add('AND ST_SOL.CD_SOLUCAO IN ('+ dsSolucao+') ');
    end;
    sqlTxt.Add('ORDER BY SOL.DS_SOLUCAO');

    sqlData.Close;
    sqlData.DataSet.CommandText:=sqlTxt.Text;
    sqlData.Open;

    while not sqlData.eof do
    begin
      if not cdsSolucao.Active then
        cdsSolucao.Open;

      cdsSolucao.Append;
      cdsSolucaoCD_SOLUCAO.AsInteger:=sqlData.FieldByName('CD_SOLUCAO').AsInteger;
      cdsSolucaoDS_SOLUCAO.AsString:=sqlData.FieldByName('DS_SOLUCAO').AsString;
      cdsSolucaoCD_SUBTIPO_SOLUCAO.AsInteger:=sqlData.FieldByName('CD_SUBTIPO_SOLUCAO').AsInteger;
      cdsSolucaoCD_TIPO_OCORRENCIA.AsInteger:=sqlData.FieldByName('CD_TIPO_OCORRENCIA').AsInteger;
      cdsSolucaoCD_SUBTIPO_OCORRENCIA.AsInteger:=sqlData.FieldByName('CD_SUBTIPO_OCORRENCIA').AsInteger;
      cdsSolucaoID_CAUSA.AsBoolean:=stringToBoolean(sqlData.FieldByName('ID_CAUSA').AsString);
      cdsSolucaoID_FILMAGEM.AsBoolean:=stringToBoolean(sqlData.FieldByName('ID_FILMAGEM').AsString);
      cdsSolucaoID_ESTOQUE.AsBoolean:=stringToBoolean(sqlData.FieldByName('ID_ESTOQUE').AsString);
      cdsSolucaoID_TELEVENDAS.AsBoolean:=stringToBoolean(sqlData.FieldByName('ID_TELEVENDAS').AsString);
      cdsSolucaoID_TRANSP_RESPONSAVEL.AsBoolean:=stringToBoolean(sqlData.FieldByName('ID_TRANSP_RESP').AsString);
      cdsSolucaoID_EMBALAGEM.AsBoolean:=stringToBoolean(sqlData.FieldByName('ID_EMBALAGEM').AsString);
      cdsSolucaoID_SUBTIPO_OCORRENCIA.AsBoolean:=stringToBoolean(sqlData.FieldByName('ID_SUBTIPO_OCORRENCIA').AsString);
      cdsSolucaoID_RECOLHE_MERCADORIA.AsBoolean:=stringToBoolean(sqlData.FieldByName('ID_RECOLHE_MERCADORIA').AsString);
      cdsSolucaoID_ACEITE.AsString:=sqlData.FieldByName('ID_ACEITE').AsString;
      cdsSolucao.Post;

      sqlData.Next;
    end;
    if not isAtivarLista then
      cdsSolucao.Close;
  finally
    sqlTxt.Free;
    sqlData.Close;
    sqlData.Free;
  end;
end;

procedure TDM.carregaCausaOcorrencia(isAtivarLista:Boolean;dsTipoOcorrencia,dsSubTipoOcorrencia,dsCausa:string);
var
  sqlData : TSimpleDataSet;
  sqlTxt : TStringList;
begin
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;
  sqlTxt:=TStringList.Create;

  cdsCausa.Close;
  cdsCausa.CreateDataSet;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT SUBT_CAUSA.CD_SUBTIPO_CAUSA, SUBT_CAUSA.CD_SUBTIPO_OCORRENCIA,');
    sqlTxt.Add(' SUBT_CAUSA.CD_TIPO_OCORRENCIA,CAUSA.CD_CAUSA, CAUSA.DS_CAUSA');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_SUBTIPO_CAUSA SUBT_CAUSA');
    sqlTxt.Add('JOIN GAMSAC.DC_SAC_CAUSA CAUSA ON SUBT_CAUSA.CD_CAUSA = CAUSA.CD_CAUSA AND CAUSA.CD_CAUSA > 0');
    sqlTxt.Add(' AND CAUSA.ID_ATIVO = ''S'' ');
    if dsTipoOcorrencia <> EmptyStr then
    begin
      sqlTxt.Add('AND SUBT_CAUSA.CD_TIPO_OCORRENCIA IN ('+ dsTipoOcorrencia+') ');
      if dsSubTipoOcorrencia <> EmptyStr then
        sqlTxt.Add('AND SUBT_CAUSA.CD_SUBTIPO_OCORRENCIA IN ('+ dsSubTipoOcorrencia+') ');
      if dsCausa <> EmptyStr then
        sqlTxt.Add('AND SUBT_CAUSA.CD_CAUSA IN ('+ dsCausa+') ');
    end;

    sqlTxt.Add('ORDER BY SUBT_CAUSA.CD_SUBTIPO_CAUSA');

    sqlData.Close;
    sqlData.DataSet.CommandText:=sqlTxt.Text;
    sqlData.Open;

    while not sqlData.eof do
    begin
      if not cdsCausa.Active then
        cdsCausa.Open;

      cdsCausa.Append;
      cdsCausaCD_SUBTIPO_CAUSA.AsInteger:=sqlData.FieldByName('CD_SUBTIPO_CAUSA').AsInteger;
      cdsCausaCD_SUBTIPO_OCORRENCIA.AsInteger:=sqlData.FieldByName('CD_SUBTIPO_OCORRENCIA').AsInteger;
      cdsCausaCD_TIPO_OCORRENCIA.AsInteger:=sqlData.FieldByName('CD_TIPO_OCORRENCIA').AsInteger;
      cdsCausaCD_CAUSA.AsInteger:=sqlData.FieldByName('CD_CAUSA').AsInteger;
      cdsCausaDS_CAUSA.AsString:=sqlData.FieldByName('DS_CAUSA').AsString;
      cdsCausa.Post;

      sqlData.Next;
    end;
    if not isAtivarLista then
      cdsCausa.Close;
  finally
    sqlTxt.Free;
    sqlData.Close;
    sqlData.Free;
  end;
end;

procedure TDM.gravarDadosSupervisorArea(nrMatricula:integer;dsNome:string);
begin
  with cdsListaSupervisorArea do
  begin
    if not Locate('NR_MATRICULA',nrMatricula,[loPartialKey,loCaseInsensitive]) then
    begin
      Append;
      FieldByName('NR_MATRICULA').AsInteger:=nrMatricula;
      FieldByName('NM_SUPERVISOR').AsString:=UpperCase(Trim(dsNome));
      Post;
    end;
  end;
end;

procedure TDM.gravarDadosGerenteDepto(nrMatricula:integer;dsNome:string);
begin
  with cdsListaGerenteDepto do
  begin
    if not Locate('NR_MATRICULA',nrMatricula,[loPartialKey,loCaseInsensitive]) then
    begin
      Append;
      FieldByName('NR_MATRICULA').AsInteger:=nrMatricula;
      FieldByName('NM_GERENTE').AsString:=UpperCase(Trim(dsNome));
      Post;
    end;
  end;
end;

procedure TDM.gravarListaEmailUsuario(dsNome,dsemail:string);
begin
  with cdsListaEmailUsuario do
  begin
    Append;
    FieldByName('NM_USUARIO').AsString:=dsNome;
    FieldByName('DS_EMAIL').AsString:=dsemail;
    Post;
  end;
end;


procedure TDM.carregaSolucionador(isAtivarLista:Boolean);
var
  sqlData : TSimpleDataSet;
  sqltxt: TStringList;

begin
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;
  sqltxt:=TStringList.Create;

  cdsSolucionador.Close;
  cdsSolucionador.CreateDataSet;

  cdsListaGerenteDepto.Close;
  cdsListaGerenteDepto.CreateDataSet;

  cdsListaSupervisorArea.Close;
  cdsListaSupervisorArea.CreateDataSet;

  cdsListaEmailUsuario.Close;
  cdsListaEmailUsuario.CreateDataSet;

  try
    sqltxt.Clear;
    sqltxt.Add('SELECT SOLUC.NR_MATRIC_SOLUCIONADOR MAT_SOLUCIONADOR, SOLUC.NM_SOLUCIONADOR NOME_SOLUCIONADOR,SOLUC.DS_EMAIL EMAIL_SOLUCIONADOR,');
    sqltxt.Add(' AREA.NR_MATRIC_GERENTE_AREA MAT_GERENTE_AREA, Nvl(GER_AREA.NM_USUARIO,''NAO LOCALIZADO'') NOME_GERENTE_AREA,EMAIL_AREA.DS_EMAIL EMAIL_GERENTE_AREA,');
    sqltxt.Add(' DEPTO.CD_DEPTO COD_DEPTO, DEPTO.DS_DEPTO DESC_DEPTO,AREA.CD_AREA_ORIGEM AREA_ORIGEM,');
    sqltxt.Add(' DEPTO.NR_MATRIC_GERENTE_DEPTO MAT_GERENTE_DEPTO, Nvl(GER_DEPTO.NM_USUARIO,''NAO LOCALIZADO'') NOME_GERENTE_DEPTO,EMAIL_DEPTO.DS_EMAIL EMAIL_GERENTE_DEPTO,');
    sqltxt.Add(' AREA.QTD_DIAS_SOLUCAO PRAZO, USUARIO.CD_EMPRESA ');
    sqltxt.Add('FROM GAMSAC.DC_SAC_SOLUCIONADOR SOLUC');
    sqltxt.Add(' LEFT OUTER JOIN ACESSO.DC_USUARIO USUARIO ON SOLUC.NR_MATRIC_SOLUCIONADOR = USUARIO.NR_MATRICULA AND USUARIO.ID_ATIVO = ''A'' ');
    sqltxt.Add(' JOIN GAMSAC.DC_SAC_DEPTO DEPTO ON SOLUC.CD_DEPTO = DEPTO.CD_DEPTO');
    sqltxt.Add(' LEFT OUTER JOIN ACESSO.DC_USUARIO GER_DEPTO ON DEPTO.NR_MATRIC_GERENTE_DEPTO = GER_DEPTO.NR_MATRICULA');
    sqltxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_SOLUCIONADOR EMAIL_DEPTO ON EMAIL_DEPTO.NR_MATRIC_SOLUCIONADOR = GER_DEPTO.NR_MATRICULA');
    sqltxt.Add(' JOIN GAMSAC.DC_SAC_AREA_DEPTO AREA ON SOLUC.CD_AREA_DEPTO = AREA.CD_AREA_DEPTO');
    sqltxt.Add(' LEFT OUTER JOIN ACESSO.DC_USUARIO GER_AREA ON AREA.NR_MATRIC_GERENTE_AREA = GER_AREA.NR_MATRICULA');
    sqltxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_SOLUCIONADOR EMAIL_AREA ON EMAIL_AREA.NR_MATRIC_SOLUCIONADOR = GER_AREA.NR_MATRICULA');
    sqltxt.Add('WHERE SOLUC.ID_ATIVO = ''S'' ');
    sqltxt.Add('ORDER BY SOLUC.NM_SOLUCIONADOR');
    //sqltxt.SaveToFile('sqlEmailSolucionador.sql');
    sqlData.Close;
    sqlData.DataSet.CommandText:=sqltxt.Text;
    sqlData.Open;

    while not sqlData.eof do
    begin
      if not cdsSolucionador.Active then
        cdsSolucionador.Open;

      cdsSolucionador.Append;
      cdsSolucionadorNR_MATRIC_SOLUCIONADOR.AsInteger:=sqlData.FieldByName('MAT_SOLUCIONADOR').AsInteger;
      cdsSolucionadorNM_SOLUCIONADOR.AsString:=sqlData.FieldByName('NOME_SOLUCIONADOR').AsString;
      cdsSolucionadorDS_EMAIL_SOLUCIONADOR.AsString:=sqlData.FieldByName('EMAIL_SOLUCIONADOR').AsString;
      cdsSolucionadorCD_DEPTO.AsInteger:=sqlData.FieldByName('COD_DEPTO').AsInteger;
      cdsSolucionadorDS_DEPTO.AsString:=sqlData.FieldByName('DESC_DEPTO').AsString;
      cdsSolucionadorDS_EMAIL_GERENTE_DEPTO.AsString:=sqlData.FieldByName('EMAIL_GERENTE_DEPTO').AsString;

      { supervisor da area }
      cdsSolucionadorCD_GERENTE_AREA.AsInteger:=sqlData.FieldByName('MAT_GERENTE_AREA').AsInteger;

      cdsSolucionadorNM_GERENTE_AREA.AsString:=sqlData.FieldByName('NOME_GERENTE_AREA').AsString;

      { gravar dados }
       gravarDadosSupervisorArea(sqlData.FieldByName('MAT_GERENTE_AREA').AsInteger,sqlData.FieldByName('NOME_GERENTE_AREA').AsString);

      { gerente do depto }
      cdsSolucionadorCD_GERENTE_DEPTO.AsInteger:=sqlData.FieldByName('MAT_GERENTE_DEPTO').AsInteger;
      cdsSolucionadorNM_GERENTE_DEPTO.AsString:=sqlData.FieldByName('NOME_GERENTE_DEPTO').AsString;
      { gravar dados}
      gravarDadosGerenteDepto(sqlData.FieldByName('MAT_GERENTE_DEPTO').AsInteger,sqlData.FieldByName('NOME_GERENTE_DEPTO').AsString);

      cdsSolucionadorDS_EMAIL_GERENTE_AREA.AsString:=sqlData.FieldByName('EMAIL_GERENTE_AREA').AsString;
      cdsSolucionadorQTD_DIAS_SOLUCAO.AsInteger:=sqlData.FieldByName('PRAZO').AsInteger;
      cdsSolucionadorCD_AREA_ORIGEM.AsInteger:=sqlData.FieldByName('AREA_ORIGEM').AsInteger;
      cdsSolucionadorCD_EMPRESA.AsInteger:=sqlData.FieldByName('CD_EMPRESA').AsInteger;
      cdsSolucionador.Post;

      { gravar dados de email }
      gravarListaEmailUsuario(sqlData.FieldByName('NOME_SOLUCIONADOR').AsString,sqlData.FieldByName('EMAIL_SOLUCIONADOR').AsString);

      sqlData.Next;
    end;

    if not isAtivarLista then
    begin
      cdsSolucionador.Close;
      cdsListaSupervisorArea.Close;
      cdsListaGerenteDepto.Close;
    end;
  finally
    sqltxt.Free;
    sqlData.Close;
    sqlData.Free;
  end;
end;

procedure TDM.carregaListaUsuario;
var
  sqlData : TSimpleDataSet;
  sqltxt: TStringList;
begin
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;
  sqltxt:=TStringList.Create;

  cdsListaUsuario.Close;
  cdsListaUsuario.CreateDataSet;
  try
    sqltxt.Clear;
    sqltxt.Add('SELECT USUARIO.NR_MATRICULA, USUARIO.NM_USUARIO, USUARIO.CD_FUNCAO,');
    sqltxt.Add(' FUNCAO.NM_FUNCAO, USUARIO.CD_EMPRESA ');
    sqltxt.Add('FROM ACESSO.DC_USUARIO USUARIO ');
    sqltxt.Add('JOIN ACESSO.DC_FUNCAO FUNCAO ON USUARIO.CD_FUNCAO = FUNCAO.CD_FUNCAO ');
    sqltxt.Add('WHERE USUARIO.ID_ATIVO = ''A'' ');
    sqltxt.Add('ORDER BY USUARIO.NM_USUARIO,USUARIO.NR_MATRICULA ');
    sqlData.Close;
    sqlData.DataSet.CommandText:=sqltxt.Text;
    sqlData.Open;
    while not sqlData.eof do
    begin
      if not cdsListaUsuario.Active then
        cdsListaUsuario.Open;

      cdsListaUsuario.Append;
      cdsListaUsuarioNR_MATRICULA.AsInteger:=sqlData.FieldByName('NR_MATRICULA').AsInteger;
      cdsListaUsuarioNM_USUARIO.AsString:=trim(sqlData.FieldByName('NM_USUARIO').AsString);
      cdsListaUsuarioCD_FUNCAO.AsInteger:=sqlData.FieldByName('CD_FUNCAO').AsInteger;
      cdsListaUsuarioNM_FUNCAO.AsString:=trim(sqlData.FieldByName('NM_FUNCAO').AsString);
      cdsListaUsuarioCD_EMPRESA.AsInteger:=sqlData.FieldByName('CD_EMPRESA').AsInteger;
      cdsListaUsuarioNM_USUARIO_MATRICULA.AsString:=format('%s [%d]',[trim(sqlData.FieldByName('NM_USUARIO').AsString),sqlData.FieldByName('NR_MATRICULA').AsInteger]);

      cdsListaUsuario.Post;

      sqlData.Next;
    end;
    cdsListaUsuario.Close;
  finally
    sqltxt.Free;
    sqlData.Close;
    sqlData.Free;
  end;
end;

procedure TDM.carregaListaDepartamento;
var
  sqlData : TSimpleDataSet;
  sqltxt: TStringList;
begin
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;
  sqltxt:=TStringList.Create;

  cdsListaDepartamento.Close;
  cdsListaDepartamento.CreateDataSet;
  try
    sqltxt.Clear;
    sqltxt.Add('SELECT CD_DEPTO, DS_DEPTO, NR_MATRIC_GERENTE_DEPTO');
    sqltxt.Add('FROM GAMSAC.DC_SAC_DEPTO ');
    sqltxt.Add('ORDER BY DS_DEPTO');
    sqlData.Close;
    sqlData.DataSet.CommandText:=sqltxt.Text;
    sqlData.Open;
    while not sqlData.eof do
    begin
      if not cdsListaDepartamento.Active then
        cdsListaDepartamento.Open;

      cdsListaDepartamento.Append;
      cdsListaDepartamentoCD_DEPTO.AsInteger:=sqlData.FieldByName('CD_DEPTO').AsInteger;
      cdsListaDepartamentoDS_DEPTO.AsString:=trim(sqlData.FieldByName('DS_DEPTO').AsString);
      cdsListaDepartamentoNR_MATRIC_GERENTE_DEPTO.AsInteger:=sqlData.FieldByName('NR_MATRIC_GERENTE_DEPTO').AsInteger;
      cdsListaDepartamento.Post;

      sqlData.Next;
    end;
    cdsListaDepartamento.Close;
  finally
    sqltxt.Free;
    sqlData.Close;
    sqlData.Free;
  end;
end;

procedure TDM.carregaListaAreaDepartamento(isAtivarLista:Boolean);
var
  sqlData : TSimpleDataSet;
  sqltxt: TStringList;
begin
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;
  sqltxt:=TStringList.Create;

  cdsListaAreaDepto.Close;
  cdsListaAreaDepto.CreateDataSet;
  try
    sqltxt.Clear;
    sqltxt.Add('SELECT CD_AREA_DEPTO, CD_DEPTO, DS_AREA_DEPTO, QTD_DIAS_SOLUCAO, NR_MATRIC_GERENTE_AREA');
    sqltxt.Add('FROM GAMSAC.DC_SAC_AREA_DEPTO ');
    sqltxt.Add('ORDER BY DS_AREA_DEPTO');
    sqlData.Close;
    sqlData.DataSet.CommandText:=sqltxt.Text;
    sqlData.Open;
    while not sqlData.eof do
    begin
      if not cdsListaAreaDepto.Active then
        cdsListaAreaDepto.Open;

      cdsListaAreaDepto.Append;
      cdsListaAreaDeptoCD_AREA_DEPTO.AsInteger:=sqlData.FieldByName('CD_AREA_DEPTO').AsInteger;
      cdsListaAreaDeptoCD_DEPTO.AsInteger:=sqlData.FieldByName('CD_DEPTO').AsInteger;
      cdsListaAreaDeptoDS_AREA_DEPTO.AsString:=trim(sqlData.FieldByName('DS_AREA_DEPTO').AsString);
      cdsListaAreaDeptoQTD_DIAS_SOLUCAO.AsInteger:=sqlData.FieldByName('QTD_DIAS_SOLUCAO').AsInteger;
      cdsListaAreaDeptoNR_MATRIC_GERENTE_AREA.AsInteger:=sqlData.FieldByName('NR_MATRIC_GERENTE_AREA').AsInteger;
      cdsListaAreaDepto.Post;

      sqlData.Next;
    end;
    cdsListaAreaDepto.Close;
  finally
    sqltxt.Free;
    sqlData.Close;
    sqlData.Free;
  end;
end;

procedure TDM.inicializarDataSetLocal(isLimparOcorrencia,isEmissaoDentroPrazo48Horas,isControlarTipoOcorrencia:Boolean);
begin
  if isLimparOcorrencia then
  begin
    if cdsOcorrencia.Active then
    begin
      cdsOcorrencia.EmptyDataSet;
      cdsItemOcorrencia.EmptyDataSet;
    end;
  end;

  { limpar indice de ordenação}
  sqlGenericaCadastro.IndexName:='';

  cdsTipoOcorrencia.Open;
  cdsTipoOcorrencia.First;
  cdsTipoOcorrencia.Filtered:=False;


  { Controle de avarias de notas emitidas em ate 48 horas - Desabilitado conforme SS.: 35116 }
  { se for canal farma - controla as ocorrencias de avaria conforme a data de emissao da nfe  }
  {
  if isControlarTipoOcorrencia then
  begin
    // verifica intervalo entre a emissao da nota e a reclamação da avaria
    if not isEmissaoDentroPrazo48Horas then
    begin
      // Produto Avariado - 48H
      cdsTipoOcorrencia.Filter:='CD_TIPO_OCORRENCIA <> 15';
      cdsTipoOcorrencia.Filtered:=True;
    end
    else
    begin
      // Produto Avariado
      cdsTipoOcorrencia.Filter:='CD_TIPO_OCORRENCIA <> 2';
      cdsTipoOcorrencia.Filtered:=True;
    end;
  end;
  }

  cdsSubTipoOcorrencia.Open;
  cdsSubTipoOcorrencia.First;
  cdsSubTipoOcorrencia.Filtered:=False;

  cdsSituacaoEmbalagem.Open;
  cdsSituacaoEmbalagem.First;
  cdsSituacaoEmbalagem.Filtered:=False;

  cdsSolucionador.Open;
  cdsSolucionador.First;
  cdsSolucionador.Filtered:=False;

  cdsSolucao.Open;
  cdsSolucao.First;
  cdsSolucao.Filtered:=False;

  cdsCausa.Open;
  cdsCausa.First;
  cdsCausa.Filtered:=False;

  cdsStatusSolucao.Open;
  cdsStatusSolucao.First;
  cdsStatusSolucao.Filtered:=False;

  cdsStatusCausa.Open;
  cdsStatusCausa.First;
  cdsStatusCausa.Filtered:=False;

  cdsListaSolucao.Open;
  cdsListaSolucao.First;
  cdsListaSolucao.Filtered:=False;

  cdsListaCausa.Open;
  cdsListaCausa.First;
  cdsListaCausa.Filtered:=False;

  cdsSolucionador.Open;
  cdsSolucionador.First;
  cdsSolucionador.Filtered:=False;

  cdsListaUsuario.Open;
  cdsListaUsuario.First;
  cdsListaUsuario.Filtered:=False;

  cdsListaDepartamento.Open;
  cdsListaDepartamento.First;
  cdsListaDepartamento.Filtered:=False;

  cdsListaAreaDepto.Open;
  cdsListaAreaDepto.First;
  cdsListaAreaDepto.Filtered:=False;

  cdsListaAreaOrigem.Open;
  cdsListaAreaOrigem.First;
  cdsListaAreaOrigem.Filtered:=False;

  cdsListaGerenteDepto.Open;
  cdsListaGerenteDepto.First;
  cdsListaGerenteDepto.Filtered:=False;

  cdsListaSupervisorArea.Open;
  cdsListaSupervisorArea.First;
  cdsListaSupervisorArea.Filtered:=False;

  cdsMotivoCancelamento.Open;
  cdsMotivoCancelamento.First;
  cdsMotivoCancelamento.Filtered:=false;

end;

procedure TDM.execFiltroSubTipoOcorrencia(id:integer;dsTipoOcorrencia:string);
var
  i : integer;
begin
  i:=0;
  cdsSubTipoOcorrencia.Open;
  cdsSubTipoOcorrencia.First;
  cdsSubTipoOcorrencia.Filtered:=false;

  if dsTipoOcorrencia <> EmptyStr then
    cdsSubTipoOcorrencia.Filter:='CD_TIPO_OCORRENCIA In ('+dsTipoOcorrencia+')';
  cdsSubTipoOcorrencia.Filtered:=true;
end;

procedure TDM.execFiltroSubTipoOcorrencia(cdTipoOcorrencia:integer);
var
  i : integer;
begin
  i:=0;
  cdsSubTipoOcorrencia.Open;
  cdsSubTipoOcorrencia.First;
  cdsSubTipoOcorrencia.Filtered:=false;

  if cdTipoOcorrencia > 0 then
    cdsSubTipoOcorrencia.Filter:='CD_TIPO_OCORRENCIA = ' + inttostr(cdTipoOcorrencia);
  cdsSubTipoOcorrencia.Filtered:=true;
end;

procedure TDM.execFiltroCausaItemOcorrencia(cdTipoOcorrencia,cdSubTipoOcorrencia:integer);
begin
  cdsCausa.Open;
  cdsCausa.First;
  cdsCausa.Filtered:=false;
  cdsCausa.Filter:='CD_TIPO_OCORRENCIA = ' + inttostr(cdTipoOcorrencia) + ' AND CD_SUBTIPO_OCORRENCIA = ' + inttostr(cdSubTipoOcorrencia);
  cdsCausa.Filtered:=true;
end;

procedure TDM.execFiltroSolucaoItemOcorrencia(cdTipoOcorrencia,cdSubTipoOcorrencia,cdSolucao:integer);
begin
  cdsSolucao.Open;
  cdsSolucao.First;
  cdsSolucao.Filtered:=false;
  cdsSolucao.Filter:='CD_TIPO_OCORRENCIA = ' + inttostr(cdTipoOcorrencia) + ' AND CD_SUBTIPO_OCORRENCIA = ' + inttostr(cdSubTipoOcorrencia);
  if cdSolucao > 0 then
    cdsSolucao.Filter:=cdsSolucao.Filter + ' AND CD_SOLUCAO = ' + inttostr(cdSolucao);
  cdsSolucao.Filtered:=true;
end;

procedure TDM.execFiltroSolucionador(cdEmpresa,cdDepto:integer;dsMatricSolucionador:string;isSolucionadorPadrao,isDistrito,isPrimeiraPesquisa,isListarTodos:Boolean);
begin
  cdsSolucionador.Open;
  cdsSolucionador.First;
  cdsSolucionador.Filter:='';
  cdsSolucionador.Filtered:=false;
  if not isListarTodos then
  begin
    if isSolucionadorPadrao then
      cdsSolucionador.Filter:='NR_MATRIC_SOLUCIONADOR = ' + dsMatricSolucionador
    else
      if cdDepto > 0 then
        cdsSolucionador.Filter:='CD_DEPTO = ' + inttostr(cdDepto);

    if isDistrito then
      cdsSolucionador.Filter:='NM_SOLUCIONADOR LIKE ''DISTRITO%''';

    if cdEmpresa > 0 then
    begin
      if cdsSolucionador.Filter = EmptyStr then
        cdsSolucionador.Filter:='CD_EMPRESA = ' + IntToStr(cdEmpresa)
      else
        cdsSolucionador.Filter:=cdsSolucionador.Filter + ' AND CD_EMPRESA = ' + IntToStr(cdEmpresa)
    end;
  end;
  cdsSolucionador.Filtered:=true;

  if cdsSolucionador.RecordCount = 0 then
  begin
    cdsSolucionador.Open;
    cdsSolucionador.First;
    cdsSolucionador.Filtered:=false;

    { refaz a pesquisa passando empresa "zero" }
    if isPrimeiraPesquisa then
      execFiltroSolucionador(0,cdDepto,dsMatricSolucionador,isSolucionadorPadrao,isDistrito,False,False);
  end;
end;

procedure TDM.execFiltroListaUsuario(isGerente,isSupervisor:Boolean);
begin
  cdsListaUsuario.Open;
  cdsListaUsuario.First;
  cdsListaUsuario.Filtered:=false;

  if isGerente then
    cdsListaUsuario.Filter:='NM_FUNCAO LIKE ''%GERENTE%'' ';

  if isSupervisor then
    cdsListaUsuario.Filter:='NM_FUNCAO LIKE ''%SUPERVISOR%'' ';

  cdsListaUsuario.Filtered:=true;
end;

procedure TDM.execFiltroAreaSolucionador(cdDepto:integer);
begin
  cdsListaAreaDepto.Open;
  cdsListaAreaDepto.First;
  cdsListaAreaDepto.Filtered:=false;
  cdsListaAreaDepto.Filter:='CD_DEPTO = ' + inttostr(cdDepto);
  cdsListaAreaDepto.Filtered:=true;
end;

procedure TDM.alterarStatusLigacaoPorTelefone(ligacao:TFDadosLigacao; idStatus:integer);
var
  sqlQuery : TSQLQuery;
  sqlTxt : string;

begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  try
    sqlTxt:='UPDATE PRDDM.DC_SAC_LOG_LIGACAO SET CD_TIPO_ATENDIMENTO = :CD_TIPO_ATENDIMENTO';
    sqlTxt:=sqlTxt + ' WHERE CD_TIPO_ATENDIMENTO = 1 and trunc(DT_LIGACAO) = :DT_LIGACAO and NR_TELEFONE = :NR_TELEFONE ';

    sqlQuery.Close;
    sqlQuery.SQL.Text:=sqlTxt;
    sqlQuery.ParamByName('CD_TIPO_ATENDIMENTO').AsString:=inttostr(idStatus);
    sqlQuery.ParamByName('DT_LIGACAO').AsString:=FormatDateTime('dd/mm/yyyy',dadosEmpresa.dataSistema);
    sqlQuery.ParamByName('NR_TELEFONE').AsString:=ligacao.nrTelefone;
    sqlQuery.ExecSQL();
  finally
    sqlQuery.Free;
    sqlQuery:=nil;
  end;
end;

procedure TDM.alterarStatusLigacao(ligacao:TFDadosLigacao; idStatus:integer);
var
  sqlQuery : TSQLQuery;
  sqlTxt : string;

begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  try
    sqlTxt:='UPDATE PRDDM.DC_SAC_LOG_LIGACAO SET CD_TIPO_ATENDIMENTO = ' + inttostr(idStatus);
    sqlTxt:=sqlTxt + ' WHERE CD_LOG_LIGACAO = ' + inttostr(ligacao.codigoLigacao);

    sqlQuery.Close;
    sqlQuery.SQL.Text:=sqlTxt;
    sqlQuery.ExecSQL();

    if idStatus in [TIPO_LIGACAO_ATENDIDO_NORMAL,TIPO_LIGACAO_RETORNO_OK] then
      alterarStatusLigacaoPorTelefone(ligacao,TIPO_LIGACAO_SEM_RETORNO);
  finally
    sqlQuery.Free;
    sqlQuery:=nil;
  end;
end;

procedure TDM.consultaFiladeEspera(idTipoLigacao:string);
begin
  try
    DM.sqlConsultaFilaLigacao.Close;
    DM.sqlConsultaFilaLigacao.DataSet.ParamByName('CD_TIPO_ATENDIMENTO').AsString:=idTipoLigacao;
    DM.sqlConsultaFilaLigacao.Open;
  except
    on E:Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TDM.execControledeLigacao;
begin
  try
    sqlControleLigacao.Close;
    sqlControleLigacao.Open;
  except
    on E:Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TDM.ordenarGridS(dsDataSet:TSimpleDataSet;nmColuna:string);
  function getIndiceAtual:string;
  var
    i:integer;
  begin
    i:=pos('.',dsDataSet.IndexDefs[0].Name);
    Result:=copy(dsDataSet.IndexDefs[0].Name,1,i-1);
  end;
var
  indice : string;
  idDec : Boolean;

begin
  { nome do indice }
  indice:=nmColuna + '.' + inttostr(Random(9999));

  if dsDataSet.IndexDefs.Count > 0 then
  begin
    if ((ixDescending in dsDataSet.IndexDefs[0].Options) or (nmColuna <> getIndiceAtual)) then
      idDec:=false
    else
      idDec:=true;
  end
  else
    idDec:=false;

  { limpa indice existente }
  dsDataSet.IndexDefs.Clear;

  if idDec then
    dsDataSet.IndexDefs.Add(indice,nmColuna,[ixDescending])
  else
    dsDataSet.IndexDefs.Add(indice,nmColuna,[]);

  dsDataSet.IndexName:=indice;
  dsDataSet.First;
end;

procedure TDM.ordenarGridD(dsDataSet:TClientDataSet;nmColuna:string);
  function getIndiceAtual:string;
  var
    i:integer;
  begin
    i:=pos('.',dsDataSet.IndexDefs[0].Name);
    Result:=copy(dsDataSet.IndexDefs[0].Name,1,i-1);
  end;
var
  indice : string;
  idDec : Boolean;

begin
  { nome do indice }
  indice:=nmColuna + '.' + inttostr(Random(9999));

  if dsDataSet.IndexDefs.Count > 0 then
  begin
    if ((ixDescending in dsDataSet.IndexDefs[0].Options) or (nmColuna <> getIndiceAtual)) then
      idDec:=false
    else
      idDec:=true;
  end
  else
    idDec:=false;

  { limpa indice existente }
  dsDataSet.IndexDefs.Clear;

  if idDec then
    dsDataSet.IndexDefs.Add(indice,nmColuna,[ixDescending])
  else
    dsDataSet.IndexDefs.Add(indice,nmColuna,[]);

  dsDataSet.IndexName:=indice;
  dsDataSet.First;
end;

function TDM.getNovoNumeroOcorrencia : integer;
var
  sqlData : TSimpleDataSet;
begin
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;
  try
    try
      sqlData.Close;
      //sqlData.DataSet.CommandText:='SELECT MAX(CD_OCORRENCIA) MAX_RG '+
      //                             'FROM GAMSAC.DC_SAC_OCORRENCIA';
      sqlData.DataSet.CommandText:='SELECT GAMSAC.SQ_SAC_OCORRENCIA.NEXTVAL SEQ FROM DUAL';
      sqlData.Open;
      Result:=sqlData.FieldByName('SEQ').AsInteger;
    except
      on E:Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    sqlData.Close;
    sqlData.Free;
  end;
end;

procedure TDM.consultarCliente;
var
  sqlTxt : string;
  dsCodigo : string;
begin
  try
    sqlTxt:='SELECT CLIENTE.NROC_C,CLIENTE.DIGC_C,CLIENTE.TIPC_C,CLIENTE.CANC_C,PESSOA.NOMP_P,PESSOA.MUNP_P,';
    sqlTxt:=sqlTxt + 'PESSOA.UFEP_P,CLIENTE.CD_EMPRESA_ESTOQUE,CLIENTE.DUCC_C,PESSOA.DVAP_P,DS_LOGRADOURO,NR_LOGRADOURO,NM_BAIRRO,NM_CIDADE,ID_ESTADO,';
    sqlTxt:=sqlTxt + 'CLIENTE.NROV_C,Round(NROV_C / 100) * 100 DISTRITO,';
    sqlTxt:=sqlTxt + 'ENTREGA.CD_ENTREGA ENTREGADOR, ENTREGA.DS_ETIQUETA ETIQUETA,ENTREGA.CD_TRANSPORTADOR,';
    sqlTxt:=sqlTxt + 'CLIENTE.ID_SITUACAO_CLIENTE, PESSOA.CGCP_P,SETOR.NOMV_V,PESSOA.ENDP_P, ';
    sqlTxt:=sqlTxt + 'Nvl(EMAIL_NFE.DS_EMAIL_NFE_PRINCIPAL,CLIENTE.NM_EMAIL_NFE) DS_EMAIL_NFE_PRINCIPAL,';
    sqlTxt:=sqlTxt + 'Nvl(EMAIL_NFE_COPIA.DS_EMAIL_NFE_COPIA,CLIENTE.NM_EMAIL_NFE_COPIA) DS_EMAIL_NFE_COPIA,';
    sqlTxt:=sqlTxt + 'Nvl(EMAIL_NFE_SAC.DS_EMAIL_SAC,'''') DS_EMAIL_SAC, Nvl(EMAIL_NFE_SAC.NM_RESPONSAVEL,'''') NM_CONTATO_SAC,';
    sqlTxt:=sqlTxt + 'Nvl(TELE.NR_TELEFONE,'''') NR_TELEFONE ';
    sqlTxt:=sqlTxt + 'FROM PRDDM.DCCLI CLIENTE ';
    sqlTxt:=sqlTxt + 'JOIN PRDDM.DCPES PESSOA ON CLIENTE.CGCP_C = PESSOA.CGCP_P ';
    sqlTxt:=sqlTxt + 'JOIN PRDDM.DC_ENDERECO_CLIENTE ENDERECO ON CLIENTE.NROC_C = ENDERECO.CD_CLIENTE ';
    sqlTxt:=sqlTxt + 'JOIN PRDDM.DCVEN SETOR ON CLIENTE.NROV_C = SETOR.NROV_V ';
    sqlTxt:=sqlTxt + 'JOIN GAMFRETE.DC_ENTREGA ENTREGA ON CLIENTE.CD_ENTREGA_CAMINHAO_SECUNDARIO = ENTREGA.CD_ENTREGA ';
    sqlTxt:=sqlTxt + 'LEFT OUTER JOIN PRDDM.DC_TELEFONE_CLIENTE TELE ON CLIENTE.NROC_C = TELE.NR_CLIENTE AND TELE.ID_TELEFONE_CLIENTE = ''S'' ';
    sqlTxt:=sqlTxt + 'LEFT OUTER JOIN ( SELECT CD_CLIENTE,DS_EMAIL_CLIENTE DS_EMAIL_NFE_PRINCIPAL ';
    sqlTxt:=sqlTxt + '                  FROM PRDDM.DC_EMAIL_CLIENTE ';
    sqlTxt:=sqlTxt + '                  WHERE CD_EMAIL_CATEGORIA = 1 '; { NFE PRINCIPAL }
    sqlTxt:=sqlTxt + '                ) EMAIL_NFE ON CLIENTE.NROC_C = EMAIL_NFE.CD_CLIENTE ';
    sqlTxt:=sqlTxt + 'LEFT OUTER JOIN ( SELECT CD_CLIENTE,DS_EMAIL_CLIENTE DS_EMAIL_NFE_COPIA ';
    sqlTxt:=sqlTxt + '                  FROM PRDDM.DC_EMAIL_CLIENTE ';
    sqlTxt:=sqlTxt + '                  WHERE CD_EMAIL_CATEGORIA = 2 ';  { NFE COPIA }
    sqlTxt:=sqlTxt + '                ) EMAIL_NFE_COPIA ON CLIENTE.NROC_C = EMAIL_NFE_COPIA.CD_CLIENTE ';
    sqlTxt:=sqlTxt + 'LEFT OUTER JOIN ( SELECT CD_CLIENTE,DS_EMAIL_CLIENTE DS_EMAIL_SAC,NM_RESPONSAVEL ';
    sqlTxt:=sqlTxt + '                  FROM PRDDM.DC_EMAIL_CLIENTE ';
    sqlTxt:=sqlTxt + '                  WHERE CD_EMAIL_CATEGORIA = 31 '; { SAC}
    sqlTxt:=sqlTxt + '                ) EMAIL_NFE_SAC ON CLIENTE.NROC_C = EMAIL_NFE_SAC.CD_CLIENTE ';

    case filtroConsulta.idFiltro of
      0 : begin
            dsCodigo:=copy(filtroConsulta.dsFiltro,1,length(filtroConsulta.dsFiltro)-1);
            sqlTxt:=sqlTxt + 'WHERE NROC_C = ' + dsCodigo;
          end;
      1 : begin
            sqlTxt:=sqlTxt + 'WHERE CGCP_C = ' + filtroConsulta.dsFiltro;
          end;
      2 : begin
            sqlTxt:=sqlTxt + 'JOIN PRDDM.V_DCNOTHST NOTA ON CLIENTE.NROC_C = NOTA.NROC_N ';
            sqlTxt:=sqlTxt + '                        AND TIPN_N = ''V'' ';
            sqlTxt:=sqlTxt + 'WHERE NOTA.NR_NFE = ' + filtroConsulta.dsFiltro;
          end;
      3 : begin
            sqlTxt:=sqlTxt + 'JOIN PRDDM.DCDUP DUP ON CLIENTE.NROC_C = DUP.NROC_D ';
            sqlTxt:=sqlTxt + '                        AND TIPD_D = ''R'' ';
            sqlTxt:=sqlTxt + 'WHERE DUP.NROD_D = ' + filtroConsulta.dsFiltro;
          end;
      4 : begin
            filtroConsulta.dsFiltro:='%'+filtroConsulta.dsFiltro+'%';
            sqlTxt:=sqlTxt + 'WHERE PESSOA.NOMP_P LIKE ' + QuotedStr(filtroConsulta.dsFiltro);
            sqlTxt:=sqlTxt + ' ORDER BY NOMP_P';
          end;
    end;
    sqlConsultaCliente.Close;
    sqlConsultaCliente.DataSet.CommandText:=sqlTxt;
    sqlConsultaCliente.SaveToFile('C:\temp\'+sqlTxt);
    sqlConsultaCliente.Open;
  except
    on E:Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TDM.insertEmailContatoSacCliente(cliente : TCliente);
var
  sqlTxt : string;
  sqlQuery : TSQLQuery;
  i: integer;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  try
    try
      sqlTxt:='INSERT INTO PRDDM.DC_EMAIL_CLIENTE (CD_EMAIL_CATEGORIA, CD_CLIENTE,';
      sqlTxt:=sqlTxt + 'DS_EMAIL_CLIENTE, NM_USUARIO, DT_ATUALIZACAO,NM_RESPONSAVEL  ) VALUES (';
      sqlTxt:=sqlTxt + QuotedStr(CD_EMAIL_CATEGORIA_SAC)+',';
      sqlTxt:=sqlTxt + QuotedStr(inttostr(cliente.codigo))+',';
      sqlTxt:=sqlTxt + QuotedStr(cliente.emailSac)+',';
      sqlTxt:=sqlTxt + inttostr(usuario.matricula)+',';
      sqlTxt:=sqlTxt + 'SYSDATE'+',';
      sqlTxt:=sqlTxt + QuotedStr(cliente.contato)+')';

      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt;
      sqlQuery.ExecSQL;
    except
      on E:Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    sqlQuery.Free;
    sqlQuery:=nil;
  end;
end;

procedure TDM.alterarEmailSacCliente(cliente : TCliente);
var
  sqlTxt : string;
  sqlQuery : TSQLQuery;
  i: integer;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  try
    try
      sqlTxt:='UPDATE PRDDM.DC_EMAIL_CLIENTE SET DS_EMAIL_CLIENTE = :DS_EMAIL_CLIENTE,';
      sqlTxt:=sqlTxt + 'NM_RESPONSAVEL = :NM_RESPONSAVEL,DT_ATUALIZACAO = SYSDATE,NM_USUARIO = :NM_USUARIO ';
      sqlTxt:=sqlTxt + 'WHERE CD_EMAIL_CATEGORIA = :CD_EMAIL_CATEGORIA ';
      sqlTxt:=sqlTxt + 'AND CD_CLIENTE = :CD_CLIENTE ';

      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt;
      sqlQuery.ParamByName('DS_EMAIL_CLIENTE').AsString:=cliente.emailSac;
      sqlQuery.ParamByName('NM_RESPONSAVEL').AsString:=cliente.contato;
      sqlQuery.ParamByName('NM_USUARIO').AsString:=inttostr(usuario.matricula);
      sqlQuery.ParamByName('CD_EMAIL_CATEGORIA').AsString:=CD_EMAIL_CATEGORIA_SAC;
      sqlQuery.ParamByName('CD_CLIENTE').AsString:=inttostr(cliente.codigo);

      sqlQuery.ExecSQL;
    except
      on E:Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    sqlQuery.Free;
    sqlQuery:=nil;
  end;
end;

function TDM.getTelefoneIdentificacaoCliente(cdCliente:string) : string;
var
  sqlData : TSimpleDataSet;
begin
  Result:='';
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;
  try
    try
      sqlData.Close;
      sqlData.DataSet.CommandText:='SELECT NR_TELEFONE TELEFONE ' +
                                   'FROM PRDDM.DC_TELEFONE_CLIENTE ' +
                                   'WHERE NR_CLIENTE = ' + cdCliente +
                                   ' ORDER BY DT_ATUALIZACAO DESC';
      sqlData.Open;
      if not sqlData.IsEmpty then
        Result:=sqlData.FieldByName('TELEFONE').AsString;
    except
      on E:Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    sqlData.Close;
    sqlData.Free;
  end;
end;

function TDM.isProtocoloGravado(nrProtocolo:integer) : Boolean;
var
  sqlData : TSimpleDataSet;
begin
  Result:=False;
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;
  try
    try
      sqlData.Close;
      sqlData.DataSet.CommandText:='SELECT CD_OCORRENCIA ' +
                                   'FROM GAMSAC.DC_SAC_OCORRENCIA ' +
                                   'WHERE CD_OCORRENCIA = ' + inttostr(nrProtocolo);
      sqlData.Open;
      if not sqlData.IsEmpty then
        Result:=True;
    except
      on E:Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    sqlData.Close;
    sqlData.Free;
  end;
end;

function TDM.getOcorrenciaRegistradaDaNFe(cdEmpresa,nrNFe,nrSerieNFe,cdMercadoria:integer) : integer;
var
  sqlData : TSimpleDataSet;
  sqlTxt: TStringList;
begin
  Result:=0;
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    try
      sqlTxt.Add('SELECT DISTINCT CD_OCORRENCIA');
      sqlTxt.Add('FROM GAMSAC.DC_SAC_ITEM_OCORRENCIA');
      sqlTxt.Add('WHERE CD_EMPRESA_ITEM_OCORRENCIA = :CD_EMPRESA');
      sqlTxt.Add('AND NR_NFE_ITEM_OCORRENCIA = :NR_NFE');
      sqlTxt.Add('AND NR_SERIE_NFE = :NR_SERIE_NFE');
      if cdMercadoria > 0 then
        sqlTxt.Add('AND CD_PRODUTO_ITEM_OCORRENCIA = :CD_PRODUTO');

      sqlData.Close;
      sqlData.DataSet.CommandText:=sqlTxt.Text;

      sqlData.DataSet.ParamByName('CD_EMPRESA').AsString:=IntToStr(cdEmpresa);
      sqlData.DataSet.ParamByName('NR_NFE').AsString:=IntToStr(nrNFe);
      sqlData.DataSet.ParamByName('NR_SERIE_NFE').AsString:=IntToStr(nrSerieNFe);
      if cdMercadoria > 0 then
        sqlData.DataSet.ParamByName('CD_PRODUTO').AsString:=IntToStr(cdMercadoria);

      sqlData.Open;
      if not sqlData.IsEmpty then
        Result:=sqlData.FieldByName('CD_OCORRENCIA').AsInteger;
    except
      on E:Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    sqlTxt.Free;
    sqlData.Close;
    sqlData.Free;
  end;
end;

procedure TDM.insertTelefoneCliente(idTipoTelefone,dsTelefone:string;cliente : TCliente);
  function getcdTelefone: integer;
  var
    sqlData : TSimpleDataSet;
  begin
    sqlData:=TSimpleDataSet.Create(nil);
    sqlData.Connection:=conexaoProducao;
    try
      try
        sqlData.Close;
        sqlData.DataSet.CommandText:='SELECT MAX(CD_TELEFONE) MAX '+
                                     'FROM PRDDM.DC_TELEFONE_CLIENTE';
        sqlData.Open;
        Result:=sqlData.FieldByName('MAX').AsInteger + 1;
      except
        on E:Exception do
          raise Exception.Create(E.Message);
      end;
    finally
      sqlData.Close;
      sqlData.Free;
    end;
  end;

var
  sqlTxt : string;
  sqlQuery : TSQLQuery;
  i: integer;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  try
    try
      sqlTxt:='INSERT INTO PRDDM.DC_TELEFONE_CLIENTE (CD_TELEFONE, NR_CLIENTE,';
      sqlTxt:=sqlTxt + 'NR_TELEFONE,ID_TELEFONE_CLIENTE,DT_ATUALIZACAO,NM_USUARIO,';
      sqlTxt:=sqlTxt + 'QT_ATENDIMENTO ) VALUES (';
      sqlTxt:=sqlTxt + inttostr(getcdTelefone)+',';
      sqlTxt:=sqlTxt + QuotedStr(inttostr(cliente.codigo))+',';
      if dsTelefone <> EmptyStr then
        sqlTxt:=sqlTxt + QuotedStr(dsTelefone)+','
      else
        sqlTxt:=sqlTxt + QuotedStr(cliente.telefoneContato)+',';
      sqlTxt:=sqlTxt + QuotedStr(idTipoTelefone)+',';
      sqlTxt:=sqlTxt + 'SYSDATE'+',';
      sqlTxt:=sqlTxt + inttostr(usuario.matricula)+',';
      sqlTxt:=sqlTxt + QuotedStr('1');
      sqlTxt:=sqlTxt + ')';

      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt;
      sqlQuery.ExecSQL;
    except
      on E:Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    sqlQuery.Free;
    sqlQuery:=nil;
  end;
end;

procedure TDM.alterarTelefoneCliente(cliente : TCliente);
var
  sqlTxt : string;
  sqlQuery : TSQLQuery;
  i: integer;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  try
    try
      sqlTxt:='UPDATE PRDDM.DC_TELEFONE_CLIENTE SET NR_TELEFONE = :NR_TELEFONE,';
      sqlTxt:=sqlTxt + 'DT_ATUALIZACAO = SYSDATE,NM_USUARIO = :NM_USUARIO ';
      sqlTxt:=sqlTxt + 'WHERE ID_TELEFONE_CLIENTE = :ID_TELEFONE_CLIENTE ';
      sqlTxt:=sqlTxt + 'AND NR_CLIENTE = :NR_CLIENTE ';

      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt;
      sqlQuery.ParamByName('NR_TELEFONE').AsString:=cliente.telefoneContato;
      sqlQuery.ParamByName('NM_USUARIO').AsString:=IntToStr(usuario.matricula);
      sqlQuery.ParamByName('ID_TELEFONE_CLIENTE').AsString:=ID_TELEFONE_CLIENTE_SAC;
      sqlQuery.ParamByName('NR_CLIENTE').AsString:=inttostr(cliente.codigo);

      sqlQuery.ExecSQL;
    except
      on E:Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    sqlQuery.Free;
    sqlQuery:=nil;
  end;
end;

procedure TDM.atualizarDadosOcorrenciaLocal;
begin
  cdsOcorrencia.Edit;
  cdsOcorrencia.FieldByName('cdPrioridade').AsInteger:=ocorrencia.cdPrioridade;
  if Length(trim(ocorrencia.descricao)) > 1 then
    ocorrencia.descricao:=trim(ocorrencia.descricao);
  cdsOcorrencia.FieldByName('descricao').AsString:=ocorrencia.descricao;
  cdsOcorrencia.FieldByName('dataLimite').AsDateTime:=ocorrencia.dataLimite;
  cdsOcorrencia.FieldByName('dataRegistro').AsDateTime:=ocorrencia.dataRegistro;
  cdsOcorrencia.FieldByName('dsContato').AsString:=ocorrencia.contato + ' ' + ocorrencia.telefone;
  cdsOcorrencia.FieldByName('dsEmailCliente').AsString:=ocorrencia.emailContato;
  cdsOcorrencia.FieldByName('cdMeioDeContato').AsInteger:=ocorrencia.cdMeioDeOrigemDoContato;
  cdsOcorrencia.FieldByName('idSituacaoOrdemColeta').AsString:=ocorrencia.idSituacaoOrdemColeta;
  cdsOcorrencia.FieldByName('idOcorrenciaIntegral').AsBoolean:=ocorrencia.isOcorrenciaIntegral;
  cdsOcorrencia.FieldByName('cdDestinoEmailOrdemDeColeta').AsInteger:=ocorrencia.cdDestinoEmailOrdemDeColeta;
  cdsOcorrencia.FieldByName('dsNomeArquivo').AsString:=ocorrencia.dsArquivoOcorrencia;

  cdsOcorrencia.Post;
end;

procedure TDM.gravarOcorrenciaLocal;
begin
  try
    if not cdsOcorrencia.Active then
      cdsOcorrencia.Open;

    cdsOcorrencia.Append;
    cdsOcorrencia.FieldByName('cdOcorrencia').AsInteger:=ocorrencia.cdOcorrencia;
    cdsOcorrencia.FieldByName('cdEmpresa').AsInteger:=ocorrencia.cdEmpresa;
    cdsOcorrencia.FieldByName('cdCliente').AsInteger:=ocorrencia.cdCliente;
    cdsOcorrencia.FieldByName('cdUsuario').AsInteger:=ocorrencia.cdUsuario;
    cdsOcorrencia.FieldByName('descricao').AsString:=ocorrencia.descricao;
    cdsOcorrencia.FieldByName('cdPrioridade').AsInteger:=ocorrencia.cdPrioridade;
    cdsOcorrencia.FieldByName('dataRegistro').AsDateTime:=ocorrencia.dataRegistro;
    cdsOcorrencia.FieldByName('dataLimite').AsDateTime:=ocorrencia.dataLimite;
    cdsOcorrencia.FieldByName('cdStatusSolucao').AsInteger:=ocorrencia.cdStatusSolucao;
    cdsOcorrencia.FieldByName('cdStatusCausa').AsInteger:=ocorrencia.cdStatusCausa;
    cdsOcorrencia.FieldByName('dsContato').AsString:=ocorrencia.contato + ' ' + ocorrencia.telefone;
    cdsOcorrencia.FieldByName('razaoSocial').AsString:=ocorrencia.razaoSocial;
    cdsOcorrencia.FieldByName('dsPrioridade').AsString:=ocorrencia.dsPrioridade;
    cdsOcorrencia.FieldByName('dsStatusSolucao').AsString:=ocorrencia.dsStatusSolucao;
    cdsOcorrencia.FieldByName('dsStatusCausa').AsString:=ocorrencia.dsStatusCausa;
    cdsOcorrencia.FieldByName('codigoDigito').AsInteger:=ocorrencia.codigoDigito;
    cdsOcorrencia.FieldByName('dsEmailCliente').AsString:=ocorrencia.emailContato;
    cdsOcorrencia.FieldByName('idMostrarAvisoDevolucao').AsBoolean:=False;
    cdsOcorrencia.FieldByName('idSituacaoOrdemColeta').AsString:=ocorrencia.idSituacaoOrdemColeta;
    cdsOcorrencia.FieldByName('dtEmissaoOrdemDeColeta').AsDateTime:=ocorrencia.dataEmissaoOrdemDeColeta;
    cdsOcorrencia.FieldByName('cdDestinoEmailOrdemDeColeta').AsInteger:=ocorrencia.cdDestinoEmailOrdemDeColeta;
    cdsOcorrencia.FieldByName('dsNomeArquivo').AsString:=ocorrencia.dsArquivoOcorrencia;


    cdsOcorrencia.Post;
  except
    on E:Exception do
      raise Exception.CreateFmt('Erro a gravar ocorrencia Local. Detalhes: %s',[E.Message]);
  end;
end;

procedure TDM.gravarNovoItemOcorrenciaLocal(itemOcorrencia:TItemOcorrencia);
begin
  try
    if not cdsItemOcorrencia.Active then
      cdsItemOcorrencia.Open;

    cdsItemOcorrencia.Append;
    cdsItemOcorrencia.FieldByName('nrSequencia').AsInteger:=itemOcorrencia.nrSequencia;
    cdsItemOcorrencia.FieldByName('cdEmpresa').AsInteger:=itemOcorrencia.cdEmpresa;
    cdsItemOcorrencia.FieldByName('idEmpresaNFe').AsInteger:=itemOcorrencia.idEmpresaNFe;
    cdsItemOcorrencia.FieldByName('nrNFe').AsInteger:=itemOcorrencia.nrNFe;
    cdsItemOcorrencia.FieldByName('nrSerieNFe').AsInteger:=itemOcorrencia.nrSerieNFe;
    cdsItemOcorrencia.FieldByName('dataEmissao').AsDateTime:=itemOcorrencia.dataEmissao;
    cdsItemOcorrencia.FieldByName('cdOrigemPedido').AsInteger:=itemOcorrencia.cdOrigemPedido;
    cdsItemOcorrencia.FieldByName('dsOrigemPedido').AsString:=itemOcorrencia.dsOrigemPedido;
    cdsItemOcorrencia.FieldByName('cdProduto').AsInteger:=itemOcorrencia.cdProduto;
    cdsItemOcorrencia.FieldByName('digitoProduto').AsInteger:=itemOcorrencia.digitoProduto;
    cdsItemOcorrencia.FieldByName('dsProduto').AsString:=itemOcorrencia.dsProduto;
    cdsItemOcorrencia.FieldByName('quantProduto').AsInteger:=itemOcorrencia.quantProduto;
    cdsItemOcorrencia.FieldByName('cdTipoProduto').AsInteger:=itemOcorrencia.cdTipoProduto;
    cdsItemOcorrencia.FieldByName('dsTipoProduto').AsString:=itemOcorrencia.dsTipoProduto;
    cdsItemOcorrencia.FieldByName('dsLoteProduto').AsString:=itemOcorrencia.dsLote;
    cdsItemOcorrencia.FieldByName('dataValidadeProduto').AsDateTime:=itemOcorrencia.dataValidadeProduto;
    cdsItemOcorrencia.FieldByName('prazoValidade').AsInteger:=itemOcorrencia.periodoValidade;
    cdsItemOcorrencia.FieldByName('cdSituacaoEmbalagem').AsInteger:=itemOcorrencia.cdSituacaoEmbalagem;
    cdsItemOcorrencia.FieldByName('dsSituacaoEmbalagem').AsString:=itemOcorrencia.dsSituacaoEmbalagem;
    cdsItemOcorrencia.FieldByName('cdTipoOcorrencia').AsInteger:=itemOcorrencia.cdTipoOcorrencia;
    cdsItemOcorrencia.FieldByName('dsTipoOcorrencia').AsString:=itemOcorrencia.dsTipoOcorrencia;
    cdsItemOcorrencia.FieldByName('cdSubTipoOcorrencia').AsInteger:=itemOcorrencia.cdSubTipoOcorrencia;
    cdsItemOcorrencia.FieldByName('dsSubTipoOcorrencia').AsString:=itemOcorrencia.dsSubTipoOcorrencia;
    if Length(trim(itemOcorrencia.descricaoOcorrencia)) > 1  then
      itemOcorrencia.descricaoOcorrencia:=trim(itemOcorrencia.descricaoOcorrencia);
    cdsItemOcorrencia.FieldByName('descricaoOcorrencia').AsWideString:=itemOcorrencia.descricaoOcorrencia;
    cdsItemOcorrencia.FieldByName('cdSolucionador').AsInteger:=itemOcorrencia.cdSolucionador;
    cdsItemOcorrencia.FieldByName('nomeSolucionador').AsString:=itemOcorrencia.nomeSolucionador;
    cdsItemOcorrencia.FieldByName('cdGerenteSolucionador').AsInteger:=itemOcorrencia.cdGerenteSolucionador;
    cdsItemOcorrencia.FieldByName('nmGerenteSolucionador').AsString:=itemOcorrencia.nomeGerenteSolucionador;
    if not itemOcorrencia.isSolucionadorGAM then
    begin
      cdsItemOcorrencia.FieldByName('nrMatriculaRepresentante').AsString:=format('%d%d',[itemOcorrencia.cdDistrito,itemOcorrencia.cdSetor]);
      cdsItemOcorrencia.FieldByName('nrMatriculaGerenteRepresentante').AsString:=format('%d%d',[itemOcorrencia.cdDistrito,itemOcorrencia.cdDistrito]);
    end
    else
    begin
      cdsItemOcorrencia.FieldByName('nrMatriculaRepresentante').AsString:='0';
      cdsItemOcorrencia.FieldByName('nrMatriculaGerenteRepresentante').AsString:='0';
    end;
    cdsItemOcorrencia.FieldByName('cdSetor').AsInteger:=itemOcorrencia.cdSetor;
    cdsItemOcorrencia.FieldByName('nomeRepresentante').AsString:=itemOcorrencia.nomeRepresentante;
    cdsItemOcorrencia.FieldByName('cdDistrito').AsInteger:=itemOcorrencia.cdDistrito;
    cdsItemOcorrencia.FieldByName('cdTransportador').AsInteger:=itemOcorrencia.cdTransportador;
    cdsItemOcorrencia.FieldByName('nomeTransportador').AsString:=itemOcorrencia.nomeTransportador;
    cdsItemOcorrencia.FieldByName('dsTransbordoCarga').AsWideString:=itemOcorrencia.dsTransbordoCarga;
    cdsItemOcorrencia.FieldByName('cdStatusSolucao').AsInteger:=itemOcorrencia.cdStatusSolucao;
    cdsItemOcorrencia.FieldByName('dsStatusSolucao').AsString:=itemOcorrencia.dsStatusSolucao;
    cdsItemOcorrencia.FieldByName('cdStatusCausa').AsInteger:=itemOcorrencia.cdStatusCausa;
    cdsItemOcorrencia.FieldByName('dsStatusCausa').AsString:=itemOcorrencia.dsStatusCausa;
    cdsItemOcorrencia.FieldByName('dataLimite').AsDateTime:=itemOcorrencia.dataLimite;
    cdsItemOcorrencia.FieldByName('cdAreaOrigem').AsInteger:=itemOcorrencia.cdAreaOrigem;
    cdsItemOcorrencia.FieldByName('dsAreaOrigem').AsString:=itemOcorrencia.dsAreaOrigem;
    cdsItemOcorrencia.FieldByName('dsEmailSolucionador').AsString:=itemOcorrencia.contatoEmail.dsEmailSolucionador;
    cdsItemOcorrencia.FieldByName('dsEmailSupervisor').AsString:=itemOcorrencia.contatoEmail.dsEmailSupervisor;
    cdsItemOcorrencia.FieldByName('dsEmailRepresentante').AsString:=itemOcorrencia.contatoEmail.dsEmailRepresentante;
    cdsItemOcorrencia.FieldByName('dsEmailCoordenador').AsString:=itemOcorrencia.contatoEmail.dsEmailCoordenador;
    cdsItemOcorrencia.FieldByName('dsEmailCopia').AsString:=itemOcorrencia.contatoEmail.dsEmailCopia;
    cdsItemOcorrencia.FieldByName('dsEmailCopiaExtra').AsString:=itemOcorrencia.contatoEmail.dsEmailCopiaExtra;
    cdsItemOcorrencia.FieldByName('nrMatriculaGerenteCanal').AsString:=inttostr(getMatriculaGerenteArea(format('%d%d',[itemOcorrencia.cdDistrito,itemOcorrencia.cdSetor])));
    cdsItemOcorrencia.FieldByName('idRecolherMercadoria').AsBoolean:=itemOcorrencia.isRecolherMercadoria;
    cdsItemOcorrencia.FieldByName('IdAlertarRegistroForaPrazo').AsBoolean:=itemOcorrencia.isAlertarRegistroForaDoPrazo;
    cdsItemOcorrencia.FieldByName('cdOperadorLogistico').AsInteger:=itemOcorrencia.cdOperadorLogistico;
    cdsItemOcorrencia.FieldByName('dsDigitadorPedido').AsString:=itemOcorrencia.dsDigitadorPedido;
    cdsItemOcorrencia.FieldByName('dsMotivoCancelamento').AsString:=itemOcorrencia.dsMotivoCancelamento;
    cdsItemOcorrencia.FieldByName('nrOrdemDevolucao').AsInteger:=0;
    cdsItemOcorrencia.FieldByName('dsDetalheDevolucao').AsString:='';
    cdsItemOcorrencia.FieldByName('dsSituacaoDevolucao').AsString:='';
    cdsItemOcorrencia.FieldByName('idNecessitaOrdemColeta').AsBoolean:=itemOcorrencia.isNecessitaOrdemDeColeta;
    if (itemOcorrencia.isEnviarMensagemProdutoTermolabil and itemOcorrencia.isNecessitaOrdemDeColeta) then
      cdsItemOcorrencia.FieldByName('idAlertarProdutoTermolabil').AsBoolean:=True
    else
      cdsItemOcorrencia.FieldByName('idAlertarProdutoTermolabil').AsBoolean:=False;
    cdsItemOcorrencia.FieldByName('cdClienteEntrega').AsInteger:=itemOcorrencia.cdClienteEntrega;

    cdsItemOcorrencia.FieldByName('Cfop').AsInteger:= itemOcorrencia.Cfop;
    cdsItemOcorrencia.FieldByName('cst').AsString:= itemOcorrencia.Cst;
    cdsItemOcorrencia.FieldByName('vlrUnitarioMercadoria').AsFloat:= itemOcorrencia.VlrUnitarioMercadoria;
    cdsItemOcorrencia.FieldByName('vlrUnitarioBcIcms').AsFloat:= itemOcorrencia.VlrUnitarioBcIcms;
    cdsItemOcorrencia.FieldByName('vlrUnitarioIcms').AsFloat:= itemOcorrencia.VlrUnitarioIcms;
    cdsItemOcorrencia.FieldByName('vlrUnitarioBcST').AsFloat:= itemOcorrencia.VlrUnitarioBcST;
    cdsItemOcorrencia.FieldByName('vlrUnitarioST').AsFloat:= itemOcorrencia.VlrUnitarioST;

    cdsItemOcorrencia.Post;
  except
    on E:Exception do
      raise Exception.CreateFmt('Erro a gravar ocorrencia Local. Detalhes: %s',[E.Message]);
  end;
end;

procedure TDM.gravarNovoSolucionadorItemOcorrenciaLocal(itemOcorrencia:TItemOcorrencia);
begin
  try
    cdsItemOcorrencia.edit;
    cdsItemOcorrencia.FieldByName('cdSolucionador').AsInteger:=itemOcorrencia.cdSolucionador;
    cdsItemOcorrencia.FieldByName('nomeSolucionador').AsString:=itemOcorrencia.nomeSolucionador;
    cdsItemOcorrencia.FieldByName('cdGerenteSolucionador').AsInteger:=itemOcorrencia.cdGerenteSolucionador;
    cdsItemOcorrencia.FieldByName('nmGerenteSolucionador').AsString:=itemOcorrencia.nomeGerenteSolucionador;
    cdsItemOcorrencia.FieldByName('dataLimite').AsDateTime:=itemOcorrencia.dataLimite;
    cdsItemOcorrencia.FieldByName('dsEmailSolucionador').AsString:=itemOcorrencia.contatoEmail.dsEmailSolucionador;
    cdsItemOcorrencia.FieldByName('dsEmailSupervisor').AsString:=itemOcorrencia.contatoEmail.dsEmailSupervisor;
    cdsItemOcorrencia.FieldByName('dsEmailRepresentante').AsString:=itemOcorrencia.contatoEmail.dsEmailRepresentante;
    cdsItemOcorrencia.FieldByName('dsEmailCoordenador').AsString:=itemOcorrencia.contatoEmail.dsEmailCoordenador;
    cdsItemOcorrencia.FieldByName('dsEmailCopia').AsString:=itemOcorrencia.contatoEmail.dsEmailCopia;
    cdsItemOcorrencia.FieldByName('dsEmailCopiaExtra').AsString:=itemOcorrencia.contatoEmail.dsEmailCopiaExtra;
    cdsItemOcorrencia.FieldByName('nrMatriculaGerenteCanal').AsString:=inttostr(getMatriculaGerenteArea(format('%d%d',[itemOcorrencia.cdDistrito,itemOcorrencia.cdSetor])));
    cdsItemOcorrencia.FieldByName('cdAreaOrigem').AsInteger:=itemOcorrencia.cdAreaOrigem;
    cdsItemOcorrencia.FieldByName('dsAreaOrigem').AsString:=itemOcorrencia.dsAreaOrigem;
    cdsItemOcorrencia.FieldByName('idRecolherMercadoria').AsBoolean:=itemOcorrencia.isRecolherMercadoria;
    cdsItemOcorrencia.Post;
  except
    on E:Exception do
      raise Exception.CreateFmt('Erro a gravar ocorrencia Local. Detalhes: %s',[E.Message]);
  end;
end;

function TDM.getSequencialItem:integer;
begin
  Result:=cdsItemOcorrencia.RecordCount + 1;
end;

procedure TDM.consultaPedidoCompra(nrPedido,cdCliente:integer);
var
  sqltxt : string;
begin
  sqltxt:='SELECT TIPO_O Tipo, NROO_O Pedido, DATO_O Data, HORO_O Hora,STAO_O Status, ';
  sqltxt:=sqltxt + 'SNRO_O Digitador, MOTO_O Observacao, ol.ds_operador_logistico||'' [ ''||ol.cd_operador_logistico ||'' ] '' operacao ';
  sqltxt:=sqltxt + 'FROM PRDDM.V_DCORDHST P, PRDDM.DC_OPERADOR_LOGISTICO ol ';
  sqltxt:=sqltxt + 'WHERE TIPO_O = ''V'' ';
  sqltxt:=sqltxt + 'AND p.cd_operador_logistico = ol.cd_operador_logistico ';
  sqltxt:=sqltxt + 'AND NROC_O = ' + inttostr(cdCliente);
  if nrPedido > 0 then
    sqltxt:=sqltxt + ' AND NROO_O = ' + inttostr(nrPedido);
  sqltxt:=sqltxt + ' ORDER BY NROO_O DESC';

  dsGenerica.DataSet:=sqlConsultaPedido;
  sqlConsultaPedido.Close;
  sqlConsultaPedido.DataSet.CommandText:=sqltxt;
  sqlConsultaPedido.Open;
end;

function TDM.isExisteTabela(dsTabela:string):Boolean;
var
  sqlData: TSQLQuery;
begin
  sqlData:=TSQLQuery.Create(nil);
  try
    try
      sqlData.SQLConnection:=conexaoHistorico;
      sqlData.SQL.Clear;
      sqlData.SQL.Text:=format('SELECT 1 FROM %s WHERE ROWNUM = 1',[dstabela]);
      sqlData.Open;
      Result:=True;
    except
      Result:=False;
    end;
  finally
    sqlData.Close;
    sqlData.Free;
  end;
end;

procedure TDM.consultaNFe(nrNFe,cdCliente:integer;dataEmissao:string);
var
  sqltxt : string;
begin
  sqltxt:=sqltxt + 'SELECT ';
  sqltxt:=sqltxt + 'CASE ';
  sqltxt:=sqltxt + ' WHEN NOTA.TIPN_N = ''V'' THEN ''VENDA'' ';
  sqltxt:=sqltxt + ' WHEN NOTA.TIPN_N = ''Y'' THEN ''CANCELADA'' ';
  sqltxt:=sqltxt + 'END TIPO,';
  sqltxt:=sqltxt + 'EMP.NM_EMPRESA Empresa, NR_NFE_NF NFe, NR_NFE_SERIE Serie, DEMN_N Emissao, ';
  sqltxt:=sqltxt + 'TOTN_N Valor,NVL(SNRO_O,''INDETERMINADO'') Digitador, NVL(DS_MEIO_TRANSMISSAO,''INDETERMINADO'') Origem, NRON_N NotaControle,';
  sqltxt:=sqltxt + 'TPPP_N cdOrigemPedido, NROT_N Caminhao, NROV_N Setor,';
  sqltxt:=sqltxt + 'CLIENTE.CD_ENTREGA_CAMINHAO_SECUNDARIO cdCaminhaoSecundario, NOTA.TIPN_N, NOTA.CD_OPERADOR_LOGISTICO,';
  sqltxt:=sqltxt + 'NOTA.ID_EMPRESA, NOTA.CD_EMPRESA, ol.ds_operador_logistico||'' [ ''||ol.cd_operador_logistico||'' ] '' operacao, ';
  sqltxt:=sqltxt + 'NOTA.CD_CLIENTE_ENTREGA ';

  if nrNFe > 0 then
  begin
    if dataEmissao <> EmptyStr then
    begin
      { conexão }
      sqlConsultaNFe.Connection:=conexaoHistorico;

      tabelaPesquisa.limparDados;
      gravaNomeTabela(strtodate(dataEmissao),dadosEmpresa.dataSistema);

      sqltxt:=sqltxt + format('FROM %s NOTA ',[tabelaPesquisa.dcnot]);
      sqltxt:=sqltxt + format('JOIN %s PEDIDO ON NOTA.NROC_N = PEDIDO.NROC_O AND NOTA.CD_PEDIDO = PEDIDO.NROO_O ',[tabelaPesquisa.dcord]);
    end
    else
    begin
      { conexão }
      sqlConsultaNFe.Connection:=conexaoProducao;
      sqltxt:=sqltxt + 'FROM PRDDM.V_DCNOTHST NOTA ';
      sqltxt:=sqltxt + 'LEFT OUTER JOIN PRDDM.V_DCORDHST PEDIDO ON NOTA.NROC_N = PEDIDO.NROC_O AND NOTA.CD_PEDIDO = PEDIDO.NROO_O ';
    end;
  end
  else
  begin
   { conexão }
    sqlConsultaNFe.Connection:=conexaoProducao;

    sqltxt:=sqltxt + 'FROM PRDDM.V_DCNOTHST NOTA ';
    sqltxt:=sqltxt + 'LEFT OUTER JOIN PRDDM.V_DCORDHST PEDIDO ON NOTA.NROC_N = PEDIDO.NROC_O AND NOTA.CD_PEDIDO = PEDIDO.NROO_O ';
  end;

  sqltxt:=sqltxt + 'JOIN ACESSO.DC_EMPRESA EMP ON EMP.CD_EMPRESA = NOTA.CD_EMPRESA ';
  sqltxt:=sqltxt + 'LEFT OUTER JOIN PRDDM.DC_MEIO_TRANSMISSAO TRANSM ON NOTA.TPPP_N = TRANSM.CD_MEIO_TRANSMISSAO ';
  sqltxt:=sqltxt + 'JOIN PRDDM.DCCLI CLIENTE ON NOTA.NROC_N = CLIENTE.NROC_C ';
  sqltxt:=sqltxt + 'LEFT OUTER JOIN PRDDM.DC_OPERADOR_LOGISTICO OL ON NOTA.CD_OPERADOR_LOGISTICO = OL.CD_OPERADOR_LOGISTICO ';
  sqltxt:=sqltxt + 'WHERE TIPN_N IN (''V'',''Y'') ';
  sqltxt:=sqltxt + format('AND NROC_N = %d',[cdCliente]);
  if nrNFe > 0 then
    sqltxt:=sqltxt + format(' AND NR_NFE_NF = %d',[nrNFe]);

  sqltxt:=sqltxt + ' ORDER BY NOTA.DEMN_N DESC, NOTA.ID_EMPRESA, NOTA.NR_NFE_NF';

  dsGenerica.DataSet:=sqlConsultaNFe;
  sqlConsultaNFe.Close;
  sqlConsultaNFe.DataSet.CommandText:=sqltxt;
  sqlConsultaNFe.Open;
end;

procedure TDM.consultaDuplicata(nrDuplicata,cdCliente:integer);
var
  sqltxt : string;
begin
  sqltxt:='SELECT ID_EMPRESA Empresa, NR_NFE NFe, NROD_D Duplicata, DEMD_D Emissao,';
  sqltxt:=sqltxt + 'DVND_D Vencimento, VDPD_D Valor, SDOD_D Saldo ';
  sqltxt:=sqltxt + 'FROM PRDDM.DCDUP ';
  sqltxt:=sqltxt + 'WHERE TIPD_D = ''R'' ';
  sqltxt:=sqltxt + 'AND NROC_D = ' + inttostr(cdCliente);
  if nrDuplicata > 0 then
    sqltxt:=sqltxt + ' AND NROD_D = ' + inttostr(nrDuplicata)
  else
    sqltxt:=sqltxt + ' AND SDOD_D > 0 ';

  sqltxt:=sqltxt + ' ORDER BY DVND_D';

  dsGenerica.DataSet:=sqlConsultaDuplicata;
  sqlConsultaDuplicata.Close;
  sqlConsultaDuplicata.DataSet.CommandText:=sqltxt;
  sqlConsultaDuplicata.Open;
end;

function TDM.isProdutoRefrigeradoLocalizado:Boolean;
begin
  try
    Result:=False;
    sqlItemNFe_PedidoCompra.First;
    while not sqlItemNFe_PedidoCompra.Eof do
    begin
      if sqlItemNFe_PedidoCompra.FieldByName('REF').AsString[1] = 'S' then
      begin
        Result:=true;
        Break;
      end;
      sqlItemNFe_PedidoCompra.Next;
    end;
  finally
    sqlItemNFe_PedidoCompra.First;
  end;
end;

function TDM.isProdutoOncologicoLocalizado:Boolean;
begin
  try
    Result:=False;
    sqlItemNFe_PedidoCompra.First;
    while not sqlItemNFe_PedidoCompra.Eof do
    begin
      if Trim(sqlItemNFe_PedidoCompra.FieldByName('ESPECIALIDADE').AsString) = DS_ESPECIALIDADE_ANTINEOPLASICO then
      begin
        if sqlItemNFe_PedidoCompra.FieldByName('REF').AsString[1] = 'N' then
        begin
          Result:=true;
          Break;
        end;
      end;
      sqlItemNFe_PedidoCompra.Next;
    end;
  finally
    sqlItemNFe_PedidoCompra.First;
  end;
end;

procedure TDM.marcarMercadoriaComAvisoDeRecall;
begin
  sqlItemNFe_PedidoCompra.Edit;
  sqlItemNFe_PedidoCompra.FieldByName('LOTE').AsString:=format('%s%s',[trim(sqlItemNFe_PedidoCompra.FieldByName('LOTE').AsString),DS_ALERTA_RECALL_LOTE]);
  sqlItemNFe_PedidoCompra.FieldByName('ID_RECALL').AsString:='S';
  sqlItemNFe_PedidoCompra.Post;
end;

procedure TDM.listarItemNFe;
var
  sqltxt : string;
begin
  if tabelaPesquisa.dcios = EmptyStr then
    sqlItemNFe_PedidoCompra.Connection:=conexaoProducao
  else
  begin
    if pos('PRDKP',tabelaPesquisa.dcios) > 0 then
      sqlItemNFe_PedidoCompra.Connection:=conexaoHistorico
    else
      sqlItemNFe_PedidoCompra.Connection:=conexaoProducao;
  end;

  sqltxt:='SELECT MERC.CD_MERCADORIA CODIGO,';
  sqltxt:=sqltxt + 'MERC.NR_DV_MERCADORIA DIG, NM_MERCADORIA NOME, DS_APRESENTACAO_MERCADORIA APRESENTACAO,';
  sqltxt:=sqltxt + 'QUAI_I QUANT, PLIQ_YI / QUAI_I VL_UNITARIO, NVL(B.LOTL_I,''0'') LOTE, NVL(SEQL_I,''0'') SEQLOTE,';
  sqltxt:=sqltxt + 'NVL(sum(QUAL_I),''0'') QTLOTE, TRUNC(NVL(DT_VALIDADE_LOTE,''01/01/2039'')) VALIDADE,';
  sqltxt:=sqltxt + 'MERC.CD_EAN_VENDA EAN, MERC.ID_REFRIGERADO REF,';
  sqltxt:=sqltxt + 'MERC.DS_NIVEL_ECNM ECNM_M,MERC.DS_NIVEL_EITM,';
  sqltxt:=sqltxt + 'NVL(CLASS.DS_DESCRICAO_ESTRUTURA,''DESCONHECIDA'') ESPECIALIDADE, ''N'' ID_RECALL,';
  sqltxt:=sqltxt + 'ol.ds_operador_logistico||'' [ ''||ol.cd_operador_logistico||'' ] '' operacao, ol.cd_operador_logistico, ';
  sqltxt:=sqltxt + 'dblq_yi * quai_i DescFinanceiro,''N'' as ID_SELECIONADO, CFOP_I, CSTM_I1, ';
  sqltxt:=sqltxt + 'Round ( ( BINI_YI + BIFI_YI + BISI_YI ) * QUAI_I,2 ) as BC_ICMS, Round ( ( VINI_YI + VIFI_YI + VISI_YI ) * QUAI_I, 2 ) as VL_ICMS,';
  sqltxt:=sqltxt + 'BIRI_YI AS BC_ST, VIRI_YI AS VL_ST ';

  if sqlConsultaNFe.RecordCount > 1 then
    sqltxt:=sqltxt + ' FROM PRDDM.V_DCIOSHST A '
  else
  begin
    if tabelaPesquisa.dcios <> EmptyStr then
      sqltxt:=sqltxt + format('FROM %s A ',[tabelaPesquisa.dcios])
    else
      sqltxt:=sqltxt + 'FROM PRDDM.V_DCIOSHST A ';
  end;

  sqltxt:=sqltxt + 'JOIN PRDDM.DC_MERCADORIA MERC ON A.NROM_I = MERC.CD_MERCADORIA ';
  sqltxt:=sqltxt + 'LEFT OUTER JOIN PRDDM.DC_CLASSIFICACAO_PRODUTO CLASS ON MERC.DS_NIVEL_EITM = CLASS.NR_SEQUENCIAL ';

  if tabelaPesquisa.dcilo <> EmptyStr then
    sqltxt:=sqltxt + format('LEFT OUTER JOIN %s B ON A.NROM_I = B.NROM_I AND A.NRON_I = B.NRON_I ',[tabelaPesquisa.dcilo])
  else
     sqltxt:=sqltxt + 'LEFT OUTER JOIN PRDDM.V_DCILOHST B ON A.NROM_I = B.NROM_I AND A.NRON_I = B.NRON_I ';

  sqltxt:=sqltxt + 'JOIN PRDDM.DC_OPERADOR_LOGISTICO OL ON A.CD_OPERADOR_LOGISTICO = OL.CD_OPERADOR_LOGISTICO ';
  sqltxt:=sqltxt + 'LEFT OUTER JOIN PRDDM.DC_WMS_VALIDADE_LOTE LOTE ON B.NROM_I = LOTE.CD_MERCADORIA AND TRIM(B.LOTL_I) = TRIM(LOTE.DS_LOTE) AND LOTE.CD_EMPRESA = A.CD_EMPRESA ';
  sqltxt:=sqltxt + format('WHERE A.TIPN_I = ''%s'' ',[sqlConsultaNFe.FieldByName('TIPN_N').AsString]);
  sqltxt:=sqltxt + 'AND A.NROM_I <> 13000 ';
  sqltxt:=sqltxt + format('AND A.NRON_I = %s ',[sqlConsultaNFe.FieldByName('NotaControle').AsString]);
  sqltxt:=sqltxt + format(' AND A.ID_EMPRESA = %s ',[sqlConsultaNFe.FieldByName('ID_EMPRESA').AsString]);

  sqltxt:=sqltxt + 'GROUP BY MERC.CD_MERCADORIA ,MERC.NR_DV_MERCADORIA , NM_MERCADORIA , DS_APRESENTACAO_MERCADORIA ,';
  sqltxt:=sqltxt + '       QUAI_I , PLIQ_YI / QUAI_I , NVL(B.LOTL_I,''0'') , NVL(SEQL_I,''0'') ,                         ';
  sqltxt:=sqltxt + '       TRUNC(NVL(DT_VALIDADE_LOTE,''01/01/2039'')) ,MERC.CD_EAN_VENDA , MERC.ID_REFRIGERADO ,      ';
  sqltxt:=sqltxt + '       MERC.DS_NIVEL_ECNM ,MERC.DS_NIVEL_EITM,                                                   ';
  sqltxt:=sqltxt + '       NVL(CLASS.DS_DESCRICAO_ESTRUTURA,''DESCONHECIDA'') , ''N'' ,                                   ';
  sqltxt:=sqltxt + '       ol.ds_operador_logistico||'' [ ''||ol.cd_operador_logistico||'' ] '' , ol.cd_operador_logistico,';
  sqltxt:=sqltxt + '       dblq_yi , quai_i, Round ( ( BINI_YI + BIFI_YI + BISI_YI ) * QUAI_I,2 ), Round ( ( VINI_YI + VIFI_YI + VISI_YI ) * QUAI_I, 2 ), CFOP_I, CSTM_I1, BIRI_YI, VIRI_YI  ';

  sqltxt:=sqltxt + ' ORDER BY NOME,SEQLOTE';

  sqlItemNFe_PedidoCompra.Close;
  sqlItemNFe_PedidoCompra.DataSet.CommandText:=sqltxt;

  sqlItemNFe_PedidoCompra.Open;
end;

procedure TDM.listaItemPedido;
var
  sqltxt : string;
begin
  sqltxt:='SELECT CD_MERCADORIA*10+NR_DV_MERCADORIA CODIGO,NM_MERCADORIA NOME, DS_APRESENTACAO_MERCADORIA APRESENTACAO, QUAY_Y QUANT, PLIQ_Y / QUAY_Y VL_UNITARIO, CD_EAN_VENDA EAN, ID_REFRIGERADO REF, CD_MERCADORIA, DS_NIVEL_ECNM, ''SEM LOTE'' LOTE, ';
  sqltxt:=sqltxt + 'ol.ds_operador_logistico||'' [ ''||ol.cd_operador_logistico||'' ] '' operacao ';
  sqltxt:=sqltxt + ', decode(ID_DIGITACAO,''R'',''REPRESENTANTE'',''C'',''CLIENTE'','' '') DIGITADOR_EGAM ,''N'' as ID_SELECIONADO,NR_DV_MERCADORIA DIG ';

  sqltxt:=sqltxt + 'FROM PRDDM.V_DCYTEHST Y ';
  sqltxt:=sqltxt + 'JOIN PRDDM.DC_OPERADOR_LOGISTICO OL ON Y.CD_OPERADOR_LOGISTICO = OL.CD_OPERADOR_LOGISTICO ';
  sqltxt:=sqltxt + 'JOIN PRDDM.DC_MERCADORIA ON NROM_Y = CD_MERCADORIA ';
  sqltxt:=sqltxt + 'AND NROO_Y = ' + sqlConsultaPedido.FieldByName('Pedido').AsString;
  sqltxt:=sqltxt + ' ORDER BY NM_MERCADORIA';
  sqlItemNFe_PedidoCompra.Close;
  sqlItemNFe_PedidoCompra.DataSet.CommandText:=sqltxt;
  sqlItemNFe_PedidoCompra.Open;
end;

procedure TDM.listaTipoVolumeItemNFe;
var
  sqltxt : string;
begin
  try
    sqltxt:=         'SELECT * FROM (';
    sqltxt:=sqltxt + 'SELECT NROM_I||NR_DV_MERCADORIA CODIGO,NM_MERCADORIA||'' ''||DS_APRESENTACAO_MERCADORIA MERCADORIA,';
    sqltxt:=sqltxt + ' QUAI_I QUANT,DS_LOCAL_SEPARACAO TIPO_VOLUME,SEQV_I SEQ_VOLUME,''N'' as ID_SELECIONADO,NR_DV_MERCADORIA DIG ';
    sqltxt:=sqltxt + 'FROM PRDDM.V_DCIOSDHST I,PRDDM.DC_LOCAL_SEPARACAO L,PRDDM.DC_MERCADORIA,PRDDM.V_DCPRNHST P ';
    sqltxt:=sqltxt + 'WHERE TIPN_I = ''V'' ';
    sqltxt:=sqltxt + ' AND TIPV_I = CD_LOCAL_SEPARACAO ';
    sqltxt:=sqltxt + ' AND NROM_I = CD_MERCADORIA ';
    sqltxt:=sqltxt + ' AND I.CD_EMPRESA = L.CD_EMPRESA ';
    sqltxt:=sqltxt + ' AND P.ID_EMPRESA = I.CD_EMPRESA ';
    sqltxt:=sqltxt + ' AND P.NROR_R = I.NRON_I ';
    sqltxt:=sqltxt + ' AND I.CD_EMPRESA = ' + sqlConsultaNFe.FieldByName('cd_empresa').AsString;
    sqltxt:=sqltxt +  format('AND P.NRON_R = %s ',[sqlConsultaNFe.FieldByName('NotaControle').AsString]);
    sqltxt:=sqltxt + ' AND P.DATO_R = '+ QuotedStr(sqlConsultaNFe.FieldByName('Emissao').AsString);
    {
    sqltxt:=sqltxt + ' UNION ALL ';
    sqltxt:=sqltxt + 'SELECT NROM_I||NR_DV_MERCADORIA CODIGO,NM_MERCADORIA||'' ''||DS_APRESENTACAO_MERCADORIA MERCADORIA,';
    sqltxt:=sqltxt + ' QUAI_I QUANT,DS_LOCAL_SEPARACAO TIPO_VOLUME,SEQV_I SEQ_VOLUME ';

    if sqlConsultaNFe.FieldByName('CD_EMPRESA').AsInteger = CD_GAM_SC then
      sqltxt:=sqltxt + 'FROM PRDDIA.DCIOSD@SIPRODCD I,PRDDM.DC_LOCAL_SEPARACAO@SIPRODCD L,PRDDM.DC_MERCADORIA,PRDDM.DCPRN P  ';
    if sqlConsultaNFe.FieldByName('CD_EMPRESA').AsInteger = CD_GAM_RS then
      sqltxt:=sqltxt + 'FROM PRDDIA.DCIOSD@SIPRODCDRS I,PRDDM.DC_LOCAL_SEPARACAO@SIPRODCDRS L,PRDDM.DC_MERCADORIA,PRDDM.DCPRN P ';

    sqltxt:=sqltxt + 'WHERE TIPN_I = ''V'' ';
    sqltxt:=sqltxt + ' AND TIPV_I = CD_LOCAL_SEPARACAO ';
    sqltxt:=sqltxt + ' AND NROM_I = CD_MERCADORIA ';
    sqltxt:=sqltxt + ' AND I.CD_EMPRESA = L.CD_EMPRESA ';
    sqltxt:=sqltxt + ' AND P.NROR_R = I.NRON_I ';
    sqltxt:=sqltxt +   format('AND P.NRON_R = %s ',[sqlConsultaNFe.FieldByName('NotaControle').AsString]);
    sqltxt:=sqltxt + 'AND P.DATO_R = '+ QuotedStr(sqlConsultaNFe.FieldByName('Emissao').AsString);
    }
    sqltxt:=sqltxt + ') ORDER BY 5,1';


    sqlItemNFe_PedidoCompra.Close;
    sqlItemNFe_PedidoCompra.DataSet.CommandText:=sqltxt;
    sqlItemNFe_PedidoCompra.Open;
  except
    on E:Exception do
      raise Exception.CreateFmt('Erro ao consultar tipo de volume do item. Detalhes: %s.',[E.Message]);
  end;
end;

procedure TDM.localizaProdutoLista(dsCampoConsulta,dsFiltro:string);
begin
  with sqlItemNFe_PedidoCompra do
  begin
    First;
    try
      Locate(dsCampoConsulta,UpperCase(dsFiltro),[loPartialKey,loCaseInsensitive]);
    except
      raise Exception.CreateFmt('%s Inválido.',[dsCampoConsulta]);
    end;
  end;
end;

procedure TDM.consultarDadosTransportador;
var
  sqlDados: TSimpleDataSet;
  sqlTxt: TStringList;
begin
  sqlDados:=TSimpleDataSet.Create(nil);
  sqlDados.Connection:=conexaoProducao;

  sqlTxt:=TStringList.Create;
  sqlTxt.Clear;
  try
    sqlTxt.Add('SELECT E.CD_TRANSPORTADOR, Trim(NOMP_P) NOMP_P ');
    sqlTxt.Add('FROM GAMFRETE.DC_ENTREGA E, GAMFRETE.DC_TRANSPORTADOR T, PRDDM.DCPES ');
    sqlTxt.Add('WHERE E.CD_TRANSPORTADOR = T.CD_TRANSPORTADOR');
    sqlTxt.Add(' AND CGCP_P = NR_CNPJ ');
    sqlTxt.Add(' AND CD_ENTREGA = :CD_ENTREGA ');

    sqlDados.Close;
    sqlDados.DataSet.CommandText:=sqlTxt.Text;
    sqlDados.DataSet.ParamByName('CD_ENTREGA').AsString:=IntToStr(ocorrencia.item.cdCaminhaoSecundario);
    sqlDados.Open;

    if not sqlDados.IsEmpty then
    begin
      ocorrencia.item.cdTransportador:=sqlDados.FieldByName('CD_TRANSPORTADOR').AsInteger;
      ocorrencia.item.nomeTransportador:=sqlDados.FieldByName('NOMP_P').AsString;
    end
    else
    begin
      ocorrencia.item.cdTransportador:=0;
      ocorrencia.item.nomeTransportador:='';
    end;

  finally
    sqlTxt.Free;
    sqlDados.Close;
    sqlDados.Free;
  end;
end;

procedure TDM.consultarDadosAdicionaisNFe;
var
  sqlDados: TSimpleDataSet;
  sqlTxt: TStringList;
begin
  sqlDados:=TSimpleDataSet.Create(nil);
  if tabelaPesquisa.dcNFeDadosAdicionais = EmptyStr then
    sqlDados.Connection:=conexaoProducao
  else
    sqlDados.Connection:=conexaoHistorico;

  sqlTxt:=TStringList.Create;
  sqlTxt.Clear;
  try
    sqlTxt.Add('SELECT SQ_MENSAGEM, DS_MENSAGEM ');
    if tabelaPesquisa.dcNFeDadosAdicionais = EmptyStr then
      sqlTxt.Add('FROM PRDDM.V_DC_NFE_DADOS_ADICIONAISHST ')
    else
      sqlTxt.Add(format('FROM %s ',[tabelaPesquisa.dcNFeDadosAdicionais]));
    sqlTxt.Add('WHERE ID_INFORMACAO_FISCAL = ''N'' ');
    sqlTxt.Add('AND Upper(DS_MENSAGEM) LIKE ''TRANSBORDO EM :%'' ');
    sqlTxt.Add('AND ID_EMPRESA = :ID_EMPRESA ');
    sqlTxt.Add('AND DT_EMISSAO = :DT_EMISSAO ');
    //sqlTxt.Add('AND NR_NFE = :NR_NFE ');
    //sqlTxt.Add('AND NR_NFE_SERIE = :SERIE_NFE ');
    sqlTxt.Add('AND NR_NOTA_FISCAL = :NR_NOTA_FISCAL ');
    sqlTxt.Add('AND NR_SERIE = :NR_SERIE ');
    sqlTxt.Add('ORDER BY SQ_MENSAGEM ');

    sqlDados.Close;
    sqlDados.DataSet.CommandText:=sqlTxt.Text;
    sqlDados.DataSet.ParamByName('ID_EMPRESA').AsString:=IntToStr(ocorrencia.item.cdEmpresa);
    sqlDados.DataSet.ParamByName('DT_EMISSAO').AsString:=DateToStr(ocorrencia.item.dataEmissao);
    //sqlDados.DataSet.ParamByName('NR_NFE').AsString:=IntToStr(ocorrencia.item.nrNFe);
    //sqlDados.DataSet.ParamByName('NR_NFE_SERIE').AsString:=IntToStr(ocorrencia.item.nrSerieNFe);
    sqlDados.DataSet.ParamByName('NR_NOTA_FISCAL').AsString:=IntToStr(ocorrencia.item.nrNFeControle);
    sqlDados.DataSet.ParamByName('NR_SERIE').AsString:=IntToStr(ocorrencia.item.nrSerieNFe);
    sqlDados.Open;

    if not sqlDados.IsEmpty then
    begin
      while not sqlDados.Eof do
      begin
        ocorrencia.item.dsTransbordoCarga:=ocorrencia.item.dsTransbordoCarga + sqlDados.FieldByName('DS_MENSAGEM').AsString;
        sqlDados.Next;
      end;
    end;

  finally
    sqlTxt.Free;
    sqlDados.Close;
    sqlDados.Free;
  end;
end;

procedure TDM.atualizarStatusSolucaoOcorrencia(isSomenteLocal,isReaberturaOcorrencia:Boolean);
var
  contItemPendente: integer;
  contItemParcial: integer;
  contItemFinalizado: integer;
  contItemCancelado: integer;
  totalItem: integer;
  isCancelarOrdemDeEntrega: Boolean;

begin
  contItemPendente  :=0;
  contItemFinalizado:=0;
  contItemCancelado :=0;
  totalItem:=0;
  isCancelarOrdemDeEntrega:=False;

  cdsItemOcorrencia.First;
  cdsItemOcorrencia.DisableControls;
  try
    while not cdsItemOcorrencia.Eof do
    begin
      inc(totalItem);
      case cdsItemOcorrencia.FieldByName('cdStatusSolucao').AsInteger of
        1   : inc(contItemPendente);
        2 : inc(contItemFinalizado);
        4 : begin
          inc(contItemFinalizado);
          inc(contItemCancelado);
        end;
      end;
      cdsItemOcorrencia.Next;
    end;

    if totalItem = 1 then
    begin
      if contItemPendente = 0  then
      begin
        if contItemCancelado > 0 then
          isCancelarOrdemDeEntrega:=True;

        alterarStatusSolucaoOcorrenciaLocal(CD_SOLUCAO_FINALIZADA_OCORRENCIA);
        if not isSomenteLocal then
        begin
          alterarStatusSolucaoOcorrencia(CD_SOLUCAO_FINALIZADA_OCORRENCIA,isCancelarOrdemDeEntrega,'');
          alterarStatusSolucaoListaConsultaOcorrencia(CD_SOLUCAO_FINALIZADA_OCORRENCIA);
        end;
      end
      else
      begin
        if isReaberturaOcorrencia then
        begin
          alterarStatusSolucaoOcorrencia(CD_SOLUCAO_PENDENTE_OCORRENCIA,isCancelarOrdemDeEntrega,'A');
          alterarStatusSolucaoListaConsultaOcorrencia(CD_SOLUCAO_PENDENTE_OCORRENCIA);
        end;
      end;
    end
    else
    begin
      if ((contItemPendente > 0) and (contItemFinalizado > 0)) then
      begin
        alterarStatusSolucaoOcorrenciaLocal(CD_SOLUCAO_PARCIAL_OCORRENCIA);
        if not isSomenteLocal then
        begin
          alterarStatusSolucaoOcorrencia(CD_SOLUCAO_PARCIAL_OCORRENCIA,isCancelarOrdemDeEntrega,'');
          alterarStatusSolucaoListaConsultaOcorrencia(CD_SOLUCAO_PARCIAL_OCORRENCIA);
        end;
      end;

      if (contItemPendente = 0) then
      begin
        alterarStatusSolucaoOcorrenciaLocal(CD_SOLUCAO_FINALIZADA_OCORRENCIA);
        if not isSomenteLocal then
        begin
          alterarStatusSolucaoOcorrencia(CD_SOLUCAO_FINALIZADA_OCORRENCIA,isCancelarOrdemDeEntrega,'');
          alterarStatusSolucaoListaConsultaOcorrencia(CD_SOLUCAO_FINALIZADA_OCORRENCIA);
        end;
      end;

      if ((contItemPendente = totalItem)) then
      begin
        if isReaberturaOcorrencia then
        begin
          alterarStatusSolucaoOcorrencia(CD_SOLUCAO_PENDENTE_OCORRENCIA,isCancelarOrdemDeEntrega,'A');
          alterarStatusSolucaoListaConsultaOcorrencia(CD_SOLUCAO_PENDENTE_OCORRENCIA);
        end;
      end;
    end;
  finally
    cdsItemOcorrencia.EnableControls;
  end;
end;

function TDM.getIdNessidadeEmissaoOrdemDeColeta:String;
begin
  Result:=ID_SITUACAO_ORDEM_DE_COLETA_NAO_SE_APLICA;

  cdsItemOcorrencia.First;
  cdsItemOcorrencia.DisableControls;
  try
    while not cdsItemOcorrencia.Eof do
    begin
      if cdsItemOcorrencia.FieldByName('idNecessitaOrdemColeta').AsBoolean then
      begin
        Result:=ID_SITUACAO_ORDEM_DE_COLETA_AGUARDANDO;
        Break;
      end;

      cdsItemOcorrencia.Next;
    end;
  finally
    cdsItemOcorrencia.EnableControls;
  end;
end;


procedure TDM.atualizarStatusCausaOcorrencia(isSomenteLocal,isReaberturaOcorrencia:Boolean);
var
  contItemPendente: integer;
  contItemNaoTratado: integer;
  contItemFinalizado: integer;
  totalItem: integer;

begin
  contItemPendente:=0;
  contItemNaoTratado:=0;
  contItemFinalizado:=0;
  totalItem:=0;

  cdsItemOcorrencia.First;
  cdsItemOcorrencia.DisableControls;
  try
    while not cdsItemOcorrencia.Eof do
    begin
      inc(totalItem);
      case cdsItemOcorrencia.FieldByName('cdStatusCausa').AsInteger of
        1 : inc(contItemPendente);
        2 : inc(contItemNaoTratado);
        3,4 : inc(contItemFinalizado);
      end;
      cdsItemOcorrencia.Next;
    end;

    if totalItem = 1 then
    begin
      if contItemPendente = 0  then
      begin
        alterarStatusCausaOcorrenciaLocal(CD_CAUSA_FINALIZADA_OCORRENCIA);
        if not isSomenteLocal then
        begin
          alterarStatusCausaOcorrencia(CD_CAUSA_FINALIZADA_OCORRENCIA);
          alterarStatusCausaListaConsultaOcorrencia(CD_CAUSA_FINALIZADA_OCORRENCIA);
        end;
      end
      else
      begin
        if isReaberturaOcorrencia then
        begin
          alterarStatusCausaOcorrencia(CD_CAUSA_PENDENTE_OCORRENCIA);
          alterarStatusCausaListaConsultaOcorrencia(CD_CAUSA_PENDENTE_OCORRENCIA);
        end;
      end;
    end
    else
    begin
      if ( (contItemPendente > 0) and ( (contItemFinalizado > 0) or (contItemNaoTratado > 0)) ) then
      begin
        alterarStatusCausaOcorrenciaLocal(CD_CAUSA_PARCIAL_OCORRENCIA);
        if not isSomenteLocal then
        begin
          alterarStatusCausaOcorrencia(CD_CAUSA_PARCIAL_OCORRENCIA);
          alterarStatusCausaListaConsultaOcorrencia(CD_CAUSA_PARCIAL_OCORRENCIA);
        end;
      end;

      if (contItemPendente = 0) then
      begin
        alterarStatusCausaOcorrenciaLocal(CD_CAUSA_FINALIZADA_OCORRENCIA);
        if not isSomenteLocal then
        begin
          alterarStatusCausaOcorrencia(CD_CAUSA_FINALIZADA_OCORRENCIA);
          alterarStatusCausaListaConsultaOcorrencia(CD_CAUSA_FINALIZADA_OCORRENCIA);
        end;
      end;

      if ((contItemPendente = totalItem)) then
      begin
        if isReaberturaOcorrencia then
        begin
          alterarStatusCausaOcorrencia(CD_CAUSA_PENDENTE_OCORRENCIA);
          alterarStatusCausaListaConsultaOcorrencia(CD_CAUSA_PENDENTE_OCORRENCIA);
        end;
      end;
    end;
  finally
    cdsItemOcorrencia.EnableControls;
  end;
end;

procedure TDM.alterarStatusSolucaoItemLocal(cdStatus:integer;isReaberturaOcorrencia:Boolean);
begin
  cdsItemOcorrencia.Edit;
  cdsItemOcorrencia.FieldByName('cdStatusSolucao').AsInteger:=cdStatus;
  cdsItemOcorrencia.FieldByName('dsStatusSolucao').AsString:=cdSolucaoItemToDescricao(cdStatus);
  cdsItemOcorrencia.Post;

  if not isReaberturaOcorrencia then
  begin
    cdsSolucaoItem.Edit;
    cdsSolucaoItem.FieldByName('dsSolucaoItemOcorrencia').AsString:=ocorrencia.item.solucao.dsSolucao;
    cdsSolucaoItem.Post;
  end
  else
  begin
    cdsSolucaoItem.EmptyDataSet;
  end;
end;

procedure TDM.alterarStatusCausaItemLocal(cdStatus:integer);
begin
  cdsItemOcorrencia.Edit;
  cdsItemOcorrencia.FieldByName('cdStatusCausa').AsInteger:=cdStatus;
  cdsItemOcorrencia.FieldByName('dsStatusCausa').AsString:=cdCausaItemToDescricao(cdStatus);
  cdsItemOcorrencia.Post;
end;

procedure TDM.alterarStatusSolucaoOcorrenciaLocal(cdStatus:integer);
begin
  cdsOcorrencia.Edit;
  cdsOcorrencia.FieldByName('cdStatusSolucao').AsInteger:=cdStatus;
  cdsOcorrencia.FieldByName('dsStatusSolucao').AsString:=cdSolucaoOcorrenciaToDescricao(cdStatus);
  cdsOcorrencia.Post;
end;

procedure TDM.alterarStatusCausaOcorrenciaLocal(cdStatus:integer);
begin
  cdsOcorrencia.Edit;
  cdsOcorrencia.FieldByName('cdStatusCausa').AsInteger:=cdStatus;
  cdsOcorrencia.FieldByName('dsStatusCausa').AsString:=cdCausaOcorrenciaToDescricao(cdStatus);
  cdsOcorrencia.Post;
end;

procedure TDM.alterarStatusSolucaoListaConsultaOcorrencia(cdStatus:integer);
begin
  sqlConsultaOcorrencia.Edit;
  sqlConsultaOcorrencia.FieldByName('ST_SOLUCAO').AsInteger:=cdStatus;
  sqlConsultaOcorrencia.FieldByName('SOLUCAO').AsString:=UpperCase(cdSolucaoOcorrenciaToDescricao(cdStatus));
  sqlConsultaOcorrencia.Post;
end;

procedure TDM.alterarStatusCausaListaConsultaOcorrencia(cdStatus:integer);
begin
  sqlConsultaOcorrencia.Edit;
  sqlConsultaOcorrencia.FieldByName('ST_CAUSA').AsInteger:=cdStatus;
  sqlConsultaOcorrencia.FieldByName('CAUSA').AsString:=UpperCase(cdCausaOcorrenciaToDescricao(cdStatus));
  sqlConsultaOcorrencia.Post;
end;

procedure TDM.alterarStatusCausaItemOcorrencia(cdOcorrencia,nrSequencia,cdStatus:integer);
var
  sqlQuery : TSQLQuery;
  sqlTxt : TStringList;

begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_ITEM_OCORRENCIA SET ');
    sqlTxt.Add('CD_ST_CAUSA_ITEM_OCORRENCIA = :STATUS ');
    sqlTxt.Add('WHERE CD_OCORRENCIA = :NR_OCORRENCIA ');
    sqlTxt.Add('AND CD_ITEM_OCORRENCIA = :NR_ITEM ');

    sqlQuery.Close;
    sqlQuery.SQL.Clear;
    sqlQuery.SQL.Text:=sqlTxt.Text;
    sqlQuery.ParamByName('STATUS').AsInteger:=cdStatus;
    sqlQuery.ParamByName('NR_OCORRENCIA').AsString:=IntToStr(cdOcorrencia);
    sqlQuery.ParamByName('NR_ITEM').AsString:=IntToStr(nrSequencia);
    sqlQuery.ExecSQL();
  finally
    sqlTxt.Free;
    sqlQuery.Free;
    sqlQuery:=nil;
  end;
end;

procedure TDM.alterarStatusSolucaoItemOcorrencia(cdOcorrencia,nrSequencia,cdStatus:integer);
var
  sqlQuery : TSQLQuery;
  sqlTxt : TStringList;

begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_ITEM_OCORRENCIA SET ');
    sqlTxt.Add('CD_ST_SOLUCAO_ITEM_OCORRENCIA = :STATUS ');
    sqlTxt.Add('WHERE CD_OCORRENCIA = :NR_OCORRENCIA ');
    sqlTxt.Add('AND CD_ITEM_OCORRENCIA = :NR_ITEM ');

    sqlQuery.Close;
    sqlQuery.SQL.Clear;
    sqlQuery.SQL.Text:=sqlTxt.Text;
    sqlQuery.ParamByName('STATUS').AsInteger:=cdStatus;
    sqlQuery.ParamByName('NR_OCORRENCIA').AsString:=IntToStr(cdOcorrencia);
    sqlQuery.ParamByName('NR_ITEM').AsString:=IntToStr(nrSequencia);
    sqlQuery.ExecSQL();
  finally
    sqlTxt.Free;
    sqlQuery.Free;
    sqlQuery:=nil;
  end;
end;

procedure TDM.alterarStatusSolucaoOcorrencia(cdStatus:integer;isCancelarOrdemDeEntrega:Boolean;PidSituacaoOrdemColeta:String);
var
  sqlQuery : TSQLQuery;
  sqlTxt : TStringList;

begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_OCORRENCIA SET ');
    sqlTxt.Add('CD_ST_SOLUCAO_OCORRENCIA = :STATUS ');
    if isCancelarOrdemDeEntrega then
      sqlTxt.Add(',ID_SITUACAO_ORDEM_COLETA = ''N'' ');
    if PidSituacaoOrdemColeta<>EmptyStr then
      sqlTxt.Add(',ID_SITUACAO_ORDEM_COLETA = :PidSituacaoOrdemColeta ');

    sqlTxt.Add('WHERE CD_OCORRENCIA = :NR_OCORRENCIA ');

    sqlQuery.Close;
    sqlQuery.SQL.Clear;
    sqlQuery.SQL.Text:=sqlTxt.Text;
    sqlQuery.ParamByName('STATUS').AsInteger:=cdStatus;
    sqlQuery.ParamByName('NR_OCORRENCIA').AsString:=IntToStr(ocorrencia.cdOcorrencia);
    if PidSituacaoOrdemColeta<>EmptyStr then
        sqlQuery.ParamByName('PidSituacaoOrdemColeta').AsString:=PidSituacaoOrdemColeta;


    sqlQuery.ExecSQL();
  finally
    sqlTxt.Free;
    sqlQuery.Free;
    sqlQuery:=nil;
  end;
end;

procedure TDM.reenviarOrdemDeColeta(cdOcorrencia,cdDestinatario:integer; dsEmail:string);
var
  sqlQuery : TSQLQuery;
  sqlTxt : TStringList;

begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_OCORRENCIA SET ');
    sqlTxt.Add('ID_SITUACAO_ORDEM_COLETA = :ID_SITUACAO_ORDEM_COLETA, DT_EMISSAO_ORDEM_COLETA = :DT_EMISSAO_ORDEM_COLETA ');
    sqlTxt.Add(',CD_DESTINO_EMAIL_ORDEM_COLETA = :CD_DESTINO_EMAIL_ORDEM_COLETA ');
    if dsEmail <> EmptyStr then
      sqlTxt.Add(',DS_EMAIL_CLIENTE = :DS_EMAIL_CLIENTE');
    sqlTxt.Add('WHERE CD_OCORRENCIA = :NR_OCORRENCIA ');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Clear;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('ID_SITUACAO_ORDEM_COLETA').AsString:=ID_SITUACAO_ORDEM_DE_COLETA_AGUARDANDO;
      if dsEmail <> EmptyStr then
        sqlQuery.ParamByName('DS_EMAIL_CLIENTE').AsString:=dsEmail;
      sqlQuery.ParamByName('DT_EMISSAO_ORDEM_COLETA').AsString:=DATA_FUTURA_PADRAO;
      sqlQuery.ParamByName('NR_OCORRENCIA').AsString:=IntToStr(cdOcorrencia);
      sqlQuery.ParamByName('CD_DESTINO_EMAIL_ORDEM_COLETA').AsString:=IntToStr(cdDestinatario);
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.CreateFmt('Ocorreu um erro ao atualizar os dados da ocorrencia. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Free;
    sqlQuery:=nil;
  end;
end;

procedure TDM.alterarStatusCausaOcorrencia(cdStatus:integer);
var
  sqlQuery : TSQLQuery;
  sqlTxt : TStringList;

begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_OCORRENCIA SET ');
    sqlTxt.Add('CD_ST_CAUSA_OCORRENCIA = :STATUS ');
    sqlTxt.Add('WHERE CD_OCORRENCIA = :NR_OCORRENCIA ');

    sqlQuery.Close;
    sqlQuery.SQL.Clear;
    sqlQuery.SQL.Text:=sqlTxt.Text;
    sqlQuery.ParamByName('STATUS').AsInteger:=cdStatus;
    sqlQuery.ParamByName('NR_OCORRENCIA').AsString:=IntToStr(ocorrencia.cdOcorrencia);
    sqlQuery.ExecSQL();
  finally
    sqlTxt.Free;
    sqlQuery.Free;
    sqlQuery:=nil;
  end;
end;

procedure TDM.execProcessoGravarSolucaoItem();
var
  lTD : TDBXTransaction;
begin
  try
    { iniciar transsação }
    lTD := conexaoProducao.BeginTransaction;

    gravarSolucaoItemOcorrencia(False,False);
    alterarStatusSolucaoItemOcorrencia(ocorrencia.cdOcorrencia,ocorrencia.item.nrSequencia,CD_SOLUCAO_FINALIZADA_ITEM);
    alterarStatusSolucaoItemLocal(CD_SOLUCAO_FINALIZADA_ITEM,False);
    atualizarStatusSolucaoOcorrencia(False,False);

    { Se terminar normalmente executa commit }
    conexaoProducao.CommitFreeAndNil(lTD);
  except
    on E:Exception do
    begin
      { Se der problema executa roolback em todos os processos }
      conexaoProducao.RollbackFreeAndNil(lTD);
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TDM.execProcessoGravarCausaItem;
var
  lTD : TDBXTransaction;
begin
  try
    { iniciar transsação }
    lTD := conexaoProducao.BeginTransaction;

    DM.gravarCausaItemOcorrencia;
    DM.alterarStatusCausaItemOcorrencia(ocorrencia.cdOcorrencia,ocorrencia.item.nrSequencia,CD_CAUSA_FINALIZADA_ITEM);
    DM.alterarStatusCausaItemLocal(CD_CAUSA_FINALIZADA_ITEM);
    DM.atualizarStatusCausaOcorrencia(False,False);

    { Se terminar normalmente executa commit }
    conexaoProducao.CommitFreeAndNil(lTD);
  except
    on E:Exception do
    begin
      { Se der problema executa roolback em todos os processos }
      conexaoProducao.RollbackFreeAndNil(lTD);
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TDM.gravarCausaItemOcorrencia;
var
  sqlDados: TSQLQuery;
  sqlTxt: TStringList;

begin
  sqlDados:=TSQLQuery.Create(nil);
  sqlDados.SQLConnection:=conexaoProducao;

  sqlTxt:=TStringList.Create;
  sqlTxt.Clear;
  try
    try
      sqlTxt.Add('UPDATE GAMSAC.DC_SAC_SOLUCAO_ITEM_OCORRENCIA SET ');
      sqlTxt.Add('CD_SUBTIPO_CAUSA = :CD_SUBTIPO_CAUSA, DS_CAUSA_ITEM_OCORRENCIA = :DS_CAUSA_ITEM_OCORRENCIA ');
      sqlTxt.Add(',DT_CAUSA_ITEM_OCORRENCIA = :DT_CAUSA_ITEM_OCORRENCIA');
      sqlTxt.Add(',DS_TRANSP_RESP_CAUSA = :DS_TRANSP_RESP_CAUSA, DS_ACAO_CAUSA = :DS_ACAO_CAUSA ');
      sqlTxt.Add('WHERE CD_OCORRENCIA = :CD_OCORRENCIA ');
      sqlTxt.Add('AND CD_ITEM_OCORRENCIA = :CD_ITEM_OCORRENCIA ');

      sqlDados.Close;
      sqlDados.SQL.Clear;
      sqlDados.SQL.Text:=sqlTxt.Text;
      sqlDados.ParamByName('CD_OCORRENCIA').AsString:=inttostr(ocorrencia.cdOcorrencia);
      sqlDados.ParamByName('CD_ITEM_OCORRENCIA').AsString:=inttostr(ocorrencia.item.nrSequencia);
      sqlDados.ParamByName('CD_SUBTIPO_CAUSA').AsString:=inttostr(ocorrencia.item.causa.cdSubTipoCausa);
      sqlDados.ParamByName('DS_CAUSA_ITEM_OCORRENCIA').AsString:=ocorrencia.item.causa.dsCausa;
      sqlDados.ParamByName('DT_CAUSA_ITEM_OCORRENCIA').AsDateTime:=dadosEmpresa.dataHora;
      sqlDados.ParamByName('DS_TRANSP_RESP_CAUSA').AsString:=ocorrencia.item.causa.dsTransporte;
      sqlDados.ParamByName('DS_ACAO_CAUSA').AsString:=ocorrencia.item.causa.dsAcaoTomada;
      sqlDados.ExecSQL();
    except
      on E:Exception  do
        raise Exception.CreateFmt('Erro ao gravar dados da causa da ocorrencia. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlDados.Close;
    sqlDados.Free;
  end;
end;

procedure TDM.gravarSolucaoItemOcorrencia(isSolucaoPadrao,isCausaPadrao:Boolean);
var
  sqlDados: TSQLQuery;
  sqlTxt: TStringList;
begin
  sqlDados:=TSQLQuery.Create(nil);
  sqlDados.SQLConnection:=conexaoProducao;

  sqlTxt:=TStringList.Create;
  sqlTxt.Clear;
  try
    try
      sqlTxt.Add('INSERT INTO GAMSAC.DC_SAC_SOLUCAO_ITEM_OCORRENCIA ');
      sqlTxt.Add('(CD_OCORRENCIA, CD_ITEM_OCORRENCIA,');
      sqlTxt.Add('CD_SUBTIPO_CAUSA, CD_SUBTIPO_SOLUCAO, DS_SOLUCAO_ITEM_OCORRENCIA,');
      sqlTxt.Add('ID_FILMAGEM_ITEM_OCORRENCIA, ID_VISIVEL_ITEM_OCORRENCIA,');
      sqlTxt.Add('NR_CAMERA, CD_CONFERENTE, ID_CONTA_ESTOQUE, ID_RESULTADO_ESTOQUE,');
      sqlTxt.Add('ID_GRAVACAO_TLV, DT_SOLUCAO_ITEM_OCORRENCIA, ID_RESULTADO_GRAVACAO_TLV,');
      sqlTxt.Add('DS_TRANSP_RESP_SOLUCAO, CD_SITUACAO_EMBALAGEM, DS_CAUSA_ITEM_OCORRENCIA,');
      sqlTxt.Add('DT_CAUSA_ITEM_OCORRENCIA, DS_TRANSP_RESP_CAUSA, DS_ACAO_CAUSA,');
      sqlTxt.Add('DT_ATUALIZACAO, NM_USUARIO, ID_RECOLHE_MERCADORIA )');
      sqlTxt.Add('VALUES ');
      sqlTxt.Add('(:CD_OCORRENCIA, :CD_ITEM_OCORRENCIA,');
      sqlTxt.Add(':CD_SUBTIPO_CAUSA, :CD_SUBTIPO_SOLUCAO, :DS_SOLUCAO_ITEM_OCORRENCIA,');
      sqlTxt.Add(':ID_FILMAGEM_ITEM_OCORRENCIA, :ID_VISIVEL_ITEM_OCORRENCIA,');
      sqlTxt.Add(':NR_CAMERA, :CD_CONFERENTE, :ID_CONTA_ESTOQUE, :ID_RESULTADO_ESTOQUE,');
      sqlTxt.Add(':ID_GRAVACAO_TLV, :DT_SOLUCAO_ITEM_OCORRENCIA, :ID_RESULTADO_GRAVACAO_TLV,');
      sqlTxt.Add(':DS_TRANSP_RESP_SOLUCAO, :CD_SITUACAO_EMBALAGEM, :DS_CAUSA_ITEM_OCORRENCIA,');
      sqlTxt.Add(':DT_CAUSA_ITEM_OCORRENCIA, :DS_TRANSP_RESP_CAUSA, :DS_ACAO_CAUSA,');
      sqlTxt.Add(':DT_ATUALIZACAO, :NM_USUARIO, :ID_RECOLHE_MERCADORIA )');

      sqlDados.Close;
      sqlDados.SQL.Clear;
      sqlDados.SQL.Text:=sqlTxt.Text;
      if not isSolucaoPadrao then
      begin
        sqlDados.ParamByName('CD_OCORRENCIA').AsString:=inttostr(ocorrencia.cdOcorrencia);
        sqlDados.ParamByName('CD_ITEM_OCORRENCIA').AsString:=inttostr(ocorrencia.item.nrSequencia);
        sqlDados.ParamByName('CD_SUBTIPO_CAUSA').AsString:=inttostr(ocorrencia.item.causa.cdSubTipoCausa);
        sqlDados.ParamByName('CD_SUBTIPO_SOLUCAO').AsString:=inttostr(ocorrencia.item.solucao.cdSubTipoSolucao);
        sqlDados.ParamByName('DS_SOLUCAO_ITEM_OCORRENCIA').AsString:=ocorrencia.item.solucao.dsSolucao;
        sqlDados.ParamByName('ID_FILMAGEM_ITEM_OCORRENCIA').AsString:=booleanToString(ocorrencia.item.solucao.idFilmagem);
        sqlDados.ParamByName('ID_VISIVEL_ITEM_OCORRENCIA').AsString:=booleanToString(ocorrencia.item.solucao.idFilmagemVisivel);
        sqlDados.ParamByName('NR_CAMERA').AsString:=inttostr(ocorrencia.item.solucao.nrCamera);
        sqlDados.ParamByName('CD_CONFERENTE').AsString:=inttostr(ocorrencia.item.solucao.cdConferente);
        sqlDados.ParamByName('ID_CONTA_ESTOQUE').AsString:=booleanToString(ocorrencia.item.solucao.idContagemEstoque);
        sqlDados.ParamByName('ID_RESULTADO_ESTOQUE').AsInteger:=ocorrencia.item.solucao.cdSituacaoEstoque;
        sqlDados.ParamByName('ID_GRAVACAO_TLV').AsString:=booleanToString(ocorrencia.item.solucao.idGravacaoTlv);
        sqlDados.ParamByName('DT_SOLUCAO_ITEM_OCORRENCIA').AsDateTime:=dadosEmpresa.dataHora;
        sqlDados.ParamByName('ID_RESULTADO_GRAVACAO_TLV').AsString:=ocorrencia.item.solucao.idGravacaoCorreta;
        sqlDados.ParamByName('DS_TRANSP_RESP_SOLUCAO').AsString:=ocorrencia.item.solucao.dsTransporte;
        sqlDados.ParamByName('CD_SITUACAO_EMBALAGEM').AsString:=inttostr(ocorrencia.item.solucao.cdSituacaoEmbalagem);
        sqlDados.ParamByName('DS_CAUSA_ITEM_OCORRENCIA').AsString:=ocorrencia.item.causa.dsCausa;
        sqlDados.ParamByName('DT_CAUSA_ITEM_OCORRENCIA').AsString:=DATA_FUTURA_PADRAO;
        sqlDados.ParamByName('DS_TRANSP_RESP_CAUSA').AsString:=ocorrencia.item.causa.dsTransporte;
        sqlDados.ParamByName('DS_ACAO_CAUSA').AsString:=ocorrencia.item.causa.dsAcaoTomada;
        sqlDados.ParamByName('DT_ATUALIZACAO').AsDateTime:=dadosEmpresa.dataHora;
        sqlDados.ParamByName('NM_USUARIO').AsString:=usuario.login;
        sqlDados.ParamByName('ID_RECOLHE_MERCADORIA').AsString:=ocorrencia.item.solucao.idRecolherMercadoria;
      end
      else
      begin
        sqlDados.ParamByName('CD_OCORRENCIA').AsString:=cdsOcorrencia.FieldByName('cdOcorrencia').AsString;
        sqlDados.ParamByName('CD_ITEM_OCORRENCIA').AsString:=cdsItemOcorrencia.FieldByName('nrSequencia').AsString;
        if isCausaPadrao then
          sqlDados.ParamByName('CD_SUBTIPO_CAUSA').AsString:=inttostr(getCodigoSubTipoCausaFixa(cdsItemOcorrencia.FieldByName('cdTipoOcorrencia').AsString,cdsItemOcorrencia.FieldByName('cdSubTipoOcorrencia').AsString))
        else
          sqlDados.ParamByName('CD_SUBTIPO_CAUSA').AsInteger:=0;
        sqlDados.ParamByName('CD_SUBTIPO_SOLUCAO').AsString:=inttostr(getCodigoSubTipoSolucaoFixa(cdsItemOcorrencia.FieldByName('cdTipoOcorrencia').AsString,cdsItemOcorrencia.FieldByName('cdSubTipoOcorrencia').AsString));;
        sqlDados.ParamByName('DS_SOLUCAO_ITEM_OCORRENCIA').AsString:=' ';
        sqlDados.ParamByName('ID_FILMAGEM_ITEM_OCORRENCIA').AsString:='Z';
        sqlDados.ParamByName('ID_VISIVEL_ITEM_OCORRENCIA').AsString:='Z';
        sqlDados.ParamByName('NR_CAMERA').AsString:='0';
        sqlDados.ParamByName('CD_CONFERENTE').AsString:='0';
        sqlDados.ParamByName('ID_CONTA_ESTOQUE').AsString:='Z';
        sqlDados.ParamByName('ID_RESULTADO_ESTOQUE').AsString:='0';
        sqlDados.ParamByName('ID_GRAVACAO_TLV').AsString:='Z';
        sqlDados.ParamByName('DT_SOLUCAO_ITEM_OCORRENCIA').AsDateTime:=dadosEmpresa.dataHora;
        sqlDados.ParamByName('ID_RESULTADO_GRAVACAO_TLV').AsString:='0';
        sqlDados.ParamByName('DS_TRANSP_RESP_SOLUCAO').AsString:=' ';
        sqlDados.ParamByName('CD_SITUACAO_EMBALAGEM').AsString:='0';
        sqlDados.ParamByName('DS_CAUSA_ITEM_OCORRENCIA').AsString:=' ';
        sqlDados.ParamByName('DT_CAUSA_ITEM_OCORRENCIA').AsDateTime:=dadosEmpresa.dataHora;
        sqlDados.ParamByName('DS_TRANSP_RESP_CAUSA').AsString:=' ';
        sqlDados.ParamByName('DS_ACAO_CAUSA').AsString:=' ';
        sqlDados.ParamByName('DT_ATUALIZACAO').AsDateTime:=dadosEmpresa.dataHora;
        sqlDados.ParamByName('NM_USUARIO').AsString:='SAC';
        sqlDados.ParamByName('ID_RECOLHE_MERCADORIA').AsString:=booleanToString(cdsItemOcorrencia.FieldByName('idRecolherMercadoria').AsBoolean);
      end;

      sqlDados.ExecSQL();
    except
      on E:Exception  do
        raise Exception.CreateFmt('Erro ao inserir ocorrencia. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlDados.Close;
    sqlDados.Free;
  end;
end;

procedure TDM.execAlterarSolucionadorItemOcorrencia;
var
  sqlDados: TSQLQuery;
  sqlTxt: TStringList;
  teste: string;
begin
  sqlDados:=TSQLQuery.Create(nil);
  sqlDados.SQLConnection:=conexaoProducao;

  sqlTxt:=TStringList.Create;
  sqlTxt.Clear;
  try
    try
      sqlTxt.Add('UPDATE GAMSAC.DC_SAC_ITEM_OCORRENCIA SET ');
      sqlTxt.Add('NR_MATRIC_SOLUCIONADOR = :NR_MATRIC_SOLUCIONADOR,');
      sqlTxt.Add('NR_MATRIC_GERENTE_SOLUCIONADOR = :NR_MATRIC_GERENTE_SOLUCIONADOR,');
      sqlTxt.Add('DT_LIMITE_SOLUCAO = :DT_LIMITE_SOLUCAO, CD_AREA_ORIGEM = :CD_AREA_ORIGEM ');
      sqlTxt.Add('WHERE CD_OCORRENCIA = :CD_OCORRENCIA AND CD_ITEM_OCORRENCIA = :CD_ITEM_OCORRENCIA');

      sqlDados.Close;
      sqlDados.SQL.Clear;
      sqlDados.SQL.Text:=sqlTxt.Text;
      sqlDados.ParamByName('CD_OCORRENCIA').AsString:=cdsOcorrencia.FieldByName('cdOcorrencia').AsString;
      sqlDados.ParamByName('CD_ITEM_OCORRENCIA').AsString:=cdsItemOcorrencia.FieldByName('nrSequencia').AsString;
      sqlDados.ParamByName('NR_MATRIC_SOLUCIONADOR').AsString:=cdsItemOcorrencia.FieldByName('cdSolucionador').AsString;
      sqlDados.ParamByName('NR_MATRIC_GERENTE_SOLUCIONADOR').AsString:=cdsItemOcorrencia.FieldByName('cdGerenteSolucionador').AsString;
      sqlDados.ParamByName('DT_LIMITE_SOLUCAO').AsDateTime:=cdsItemOcorrencia.FieldByName('dataLimite').AsDateTime;
      sqlDados.ParamByName('CD_AREA_ORIGEM').AsString:=cdsItemOcorrencia.FieldByName('cdAreaOrigem').AsString;
      sqlDados.ExecSQL();
    except
      on E:Exception  do
        raise Exception.CreateFmt('Erro ao inserir item da ocorrencia[%s]. Detalhes: %s',[cdsItemOcorrencia.FieldByName('nrSequencia').AsString,E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlDados.Close;
    sqlDados.Free;
  end;
end;

procedure TDM.execGravarItemOcorrencia;
var
  sqlDados: TSQLQuery;
  sqlTxt: TStringList;
  teste: string;
begin
  sqlDados:=TSQLQuery.Create(nil);
  sqlDados.SQLConnection:=conexaoProducao;

  sqlTxt:=TStringList.Create;
  sqlTxt.Clear;
  try
    try
      sqlTxt.Add('INSERT INTO GAMSAC.DC_SAC_ITEM_OCORRENCIA (');
      sqlTxt.Add('CD_OCORRENCIA, CD_ITEM_OCORRENCIA, CD_EMPRESA_ITEM_OCORRENCIA,');
      sqlTxt.Add('ID_EMPRESA_NFE_ITEM_OCORRENCIA, NR_NFE_ITEM_OCORRENCIA,');
      sqlTxt.Add('NR_SERIE_NFE, DT_EMISSAO_NF_ITEM_OCORRENCIA,');
      sqlTxt.Add('CD_ORIGEM_PEDIDO, CD_PRODUTO_ITEM_OCORRENCIA,');
      sqlTxt.Add('QT_PRODUTO_ITEM_OCORRENCIA, TP_PRODUTO_ITEM_OCORRENCIA,');
      sqlTxt.Add('DT_VAL_PRODUTO_ITEM_OCORRENCIA, PR_VAL_PRODUTO_ITEM_OCORRENCIA,');
      sqlTxt.Add('CD_SITUACAO_EMBALAGEM, CD_TIPO_OCORRENCIA, CD_SUBTIPO_OCORRENCIA,');
      sqlTxt.Add('DS_ITEM_OCORRENCIA, NR_MATRIC_SOLUCIONADOR, NR_MATRIC_GERENTE_SOLUCIONADOR,');
      sqlTxt.Add('NR_MATRIC_REPRESENTANTE, NR_MAT_GERENTE_REPRESENTANTE,');
      sqlTxt.Add('CD_SETOR, CD_DISTRITO, CD_TRANSPORTADOR, DS_TRANSBORDO_VIAGEM,');
      sqlTxt.Add('CD_ST_SOLUCAO_ITEM_OCORRENCIA, CD_ST_CAUSA_ITEM_OCORRENCIA,');
      sqlTxt.Add('DT_LIMITE_SOLUCAO, CD_AREA_ORIGEM, DS_LOTE_ITEM_OCORRENCIA,');
      sqlTxt.Add('NR_MATRICULA_GERENTE_CANAL, ID_REGISTRO_FORA_PRAZO, CD_OPERADOR_LOGISTICO, DS_DIGITADOR_PEDIDO, CD_CLIENTE_ENTREGA,');
      sqlTxt.Add('CD_CFOP, DS_CST, VL_UNITARIO, VL_BC_ICMS_UNITARIO, VL_ICMS_UNITARIO, VL_BC_ST_UNITARIO, VL_ST_UNITARIO )');
      sqlTxt.Add('VALUES ');
      sqlTxt.Add('(:CD_OCORRENCIA, :CD_ITEM_OCORRENCIA, :CD_EMPRESA_ITEM_OCORRENCIA,');
      sqlTxt.Add(':ID_EMPRESA_NFE_ITEM_OCORRENCIA, :NR_NFE_ITEM_OCORRENCIA,');
      sqlTxt.Add(':NR_SERIE_NFE, :DT_EMISSAO_NF_ITEM_OCORRENCIA,');
      sqlTxt.Add(':CD_ORIGEM_PEDIDO, :CD_PRODUTO_ITEM_OCORRENCIA,');
      sqlTxt.Add(':QT_PRODUTO_ITEM_OCORRENCIA, :TP_PRODUTO_ITEM_OCORRENCIA,');
      sqlTxt.Add(':DT_VAL_PRODUTO_ITEM_OCORRENCIA, :PR_VAL_PRODUTO_ITEM_OCORRENCIA,');
      sqlTxt.Add(':CD_SITUACAO_EMBALAGEM, :CD_TIPO_OCORRENCIA, :CD_SUBTIPO_OCORRENCIA,');
      sqlTxt.Add(':DS_ITEM_OCORRENCIA, :NR_MATRIC_SOLUCIONADOR, :NR_MATRIC_GERENTE_SOLUCIONADOR,');
      sqlTxt.Add(':NR_MATRIC_REPRESENTANTE, :NR_MAT_GERENTE_REPRESENTANTE,');
      sqlTxt.Add(':CD_SETOR, :CD_DISTRITO, :CD_TRANSPORTADOR, :DS_TRANSBORDO_VIAGEM,');
      sqlTxt.Add(':CD_ST_SOLUCAO_ITEM_OCORRENCIA, :CD_ST_CAUSA_ITEM_OCORRENCIA,');
      sqlTxt.Add(':DT_LIMITE_SOLUCAO, :CD_AREA_ORIGEM, :DS_LOTE_ITEM_OCORRENCIA,');
      sqlTxt.Add(':NR_MATRICULA_GERENTE_CANAL, :ID_REGISTRO_FORA_PRAZO, :CD_OPERADOR_LOGISTICO, :DS_DIGITADOR_PEDIDO, :CD_CLIENTE_ENTREGA,');
      sqlTxt.Add(':CD_CFOP, :DS_CST, :VL_UNITARIO, :VL_BC_ICMS_UNITARIO, :VL_ICMS_UNITARIO, :VL_BC_ST_UNITARIO, :VL_ST_UNITARIO )');

      sqlDados.Close;
      sqlDados.SQL.Clear;
      sqlDados.SQL.Text:=sqlTxt.Text;
      sqlDados.ParamByName('CD_OCORRENCIA').AsString:=cdsOcorrencia.FieldByName('cdOcorrencia').AsString;
      sqlDados.ParamByName('CD_ITEM_OCORRENCIA').AsString:=cdsItemOcorrencia.FieldByName('nrSequencia').AsString;
      sqlDados.ParamByName('CD_EMPRESA_ITEM_OCORRENCIA').AsString:=cdsOcorrencia.FieldByName('cdEmpresa').AsString;
      sqlDados.ParamByName('ID_EMPRESA_NFE_ITEM_OCORRENCIA').AsString:=cdsItemOcorrencia.FieldByName('cdEmpresa').AsString;
      sqlDados.ParamByName('NR_NFE_ITEM_OCORRENCIA').AsString:=cdsItemOcorrencia.FieldByName('nrNFe').AsString;
      sqlDados.ParamByName('NR_SERIE_NFE').AsString:=cdsItemOcorrencia.FieldByName('nrSerieNFe').AsString;
      sqlDados.ParamByName('DT_EMISSAO_NF_ITEM_OCORRENCIA').AsDateTime:=cdsItemOcorrencia.FieldByName('dataEmissao').AsDateTime;
      sqlDados.ParamByName('CD_ORIGEM_PEDIDO').AsString:=cdsItemOcorrencia.FieldByName('cdOrigemPedido').AsString;
      sqlDados.ParamByName('CD_PRODUTO_ITEM_OCORRENCIA').AsString:=cdsItemOcorrencia.FieldByName('cdProduto').AsString;
      sqlDados.ParamByName('QT_PRODUTO_ITEM_OCORRENCIA').AsString:=cdsItemOcorrencia.FieldByName('quantProduto').AsString;
      sqlDados.ParamByName('TP_PRODUTO_ITEM_OCORRENCIA').AsString:=cdsItemOcorrencia.FieldByName('cdTipoProduto').AsString;
      sqlDados.ParamByName('DT_VAL_PRODUTO_ITEM_OCORRENCIA').AsDateTime:=cdsItemOcorrencia.FieldByName('dataValidadeProduto').AsDateTime;
      sqlDados.ParamByName('PR_VAL_PRODUTO_ITEM_OCORRENCIA').AsString:=cdsItemOcorrencia.FieldByName('prazoValidade').AsString;
      sqlDados.ParamByName('CD_SITUACAO_EMBALAGEM').AsString:=cdsItemOcorrencia.FieldByName('cdSituacaoEmbalagem').AsString;
      sqlDados.ParamByName('CD_TIPO_OCORRENCIA').AsString:=cdsItemOcorrencia.FieldByName('cdTipoOcorrencia').AsString;
      sqlDados.ParamByName('CD_SUBTIPO_OCORRENCIA').AsString:=cdsItemOcorrencia.FieldByName('cdSubTipoOcorrencia').AsString;
      sqlDados.ParamByName('DS_ITEM_OCORRENCIA').AsString:=validarTextoObsevacao(cdsItemOcorrencia.FieldByName('descricaoOcorrencia').AsString);
      sqlDados.ParamByName('NR_MATRIC_SOLUCIONADOR').AsString:=cdsItemOcorrencia.FieldByName('cdSolucionador').AsString;
      sqlDados.ParamByName('NR_MATRIC_GERENTE_SOLUCIONADOR').AsString:=cdsItemOcorrencia.FieldByName('cdGerenteSolucionador').AsString;
      sqlDados.ParamByName('NR_MATRIC_REPRESENTANTE').AsString:=cdsItemOcorrencia.FieldByName('nrMatriculaRepresentante').AsString;
      sqlDados.ParamByName('NR_MAT_GERENTE_REPRESENTANTE').AsString:=cdsItemOcorrencia.FieldByName('nrMatriculaGerenteRepresentante').AsString;
      sqlDados.ParamByName('CD_SETOR').AsString:=cdsItemOcorrencia.FieldByName('cdSetor').AsString;
      sqlDados.ParamByName('CD_DISTRITO').AsString:=cdsItemOcorrencia.FieldByName('cdDistrito').AsString;
      sqlDados.ParamByName('CD_TRANSPORTADOR').AsString:=cdsItemOcorrencia.FieldByName('cdTransportador').AsString;
      sqlDados.ParamByName('DS_TRANSBORDO_VIAGEM').AsString:=cdsItemOcorrencia.FieldByName('dsTransbordoCarga').AsString;
      sqlDados.ParamByName('CD_ST_SOLUCAO_ITEM_OCORRENCIA').AsInteger:=cdsItemOcorrencia.FieldByName('cdStatusSolucao').AsInteger;
      sqlDados.ParamByName('CD_ST_CAUSA_ITEM_OCORRENCIA').AsString:=cdsItemOcorrencia.FieldByName('cdStatusCausa').AsString;
      sqlDados.ParamByName('DT_LIMITE_SOLUCAO').AsDateTime:=cdsItemOcorrencia.FieldByName('dataLimite').AsDateTime;
      sqlDados.ParamByName('CD_AREA_ORIGEM').AsString:=cdsItemOcorrencia.FieldByName('cdAreaOrigem').AsString;
      sqlDados.ParamByName('DS_LOTE_ITEM_OCORRENCIA').AsString:=cdsItemOcorrencia.FieldByName('dsLoteProduto').AsString;
      sqlDados.ParamByName('NR_MATRICULA_GERENTE_CANAL').AsString:=cdsItemOcorrencia.FieldByName('nrMatriculaGerenteCanal').AsString;
      sqlDados.ParamByName('ID_REGISTRO_FORA_PRAZO').AsString:=booleanToString(cdsItemOcorrencia.FieldByName('IdAlertarRegistroForaPrazo').AsBoolean);
      sqlDados.ParamByName('CD_OPERADOR_LOGISTICO').AsString:=cdsItemOcorrencia.FieldByName('cdOperadorLogistico').AsString;
      sqlDados.ParamByName('DS_DIGITADOR_PEDIDO').AsString:=cdsItemOcorrencia.FieldByName('dsDigitadorPedido').AsString;
      sqlDados.ParamByName('CD_CLIENTE_ENTREGA').AsString:=cdsItemOcorrencia.FieldByName('cdClienteEntrega').AsString;

      sqlDados.ParamByName('CD_CFOP').AsString:= cdsItemOcorrencia.FieldByName('cfop').AsString;
      sqlDados.ParamByName('DS_CST').AsString:= cdsItemOcorrencia.FieldByName('cst').AsString;
      sqlDados.ParamByName('VL_UNITARIO').AsString:= converterFloatParaString(cdsItemOcorrencia.FieldByName('vlrUnitarioMercadoria').AsString);
      sqlDados.ParamByName('VL_BC_ICMS_UNITARIO').AsString:= converterFloatParaString(cdsItemOcorrencia.FieldByName('vlrUnitarioBcIcms').AsString);
      sqlDados.ParamByName('VL_ICMS_UNITARIO').AsString:= converterFloatParaString(cdsItemOcorrencia.FieldByName('vlrUnitarioIcms').AsString);
      sqlDados.ParamByName('VL_BC_ST_UNITARIO').AsString:= converterFloatParaString(cdsItemOcorrencia.FieldByName('vlrUnitarioBcST').AsString);
      sqlDados.ParamByName('VL_ST_UNITARIO').AsString:= converterFloatParaString(cdsItemOcorrencia.FieldByName('vlrUnitarioST').AsString);

      sqlDados.ExecSQL();
    except
      on E:Exception  do
        raise Exception.CreateFmt('Erro ao inserir item da ocorrencia[%s]. Detalhes: %s',[cdsItemOcorrencia.FieldByName('nrSequencia').AsString,E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlDados.Close;
    sqlDados.Free;
  end;
end;

procedure TDM.execGravarOcorrencia;
var
  sqlDados: TSQLQuery;
  sqlTxt: TStringList;
begin
  sqlDados:=TSQLQuery.Create(nil);
  sqlDados.SQLConnection:=conexaoProducao;

  sqlTxt:=TStringList.Create;
  sqlTxt.Clear;
  try
    try
      sqlTxt.Add('INSERT INTO GAMSAC.DC_SAC_OCORRENCIA (CD_OCORRENCIA, CD_CLIENTE,');
      sqlTxt.Add('CD_EMPRESA, CD_USUARIO, DS_OCORRENCIA,CD_PR_OCORRENCIA,DT_RE_OCORRENCIA,');
      sqlTxt.Add('DT_LI_OCORRENCIA, CD_ST_SOLUCAO_OCORRENCIA,CD_ST_CAUSA_OCORRENCIA,DS_CONTATO, ');
      sqlTxt.Add('DS_EMAIL_CLIENTE,CD_MEIO_CONTATO,ID_SITUACAO_ORDEM_COLETA,');
      sqlTxt.Add('DT_EMISSAO_ORDEM_COLETA, CD_DESTINO_EMAIL_ORDEM_COLETA,NM_ARQUIVO_ANEXO)');
      sqlTxt.Add('VALUES ');
      sqlTxt.Add('(:CD_OCORRENCIA, :CD_CLIENTE, :CD_EMPRESA, :CD_USUARIO, :DS_OCORRENCIA,');
      sqlTxt.Add(':CD_PR_OCORRENCIA,:DT_RE_OCORRENCIA,:DT_LI_OCORRENCIA, :CD_ST_SOLUCAO_OCORRENCIA,');
      sqlTxt.Add(':CD_ST_CAUSA_OCORRENCIA,:DS_CONTATO,:DS_EMAIL_CLIENTE,:CD_MEIO_CONTATO,:ID_SITUACAO_ORDEM_COLETA,');
      sqlTxt.Add(':DT_EMISSAO_ORDEM_COLETA,:CD_DESTINO_EMAIL_ORDEM_COLETA,:NM_ARQUIVO_ANEXO )');

      sqlDados.Close;
      sqlDados.SQL.Clear;
      sqlDados.SQL.Text:=sqlTxt.Text;
      sqlDados.ParamByName('CD_OCORRENCIA').AsString:=cdsOcorrencia.FieldByName('cdOcorrencia').AsString;
      sqlDados.ParamByName('CD_CLIENTE').AsString:=cdsOcorrencia.FieldByName('cdCliente').AsString;
      sqlDados.ParamByName('CD_EMPRESA').AsString:=cdsOcorrencia.FieldByName('cdEmpresa').AsString;
      sqlDados.ParamByName('CD_USUARIO').AsString:=cdsOcorrencia.FieldByName('cdUsuario').AsString;
      sqlDados.ParamByName('DS_OCORRENCIA').AsString:=validarTextoObsevacao(cdsOcorrencia.FieldByName('descricao').AsString);
      sqlDados.ParamByName('CD_PR_OCORRENCIA').AsString:=cdsOcorrencia.FieldByName('cdPrioridade').AsString;
      sqlDados.ParamByName('DT_RE_OCORRENCIA').AsDateTime:=cdsOcorrencia.FieldByName('dataRegistro').AsDateTime;
      sqlDados.ParamByName('DT_LI_OCORRENCIA').AsDateTime:=cdsOcorrencia.FieldByName('dataLimite').AsDateTime;
      sqlDados.ParamByName('CD_ST_SOLUCAO_OCORRENCIA').AsString:=cdsOcorrencia.FieldByName('cdStatusSolucao').AsString;
      sqlDados.ParamByName('CD_ST_CAUSA_OCORRENCIA').AsString:=cdsOcorrencia.FieldByName('cdStatusCausa').AsString;
      sqlDados.ParamByName('DS_CONTATO').AsString:=cdsOcorrencia.FieldByName('dsContato').AsString;
      sqlDados.ParamByName('DS_EMAIL_CLIENTE').AsString:=cdsOcorrencia.FieldByName('dsEmailCliente').AsString;
      sqlDados.ParamByName('CD_MEIO_CONTATO').AsString:=cdsOcorrencia.FieldByName('cdMeioDeContato').AsString;
      sqlDados.ParamByName('ID_SITUACAO_ORDEM_COLETA').AsString:=cdsOcorrencia.FieldByName('idSituacaoOrdemColeta').AsString;
      sqlDados.ParamByName('DT_EMISSAO_ORDEM_COLETA').AsString:='01/01/2039';
      sqlDados.ParamByName('CD_DESTINO_EMAIL_ORDEM_COLETA').AsInteger:=cdsOcorrencia.FieldByName('cdDestinoEmailOrdemDeColeta').AsInteger;
      sqlDados.ParamByName('NM_ARQUIVO_ANEXO').AsString:=cdsOcorrencia.FieldByName('dsNomeArquivo').AsString;
      sqlDados.ExecSQL();
    except
      on E:Exception  do
        raise Exception.CreateFmt('Erro ao inserir ocorrencia. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlDados.Close;
    sqlDados.Free;
  end;
end;

procedure TDM.gravarDestinatarioMensagem(dsDestManual:string;indice: integer);
  function isEncaminharCopiaParaSupervisor: Boolean;
    procedure limparEmail;
    var
      emailSupervisor: string;
    begin
      emailSupervisor:=format(';%s',[cdsItemOcorrenciadsEmailSupervisor.AsString]);
      dadosMensagem[indice].listaEmailCopia:=StringReplace(dadosMensagem[indice].listaEmailCopia,emailSupervisor,'',[rfReplaceAll]);
    end;
  begin
    Result:=True;
    if cdsItemOcorrenciacdGerenteSolucionador.AsInteger=1231 then
        Result:=false;



    if cdsItemOcorrenciacdSolucionador.AsInteger = usuario.matricula then
    begin
      Result:=false;
      {
      if cdsItemOcorrenciacdTipoOcorrencia.AsInteger in [CD_TIPO_OCORRENCIA_PRODUTO_AVARIADO,CD_TIPO_OCORRENCIA_PRODUTO_AVARIADO_48_HORAS] then
      begin
        Result:=False;
      end;

      if ((cdsItemOcorrenciacdTipoOcorrencia.AsInteger in [CD_TIPO_OCORRENCIA_DEVOLUCAO,CD_TIPO_OCORRENCIA_DEVOLUCAO_TELEVENDAS]) and (cdsItemOcorrenciacdSubTipoOcorrencia.AsInteger = CD_SUBTIPO_OCORRENCIA_VENC_CURTO1)) then
      begin
        Result:=False;
      end;

      if ((cdsItemOcorrenciacdTipoOcorrencia.AsInteger = CD_TIPO_OCORRENCIA_DEVOLUCAO_HOSPITALAR) and (cdsItemOcorrenciacdSubTipoOcorrencia.AsInteger in [CD_SUBTIPO_OCORRENCIA_VENC_CURTO1,CD_SUBTIPO_OCORRENCIA_VENC_CURTO2])) then
      begin
        Result:=False;
      end;

      if ((cdsItemOcorrenciacdTipoOcorrencia.AsInteger = CD_TIPO_OCORRENCIA_PRODUTO_COM_DEFEITO) and (cdsItemOcorrenciacdSubTipoOcorrencia.AsInteger = CD_SUBTIPO_DEFEITO_FABRICA)) then
      begin
        Result:=False;
      end;

      if ((cdsItemOcorrenciacdTipoOcorrencia.AsInteger in [CD_TIPO_OCORRENCIA_DEVOLUCAO,CD_TIPO_OCORRENCIA_DEVOLUCAO_HOSPITALAR,CD_TIPO_OCORRENCIA_DEVOLUCAO_TELEVENDAS]) and (cdsItemOcorrenciacdSubTipoOcorrencia.AsInteger = CD_SUBTIPO_PRODUTO_RECOLHIDO)) then
      begin
        Result:=False;
      end;
      }

    end;
  end;

  procedure addEmail(id:integer;dsEmail:string);
  begin
    //dadosMensagem.listaEmailCopia[id]:=dsemail;

    if dadosMensagem[indice].listaEmailCopia <> EmptyStr then
      dadosMensagem[indice].listaEmailCopia:=dadosMensagem[indice].listaEmailCopia+';'+ dsEmail
    else
      dadosMensagem[indice].listaEmailCopia:=dsEmail

  end;
var
  i: integer;
begin
  i:=0;
  dadosMensagem[indice].limparDados;

  if dsDestManual <> EmptyStr then
    dadosMensagem[indice].emailDestinatario:=dsDestManual
  else
  begin
    dadosMensagem[indice].emailDestinatario:=cdsItemOcorrencia.FieldByName('dsEmailSolucionador').AsString;

    if cdsItemOcorrencia.FieldByName('dsEmailSupervisor').AsString <> EmptyStr then
    begin
     { Não enviar copia da de email para o supervisor do operador do SAC em determinadas ocorrencias. SS.: 15255 }
      if isEncaminharCopiaParaSupervisor then
        addEmail(i,cdsItemOcorrencia.FieldByName('dsEmailSupervisor').AsString);
    end;

    if cdsItemOcorrencia.FieldByName('dsEmailRepresentante').AsString <> EmptyStr then
    begin
      inc(i);
      addEmail(i,cdsItemOcorrencia.FieldByName('dsEmailRepresentante').AsString);
    end;

    if cdsItemOcorrencia.FieldByName('dsEmailCoordenador').AsString <> EmptyStr then
    begin
      inc(i);
      addEmail(i,cdsItemOcorrencia.FieldByName('dsEmailCoordenador').AsString);
    end;

    if cdsItemOcorrencia.FieldByName('dsEmailCopia').AsString <> EmptyStr then
    begin
      inc(i);
      addEmail(i,cdsItemOcorrencia.FieldByName('dsEmailCopia').AsString);
    end;

    if cdsItemOcorrencia.FieldByName('dsEmailCopiaExtra').AsString <> EmptyStr then
    begin
      inc(i);
      addEmail(i,cdsItemOcorrencia.FieldByName('dsEmailCopiaExtra').AsString);
    end;

  end;
end;

procedure TDM.enviarEmailOcorrencia(isEnviarItemAtual,isOcorrenciaIntegral:Boolean; dsDestManual:string);
  procedure carregarDadosDaMensagem(indice:integer);
  begin
    dadosMensagem[indice].dsTipoOcorrencia    :=cdsItemOcorrencia.FieldByName('dsTipoOcorrencia').AsString;
    dadosMensagem[indice].dsSubTipoOcorrencia :=cdsItemOcorrencia.FieldByName('dsSubTipoOcorrencia').AsString;
    dadosMensagem[indice].dsSolucionador      :=cdsItemOcorrencia.FieldByName('nomeSolucionador').AsString;
    dadosMensagem[indice].dsProduto           :=format('%s/%s - %s (%d unidades)',[cdsItemOcorrencia.FieldByName('cdProduto').AsString,cdsItemOcorrencia.FieldByName('digitoProduto').AsString,cdsItemOcorrencia.FieldByName('dsProduto').AsString,cdsItemOcorrencia.FieldByName('quantProduto').AsInteger]);
    dadosMensagem[indice].nrNFe               :=cdsItemOcorrencia.FieldByName('nrNFe').AsString;
    dadosMensagem[indice].dataEmissaoNFe      :=FormatDateTime('DD/MM/YYYY',cdsItemOcorrencia.FieldByName('dataEmissao').AsDateTime);
    dadosMensagem[indice].dsObservacao        :=cdsItemOcorrencia.FieldByName('descricaoOcorrencia').AsString;
    dadosMensagem[indice].isEnviarMensagemRecolhimentoMercadoria :=cdsItemOcorrencia.FieldByName('idRecolherMercadoria').AsBoolean;
    dadosMensagem[indice].isEnviarMensagemForaPrazoRegistro      :=cdsItemOcorrencia.FieldByName('IdAlertarRegistroForaPrazo').AsBoolean;
    dadosMensagem[indice].isEnviarMensagemProdutoTermolabil      :=cdsItemOcorrencia.FieldByName('idAlertarProdutoTermolabil').AsBoolean;
  end;
var
  sendEmail: TDadosEmail;
  i: integer;
begin
  sendEmail:=TDadosEmail.create(dadosEmail.servidorMsgExterna,dadosEmail.conta,dadosEmail.senha,dadosEmail.email);
  try
    i:=0;
    if isOcorrenciaIntegral then
      SetLength(dadosMensagem,cdsItemOcorrencia.RecordCount)
    else
      SetLength(dadosMensagem,1);

    if not isEnviarItemAtual then
    begin
      cdsItemOcorrencia.First;
      while not cdsItemOcorrencia.Eof do
      begin
        if isOcorrenciaIntegral then
        begin
          { grava os endereços de email }
          gravarDestinatarioMensagem(dsDestManual,i);

          { dados da ocorrencia na mensagem }
          carregarDadosDaMensagem(i);

          inc(i);
        end
        else
        begin
          if cdsItemOcorrenciacdTipoOcorrencia.AsInteger <> CD_TIPO_OCORRENCIA_PESQUISA then
          begin
            { grava os endereços de email }
            gravarDestinatarioMensagem(dsDestManual,i);

            { dados da ocorrencia na mensagem }
            carregarDadosDaMensagem(i);

            { enviar email }
            sendEmail.enviarEmailOcorrencia(dadosMensagem);
          end;
        end;

        cdsItemOcorrencia.Next;
      end;

     { enviar email }
     if isOcorrenciaIntegral then
       sendEmail.enviarEmailOcorrencia(dadosMensagem);

    end
    else
    begin
      { grava os endereços de email }
      gravarDestinatarioMensagem(dsDestManual,i);

      { dados da ocorrencia na mensagem }
      carregarDadosDaMensagem(i);

      { enviar email }
      sendEmail.enviarEmailOcorrencia(dadosMensagem);
    end;
  finally
    sendEmail.free;
  end;
end;

procedure TDM.enviarEmailDeCancelamentoOcorrencia;
var
  sendEmail: TDadosEmail;
begin
  sendEmail:=TDadosEmail.create(dadosEmail.servidorMsgInterna,dadosEmail.conta,dadosEmail.senha,dadosEmail.email);
  SetLength(dadosMensagem,1);
  try
    cdsItemOcorrencia.First;
    while not cdsItemOcorrencia.Eof do
    begin
      { grava os endereços de email }
      gravarDestinatarioMensagem('',0);

      { enviar email }
      sendEmail.enviarEmailCancelamentoOcorrencia(dadosMensagem[0]);

      cdsItemOcorrencia.Next;
    end;
  finally
    sendEmail.free;
  end;
end;

procedure TDM.enviarEmailRecorrencia;
var
  sendEmail: TDadosEmail;
begin
  sendEmail:=TDadosEmail.create(dadosEmail.servidorMsgInterna,dadosEmail.conta,dadosEmail.senha,dadosEmail.email);
  SetLength(dadosMensagem,1);
  try
    if recorrencia.isRegistrarPendentes then
    begin
      cdsItemOcorrencia.First;
      while not cdsItemOcorrencia.Eof do
      begin
        if cdsItemOcorrenciacdStatusSolucao.AsInteger = 1 then
        begin
          { grava os endereços de email }
          gravarDestinatarioMensagem('',0);

          { enviar email }
          sendEmail.enviarEmailRecorrencia(dadosMensagem[0]);
        end;
        cdsItemOcorrencia.Next;
      end;
    end
    else
    begin
      { grava os endereços de email }
      gravarDestinatarioMensagem('',0);
      { enviar email }
      sendEmail.enviarEmailRecorrencia(dadosMensagem[0]);
    end;
  finally
    sendEmail.free;
  end;
end;

procedure TDM.gravarNovaOcorrencia;
var
  lTD : TDBXTransaction;
  isSolucaoPadrao: Boolean;
  isCausaPadrao: Boolean;
begin
  try
    try
      { iniciar transsação }
      lTD := conexaoProducao.BeginTransaction;

      // gravar capa da ocorrencia
      execGravarOcorrencia;

      // gravar item da ocorrencia
      cdsItemOcorrencia.First;
      while not cdsItemOcorrencia.Eof do
      begin
        execGravarItemOcorrencia;

        // gravar solução/Causa padrão
        isSolucaoPadrao:=False;
        isCausaPadrao:=False;
        if cdsItemOcorrencia.FieldByName('cdStatusSolucao').AsInteger = CD_SOLUCAO_FINALIZADA_ITEM then
        begin
          isSolucaoPadrao:=true;
          if cdsItemOcorrencia.FieldByName('cdStatusCausa').AsInteger = CD_CAUSA_FINALIZADA_ITEM then
            isCausaPadrao:=True;

          gravarSolucaoItemOcorrencia(isSolucaoPadrao,isCausaPadrao);
        end;

        cdsItemOcorrencia.Next;
      end;

      //raise Exception.Create('Parada forçada no sistema.');

      // Gravar Telefone de contato no SAC
      if cliente.isGravarTelefoneCliente then
        insertTelefoneCliente(ID_TELEFONE_CLIENTE_SAC,'',cliente);

      // Atualizar Telefone de contato no SAC
      if cliente.isAtualizarTelefoneCliente then
        alterarTelefoneCliente(cliente);

      // Gravar Email de contato no SAC
      if cliente.isGravarEmailCliente then
        insertEmailContatoSacCliente(cliente);

      // Atualizar Email de contato no SAC
      if cliente.isAtualizarEmailCliente then
        alterarEmailSacCliente(cliente);

      { Se terminar normalmente executa commit }
      conexaoProducao.CommitFreeAndNil(lTD);

    except
      on E:Exception do
      begin
        { Se der problema executa roolback em todos os processos }
        conexaoProducao.RollbackFreeAndNil(lTD);
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TDM.execConsultaSolucaoItem;
var
  sqlDados: TSimpleDataSet;
  sqlTxt: TStringList;

  procedure gravarSolucaoItemLocal;
  begin
    if not cdsSolucaoItem.Active then
      cdsSolucaoItem.Open;
    cdsSolucaoItem.Append;
    cdsSolucaoItem.FieldByName('cdOcorrencia').AsInteger:=sqlDados.FieldByName('CD_OCORRENCIA').AsInteger;
    cdsSolucaoItem.FieldByName('cdItemOcorrencia').AsInteger:=sqlDados.FieldByName('CD_ITEM_OCORRENCIA').AsInteger;
    cdsSolucaoItem.FieldByName('cdSubTipoCausa').AsInteger:=sqlDados.FieldByName('CD_SUBTIPO_CAUSA').AsInteger;
    cdsSolucaoItem.FieldByName('dsSubTipoCausaItemOcorrencia').AsString:=sqlDados.FieldByName('DS_CAUSA').AsString;
    cdsSolucaoItem.FieldByName('cdSubTipoSolucao').AsInteger:=sqlDados.FieldByName('CD_SUBTIPO_SOLUCAO').AsInteger;
    cdsSolucaoItem.FieldByName('dsSubTipoSolucaoItemOcorrencia').AsString:=sqlDados.FieldByName('DS_SOLUCAO').AsString;
    cdsSolucaoItem.FieldByName('dsSolucaoItemOcorrencia').AsString:=sqlDados.FieldByName('DS_SOLUCAO_ITEM_OCORRENCIA').AsString;
    cdsSolucaoItem.FieldByName('idFilamgem').AsBoolean:=stringToBoolean(sqlDados.FieldByName('ID_FILMAGEM_ITEM_OCORRENCIA').AsString);
    cdsSolucaoItem.FieldByName('idImagemVisivel').AsBoolean:=stringToBoolean(sqlDados.FieldByName('ID_VISIVEL_ITEM_OCORRENCIA').AsString);
    cdsSolucaoItem.FieldByName('nrCamera').AsInteger:=sqlDados.FieldByName('NR_CAMERA').AsInteger;
    cdsSolucaoItem.FieldByName('idContagemEstoque').AsBoolean:=stringToBoolean(sqlDados.FieldByName('ID_CONTA_ESTOQUE').AsString);
    cdsSolucaoItem.FieldByName('cdSituacaoEstoque').Asinteger:=sqlDados.FieldByName('ID_RESULTADO_ESTOQUE').AsInteger;
    cdsSolucaoItem.FieldByName('dsSituacaoEstoque').AsString:=getDescricaoSituacaoEstoque(sqlDados.FieldByName('ID_RESULTADO_ESTOQUE').AsInteger);
    cdsSolucaoItem.FieldByName('cdConferente').AsInteger:=sqlDados.FieldByName('CD_CONFERENTE').AsInteger;
    if sqlDados.FieldByName('CD_CONFERENTE').AsInteger > 0 then
      cdsSolucaoItem.FieldByName('nomeConferente').AsString:=sqlDados.FieldByName('NM_USUARIO').AsString;
    cdsSolucaoItem.FieldByName('idEscutaGravacaoTlv').AsBoolean:=stringToBoolean(sqlDados.FieldByName('ID_GRAVACAO_TLV').AsString);
    cdsSolucaoItem.FieldByName('dataRegistroSolucao').AsDateTime:=sqlDados.FieldByName('DT_SOLUCAO_ITEM_OCORRENCIA').AsDateTime;
    cdsSolucaoItem.FieldByName('idResultadoGravacaoTlv').AsBoolean:=stringToBoolean(sqlDados.FieldByName('ID_RESULTADO_GRAVACAO_TLV').AsString);
    cdsSolucaoItem.FieldByName('dsTranspRespSolucao').AsString:=sqlDados.FieldByName('DS_TRANSP_RESP_SOLUCAO').AsString;
    cdsSolucaoItem.FieldByName('cdSituacaoEmbalagem').AsInteger:=sqlDados.FieldByName('CD_SITUACAO_EMBALAGEM').AsInteger;
    cdsSolucaoItem.FieldByName('dsSituacaoEmbalagem').AsString:=sqlDados.FieldByName('DS_SITUACAO_EMBALAGEM').AsString;
    cdsSolucaoItem.FieldByName('dataRegistroCausa').AsDateTime:=sqlDados.FieldByName('DT_CAUSA_ITEM_OCORRENCIA').AsDateTime;
    cdsSolucaoItem.FieldByName('dsTranspRespCausa').AsString:=sqlDados.FieldByName('DS_TRANSP_RESP_CAUSA').AsString;
    cdsSolucaoItem.FieldByName('dsCausaItem').AsString:=sqlDados.FieldByName('DS_CAUSA_ITEM_OCORRENCIA').AsString;
    cdsSolucaoItem.FieldByName('dsAcaoCausa').AsString:=sqlDados.FieldByName('DS_ACAO_CAUSA').AsString;
    cdsSolucaoItem.FieldByName('idRecolheMercadoria').AsString:=sqlDados.FieldByName('ID_RECOLHE_MERCADORIA').AsString;
    cdsSolucaoItem.Post;
  end;

  procedure inicializarDadosSolucaoItem;
  begin
    if not cdsSolucaoItem.Active then
      cdsSolucaoItem.Open;
    cdsSolucaoItem.Append;
    cdsSolucaoItem.FieldByName('cdOcorrencia').AsInteger:=sqlDados.FieldByName('CD_OCORRENCIA').AsInteger;
    cdsSolucaoItem.FieldByName('cdItemOcorrencia').AsInteger:=sqlDados.FieldByName('CD_ITEM_OCORRENCIA').AsInteger;
    cdsSolucaoItem.FieldByName('idFilamgem').AsBoolean:=False;
    cdsSolucaoItem.FieldByName('idImagemVisivel').AsBoolean:=False;
    cdsSolucaoItem.FieldByName('idContagemEstoque').AsBoolean:=False;
    cdsSolucaoItem.FieldByName('idEscutaGravacaoTlv').AsBoolean:=False;
    cdsSolucaoItem.FieldByName('idResultadoGravacaoTlv').AsBoolean:=False;
    cdsSolucaoItem.FieldByName('idRecolheMercadoria').AsString:='INDETERMINADO';
    cdsSolucaoItem.Post;
  end;
begin
  sqlDados:=TSimpleDataSet.Create(nil);
  sqlDados.Connection:=conexaoProducao;

  sqlTxt:=TStringList.Create;
  sqlTxt.Clear;
  try
    sqlTxt.Add('SELECT SOL_ITEM.CD_OCORRENCIA, SOL_ITEM.CD_ITEM_OCORRENCIA,');
    sqlTxt.Add(' SOL_ITEM.CD_SUBTIPO_CAUSA, NVL(CAUSA.DS_CAUSA,''NAO LOCALIZADA'')DS_CAUSA,');
    sqlTxt.Add(' SOL_ITEM.CD_SUBTIPO_SOLUCAO, NVL(SOLUCAO.DS_SOLUCAO,''NAO LOCALIZADA'') DS_SOLUCAO,');
    sqlTxt.Add(' SOL_ITEM.DS_SOLUCAO_ITEM_OCORRENCIA,');
    sqlTxt.Add(' SOL_ITEM.ID_FILMAGEM_ITEM_OCORRENCIA, SOL_ITEM.ID_VISIVEL_ITEM_OCORRENCIA,');
    sqlTxt.Add(' SOL_ITEM.NR_CAMERA, SOL_ITEM.CD_CONFERENTE, NVL(USUARIO.NM_USUARIO,'' '') NM_USUARIO, ');
    sqlTxt.Add(' SOL_ITEM.ID_CONTA_ESTOQUE, SOL_ITEM.ID_RESULTADO_ESTOQUE,');
    sqlTxt.Add(' SOL_ITEM.ID_GRAVACAO_TLV, SOL_ITEM.DT_SOLUCAO_ITEM_OCORRENCIA,');
    sqlTxt.Add(' SOL_ITEM.ID_RESULTADO_GRAVACAO_TLV, '' '' DS_TRANSP_RESP_SOLUCAO,');
    sqlTxt.Add(' SOL_ITEM.CD_SITUACAO_EMBALAGEM, EMBALAGEM.DS_SITUACAO_EMBALAGEM, SOL_ITEM.DS_CAUSA_ITEM_OCORRENCIA,');
    sqlTxt.Add(' SOL_ITEM.DT_CAUSA_ITEM_OCORRENCIA, '' '' DS_TRANSP_RESP_CAUSA,');
    sqlTxt.Add(' SOL_ITEM.DS_ACAO_CAUSA, decode(SOL_ITEM.ID_RECOLHE_MERCADORIA,''N'',''NAO'',''S'',''SIM'',''INDETERMINADO'') ID_RECOLHE_MERCADORIA ');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_SOLUCAO_ITEM_OCORRENCIA SOL_ITEM');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_SUBTIPO_SOLUCAO SUBT_SOLUCAO ON SOL_ITEM.CD_SUBTIPO_SOLUCAO = SUBT_SOLUCAO.CD_SUBTIPO_SOLUCAO ');
    sqlTxt.Add(' JOIN GAMSAC.DC_SAC_SOLUCAO SOLUCAO ON SUBT_SOLUCAO.CD_SOLUCAO = SOLUCAO.CD_SOLUCAO ');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_SUBTIPO_CAUSA SUBT_CAUSA ON SOL_ITEM.CD_SUBTIPO_CAUSA = SUBT_CAUSA.CD_SUBTIPO_CAUSA ');
    sqlTxt.Add(' JOIN GAMSAC.DC_SAC_CAUSA CAUSA ON SUBT_CAUSA.CD_CAUSA = CAUSA.CD_CAUSA ');
    sqlTxt.Add(' JOIN GAMSAC.DC_SAC_SITUACAO_EMBALAGEM EMBALAGEM ON SOL_ITEM.CD_SITUACAO_EMBALAGEM = EMBALAGEM.CD_SITUACAO_EMBALAGEM ');
    sqlTxt.Add(' LEFT OUTER JOIN ACESSO.DC_USUARIO USUARIO ON SOL_ITEM.CD_CONFERENTE = USUARIO.NR_MATRICULA ');
    sqlTxt.Add('WHERE CD_OCORRENCIA = :NR_OCORRENCIA ');
    sqlTxt.Add(' AND CD_ITEM_OCORRENCIA = :NR_ITEM');
    sqlDados.Close;
    sqlDados.DataSet.CommandText:=sqlTxt.Text;
    sqlDados.DataSet.ParamByName('NR_OCORRENCIA').AsString:=IntToStr(ocorrencia.cdOcorrencia);
    sqlDados.DataSet.ParamByName('NR_ITEM').AsString:=inttostr(ocorrencia.item.nrSequencia);
    sqlDados.Open;

    if not sqlDados.IsEmpty then
      gravarSolucaoItemLocal
    else
      inicializarDadosSolucaoItem;
  finally
    sqlTxt.Free;
    sqlDados.Close;
    sqlDados.Free;
  end;
end;

procedure TDM.execConsultaOcorrencia(dadosConsulta:TConsultaOcorrencia ;isSomenteMesAtual:Boolean);
var
  sqlTxt: TStringList;
begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT OCORRENCIA.CD_OCORRENCIA PROTOCOLO, CLIENTE.NROC_C||CLIENTE.DIGC_C CODIGO,');
	  sqlTxt.Add(' CLIENTE.NROV_C SETOR, PESSOA.NOMP_P RAZAO_SOCIAL, ENDERECO.NM_CIDADE CIDADE,ENDERECO.NM_BAIRRO,');
    sqlTxt.Add(' ENDERECO.ID_ESTADO UF, OCORRENCIA.DT_RE_OCORRENCIA DATA_REGISTRO,');
    sqlTxt.Add(' OCORRENCIA.DT_LI_OCORRENCIA DATA_LIMITE,ST_SOLUCAO.NM_ST_OCORRENCIA SOLUCAO,');
    sqlTxt.Add(' ST_CAUSA.NM_ST_OCORRENCIA CAUSA, OCORRENCIA.CD_CLIENTE,');
    sqlTxt.Add(' OCORRENCIA.CD_EMPRESA EMPRESA, OCORRENCIA.CD_USUARIO USUARIO,');
    sqlTxt.Add(' OCORRENCIA.DS_OCORRENCIA OBSERVACAO, OCORRENCIA.CD_PR_OCORRENCIA PRIORIDADE,');
  	sqlTxt.Add(' OCORRENCIA.CD_ST_SOLUCAO_OCORRENCIA ST_SOLUCAO, OCORRENCIA.CD_ST_CAUSA_OCORRENCIA ST_CAUSA,');
  	sqlTxt.Add(' OCORRENCIA.DS_CONTATO CONTATO,OCORRENCIA.DS_EMAIL_CLIENTE, CLIENTE.CD_ENTREGA_CAMINHAO_SECUNDARIO, ENTREGA.CD_TRANSPORTADOR, ');
    sqlTxt.Add(' ENDERECO.DS_LOGRADOURO,ENDERECO.NR_LOGRADOURO, ID_SITUACAO_ORDEM_COLETA, DT_EMISSAO_ORDEM_COLETA, CD_DESTINO_EMAIL_ORDEM_COLETA, ');
    sqlTxt.Add(' OCORRENCIA.NM_ARQUIVO_ANEXO');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_OCORRENCIA OCORRENCIA');
    sqlTxt.Add('JOIN PRDDM.DCCLI CLIENTE ON OCORRENCIA.CD_CLIENTE = CLIENTE.NROC_C');
    sqlTxt.Add('JOIN PRDDM.DC_ENDERECO_CLIENTE ENDERECO ON CLIENTE.NROC_C = ENDERECO.CD_CLIENTE');
    sqlTxt.Add('JOIN PRDDM.DCPES PESSOA ON CLIENTE.CGCP_C = PESSOA.CGCP_P');
    sqlTxt.Add('JOIN GAMSAC.DC_SAC_ST_OCORRENCIA ST_SOLUCAO ON OCORRENCIA.CD_ST_SOLUCAO_OCORRENCIA = ST_SOLUCAO.CD_ST_OCORRENCIA');
    sqlTxt.Add('JOIN GAMSAC.DC_SAC_ST_OCORRENCIA ST_CAUSA ON OCORRENCIA.CD_ST_CAUSA_OCORRENCIA = ST_CAUSA.CD_ST_OCORRENCIA');
    if dadosConsulta.nrNFe > 0 then
      sqlTxt.Add('JOIN GAMSAC.DC_SAC_ITEM_OCORRENCIA ITEM ON OCORRENCIA.CD_OCORRENCIA = ITEM.CD_OCORRENCIA');
    sqlTxt.Add('JOIN GAMFRETE.DC_ENTREGA ENTREGA ON CLIENTE.CD_ENTREGA_CAMINHAO_SECUNDARIO = ENTREGA.CD_ENTREGA ');
    sqlTxt.Add('WHERE OCORRENCIA.CD_OCORRENCIA > 0');

   if dadosConsulta.cdCliente > 0 then
    begin
      sqlTxt.Add('AND OCORRENCIA.CD_CLIENTE = :COD_CLIENTE');
      sqlTxt.Add('AND CLIENTE.DIGC_C = :DIGITO');
    end;

    if dadosConsulta.cdOcorrencia > 0 then
      sqlTxt.Add('AND OCORRENCIA.CD_OCORRENCIA = :NR_OCORRENCIA');

    if dadosConsulta.nrNFe > 0 then
      sqlTxt.Add('AND ITEM.NR_NFE_ITEM_OCORRENCIA = :NR_NFE');

    if dadosConsulta.cdSetor > 0 then
      sqlTxt.Add('AND CLIENTE.NROV_C = :SETOR');

    if dadosConsulta.cdStatusSolucao > 0 then
      sqlTxt.Add('AND OCORRENCIA.CD_ST_SOLUCAO_OCORRENCIA = :ST_SOLUCAO');

    if dadosConsulta.cdStatusCausa > 0 then
      sqlTxt.Add('AND OCORRENCIA.CD_ST_CAUSA_OCORRENCIA = :ST_CAUSA');

    if dadosConsulta.dsDataRegistro <> EmptyStr then
      sqlTxt.Add('AND TRUNC(OCORRENCIA.DT_RE_OCORRENCIA) = :DT_REGISTRO');

    if isSomenteMesAtual then
      sqlTxt.Add('AND TRUNC(OCORRENCIA.DT_RE_OCORRENCIA) >= :DT_INICIAL');

    { ordenação dos dados }
    sqlTxt.Add('ORDER BY OCORRENCIA.CD_OCORRENCIA');

    try
      sqlConsultaOcorrencia.Close;
      sqlConsultaOcorrencia.DataSet.CommandText:=sqlTxt.Text;
      if dadosConsulta.cdCliente > 0 then
      begin
        sqlConsultaOcorrencia.DataSet.ParamByName('COD_CLIENTE').AsInteger:=getCodigoSemDigitoVerificador(dadosConsulta.cdCliente);
        sqlConsultaOcorrencia.DataSet.ParamByName('DIGITO').AsInteger:=getDigitoVerificador(dadosConsulta.cdCliente);
      end;

      if dadosConsulta.cdOcorrencia > 0 then
        sqlConsultaOcorrencia.DataSet.ParamByName('NR_OCORRENCIA').AsInteger:=dadosConsulta.cdOcorrencia;

      if dadosConsulta.nrNFe > 0 then
        sqlConsultaOcorrencia.DataSet.ParamByName('NR_NFE').AsInteger:=dadosConsulta.nrNFe;

      if dadosConsulta.cdSetor > 0 then
        sqlConsultaOcorrencia.DataSet.ParamByName('SETOR').AsInteger:=dadosConsulta.cdSetor;

      if dadosConsulta.cdStatusSolucao > 0 then
        sqlConsultaOcorrencia.DataSet.ParamByName('ST_SOLUCAO').AsInteger:=dadosConsulta.cdStatusSolucao;

      if dadosConsulta.cdStatusCausa > 0 then
        sqlConsultaOcorrencia.DataSet.ParamByName('ST_CAUSA').AsInteger:=dadosConsulta.cdStatusCausa;

      if dadosConsulta.dsDataRegistro <> EmptyStr then
        sqlConsultaOcorrencia.DataSet.ParamByName('DT_REGISTRO').AsString:=dadosConsulta.dsDataRegistro;

      if isSomenteMesAtual then
        sqlConsultaOcorrencia.DataSet.ParamByName('DT_INICIAL').AsString:=FormatDateTime('dd/mm/yyyy',getDataInicioMes(dadosEmpresa.dataSistema));

      sqlConsultaOcorrencia.Open;
    except
      on E:Exception  do
        raise Exception.CreateFmt('Erro ao consultar Ocorrência, Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
  end;
end;

procedure TDM.execConsultaOcorrenciaComPrazoExpirado;
var
  sqlTxt: TStringList;
begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT OCORRENCIA.CD_OCORRENCIA PROTOCOLO, CLIENTE.NROC_C||CLIENTE.DIGC_C CODIGO,  CLIENTE.NROV_C SETOR, PESSOA.NOMP_P RAZAO_SOCIAL,');
	  sqlTxt.Add(' OCORRENCIA.DT_RE_OCORRENCIA DATA_REGISTRO,  OCORRENCIA.DT_LI_OCORRENCIA DATA_LIMITE,  OCORRENCIA.CD_EMPRESA EMPRESA,');
    sqlTxt.Add(' OCORRENCIA.CD_PR_OCORRENCIA PRIORIDADE,ITEM.NR_MATRIC_SOLUCIONADOR,SOLUC.DS_EMAIL');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_OCORRENCIA OCORRENCIA');
    sqlTxt.Add(' JOIN PRDDM.DCCLI CLIENTE ON OCORRENCIA.CD_CLIENTE = CLIENTE.NROC_C');
    sqlTxt.Add(' JOIN PRDDM.DCPES PESSOA ON CLIENTE.CGCP_C = PESSOA.CGCP_P');
    sqlTxt.Add(' JOIN GAMSAC.DC_SAC_ITEM_OCORRENCIA ITEM ON OCORRENCIA.CD_OCORRENCIA = ITEM.CD_OCORRENCIA');
    sqlTxt.Add(' JOIN ACESSO.DC_EMPRESA EMP ON OCORRENCIA.CD_EMPRESA = EMP.CD_EMPRESA');
    sqlTxt.Add(' JOIN GAMSAC.DC_SAC_SOLUCIONADOR SOLUC ON ITEM.NR_MATRIC_SOLUCIONADOR = SOLUC.NR_MATRIC_SOLUCIONADOR');
    sqlTxt.Add('WHERE OCORRENCIA.CD_OCORRENCIA > 0');
    sqlTxt.Add(' AND OCORRENCIA.DT_RE_OCORRENCIA >= TO_DATE('+QuotedStr(DATA_INICIO_ENVIO_EMAIL_AUTOMATICO)+')' );
    sqlTxt.Add(' AND OCORRENCIA.CD_ST_SOLUCAO_OCORRENCIA = 1');
    sqlTxt.Add(' AND trunc(ITEM.DT_LIMITE_SOLUCAO) < trunc(EMP.DT_PEDIDO)');
    //sqlTxt.Add(' AND ITEM.NR_MATRIC_SOLUCIONADOR = 300307 ');
    //sqlTxt.Add(' AND ITEM.CD_OCORRENCIA = 109520 ');
    sqlTxt.Add('ORDER BY OCORRENCIA.CD_OCORRENCIA');
    sqlTxt.SaveToFile('sqlConsultaOcorrenciaPrazoExpirado.sql');

    try
      sqlConsultaOcorrenciaPrazoExpirado.Close;
      sqlConsultaOcorrenciaPrazoExpirado.DataSet.CommandText:=sqlTxt.Text;
      sqlConsultaOcorrenciaPrazoExpirado.Open;
    except
      on E:Exception  do
        raise Exception.CreateFmt('Erro ao consultar Ocorrência Fora do Prazo. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
  end;
end;

procedure TDM.execConsultaRecorrenciaItem;
var
  sqlDados: TSimpleDataSet;
  sqlTxt: TStringList;

  procedure gravarRecorrencia;
  begin
    if not cdsRecorrenciaItem.Active then
      cdsRecorrenciaItem.Open;
    cdsRecorrenciaItem.Append;
    cdsRecorrenciaItemCD_RECORRENCIA.AsInteger:=sqlDados.FieldByName('CD_RECORRENCIA').AsInteger;
    cdsRecorrenciaItemCD_ITEM_OCORRENCIA.AsInteger:=cdsItemOcorrencianrSequencia.AsInteger;
    cdsRecorrenciaItemDS_RECORRENCIA.AsString:=sqlDados.FieldByName('DS_RECORRENCIA').AsString;
    cdsRecorrenciaItemDT_RECORRENCIA.AsDateTime:=sqlDados.FieldByName('DT_RECORRENCIA').AsDateTime;
    case sqlDados.FieldByName('ID_TIPO_RECORRENCIA').AsString[1] of
      'I' : cdsRecorrenciaItemDS_TIPO_RECORRENCIA.AsString:='INTERNO';
      'E' : cdsRecorrenciaItemDS_TIPO_RECORRENCIA.AsString:='EXTERNO';
    end;
    cdsRecorrenciaItem.Post;
  end;

begin
  sqlDados:=TSimpleDataSet.Create(nil);
  sqlDados.Connection:=conexaoProducao;

  sqlTxt:=TStringList.Create;
  sqlTxt.Clear;
  try
    sqlTxt.Add('SELECT CD_RECORRENCIA,DS_RECORRENCIA,ID_TIPO_RECORRENCIA,DT_RECORRENCIA ');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_RECORRENCIA ');
    sqlTxt.Add('WHERE CD_OCORRENCIA = :CD_OCORRENCIA ');
    sqlTxt.Add('AND CD_ITEM_OCORRENCIA = :CD_ITEM');
    sqlTxt.Add('ORDER BY CD_RECORRENCIA');
    sqlDados.Close;
    sqlDados.DataSet.CommandText:=sqlTxt.Text;
    sqlDados.DataSet.ParamByName('CD_OCORRENCIA').AsInteger:=cdsOcorrenciacdOcorrencia.AsInteger;
    sqlDados.DataSet.ParamByName('CD_ITEM').AsInteger:=cdsItemOcorrencianrSequencia.AsInteger;
    sqlDados.Open;

    if not sqlDados.IsEmpty then
    begin
     if cdsRecorrenciaItem.Active then
       cdsRecorrenciaItem.EmptyDataSet;

      while not sqlDados.Eof do
      begin
        gravarRecorrencia;
        sqlDados.Next;
      end;
    end;
  finally
    sqlTxt.Free;
    sqlDados.Close;
    sqlDados.Free;
  end;
end;

procedure TDM.execConsultarProcessamentoDeDevolucaoDoItem;
var
  sqlDados: TSimpleDataSet;
  sqlTxt: TStringList;

  procedure AtualizarAvisoDeDevolucao;
  begin
    if not cdsOcorrencia.Active then
      cdsOcorrencia.Open;

    cdsOcorrencia.Edit;
    cdsOcorrenciaidMostrarAvisoDevolucao.AsBoolean:=True;
    cdsOcorrencia.Post;
  end;

  procedure gravarDadosDaDevolucao;
  begin
    if not cdsItemOcorrencia.Active then
      cdsItemOcorrencia.Open;
    cdsItemOcorrencia.Edit;
    cdsItemOcorrencianrOrdemDevolucao.AsInteger:=sqlDados.FieldByName('ORDEM').AsInteger;
    cdsItemOcorrenciadsDetalheDevolucao.AsString:=trim(sqlDados.FieldByName('DS_DETALHE').AsString);
    cdsItemOcorrenciadsSituacaoDevolucao.AsString:=sqlDados.FieldByName('SITUACAO').AsString;
    cdsItemOcorrencia.Post;

    AtualizarAvisoDeDevolucao;
  end;

begin
  sqlDados:=TSimpleDataSet.Create(nil);
  sqlDados.Connection:=conexaoProducao;

  sqlTxt:=TStringList.Create;
  sqlTxt.Clear;
  try
    sqlTxt.Add('SELECT NROO_Y ORDEM, D.DS_DETALHE, ');
    sqlTxt.Add('  DECODE(STAO_O,''T'',''DIGITADO - WEB DEVOLUCAO'',''N'',''DIGITADO - GAM'',''A'',''AGUARDANDO FATURAMENTO'',''F'',''FATURADA'',STAO_O) SITUACAO ');
    sqlTxt.Add('FROM PRDDM.DCPDI I,PRDDM.DCPDC P, PRDDM.DC_DEV_DETALHE D, PRDDM.DC_DEV_ORIGEM O, PRDDM.DC_DEV_MOTIVO M ');
    sqlTxt.Add('WHERE NROO_O = NROO_Y ');
    sqlTxt.Add(' AND P.NR_NFE = I.NR_NFE ');
    sqlTxt.Add(' AND P.NR_NFE_SERIE = I.NR_NFE_SERIE ');
    sqlTxt.Add(' AND P.ID_EMPRESA = I.ID_EMPRESA ');
    sqlTxt.Add(' AND I.CD_MOTIVO_DEVOLUCAO = D.CD_DETALHE ');
    sqlTxt.Add(' AND D.CD_ORIGEM = M.CD_ORIGEM ');
    sqlTxt.Add(' AND D.CD_ORIGEM = O.CD_ORIGEM ');
    sqlTxt.Add(' AND M.CD_ORIGEM = O.CD_ORIGEM ');
    sqlTxt.Add(' AND M.CD_MOTIVO = D.CD_MOTIVO ');
    sqlTxt.Add(' AND p.id_empresa = :CD_EMPRESA ');
    sqlTxt.Add(' AND P.nr_nfe = :NR_NFE ');
    sqlTxt.Add(' AND P.nr_nfe_serie = :NR_SERIE ');
    if cdsItemOcorrenciacdProduto.AsInteger > 0 then
      sqlTxt.Add(' AND I.NROM_Y = :CD_MERCADORIA ');
    sqlTxt.SaveToFile('ConsultaDevolucao.sql');

    sqlDados.Close;
    sqlDados.DataSet.CommandText:=sqlTxt.Text;
    sqlDados.DataSet.ParamByName('CD_EMPRESA').AsInteger:=cdsItemOcorrenciaidEmpresaNFe.AsInteger;
    sqlDados.DataSet.ParamByName('NR_NFE').AsInteger:=cdsItemOcorrencianrNFe.AsInteger;
    sqlDados.DataSet.ParamByName('NR_SERIE').AsInteger:=cdsItemOcorrencianrSerieNFe.AsInteger;
    if cdsItemOcorrenciacdProduto.AsInteger > 0 then
      sqlDados.DataSet.ParamByName('CD_MERCADORIA').AsInteger:=cdsItemOcorrenciacdProduto.AsInteger;
    sqlDados.Open;

    if not sqlDados.IsEmpty then
      gravarDadosDaDevolucao;

  finally
    sqlTxt.Free;
    sqlDados.Close;
    sqlDados.Free;
  end;
end;

procedure TDM.execConsultarItemOcorrencia;
var
  sqlDados: TSimpleDataSet;
  sqlTxt: TStringList;

  procedure carregarItens;
  begin
    ocorrencia.item.limparDados;
    ocorrencia.item.nrSequencia:=sqlDados.FieldByName('nrSequencia').AsInteger;
    ocorrencia.item.cdEmpresa:=sqlDados.FieldByName('cdEmpresa').AsInteger;
    ocorrencia.item.idEmpresaNFe:=sqlDados.FieldByName('idEmpresaNFe').AsInteger;
    ocorrencia.item.nrNFe:=sqlDados.FieldByName('nrNFe').AsInteger;
    ocorrencia.item.nrSerieNFe:=sqlDados.FieldByName('nrSerieNFe').AsInteger;
    ocorrencia.item.dataEmissao:=sqlDados.FieldByName('dataEmissao').AsDateTime;
    ocorrencia.item.cdOrigemPedido:=sqlDados.FieldByName('cdOrigemPedido').AsInteger;
    ocorrencia.item.dsOrigemPedido:=sqlDados.FieldByName('Origem').AsString;
    ocorrencia.item.cdProduto:=sqlDados.FieldByName('cdProduto').AsInteger;
    ocorrencia.item.digitoProduto:=sqlDados.FieldByName('digProduto').AsInteger;
    ocorrencia.item.dsProduto:=sqlDados.FieldByName('dsProduto').AsString;
    ocorrencia.item.quantProduto:=sqlDados.FieldByName('quantProduto').AsInteger;
    ocorrencia.item.cdTipoProduto:=sqlDados.FieldByName('cdTipoProduto').AsInteger;
    ocorrencia.item.dsLote:=sqlDados.FieldByName('loteProduto').AsString;
    ocorrencia.item.dataValidadeProduto:=sqlDados.FieldByName('dataValidadeProduto').AsDateTime;
    ocorrencia.item.periodoValidade:=sqlDados.FieldByName('prazoValidade').AsInteger;
    ocorrencia.item.cdSituacaoEmbalagem:=sqlDados.FieldByName('cdSituacaoEmbalagem').AsInteger;
    ocorrencia.item.dsSituacaoEmbalagem:=sqlDados.FieldByName('dsSituacaoEmbalagem').AsString;
    ocorrencia.item.cdTipoOcorrencia:=sqlDados.FieldByName('cdTipoOcorrencia').AsInteger;
    ocorrencia.item.dsTipoOcorrencia:=sqlDados.FieldByName('dsTipoOcorrencia').AsString;
    ocorrencia.item.cdSubTipoOcorrencia:=sqlDados.FieldByName('cdSubTipoOcorrencia').AsInteger;
    ocorrencia.item.dsSubTipoOcorrencia:=sqlDados.FieldByName('dsSubTipoOcorrencia').AsString;
    ocorrencia.item.descricaoOcorrencia:=sqlDados.FieldByName('descricaoOcorrencia').AsWideString;
    ocorrencia.item.cdSolucionador:=sqlDados.FieldByName('cdSolucionador').AsInteger;
    ocorrencia.item.nomeSolucionador:=sqlDados.FieldByName('nomeSolucionador').AsString;
    ocorrencia.item.cdGerenteSolucionador:=sqlDados.FieldByName('cdGerenteSolucionador').AsInteger;
    ocorrencia.item.nomeGerenteSolucionador:=sqlDados.FieldByName('nomeGerenteSolucionador').AsString;
    ocorrencia.item.cdSetor:=sqlDados.FieldByName('cdSetor').AsInteger;
    ocorrencia.item.nomeRepresentante:=sqlDados.FieldByName('dsSetor').AsString;
    ocorrencia.item.nrMatriculaRepresentante:=sqlDados.FieldByName('matricSetor').AsInteger;
    ocorrencia.item.cdDistrito:=sqlDados.FieldByName('cdDistrito').AsInteger;
    ocorrencia.item.nrMatriculaGerenteRepresentante:=sqlDados.FieldByName('matricDistrito').AsInteger;
    ocorrencia.item.cdTransportador:=sqlDados.FieldByName('cdTransportador').AsInteger;
    ocorrencia.item.nomeTransportador:=sqlDados.FieldByName('nomeTransportador').AsString;
    ocorrencia.item.dsTransbordoCarga:=sqlDados.FieldByName('dsTransbordoCarga').AsWideString;
    ocorrencia.item.cdStatusSolucao:=sqlDados.FieldByName('cdStatusSolucao').AsInteger;
    ocorrencia.item.dsStatusSolucao:=cdSolucaoItemToDescricao(sqlDados.FieldByName('cdStatusSolucao').AsInteger);
    ocorrencia.item.cdStatusCausa:=sqlDados.FieldByName('cdStatusCausa').AsInteger;
    ocorrencia.item.dsStatusCausa:=cdCausaItemToDescricao(sqlDados.FieldByName('cdStatusCausa').AsInteger);
    ocorrencia.item.dataLimite:=sqlDados.FieldByName('dataLimite').AsDateTime;
    ocorrencia.item.cdAreaOrigem:=sqlDados.FieldByName('cdAreaOrigem').AsInteger;
    ocorrencia.item.dsAreaOrigem:=sqlDados.FieldByName('dsAreaOrigem').AsString;
    ocorrencia.item.contatoEmail.dsEmailSolucionador:=DM.getEmailSolucionador(inttostr(ocorrencia.item.cdSolucionador),'');
    ocorrencia.item.contatoEmail.dsEmailSupervisor:=DM.getEmailSolucionador(inttostr(ocorrencia.item.cdGerenteSolucionador),'');
    ocorrencia.item.contatoEmail.dsEmailRepresentante:=DM.getEmailSolucionador(inttostr(ocorrencia.item.nrMatriculaRepresentante),'');
    ocorrencia.item.contatoEmail.dsEmailCoordenador:=DM.getEmailSolucionador(inttostr(ocorrencia.item.nrMatriculaGerenteRepresentante),'');
    ocorrencia.item.isAlertarRegistroForaDoPrazo:=(sqlDados.FieldByName('ID_REGISTRO_FORA_PRAZO').AsString = 'S');
    ocorrencia.item.dsMotivoCancelamento:=sqlDados.FieldByName('DS_MOTIVO_CANCELAMENTO').AsString;

  end;

begin
  sqlDados:=TSimpleDataSet.Create(nil);
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT');
    sqlTxt.Add(' ITEM.CD_ITEM_OCORRENCIA nrSequencia,');
    sqlTxt.Add(' ITEM.CD_EMPRESA_ITEM_OCORRENCIA cdEmpresa,');
    sqlTxt.Add(' ITEM.ID_EMPRESA_NFE_ITEM_OCORRENCIA idEmpresaNFe,');
    sqlTxt.Add(' ITEM.NR_NFE_ITEM_OCORRENCIA nrNFe,');
    sqlTxt.Add(' ITEM.NR_SERIE_NFE nrSerieNFe,');
    sqlTxt.Add(' ITEM.DT_EMISSAO_NF_ITEM_OCORRENCIA dataEmissao,');
    sqlTxt.Add(' ITEM.CD_ORIGEM_PEDIDO cdOrigemPedido,');
    sqlTxt.Add(' TRANSM.DS_MEIO_TRANSMISSAO Origem,');
    sqlTxt.Add(' ITEM.CD_PRODUTO_ITEM_OCORRENCIA cdProduto,');
    sqlTxt.Add(' MERC.NR_DV_MERCADORIA digProduto,');
    sqlTxt.Add(' MERC.NM_MERCADORIA ||'' ''|| MERC.DS_APRESENTACAO_MERCADORIA dsProduto,');
    sqlTxt.Add(' ITEM.QT_PRODUTO_ITEM_OCORRENCIA quantProduto,');
    sqlTxt.Add(' ITEM.TP_PRODUTO_ITEM_OCORRENCIA cdTipoProduto,');
    sqlTxt.Add(' ITEM.DS_LOTE_ITEM_OCORRENCIA loteProduto,');
    sqlTxt.Add(' ITEM.DT_VAL_PRODUTO_ITEM_OCORRENCIA dataValidadeProduto,');
    sqlTxt.Add(' ITEM.PR_VAL_PRODUTO_ITEM_OCORRENCIA prazoValidade,');
    sqlTxt.Add(' ITEM.CD_SITUACAO_EMBALAGEM cdSituacaoEmbalagem,');
    sqlTxt.Add(' EMB.DS_SITUACAO_EMBALAGEM dsSituacaoEmbalagem,');
    sqlTxt.Add(' ITEM.CD_TIPO_OCORRENCIA cdTipoOcorrencia,');
    sqlTxt.Add(' TIPO.NM_TIPO_OCORRENCIA dsTipoOcorrencia,');
    sqlTxt.Add(' ITEM.CD_SUBTIPO_OCORRENCIA cdSubTipoOcorrencia,');
    sqlTxt.Add(' SUB_TIPO.NM_SUBTIPO_OCORRENCIA dsSubTipoOcorrencia,');
    sqlTxt.Add(' ITEM.DS_ITEM_OCORRENCIA descricaoOcorrencia,');
    sqlTxt.Add(' ITEM.NR_MATRIC_SOLUCIONADOR cdSolucionador,');
    sqlTxt.Add(' USUARIO_S.NM_SOLUCIONADOR nomeSolucionador,');
    sqlTxt.Add(' ITEM.NR_MATRIC_GERENTE_SOLUCIONADOR cdGerenteSolucionador,');
    sqlTxt.Add(' NVL(USUARIO_G.NM_USUARIO,''SEM CADASTRO'') nomeGerenteSolucionador,');
    sqlTxt.Add(' ITEM.NR_MATRIC_REPRESENTANTE matricSetor,');
    sqlTxt.Add(' ITEM.NR_MAT_GERENTE_REPRESENTANTE matricDistrito,');
    sqlTxt.Add(' ITEM.CD_SETOR cdSetor,');
    sqlTxt.Add(' SETOR.NOMV_V dsSetor,');
    sqlTxt.Add(' ITEM.CD_DISTRITO cdDistrito,');
    sqlTxt.Add(' ITEM.CD_TRANSPORTADOR cdTransportador,');
    sqlTxt.Add(' NVL(PESSOA.NOMP_P,TRANSP.DS_TRANSPORTADOR) nomeTransportador,');
    sqlTxt.Add(' ITEM.DS_TRANSBORDO_VIAGEM dsTransbordoCarga,');
    sqlTxt.Add(' ITEM.CD_ST_SOLUCAO_ITEM_OCORRENCIA cdStatusSolucao,');
    sqlTxt.Add(' ST_SOLUCAO.NM_ST_OCORRENCIA dsStatusSolucao,');
    sqlTxt.Add(' ITEM.CD_ST_CAUSA_ITEM_OCORRENCIA cdStatusCausa,');
    sqlTxt.Add(' ST_CAUSA.NM_ST_OCORRENCIA dsStatusCausa,');
    sqlTxt.Add(' ITEM.DT_LIMITE_SOLUCAO dataLimite,');
    sqlTxt.Add(' ITEM.CD_AREA_ORIGEM cdAreaOrigem, ');
    sqlTxt.Add(' ORIGEM.DS_AREA_ORIGEM dsAreaOrigem, ');
    sqlTxt.Add(' ITEM.ID_REGISTRO_FORA_PRAZO, ');
    sqlTxt.Add(' ITEM.DS_MOTIVO_CANCELAMENTO ');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_ITEM_OCORRENCIA ITEM');
    sqlTxt.Add(' LEFT OUTER JOIN PRDDM.DC_MEIO_TRANSMISSAO TRANSM ON ITEM.CD_ORIGEM_PEDIDO = TRANSM.CD_MEIO_TRANSMISSAO');
    sqlTxt.Add(' LEFT OUTER JOIN PRDDM.DC_MERCADORIA MERC ON ITEM.CD_PRODUTO_ITEM_OCORRENCIA = MERC.CD_MERCADORIA');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_SITUACAO_EMBALAGEM EMB ON ITEM.CD_SITUACAO_EMBALAGEM = EMB.CD_SITUACAO_EMBALAGEM');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_TIPO_OCORRENCIA TIPO ON ITEM.CD_TIPO_OCORRENCIA = TIPO.CD_TIPO_OCORRENCIA');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_SUBTIPO_OCORRENCIA SUB_TIPO ON ITEM.CD_SUBTIPO_OCORRENCIA = SUB_TIPO.CD_SUBTIPO_OCORRENCIA');
    sqlTxt.Add('   AND ITEM.CD_TIPO_OCORRENCIA = SUB_TIPO.CD_TIPO_OCORRENCIA');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_SOLUCIONADOR USUARIO_S ON ITEM.NR_MATRIC_SOLUCIONADOR = USUARIO_S.NR_MATRIC_SOLUCIONADOR');
    sqlTxt.Add(' LEFT OUTER JOIN PRDDM.DC_FRETE_TRANSPORTADOR TRANSP ON ITEM.CD_TRANSPORTADOR = TRANSP.CD_TRANSPORTADOR');
    sqlTxt.Add(' LEFT OUTER JOIN PRDDM.DCPES PESSOA ON TRANSP.NR_CNPJ = PESSOA.CGCP_P ');
    sqlTxt.Add(' LEFT OUTER JOIN ACESSO.DC_USUARIO USUARIO_G ON ITEM.NR_MATRIC_GERENTE_SOLUCIONADOR = USUARIO_G.NR_MATRICULA ');
    sqlTxt.Add(' LEFT OUTER JOIN PRDDM.DCVEN SETOR ON ITEM.CD_SETOR = SETOR.NROV_V ');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_AREA_ORIGEM_OCORRENCIA ORIGEM ON ITEM.CD_AREA_ORIGEM = ORIGEM.CD_AREA_ORIGEM ');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_ST_OCORRENCIA ST_SOLUCAO ON ITEM.CD_ST_SOLUCAO_ITEM_OCORRENCIA = ST_SOLUCAO.CD_ST_OCORRENCIA ');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_ST_OCORRENCIA ST_CAUSA ON ITEM.CD_ST_CAUSA_ITEM_OCORRENCIA = ST_CAUSA.CD_ST_OCORRENCIA ');
    sqlTxt.Add('WHERE CD_OCORRENCIA = :NR_OCORRENCIA');
    sqlTxt.Add('ORDER BY ITEM.CD_ITEM_OCORRENCIA');

    try
      sqlDados.Connection:=conexaoProducao;
      sqlDados.Close;
      sqlDados.DataSet.CommandText:=sqlTxt.Text;
      sqlDados.DataSet.ParamByName('NR_OCORRENCIA').AsInteger:=ocorrencia.cdOcorrencia;
      sqlDados.Open;


      if not sqlDados.IsEmpty then
      begin
        while not sqlDados.eof do
        begin
          { carrega variavel ocorrencia }
          carregarItens;

          { grava dataSet Local }
          gravarNovoItemOcorrenciaLocal(ocorrencia.item);

          { verifica dados da solução e causa }
          execConsultaSolucaoItem;

          { verifica recorrencia gravada }
          execConsultaRecorrenciaItem;

          { consultar registro de devolução }
          if ocorrencia.item.nrNFe > 0 then
            execConsultarProcessamentoDeDevolucaoDoItem;

          sqlDados.Next;
        end;
        cdsItemOcorrencia.First;
      end;
    except
      on E:Exception  do
        raise Exception.Create(E.Message);
    end;

  finally
    sqlTxt.Free;
    sqlDados.Close;
    sqlDados.Free;
  end;
end;

function TDM.getCodigoSequencial(dsCampo,dsTabela,dsCampoCondicao,dsCondicao:string):integer;
var
  sqlDados:TSimpleDataSet;
  sqltxt: TStringList;
begin
  sqltxt:=TStringList.Create;
  sqlDados:=TSimpleDataSet.Create(nil);
  sqlDados.Connection:=conexaoProducao;
  try
    sqltxt.Clear;
    sqltxt.Add('SELECT MAX(%s) CODIGO FROM GAMSAC.%s');
    if dsCampoCondicao <> EmptyStr then
      sqltxt.Add('WHERE %s = %s');

    sqlDados.Close;
    sqlDados.DataSet.CommandText:=Format(sqltxt.Text,[dsCampo,dsTabela,dsCampoCondicao,dsCondicao]);
    sqlDados.Open;
    Result:=sqlDados.FieldByName('CODIGO').AsInteger + 1;
  finally
    sqltxt.Free;
    sqlDados.Close;
    sqlDados.Free;
  end;
end;

{ area da origem }
{consultar}
procedure TDM.consultarDadosAreaOrigem(codigo:integer;desc:string);
var
  sqlTxt: TStringList;

begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT CD_AREA_ORIGEM CODIGO,DS_AREA_ORIGEM DESCRIÇÃO,ID_AREA_ORIGEM_DEFAULT PADRAO');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_AREA_ORIGEM_OCORRENCIA');
    sqlTxt.Add('WHERE CD_AREA_ORIGEM > 0 ');
    if codigo > 0 then
      sqlTxt.Add('AND CD_AREA_ORIGEM = :CODIGO');
    if desc <> EmptyStr then
      sqlTxt.Add('AND DS_AREA_ORIGEM LIKE :DESCRICAO');
    sqlTxt.Add('ORDER BY CD_AREA_ORIGEM');

    sqlGenericaCadastro.Close;
    sqlGenericaCadastro.Fields.Clear;
    sqlGenericaCadastro.DataSet.CommandText:=sqlTxt.Text;

    if codigo > 0 then
      sqlGenericaCadastro.DataSet.ParamByName('CODIGO').AsInteger:=codigo;
    if desc <> EmptyStr then
      sqlGenericaCadastro.DataSet.ParamByName('DESCRICAO').AsString:=desc + '%';

    sqlGenericaCadastro.Open;
  finally
    sqlTxt.Free;
  end;
end;

{cadastrar}
procedure TDM.cadastrarAreaOrigem;
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('INSERT INTO GAMSAC.DC_SAC_AREA_ORIGEM_OCORRENCIA ');
    sqlTxt.Add('(CD_AREA_ORIGEM, DS_AREA_ORIGEM, ID_AREA_ORIGEM_DEFAULT)');
    sqlTxt.Add('VALUES');
    sqlTxt.Add('(:CD_AREA_ORIGEM, :DS_AREA_ORIGEM, :ID_AREA_ORIGEM_DEFAULT)');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_AREA_ORIGEM').AsInteger:=cdAreaOrigem;
      sqlQuery.ParamByName('DS_AREA_ORIGEM').AsString:=Trim(dsAreaOrigem);
      sqlQuery.ParamByName('ID_AREA_ORIGEM_DEFAULT').AsString:=idPadrao[1];
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao cadastrar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.cadastrarStatusOcorrencia(cdStatusOcorrencia:integer;descStatusOcorrencia:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('INSERT INTO GAMSAC.DC_SAC_ST_OCORRENCIA ');
    sqlTxt.Add('(CD_ST_OCORRENCIA, NM_ST_OCORRENCIA)');
    sqlTxt.Add('VALUES');
    sqlTxt.Add('(:CD_ST_OCORRENCIA, :NM_ST_OCORRENCIA)');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_ST_OCORRENCIA').AsInteger:=cdStatusOcorrencia;
      sqlQuery.ParamByName('NM_ST_OCORRENCIA').AsString:=Trim(descStatusOcorrencia);
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao cadastrar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.cadastrarSituacaoEmbalagem(cdSituacaoEmb:integer;descSituacaoEmb:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('INSERT INTO GAMSAC.DC_SAC_SITUACAO_EMBALAGEM ');
    sqlTxt.Add('(CD_SITUACAO_EMBALAGEM, DS_SITUACAO_EMBALAGEM)');
    sqlTxt.Add('VALUES');
    sqlTxt.Add('(:CD_SITUACAO_EMBALAGEM, :DS_SITUACAO_EMBALAGEM)');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_SITUACAO_EMBALAGEM').AsInteger:=cdSituacaoEmb;
      sqlQuery.ParamByName('DS_SITUACAO_EMBALAGEM').AsString:=Trim(descSituacaoEmb);
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao cadastrar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.cadastrarTipoOcorrencia(cdTipoOc,cdDepto:integer;descTipoOc,IdSolucao,Idcausa,
  idFilmagem,idEstoque,idGravTlv,idAtivo,idTransp,idEmb,idSubTipoOc,idRecolherMerc:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('INSERT INTO GAMSAC.DC_SAC_TIPO_OCORRENCIA ');
    sqlTxt.Add('(CD_TIPO_OCORRENCIA, NM_TIPO_OCORRENCIA, ID_CAUSA, ID_FILMAGEM,');
    sqlTxt.Add('ID_ESTOQUE, ID_TELEVENDAS, ID_ATIVO, ID_TRANSP_RESP, ID_EMBALAGEM,');
    sqlTxt.Add('ID_SUBTIPO_OCORRENCIA, CD_DEPTO, ID_SOLUCAO, ID_RECOLHE_MERCADORIA  )');
    sqlTxt.Add('VALUES');
    sqlTxt.Add('(:CD_TIPO_OCORRENCIA, :NM_TIPO_OCORRENCIA, :ID_CAUSA, :ID_FILMAGEM,');
    sqlTxt.Add(':ID_ESTOQUE, :ID_TELEVENDAS, :ID_ATIVO, :ID_TRANSP_RESP, :ID_EMBALAGEM,');
    sqlTxt.Add(':ID_SUBTIPO_OCORRENCIA, :CD_DEPTO, :ID_SOLUCAO, :ID_RECOLHE_MERCADORIA )');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_TIPO_OCORRENCIA').AsInteger:=cdTipoOc;
      sqlQuery.ParamByName('NM_TIPO_OCORRENCIA').AsString:=Trim(descTipoOc);
      sqlQuery.ParamByName('ID_CAUSA').AsString:=Idcausa;
      sqlQuery.ParamByName('ID_FILMAGEM').AsString:=idFilmagem;
      sqlQuery.ParamByName('ID_ESTOQUE').AsString:=idEstoque;
      sqlQuery.ParamByName('ID_TELEVENDAS').AsString:=idGravTlv;
      sqlQuery.ParamByName('ID_ATIVO').AsString:=idAtivo[1];
      sqlQuery.ParamByName('ID_TRANSP_RESP').AsString:=idTransp;
      sqlQuery.ParamByName('ID_EMBALAGEM').AsString:=idEmb;
      sqlQuery.ParamByName('ID_SUBTIPO_OCORRENCIA').AsString:=idSubTipoOc;
      sqlQuery.ParamByName('CD_DEPTO').AsInteger:=cdDepto;
      sqlQuery.ParamByName('ID_SOLUCAO').AsString:=Idcausa;
      sqlQuery.ParamByName('ID_RECOLHE_MERCADORIA').AsString:=idRecolherMerc;
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao cadastrar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;


{ alterar }
procedure TDM.alterarDadosAreaOrigem(cdAreaOrigem:integer;dsAreaOrigem,idPadrao:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_AREA_ORIGEM_OCORRENCIA SET ');
    sqlTxt.Add('DS_AREA_ORIGEM = :DS_AREA_ORIGEM ');
    sqlTxt.Add(',ID_AREA_ORIGEM_DEFAULT = :ID_AREA_ORIGEM_DEFAULT');
    sqlTxt.Add('WHERE CD_AREA_ORIGEM = :CD_AREA_ORIGEM');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_AREA_ORIGEM').AsInteger:=cdAreaOrigem;
      sqlQuery.ParamByName('DS_AREA_ORIGEM').AsString:=Trim(dsAreaOrigem);
      sqlQuery.ParamByName('ID_AREA_ORIGEM_DEFAULT').AsString:=idPadrao[1];
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao alterar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.alterarDadosStatusOcorrencia(cdStatus:integer;descStatus:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_ST_OCORRENCIA SET ');
    sqlTxt.Add('NM_ST_OCORRENCIA = :NM_ST_OCORRENCIA ');
    sqlTxt.Add('WHERE CD_ST_OCORRENCIA = :CD_ST_OCORRENCIA');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_ST_OCORRENCIA').AsInteger:=cdStatus;
      sqlQuery.ParamByName('NM_ST_OCORRENCIA').AsString:=Trim(descStatus);
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao alterar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.alterarDadosSituacaoEmbalagem(cdSituacaoEmb:integer;descSituacaoEmb:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_SITUACAO_EMBALAGEM SET ');
    sqlTxt.Add('DS_SITUACAO_EMBALAGEM = :DS_SITUACAO_EMBALAGEM ');
    sqlTxt.Add('WHERE CD_SITUACAO_EMBALAGEM = :CD_SITUACAO_EMBALAGEM');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_SITUACAO_EMBALAGEM').AsInteger:=cdSituacaoEmb;
      sqlQuery.ParamByName('DS_SITUACAO_EMBALAGEM').AsString:=Trim(descSituacaoEmb);
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao alterar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.alterarCadastroTipoOcorrencia(cdTipoOc,cdDepto:integer;descTipoOc,IdSolucao,
  Idcausa,idFilmagem,idEstoque,idGravTlv,idAtivo,idTransp,idEmb,idSubTipoOc,idRecolherMerc:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_TIPO_OCORRENCIA SET ');
    sqlTxt.Add('NM_TIPO_OCORRENCIA = :NM_TIPO_OCORRENCIA, ID_CAUSA = :ID_CAUSA,');
    sqlTxt.Add('ID_FILMAGEM = :ID_FILMAGEM, ID_ESTOQUE = :ID_ESTOQUE,');
    sqlTxt.Add('ID_TELEVENDAS = :ID_TELEVENDAS, ID_ATIVO = :ID_ATIVO,');
    sqlTxt.Add('ID_TRANSP_RESP = :ID_TRANSP_RESP , ID_EMBALAGEM = :ID_EMBALAGEM,');
    sqlTxt.Add('ID_SUBTIPO_OCORRENCIA = :ID_SUBTIPO_OCORRENCIA, CD_DEPTO = :CD_DEPTO,');
    sqlTxt.Add('ID_SOLUCAO = :ID_SOLUCAO, ID_RECOLHE_MERCADORIA = :ID_RECOLHE_MERCADORIA ');
    sqlTxt.Add('WHERE CD_TIPO_OCORRENCIA = :CD_TIPO_OCORRENCIA');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_TIPO_OCORRENCIA').AsInteger:=cdTipoOc;
      sqlQuery.ParamByName('NM_TIPO_OCORRENCIA').AsString:=Trim(descTipoOc);
      sqlQuery.ParamByName('ID_CAUSA').AsString:=Idcausa;
      sqlQuery.ParamByName('ID_FILMAGEM').AsString:=idFilmagem;
      sqlQuery.ParamByName('ID_ESTOQUE').AsString:=idEstoque;
      sqlQuery.ParamByName('ID_TELEVENDAS').AsString:=idGravTlv;
      sqlQuery.ParamByName('ID_ATIVO').AsString:=idAtivo[1];
      sqlQuery.ParamByName('ID_TRANSP_RESP').AsString:=idTransp;
      sqlQuery.ParamByName('ID_EMBALAGEM').AsString:=idEmb;
      sqlQuery.ParamByName('ID_SUBTIPO_OCORRENCIA').AsString:=idSubTipoOc;
      sqlQuery.ParamByName('CD_DEPTO').AsInteger:=cdDepto;
      sqlQuery.ParamByName('ID_SOLUCAO').AsString:=IdSolucao;
      sqlQuery.ParamByName('ID_RECOLHE_MERCADORIA').AsString:=idRecolherMerc;
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao alterar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

{ excluir }
procedure TDM.excluirDadosAreaOrigem(cdAreaOrigem:integer);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('DELETE GAMSAC.DC_SAC_AREA_ORIGEM_OCORRENCIA ');
    sqlTxt.Add('WHERE CD_AREA_ORIGEM = :CD_AREA_ORIGEM');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_AREA_ORIGEM').AsInteger:=cdAreaOrigem;
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao excluir informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.excluirDadosStatusOcorrencia(cdStatus:integer);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('DELETE GAMSAC.DC_SAC_ST_OCORRENCIA ');
    sqlTxt.Add('WHERE CD_ST_OCORRENCIA = :CD_ST_OCORRENCIA');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_ST_OCORRENCIA').AsInteger:=cdStatus;
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao excluir informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.excluirDadosSituacaoEmbalagem(cdSituacaoEmb:integer);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('DELETE GAMSAC.DC_SAC_SITUACAO_EMBALAGEM ');
    sqlTxt.Add('WHERE CD_SITUACAO_EMBALAGEM = :CD_SITUACAO_EMBALAGEM');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_SITUACAO_EMBALAGEM').AsInteger:=cdSituacaoEmb;
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao excluir informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.excluirDadosTipoOcorrencia(cdTipoOcorrencia:integer);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('DELETE GAMSAC.DC_SAC_TIPO_OCORRENCIA ');
    sqlTxt.Add('WHERE CD_TIPO_OCORRENCIA = :CD_TIPO_OCORRENCIA');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_TIPO_OCORRENCIA').AsInteger:=cdTipoOcorrencia;
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao excluir informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.excluirDadosSubTipoOcorrencia(cdTipoOc,cdSubTipoOc:integer);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('DELETE GAMSAC.DC_SAC_SUBTIPO_OCORRENCIA ');
    sqlTxt.Add('WHERE CD_TIPO_OCORRENCIA = :CD_TIPO_OCORRENCIA');
    sqlTxt.Add('AND CD_SUBTIPO_OCORRENCIA = :CD_SUBTIPO_OCORRENCIA');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_TIPO_OCORRENCIA').AsInteger:=cdTipoOc;
      sqlQuery.ParamByName('CD_SUBTIPO_OCORRENCIA').AsInteger:=cdSubTipoOc;
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao excluir informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.excluirDadosSolucaoOcorrencia(cdSolucao:integer);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('DELETE GAMSAC.DC_SAC_SOLUCAO ');
    sqlTxt.Add('WHERE CD_SOLUCAO = :CD_SOLUCAO');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_SOLUCAO').AsInteger:=cdSolucao;
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao excluir informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.excluirDadosSubTipoOcXSolucao(cdSubTipoSolucao:integer);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('DELETE GAMSAC.DC_SAC_SUBTIPO_SOLUCAO ');
    sqlTxt.Add('WHERE CD_SUBTIPO_SOLUCAO = :CD_SUBTIPO_SOLUCAO');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_SUBTIPO_SOLUCAO').AsInteger:=cdSubTipoSolucao;
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao excluir informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.excluirDadosCausaOcorrencia(cdCausa:integer);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('DELETE GAMSAC.DC_SAC_CAUSA ');
    sqlTxt.Add('WHERE CD_CAUSA = :CD_CAUSA');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_CAUSA').AsInteger:=cdCausa;
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao excluir informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.excluirDadosSubTipoOcXCausa(cdSubTipoCausa:integer);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('DELETE GAMSAC.DC_SAC_SUBTIPO_CAUSA ');
    sqlTxt.Add('WHERE CD_SUBTIPO_CAUSA = :CD_SUBTIPO_CAUSA');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_SUBTIPO_CAUSA').AsInteger:=cdSubTipoCausa;
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao excluir informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.excluirDadosDepartamento(cdDepto:integer);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('DELETE GAMSAC.DC_SAC_DEPTO ');
    sqlTxt.Add('WHERE CD_DEPTO = :CD_DEPTO');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_DEPTO').AsInteger:=cdDepto;
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao excluir informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.excluirDadosAreaDepartamento(cdAreaDepto:integer);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('DELETE GAMSAC.DC_SAC_AREA_DEPTO ');
    sqlTxt.Add('WHERE CD_AREA_DEPTO = :CD_AREA_DEPTO');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_AREA_DEPTO').AsInteger:=cdAreaDepto;
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao excluir informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.excluirDadosSolucionador(nrMatricula:integer);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('DELETE GAMSAC.DC_SAC_SOLUCIONADOR ');
    sqlTxt.Add('WHERE NR_MATRIC_SOLUCIONADOR = :NR_MATRIC_SOLUCIONADOR');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('NR_MATRIC_SOLUCIONADOR').AsInteger:=nrMatricula;
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao excluir informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.consultarDadosStatusOcorrencia(codigo:integer;desc:string);
var
  sqlTxt: TStringList;

begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT CD_ST_OCORRENCIA CODIGO,NM_ST_OCORRENCIA DESCRIÇÃO');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_ST_OCORRENCIA');
    sqlTxt.Add('WHERE CD_ST_OCORRENCIA > 0 ');
    if codigo > 0 then
      sqlTxt.Add('AND CD_ST_OCORRENCIA = :CODIGO');
    if desc <> EmptyStr then
      sqlTxt.Add('AND NM_ST_OCORRENCIA LIKE :DESCRICAO');
    sqlTxt.Add('ORDER BY CD_ST_OCORRENCIA');

    sqlGenericaCadastro.Close;
    sqlGenericaCadastro.Fields.Clear;
    sqlGenericaCadastro.DataSet.CommandText:=sqlTxt.Text;

    if codigo > 0 then
      sqlGenericaCadastro.DataSet.ParamByName('CODIGO').AsInteger:=codigo;
    if desc <> EmptyStr then
      sqlGenericaCadastro.DataSet.ParamByName('DESCRICAO').AsString:=desc + '%';

    sqlGenericaCadastro.Open;
  finally
    sqlTxt.Free;
  end;
end;

procedure TDM.consultarDadosSituacaoEmbalagem(codigo:integer;desc:string);
var
  sqlTxt: TStringList;

begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT CD_SITUACAO_EMBALAGEM CODIGO,DS_SITUACAO_EMBALAGEM DESCRIÇÃO');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_SITUACAO_EMBALAGEM');
    sqlTxt.Add('WHERE CD_SITUACAO_EMBALAGEM > 0 ');
    if codigo > 0 then
      sqlTxt.Add('AND CD_SITUACAO_EMBALAGEM = :CODIGO');
    if desc <> EmptyStr then
      sqlTxt.Add('AND DS_SITUACAO_EMBALAGEM LIKE :DESCRICAO');
    sqlTxt.Add('ORDER BY CD_SITUACAO_EMBALAGEM');

    sqlGenericaCadastro.Close;
    sqlGenericaCadastro.Fields.Clear;
    sqlGenericaCadastro.DataSet.CommandText:=sqlTxt.Text;

    if codigo > 0 then
      sqlGenericaCadastro.DataSet.ParamByName('CODIGO').AsInteger:=codigo;
    if desc <> EmptyStr then
      sqlGenericaCadastro.DataSet.ParamByName('DESCRICAO').AsString:=desc + '%';

    sqlGenericaCadastro.Open;
  finally
    sqlTxt.Free;
  end;
end;

procedure TDM.consultarDadosTipoOcorrencia(codigo,deptoResponsavel:integer;desc:string);
var
  sqlTxt: TStringList;
  teste: string;
begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT CD_TIPO_OCORRENCIA CODIGO, NM_TIPO_OCORRENCIA DESCRIÇÃO, ID_CAUSA,');
    sqlTxt.Add('ID_FILMAGEM, ID_ESTOQUE, ID_TELEVENDAS, ID_TRANSP_RESP, ID_EMBALAGEM,');
    sqlTxt.Add('ID_SUBTIPO_OCORRENCIA, ID_ATIVO, CD_DEPTO DEPARTAMENTO, ID_SOLUCAO, ID_RECOLHE_MERCADORIA');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_TIPO_OCORRENCIA');
    sqlTxt.Add('WHERE CD_TIPO_OCORRENCIA > 0 ');
    if codigo > 0 then
      sqlTxt.Add('AND CD_TIPO_OCORRENCIA = :CODIGO');
    if desc <> EmptyStr then
      sqlTxt.Add('AND NM_TIPO_OCORRENCIA LIKE :DESCRICAO');
    if deptoResponsavel > 0 then
      sqlTxt.Add('AND CD_DEPTO = :DEPTO');
    sqlTxt.Add('ORDER BY CD_TIPO_OCORRENCIA');

    sqlGenericaCadastro.Close;
    sqlGenericaCadastro.Fields.Clear;
    sqlGenericaCadastro.DataSet.CommandText:=sqlTxt.Text;
    teste:=sqlTxt.Text;
    if codigo > 0 then
      sqlGenericaCadastro.DataSet.ParamByName('CODIGO').AsInteger:=codigo;
    if desc <> EmptyStr then
      sqlGenericaCadastro.DataSet.ParamByName('DESCRICAO').AsString:=desc + '%';
    if deptoResponsavel > 0 then
      sqlGenericaCadastro.DataSet.ParamByName('DEPTO').AsInteger:=deptoResponsavel;

    sqlGenericaCadastro.Open;
  finally
    sqlTxt.Free;
  end;
end;

{ subtipo de ocorrencia }
{ consulta }
procedure TDM.consultarDadosSubTipoOcorrencia(cdTipo,cdSubTipo:integer;desc:string);
var
  sqlTxt: TStringList;

begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT TIPO.NM_TIPO_OCORRENCIA DESCRIÇÃO_TIPO, SUBTIPO.NM_SUBTIPO_OCORRENCIA DESCRIÇÃO_SUBTIPO,');
    sqlTxt.Add('SUBTIPO.CD_TIPO_OCORRENCIA COD_TIPO, SUBTIPO.CD_SUBTIPO_OCORRENCIA COD_SUBTIPO,SUBTIPO.ID_ATIVO SITUAÇÃO');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_SUBTIPO_OCORRENCIA SUBTIPO');
    sqlTxt.Add('JOIN GAMSAC.DC_SAC_TIPO_OCORRENCIA TIPO ON SUBTIPO.CD_TIPO_OCORRENCIA = TIPO.CD_TIPO_OCORRENCIA');
    sqlTxt.Add('WHERE SUBTIPO.CD_TIPO_OCORRENCIA > 0 ');
    if cdTipo > 0 then
      sqlTxt.Add('AND SUBTIPO.CD_TIPO_OCORRENCIA = :CODIGO_TIPO');
    if cdSubTipo > 0 then
      sqlTxt.Add('AND SUBTIPO.CD_SUBTIPO_OCORRENCIA = :CODIGO_SUBTIPO');
    if desc <> EmptyStr then
      sqlTxt.Add('AND SUBTIPO.NM_SUBTIPO_OCORRENCIA LIKE :DESCRICAO');
    sqlTxt.Add('ORDER BY SUBTIPO.CD_TIPO_OCORRENCIA, SUBTIPO.CD_SUBTIPO_OCORRENCIA');

    sqlGenericaCadastro.Close;
    sqlGenericaCadastro.Fields.Clear;
    sqlGenericaCadastro.DataSet.CommandText:=sqlTxt.Text;

    if cdTipo > 0 then
      sqlGenericaCadastro.DataSet.ParamByName('CODIGO_TIPO').AsInteger:=cdTipo;
    if cdSubTipo > 0 then
      sqlGenericaCadastro.DataSet.ParamByName('CODIGO_SUBTIPO').AsInteger:=cdSubTipo;
    if desc <> EmptyStr then
      sqlGenericaCadastro.DataSet.ParamByName('DESCRICAO').AsString:=desc + '%';

    sqlGenericaCadastro.Open;
  finally
    sqlTxt.Free;
  end;
end;

{ cadastrar }
procedure TDM.cadastrarSubTipoOcorrencia(cdTipoOc,cdSubTipoOc:integer;descSubTipoOc,idSituacao:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('INSERT INTO GAMSAC.DC_SAC_SUBTIPO_OCORRENCIA ');
    sqlTxt.Add('(CD_TIPO_OCORRENCIA, CD_SUBTIPO_OCORRENCIA, NM_SUBTIPO_OCORRENCIA, ID_ATIVO)');
    sqlTxt.Add('VALUES');
    sqlTxt.Add('(:CD_TIPO_OCORRENCIA, :CD_SUBTIPO_OCORRENCIA, :NM_SUBTIPO_OCORRENCIA, :ID_ATIVO)');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_TIPO_OCORRENCIA').AsInteger:=cdTipoOc;
      sqlQuery.ParamByName('CD_SUBTIPO_OCORRENCIA').AsInteger:=cdSubTipoOc;
      sqlQuery.ParamByName('NM_SUBTIPO_OCORRENCIA').AsString:=trim(descSubTipoOc);
      sqlQuery.ParamByName('ID_ATIVO').AsString:=idSituacao[1];
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao cadastrar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.cadastrarSolucaoOcorrencia(cdSolucao:integer;descSolucao,idSituacao:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('INSERT INTO GAMSAC.DC_SAC_SOLUCAO ');
    sqlTxt.Add('(CD_SOLUCAO, DS_SOLUCAO, ID_ATIVO)');
    sqlTxt.Add('VALUES');
    sqlTxt.Add('(:CD_SOLUCAO, :DS_SOLUCAO, :ID_ATIVO)');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_SOLUCAO').AsInteger:=cdSolucao;
      sqlQuery.ParamByName('DS_SOLUCAO').AsString:=trim(descSolucao);
      sqlQuery.ParamByName('ID_ATIVO').AsString:=idSituacao[1];
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao cadastrar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.cadastrarCausaOcorrencia(cdCausa:integer;descCausa,idSituacao:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('INSERT INTO GAMSAC.DC_SAC_CAUSA ');
    sqlTxt.Add('(CD_CAUSA, DS_CAUSA, ID_ATIVO)');
    sqlTxt.Add('VALUES');
    sqlTxt.Add('(:CD_CAUSA, :DS_CAUSA, :ID_ATIVO)');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_CAUSA').AsInteger:=cdCausa;
      sqlQuery.ParamByName('DS_CAUSA').AsString:=Trim(descCausa);
      sqlQuery.ParamByName('ID_ATIVO').AsString:=idSituacao[1];
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao cadastrar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.cadastrarDepartamento(cdDepto,nrMatriculaGerente:integer;descDepto:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('INSERT INTO GAMSAC.DC_SAC_DEPTO ');
    sqlTxt.Add('(CD_DEPTO, DS_DEPTO, NR_MATRIC_GERENTE_DEPTO)');
    sqlTxt.Add('VALUES');
    sqlTxt.Add('(:CD_DEPTO, :DS_DEPTO, :NR_MATRIC_GERENTE_DEPTO)');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_DEPTO').AsInteger:=cdDepto;
      sqlQuery.ParamByName('DS_DEPTO').AsString:=Trim(descDepto);
      sqlQuery.ParamByName('NR_MATRIC_GERENTE_DEPTO').AsInteger:=nrMatriculaGerente;
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao cadastrar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.cadastrarAreaDepartamento(cdAreaDepto,prazoSolucao,cdDepto,nrMatriculaSupervisor,
  cdAreaOrigem:integer;descAreaDepto:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('INSERT INTO GAMSAC.DC_SAC_AREA_DEPTO ');
    sqlTxt.Add('(CD_AREA_DEPTO, CD_DEPTO, DS_AREA_DEPTO, QTD_DIAS_SOLUCAO, NR_MATRIC_GERENTE_AREA,CD_AREA_ORIGEM)');
    sqlTxt.Add('VALUES');
    sqlTxt.Add('(:CD_AREA_DEPTO, :CD_DEPTO, :DS_AREA_DEPTO, :QTD_DIAS_SOLUCAO, :NR_MATRIC_GERENTE_AREA, :CD_AREA_ORIGEM)');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_AREA_DEPTO').AsInteger:=cdAreaDepto;
      sqlQuery.ParamByName('CD_DEPTO').AsInteger:=cdDepto;
      sqlQuery.ParamByName('DS_AREA_DEPTO').AsString:=Trim(descAreaDepto);
      sqlQuery.ParamByName('QTD_DIAS_SOLUCAO').AsInteger:=prazoSolucao;
      sqlQuery.ParamByName('NR_MATRIC_GERENTE_AREA').AsInteger:=nrMatriculaSupervisor;
      sqlQuery.ParamByName('CD_AREA_ORIGEM').AsInteger:=cdAreaOrigem;
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao cadastrar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.cadastrarSolucionador(nrMatricula,cdDepto,cdAreaDepto:integer;nomeSolucionador,dsEmail,idSituacao:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('INSERT INTO GAMSAC.DC_SAC_SOLUCIONADOR ');
    sqlTxt.Add('(NR_MATRIC_SOLUCIONADOR, CD_DEPTO, CD_AREA_DEPTO, NM_SOLUCIONADOR, DS_EMAIL, ID_ATIVO)');
    sqlTxt.Add('VALUES');
    sqlTxt.Add('( :NR_MATRIC_SOLUCIONADOR, :CD_DEPTO, :CD_AREA_DEPTO, :NM_SOLUCIONADOR, :DS_EMAIL, :ID_ATIVO )');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('NR_MATRIC_SOLUCIONADOR').AsInteger:=nrMatricula;
      sqlQuery.ParamByName('CD_DEPTO').AsInteger:=cdDepto;
      sqlQuery.ParamByName('CD_AREA_DEPTO').AsInteger:=cdAreaDepto;
      sqlQuery.ParamByName('NM_SOLUCIONADOR').AsString:=trim(nomeSolucionador);
      sqlQuery.ParamByName('DS_EMAIL').AsString:=trim(dsEmail);
      sqlQuery.ParamByName('ID_ATIVO').AsString:=idSituacao[1];
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao cadastrar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;



procedure TDM.cadastrarMotivoCancelamento(PcdMotivo:integer;PDescricaoMotivo,PUsuario:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try

    sqlTxt.Clear;
    sqlTxt.Add('INSERT INTO GAMSAC.DC_SAC_MOTIVO_CANCELAMENTO ');
    sqlTxt.Add('(CD_SAC_MOTIVO_CANCELAMENTO, DS_SAC_MOTIVO_CANCELAMENTO, DT_ATUALIZACAO, NM_USUARIO)');
    sqlTxt.Add('VALUES');
    sqlTxt.Add('( :CD_SAC_MOTIVO_CANCELAMENTO, :DS_SAC_MOTIVO_CANCELAMENTO, sysdate, :NM_USUARIO )');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_SAC_MOTIVO_CANCELAMENTO').AsInteger:=PcdMotivo;
      sqlQuery.ParamByName('DS_SAC_MOTIVO_CANCELAMENTO').AsString:=PDescricaoMotivo;
      sqlQuery.ParamByName('NM_USUARIO').AsString  :=copy(usuario.login,1,20);
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao cadastrar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;


procedure TDM.alterarDadosSubTipoOcorrencia(cdTipoOc,cdSubTipoOc:integer;descSubTipoOc,idSituacao:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_SUBTIPO_OCORRENCIA SET ');
    sqlTxt.Add('NM_SUBTIPO_OCORRENCIA = :NM_SUBTIPO_OCORRENCIA, ID_ATIVO = :ID_ATIVO ');
    sqlTxt.Add('WHERE CD_TIPO_OCORRENCIA = :CD_TIPO_OCORRENCIA');
    sqlTxt.Add('AND CD_SUBTIPO_OCORRENCIA = :CD_SUBTIPO_OCORRENCIA');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_TIPO_OCORRENCIA').AsInteger:=cdTipoOc;
      sqlQuery.ParamByName('CD_SUBTIPO_OCORRENCIA').AsInteger:=cdSubTipoOc;
      sqlQuery.ParamByName('NM_SUBTIPO_OCORRENCIA').AsString:=trim(descSubTipoOc);
      sqlQuery.ParamByName('ID_ATIVO').AsString:=idSituacao[1];
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao alterar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.alterarDadosSubTipoOcXSolucao(cdSubTipoOcXSolucao,cdSolucao:integer;idAceite:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_SUBTIPO_SOLUCAO SET ');
    sqlTxt.Add('CD_SOLUCAO = :CD_SOLUCAO, ID_ACEITE = :ID_ACEITE ');
    sqlTxt.Add('WHERE CD_SUBTIPO_SOLUCAO = :CD_SUBTIPO_SOLUCAO');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_SOLUCAO').AsInteger:=cdSolucao;
      sqlQuery.ParamByName('CD_SUBTIPO_SOLUCAO').AsInteger:=cdSubTipoOcXSolucao;
      sqlQuery.ParamByName('ID_ACEITE').AsString:=UpperCase(Copy(idAceite,1,1));
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao alterar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.alterarDadosSolucao(cdSolucao:integer;descSolucao,idSituacao:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_SOLUCAO SET ');
    sqlTxt.Add('DS_SOLUCAO = :DS_SOLUCAO, ID_ATIVO = :ID_ATIVO ');
    sqlTxt.Add('WHERE CD_SOLUCAO = :CD_SOLUCAO');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_SOLUCAO').AsInteger:=cdSolucao;
      sqlQuery.ParamByName('DS_SOLUCAO').AsString:=trim(descSolucao);
      sqlQuery.ParamByName('ID_ATIVO').AsString:=idSituacao[1];
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao alterar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.alterarDadosCausa(cdCausa:integer;descCausa,idSituacao:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_CAUSA SET ');
    sqlTxt.Add('DS_CAUSA = :DS_CAUSA, ID_ATIVO = :ID_ATIVO ');
    sqlTxt.Add('WHERE CD_CAUSA = :CD_CAUSA');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_CAUSA').AsInteger:=cdCausa;
      sqlQuery.ParamByName('DS_CAUSA').AsString:=trim(descCausa);
      sqlQuery.ParamByName('ID_ATIVO').AsString:=idSituacao[1];
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao alterar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.alterarDadosSubTipoOcXCausa(cdSubTipoOcXCausa,cdCausa:integer);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_SUBTIPO_CAUSA SET ');
    sqlTxt.Add('CD_CAUSA = :CD_CAUSA ');
    sqlTxt.Add('WHERE CD_SUBTIPO_CAUSA = :CD_SUBTIPO_CAUSA');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_CAUSA').AsInteger:=cdCausa;
      sqlQuery.ParamByName('CD_SUBTIPO_CAUSA').AsInteger:=cdSubTipoOcXCausa;
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao alterar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.alterarDadosDepartamento(cdDepto,nrMatriculaGerente:integer;descDepto:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_DEPTO SET ');
    sqlTxt.Add('DS_DEPTO = :DS_DEPTO, NR_MATRIC_GERENTE_DEPTO = :NR_MATRIC_GERENTE_DEPTO ');
    sqlTxt.Add('WHERE CD_DEPTO = :CD_DEPTO');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_DEPTO').AsInteger:=cdDepto;
      sqlQuery.ParamByName('NR_MATRIC_GERENTE_DEPTO').AsInteger:=nrMatriculaGerente;
      sqlQuery.ParamByName('DS_DEPTO').AsString:=Trim(descDepto);
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao alterar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.AlterarMotivoCancelamento(PcdMotivo:integer;PDescricaoMotivo,PUsuario:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try

    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_MOTIVO_CANCELAMENTO ');
    sqlTxt.Add(' SET DS_SAC_MOTIVO_CANCELAMENTO=:DS_SAC_MOTIVO_CANCELAMENTO, DT_ATUALIZACAO=sysdate,NM_USUARIO=:NM_USUARIO');
    sqlTxt.Add('WHERE');
    sqlTxt.Add('CD_SAC_MOTIVO_CANCELAMENTO =:CD_SAC_MOTIVO_CANCELAMENTO');
    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_SAC_MOTIVO_CANCELAMENTO').AsInteger:=PcdMotivo;
      sqlQuery.ParamByName('DS_SAC_MOTIVO_CANCELAMENTO').AsString:=PDescricaoMotivo;
      sqlQuery.ParamByName('NM_USUARIO').AsString  :=copy(usuario.login,1,20);
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao cadastrar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;



procedure TDM.alterarDadosAreaDepartamento(cdAreaDepto,prazoSolucao,cdDepto,nrMatriculaSupervisor,
  cdAreaOrigem:integer;descAreaDepto:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_AREA_DEPTO SET ');
    sqlTxt.Add('CD_DEPTO = :CD_DEPTO, DS_AREA_DEPTO = :DS_AREA_DEPTO,');
    sqlTxt.Add('QTD_DIAS_SOLUCAO = :QTD_DIAS_SOLUCAO, NR_MATRIC_GERENTE_AREA = :NR_MATRIC_GERENTE_AREA, CD_AREA_ORIGEM = :CD_AREA_ORIGEM ');
    sqlTxt.Add('WHERE CD_AREA_DEPTO = :CD_AREA_DEPTO');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_AREA_DEPTO').AsInteger:=cdAreaDepto;
      sqlQuery.ParamByName('CD_DEPTO').AsInteger:=cdDepto;
      sqlQuery.ParamByName('DS_AREA_DEPTO').AsString:=descAreaDepto;
      sqlQuery.ParamByName('QTD_DIAS_SOLUCAO').AsInteger:=prazoSolucao;
      sqlQuery.ParamByName('NR_MATRIC_GERENTE_AREA').AsInteger:=nrMatriculaSupervisor;
      sqlQuery.ParamByName('CD_AREA_ORIGEM').AsInteger:=cdAreaOrigem;
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao alterar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.alterarDadosSolucionador(nrMatricula,cdDepto,cdAreaDepto:integer;dsEmail,idSituacao:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_SOLUCIONADOR SET ');
    sqlTxt.Add('CD_DEPTO = :CD_DEPTO, CD_AREA_DEPTO = :CD_AREA_DEPTO,');
    sqlTxt.Add('DS_EMAIL = :DS_EMAIL, ID_ATIVO = :ID_ATIVO ');
    sqlTxt.Add('WHERE NR_MATRIC_SOLUCIONADOR = :NR_MATRIC_SOLUCIONADOR');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('NR_MATRIC_SOLUCIONADOR').AsInteger:=nrMatricula;
      sqlQuery.ParamByName('CD_DEPTO').AsInteger:=cdDepto;
      sqlQuery.ParamByName('CD_AREA_DEPTO').AsInteger:=cdAreaDepto;
      sqlQuery.ParamByName('DS_EMAIL').AsString:=dsEmail;
      sqlQuery.ParamByName('ID_ATIVO').AsString:=idSituacao[1];
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao alterar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;


{ solucao }

{ consultar }
procedure TDM.consultarDadosSolucaoOcorrencia(codigo:integer;desc:string);
var
  sqlTxt: TStringList;

begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT CD_SOLUCAO CODIGO, DS_SOLUCAO DESCRIÇÃO, ID_ATIVO SITUAÇAO');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_SOLUCAO');
    sqlTxt.Add('WHERE CD_SOLUCAO > 0 ');
    if codigo > 0 then
      sqlTxt.Add('AND CD_SOLUCAO = :CODIGO');
    if desc <> EmptyStr then
      sqlTxt.Add('AND DS_SOLUCAO LIKE :DESCRICAO');
    sqlTxt.Add('ORDER BY CD_SOLUCAO');

    sqlGenericaCadastro.Close;
    sqlGenericaCadastro.Fields.Clear;
    sqlGenericaCadastro.DataSet.CommandText:=sqlTxt.Text;

    if codigo > 0 then
      sqlGenericaCadastro.DataSet.ParamByName('CODIGO').AsInteger:=codigo;
    if desc <> EmptyStr then
      sqlGenericaCadastro.DataSet.ParamByName('DESCRICAO').AsString:=desc + '%';

    sqlGenericaCadastro.Open;
  finally
    sqlTxt.Free;
  end;
end;

procedure TDM.consultarDadosSolucaoXSubTipoOcorrencia(codigo:integer);
var
  sqlTxt: TStringList;

begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT SUBTIPO_S.CD_SUBTIPO_SOLUCAO CODIGO,');
    sqlTxt.Add('TIPO_OC.NM_TIPO_OCORRENCIA,');
    sqlTxt.Add('SUBTIPO_OC.NM_SUBTIPO_OCORRENCIA,');
    sqlTxt.Add('SOLUCAO.DS_SOLUCAO,');
    sqlTxt.Add('SUBTIPO_S.CD_TIPO_OCORRENCIA,');
    sqlTxt.Add('SUBTIPO_S.CD_SUBTIPO_OCORRENCIA,');
    sqlTxt.Add('SUBTIPO_S.CD_SOLUCAO,');
    sqlTxt.Add('SUBTIPO_S.ID_ACEITE');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_SUBTIPO_SOLUCAO SUBTIPO_S');
    sqlTxt.Add('JOIN GAMSAC.DC_SAC_SOLUCAO SOLUCAO ON SUBTIPO_S.CD_SOLUCAO = SOLUCAO.CD_SOLUCAO AND SOLUCAO.CD_SOLUCAO > 0');
    sqlTxt.Add('JOIN GAMSAC.DC_SAC_TIPO_OCORRENCIA TIPO_OC ON SUBTIPO_S.CD_TIPO_OCORRENCIA = TIPO_OC.CD_TIPO_OCORRENCIA');
    sqlTxt.Add('JOIN GAMSAC.DC_SAC_SUBTIPO_OCORRENCIA SUBTIPO_OC ON SUBTIPO_S.CD_SUBTIPO_OCORRENCIA = SUBTIPO_OC.CD_SUBTIPO_OCORRENCIA');
    sqlTxt.Add(' AND SUBTIPO_S.CD_TIPO_OCORRENCIA = SUBTIPO_OC.CD_TIPO_OCORRENCIA');
    sqlTxt.Add('WHERE SUBTIPO_S.CD_SUBTIPO_SOLUCAO > 0');
    if codigo > 0 then
      sqlTxt.Add('AND CD_SOLUCAO = :CODIGO');
    sqlTxt.Add('ORDER BY SUBTIPO_S.CD_SUBTIPO_SOLUCAO');

    sqlGenericaCadastro.Close;
    sqlGenericaCadastro.Fields.Clear;
    sqlGenericaCadastro.DataSet.CommandText:=sqlTxt.Text;

    if codigo > 0 then
      sqlGenericaCadastro.DataSet.ParamByName('CODIGO').AsInteger:=codigo;

    sqlGenericaCadastro.Open;
  finally
    sqlTxt.Free;
  end;
end;

{ cadastrar }
procedure TDM.cadastrarSolucaoXSubTipoOcorrencia;
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('INSERT INTO GAMSAC.DC_SAC_SUBTIPO_SOLUCAO ');
    sqlTxt.Add('(CD_SUBTIPO_SOLUCAO, CD_TIPO_OCORRENCIA, CD_SUBTIPO_OCORRENCIA, CD_SOLUCAO, ID_ACEITE )');
    sqlTxt.Add('VALUES');
    sqlTxt.Add('(:CD_SUBTIPO_SOLUCAO, :CD_TIPO_OCORRENCIA, :CD_SUBTIPO_OCORRENCIA, :CD_SOLUCAO, :ID_ACEITE )');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_SUBTIPO_SOLUCAO').AsInteger:=cdSubTipoSolucao;
      sqlQuery.ParamByName('CD_TIPO_OCORRENCIA').AsString:=inttostr(cdTipoOcorrencia);
      sqlQuery.ParamByName('CD_SUBTIPO_OCORRENCIA').AsString:=inttostr(cdSubTipoOcorrencia);
      sqlQuery.ParamByName('CD_SOLUCAO').AsString:=inttostr(cdSolucao);
      sqlQuery.ParamByName('ID_ACEITE').AsString:=UpperCase(Copy(idAceite,1,1));
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao cadastrar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

{ causa }

{ consultar }
procedure TDM.consultarDadosCausaOcorrencia(codigo:integer;desc:string);
var
  sqlTxt: TStringList;

begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT CD_CAUSA CODIGO, DS_CAUSA DESCRIÇÃO, ID_ATIVO SITUAÇAO');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_CAUSA');
    sqlTxt.Add('WHERE CD_CAUSA > 0 ');
    if codigo > 0 then
      sqlTxt.Add('AND CD_CAUSA = :CODIGO');
    if desc <> EmptyStr then
      sqlTxt.Add('AND DS_CAUSA LIKE :DESCRICAO');
    sqlTxt.Add('ORDER BY CD_CAUSA');

    sqlGenericaCadastro.Close;
    sqlGenericaCadastro.Fields.Clear;
    sqlGenericaCadastro.DataSet.CommandText:=sqlTxt.Text;

    if codigo > 0 then
      sqlGenericaCadastro.DataSet.ParamByName('CODIGO').AsInteger:=codigo;
    if desc <> EmptyStr then
      sqlGenericaCadastro.DataSet.ParamByName('DESCRICAO').AsString:=desc + '%';

    sqlGenericaCadastro.Open;
  finally
    sqlTxt.Free;
  end;
end;

{ sonsultar causa X subTipo de Ocorrencia }
procedure TDM.consultarDadosCausaXSubTipoOcorrencia(codigo:integer);
var
  sqlTxt: TStringList;

begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT SUBTIPO_C.CD_SUBTIPO_CAUSA CODIGO,');
    sqlTxt.Add('TIPO_OC.NM_TIPO_OCORRENCIA,');
    sqlTxt.Add('SUBTIPO_OC.NM_SUBTIPO_OCORRENCIA,');
    sqlTxt.Add('CAUSA.DS_CAUSA,');
    sqlTxt.Add('SUBTIPO_C.CD_TIPO_OCORRENCIA,');
    sqlTxt.Add('SUBTIPO_C.CD_SUBTIPO_OCORRENCIA,');
    sqlTxt.Add('SUBTIPO_C.CD_CAUSA');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_SUBTIPO_CAUSA SUBTIPO_C');
    sqlTxt.Add('JOIN GAMSAC.DC_SAC_CAUSA CAUSA ON SUBTIPO_C.CD_CAUSA = CAUSA.CD_CAUSA AND CAUSA.CD_CAUSA > 0');
    sqlTxt.Add('JOIN GAMSAC.DC_SAC_TIPO_OCORRENCIA TIPO_OC ON SUBTIPO_C.CD_TIPO_OCORRENCIA = TIPO_OC.CD_TIPO_OCORRENCIA');
    sqlTxt.Add('JOIN GAMSAC.DC_SAC_SUBTIPO_OCORRENCIA SUBTIPO_OC ON SUBTIPO_C.CD_SUBTIPO_OCORRENCIA = SUBTIPO_OC.CD_SUBTIPO_OCORRENCIA');
    sqlTxt.Add(' AND SUBTIPO_C.CD_TIPO_OCORRENCIA = SUBTIPO_OC.CD_TIPO_OCORRENCIA');
    sqlTxt.Add('WHERE SUBTIPO_C.CD_SUBTIPO_CAUSA > 0');
    if codigo > 0 then
      sqlTxt.Add('AND CD_SOLUCAO = :CODIGO');
    sqlTxt.Add('ORDER BY SUBTIPO_C.CD_SUBTIPO_CAUSA');

    sqlGenericaCadastro.Close;
    sqlGenericaCadastro.Fields.Clear;
    sqlGenericaCadastro.DataSet.CommandText:=sqlTxt.Text;

    if codigo > 0 then
      sqlGenericaCadastro.DataSet.ParamByName('CODIGO').AsInteger:=codigo;

    sqlGenericaCadastro.Open;
  finally
    sqlTxt.Free;
  end;
end;

procedure TDM.consultarDadosDepartamento(codigo:integer);
var
  sqlTxt: TStringList;

begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT DEPTO.CD_DEPTO CODIGO, DEPTO.DS_DEPTO DESCRIÇÃO,');
    sqlTxt.Add('USUARIO.NM_USUARIO GERENTE, DEPTO.NR_MATRIC_GERENTE_DEPTO MATRICULA');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_DEPTO DEPTO');
    sqlTxt.Add('JOIN ACESSO.DC_USUARIO USUARIO ON DEPTO.NR_MATRIC_GERENTE_DEPTO = USUARIO.NR_MATRICULA');
    sqlTxt.Add('WHERE DEPTO.CD_DEPTO > 0');
    if codigo > 0 then
      sqlTxt.Add('AND DEPTO.CD_DEPTO = :CODIGO');
    sqlTxt.Add('ORDER BY DEPTO.DS_DEPTO');

    sqlGenericaCadastro.Close;
    sqlGenericaCadastro.Fields.Clear;

    sqlGenericaCadastro.DataSet.CommandText:=sqlTxt.Text;

    if codigo > 0 then
      sqlGenericaCadastro.DataSet.ParamByName('CODIGO').AsInteger:=codigo;

    sqlGenericaCadastro.Open;
  finally
    sqlTxt.Free;
  end;
end;

procedure TDM.consultarDadosAreaDepto(codigo:integer);
var
  sqlTxt: TStringList;

begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT A_DEPTO.CD_AREA_DEPTO CODIGO_AREA, A_DEPTO.CD_DEPTO COD_DEPTO,');
    sqlTxt.Add('A_DEPTO.DS_AREA_DEPTO DESCRIÇÃO, A_DEPTO.QTD_DIAS_SOLUCAO PRAZO,');
    sqlTxt.Add('USUARIO.NM_USUARIO SUPERVISOR, A_DEPTO.NR_MATRIC_GERENTE_AREA,A_DEPTO.CD_AREA_ORIGEM, AREA.DS_AREA_ORIGEM ');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_AREA_DEPTO A_DEPTO');
    sqlTxt.Add('JOIN ACESSO.DC_USUARIO USUARIO ON A_DEPTO.NR_MATRIC_GERENTE_AREA = USUARIO.NR_MATRICULA');
    sqlTxt.Add('JOIN GAMSAC.DC_SAC_AREA_ORIGEM_OCORRENCIA AREA ON A_DEPTO.CD_AREA_ORIGEM = AREA.CD_AREA_ORIGEM');
    sqlTxt.Add('WHERE A_DEPTO.CD_DEPTO > 0');
    if codigo > 0 then
      sqlTxt.Add('AND A_DEPTO.CD_AREA_DEPTO = :CODIGO');
    sqlTxt.Add('ORDER BY A_DEPTO.DS_AREA_DEPTO');

    sqlGenericaCadastro.Close;
    sqlGenericaCadastro.Fields.Clear;
    sqlGenericaCadastro.DataSet.CommandText:=sqlTxt.Text;

    if codigo > 0 then
      sqlGenericaCadastro.DataSet.ParamByName('CODIGO').AsInteger:=codigo;

    sqlGenericaCadastro.Open;

  finally
    sqlTxt.Free;
  end;
end;

procedure TDM.consultarDadosSolucionador(nrMatricula:integer);
var
  sqlTxt: TStringList;

begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT SOLUC.NR_MATRIC_SOLUCIONADOR CODIGO, SOLUC.NM_SOLUCIONADOR NOME, ');
    sqlTxt.Add('SOLUC.DS_EMAIL EMAIL, SOLUC.ID_ATIVO, SOLUC.CD_DEPTO COD_DEPTO,');
    sqlTxt.Add('SOLUC.CD_AREA_DEPTO COD_AREA_DEPTO');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_SOLUCIONADOR SOLUC');
    sqlTxt.Add('WHERE SOLUC.NR_MATRIC_SOLUCIONADOR > 0');
    if nrMatricula > 0 then
      sqlTxt.Add('AND SOLUC.NR_MATRIC_SOLUCIONADOR = :CODIGO');
    sqlTxt.Add('ORDER BY SOLUC.NM_SOLUCIONADOR');

    sqlGenericaCadastro.Close;
    sqlGenericaCadastro.Fields.Clear;
    sqlGenericaCadastro.DataSet.CommandText:=sqlTxt.Text;

    if nrMatricula > 0 then
      sqlGenericaCadastro.DataSet.ParamByName('CODIGO').AsInteger:=nrMatricula;

    sqlGenericaCadastro.Open;
  finally
    sqlTxt.Free;
  end;
end;




procedure TDM.consultarMotivoCancelamento(PnrMotivo:integer);
var
  sqlTxt: TStringList;

begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT');
    sqlTxt.Add('CD_SAC_MOTIVO_CANCELAMENTO CODIGO, DS_SAC_MOTIVO_CANCELAMENTO DESCRIÇÃO, DT_ATUALIZACAO , NM_USUARIO');
    sqlTxt.Add('FROM  GAMSAC.DC_SAC_MOTIVO_CANCELAMENTO');
    sqlTxt.Add('WHERE CD_SAC_MOTIVO_CANCELAMENTO > 0');
    if PnrMotivo > 0 then
      sqlTxt.Add('AND CD_SAC_MOTIVO_CANCELAMENTO= :PnrMotivo');
    sqlTxt.Add('ORDER BY DS_SAC_MOTIVO_CANCELAMENTO');

    sqlGenericaCadastro.Close;
    sqlGenericaCadastro.Fields.Clear;
    sqlGenericaCadastro.DataSet.CommandText:=sqlTxt.Text;

    if PnrMotivo > 0 then
      sqlGenericaCadastro.DataSet.ParamByName('CODIGO').AsInteger:=PnrMotivo;

    sqlGenericaCadastro.Open;
  finally
    sqlTxt.Free;
  end;
end;


{ cadastrar causa X subTipo de Ocorrencia }
procedure TDM.cadastrarCausaXSubTipoOcorrencia;
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('INSERT INTO GAMSAC.DC_SAC_SUBTIPO_CAUSA ');
    sqlTxt.Add('(CD_SUBTIPO_CAUSA, CD_TIPO_OCORRENCIA, CD_SUBTIPO_OCORRENCIA, CD_CAUSA)');
    sqlTxt.Add('VALUES');
    sqlTxt.Add('(:CD_SUBTIPO_CAUSA, :CD_TIPO_OCORRENCIA, :CD_SUBTIPO_OCORRENCIA, :CD_CAUSA)');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_SUBTIPO_CAUSA').AsInteger:=cdSubTipocausa;
      sqlQuery.ParamByName('CD_TIPO_OCORRENCIA').AsInteger:=cdTipoOcorrencia;
      sqlQuery.ParamByName('CD_SUBTIPO_OCORRENCIA').AsInteger:=cdSubTipoOcorrencia;
      sqlQuery.ParamByName('CD_CAUSA').AsInteger:=cdCausa;
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao cadastrar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.gravarRecorrencia;
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;

begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('INSERT INTO GAMSAC.DC_SAC_RECORRENCIA ');
    sqlTxt.Add('(CD_OCORRENCIA, CD_ITEM_OCORRENCIA, CD_RECORRENCIA, DS_RECORRENCIA, DT_RECORRENCIA, ID_TIPO_RECORRENCIA, DT_LIMITE_SOLUCAO)');
    sqlTxt.Add('VALUES');
    sqlTxt.Add('(:CD_OCORRENCIA, :CD_ITEM_OCORRENCIA, :CD_RECORRENCIA, :DS_RECORRENCIA, :DT_RECORRENCIA, :ID_TIPO_RECORRENCIA, :DT_LIMITE_SOLUCAO)');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_OCORRENCIA').AsInteger:=recorrencia.cdOcorrencia;
      sqlQuery.ParamByName('CD_ITEM_OCORRENCIA').AsInteger:=recorrencia.cdItem;
      sqlQuery.ParamByName('CD_RECORRENCIA').AsInteger:=recorrencia.cdRecorrencia;
      sqlQuery.ParamByName('DS_RECORRENCIA').AsString:=recorrencia.descRecorrencia;
      sqlQuery.ParamByName('DT_RECORRENCIA').AsDateTime:=recorrencia.dataRecorrencia;
      sqlQuery.ParamByName('ID_TIPO_RECORRENCIA').AsString:=recorrencia.idTipoRecorrencia[1];
      sqlQuery.ParamByName('DT_LIMITE_SOLUCAO').AsDateTime:=recorrencia.dataLimiteSolucao;
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao cadastrar Recorrência. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.excluirRecorrencia;
var
  lTD : TDBXTransaction;
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
  i: Integer;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    lTD:=conexaoProducao.BeginTransaction;

    sqlTxt.Clear;
    sqlTxt.Add('DELETE GAMSAC.DC_SAC_RECORRENCIA');
    sqlTxt.Add('WHERE CD_OCORRENCIA = :CD_OCORRENCIA');
    sqlTxt.Add('AND CD_ITEM_OCORRENCIA = :CD_ITEM_OCORRENCIA');
    sqlTxt.Add('AND CD_RECORRENCIA = :CD_RECORRENCIA');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_OCORRENCIA').AsInteger:=recorrencia.cdOcorrencia;
      sqlQuery.ParamByName('CD_ITEM_OCORRENCIA').AsInteger:=recorrencia.cdItem;
      sqlQuery.ParamByName('CD_RECORRENCIA').AsInteger:=recorrencia.cdRecorrencia;
      i:=sqlQuery.ExecSQL();

      if i <> 1 then
        raise Exception.Create('Erro ao excluir a recorrncia');

      conexaoProducao.CommitFreeAndNil(lTD);

      { verifica recorrencia gravada }
      execConsultaRecorrenciaItem;
    except
      on E:Exception do
      begin
        conexaoProducao.RollbackFreeAndNil(lTD);
        raise Exception.Createfmt('Erro ao Excluir a Recorrência. Detalhes: %s',[E.Message]);
      end;
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.carregarDadosRecorrencia(dsObservacao,idTipoRec:string);
begin
  try
    DM.carregaDataSistema;
    recorrencia.cdOcorrencia:=cdsOcorrenciacdOcorrencia.AsInteger;
    recorrencia.cdItem:=cdsItemOcorrencianrSequencia.AsInteger;
    recorrencia.cdRecorrencia:=getCodigoSequencial('CD_RECORRENCIA','DC_SAC_RECORRENCIA','','');
    recorrencia.descRecorrencia:=Trim(dsObservacao);
    recorrencia.idTipoRecorrencia:=idTipoRec;
    recorrencia.dataRecorrencia:=dadosEmpresa.dataHora;
    recorrencia.dataLimiteSolucao:=cdsItemOcorrenciadataLimite.AsDateTime;
  except
    on E:Exception do
      raise Exception.CreateFmt('Erro ao carregar dados da recorrencia. Detalhes: %s',[E.Message]);
  end;
end;

procedure TDM.cadastrarRecorrencia(dsObservacao,idTipoRec:string);
var
  lTD : TDBXTransaction;
begin
  try
    lTD:=conexaoProducao.BeginTransaction;

    if recorrencia.isRegistrarPendentes then
    begin
      cdsItemOcorrencia.DisableControls;
      cdsItemOcorrencia.First;

      while not DM.cdsItemOcorrencia.Eof do
      begin
        if cdsItemOcorrenciacdStatusSolucao.AsInteger = 1 then
        begin
          { carregar dados }
          carregarDadosRecorrencia(dsObservacao,idTipoRec);
          { gravar }
          gravarRecorrencia;
        end;
        cdsItemOcorrencia.Next;
      end;
      cdsItemOcorrencia.EnableControls;
    end
    else
    begin
      { carregar dados }
      carregarDadosRecorrencia(dsObservacao,idTipoRec);
      { gravar }
      gravarRecorrencia;
    end;
    conexaoProducao.CommitFreeAndNil(lTD);
  except
    on E:Exception do
    begin
      conexaoProducao.RollbackFreeAndNil(lTD);
      raise Exception.Createfmt('Erro ao gravar Recorrencia %s',[E.Message]);
    end;
  end;
end;

procedure TDM.consultarDadosSetorPesquisaSatisfacao;
var
  sqlTxt: TStringList;

begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('');
    sqlGenericaCadastro.Close;
    //sqlGenericaCadastro.DataSet.CommandText:=sqlTxt.Text;
    //sqlGenericaCadastro.Open;
  finally
    sqlTxt.Free;
  end;
end;

procedure TDM.consultarDadosPerguntaPesquisaSatisfacao;
var
  sqlTxt: TStringList;

begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('');
    sqlGenericaCadastro.Close;
    //sqlGenericaCadastro.DataSet.CommandText:=sqlTxt.Text;
    //sqlGenericaCadastro.Open;
  finally
    sqlTxt.Free;
  end;
end;

procedure TDM.consultarDadosPesquisaSatisfacao;
var
  sqlTxt: TStringList;

begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('');
    sqlGenericaCadastro.Close;
    //sqlGenericaCadastro.DataSet.CommandText:=sqlTxt.Text;
    //sqlGenericaCadastro.Open;
  finally
    sqlTxt.Free;
  end;
end;

procedure TDM.consultarListaDeConferente;
begin
  try
    sqlListaDeConferente.Close;
    sqlListaDeConferente.Open;
  except
    on E:Exception do
      raise Exception.Createfmt('Erro ao consultar lista de conferentes. Detalhes: %s',[E.Message]);
  end;
end;

function TDM.getEmailSolucionador(nrMatricula,nomeSolucionador:string):string;
begin
  Result:=nomeSolucionador;
  cdsSolucionador.Open;
  cdsSolucionador.First;
  cdsSolucionador.Filtered:=false;
  if nrMatricula <> EmptyStr then
    cdsSolucionador.Filter:=Format('NR_MATRIC_SOLUCIONADOR = %s',[nrMatricula]);
  if nomeSolucionador <> EmptyStr then
    cdsSolucionador.Filter:='NM_SOLUCIONADOR LIKE '+ QuotedStr(nomeSolucionador + '%');

  cdsSolucionador.Filtered:=true;

  if not cdsSolucionador.IsEmpty then
    Result:=cdsSolucionador.FieldByName('DS_EMAIL_SOLUCIONADOR').AsString;
end;

function TDM.getEmailExtra(nomeSolucionador:string):string;
begin
  Result:=nomeSolucionador;
  cdsListaEmailUsuario.Open;
  cdsListaEmailUsuario.First;
  cdsListaEmailUsuario.Filtered:=false;
  cdsListaEmailUsuario.Filter:='NM_USUARIO LIKE '+ QuotedStr(nomeSolucionador + '%');

  cdsListaEmailUsuario.Filtered:=true;

  if not cdsListaEmailUsuario.IsEmpty then
    Result:=cdsListaEmailUsuario.FieldByName('DS_EMAIL').AsString;
end;

procedure TDM.excluirItemOcorrencia;
begin
  try
    cdsItemOcorrencia.Delete;
    { arrumar sequencial dos itens }
    reprocessarSequenciaItemOcorrencia;
  except
    on E:Exception do
      raise Exception.Createfmt('Erro ao excluir o item',[E.Message]);
  end;
end;

procedure TDM.reprocessarSequenciaItemOcorrencia;
var
  i:integer;
begin
  cdsItemOcorrencia.First;
  i:=0;
  while not cdsItemOcorrencia.Eof do
  begin
    cdsItemOcorrencia.Edit;
    inc(i);
    cdsItemOcorrencia.FieldByName('nrSequencia').AsInteger:=i;
    cdsItemOcorrencia.Post;

    cdsItemOcorrencia.Next;
  end;
end;

procedure TDM.ordenarDadosRelatorio(idOrdenacao: integer);
begin
  cdsGeradorRelatorio.Filtered:=False;
  case idOrdenacao of
    0 : cdsGeradorRelatorio.IndexFieldNames:='dataRegistro; cdTipoOcorrencia; cdSubTipoOcorrencia; cdSolucao';
    1 : cdsGeradorRelatorio.IndexFieldNames:='dataRegistro; cdTipoOcorrencia; cdSolucao';
    2 : cdsGeradorRelatorio.IndexFieldNames:='dataRegistro; cdTipoOcorrencia; cdCausa';
  end;
  cdsGeradorRelatorio.Filtered:=True;
end;

procedure TDM.carregarDataSetGeradorRelatorio;
begin
  cdsGeradorRelatorio.Close;
  cdsGeradorRelatorio.CreateDataSet;

  if not cdsGeradorRelatorio.Active then
    cdsGeradorRelatorio.Open;

  while not sqlRelatorio.Eof do
  begin
    cdsGeradorRelatorio.Append;
    cdsGeradorRelatorio.FieldByName('dataRegistro').AsString:=sqlRelatorio.FieldByName('dataRegistro').AsString;
    cdsGeradorRelatorio.FieldByName('cdTipoOcorrencia').AsInteger:=sqlRelatorio.FieldByName('cdTipoOcorrencia').AsInteger;
    cdsGeradorRelatorio.FieldByName('cdSubTipoOcorrencia').AsInteger:=sqlRelatorio.FieldByName('cdSubTipoOcorrencia').AsInteger;
    cdsGeradorRelatorio.FieldByName('cdSolucao').AsInteger:=sqlRelatorio.FieldByName('cdSolucao').AsInteger;
    cdsGeradorRelatorio.FieldByName('cdCausa').AsInteger:=sqlRelatorio.FieldByName('cdCausa').AsInteger;
    cdsGeradorRelatorio.FieldByName('dsTipoOcorrencia').AsString:=sqlRelatorio.FieldByName('dsTipoOcorrencia').AsString;
    cdsGeradorRelatorio.FieldByName('dsSubTipoOcorrencia').AsString:=sqlRelatorio.FieldByName('dsSubTipoOcorrencia').AsString;
    cdsGeradorRelatorio.FieldByName('dsSolucao').AsString:=sqlRelatorio.FieldByName('dsSolucao').AsString;
    cdsGeradorRelatorio.FieldByName('dsCausa').AsString:=sqlRelatorio.FieldByName('dsCausa').AsString;
    cdsGeradorRelatorio.FieldByName('idExisteFilmagem').AsString:=sqlRelatorio.FieldByName('idExisteFilmagem').AsString;
    cdsGeradorRelatorio.FieldByName('idFilmagemVisivel').AsString:=sqlRelatorio.FieldByName('idFilmagemVisivel').AsString;
    cdsGeradorRelatorio.FieldByName('idConfereEstoque').AsString:=sqlRelatorio.FieldByName('idConfereEstoque').AsString;
    cdsGeradorRelatorio.FieldByName('idSituacaoEstoque').AsString:=sqlRelatorio.FieldByName('idSituacaoEstoque').AsString;
    cdsGeradorRelatorio.FieldByName('idGravacaoTlv').AsString:=sqlRelatorio.FieldByName('idGravacaoTlv').AsString;
    cdsGeradorRelatorio.FieldByName('idAtendimentoCorreto').AsString:=sqlRelatorio.FieldByName('idAtendimentoCorreto').AsString;
    cdsGeradorRelatorio.Post;
    sqlRelatorio.Next;
  end;
end;

procedure TDM.gerarRelatorioDeRecorrencia(dataInicial,dataFinal: TDate);
var
  sqlTxt: TStringList;

begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT SOL_SOL.NM_SOLUCIONADOR SOLUCIONADOR, SOL_GER.NM_SOLUCIONADOR GERENTE, Count(CD_RECORRENCIA) TOTAL');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_RECORRENCIA REC');
    sqlTxt.Add('JOIN GAMSAC.DC_SAC_ITEM_OCORRENCIA OC ON REC.CD_OCORRENCIA = OC.CD_OCORRENCIA');
    sqlTxt.Add('JOIN GAMSAC.DC_SAC_SOLUCIONADOR SOL_SOL ON OC.NR_MATRIC_SOLUCIONADOR = SOL_SOL.NR_MATRIC_SOLUCIONADOR');
    sqlTxt.Add('JOIN GAMSAC.DC_SAC_SOLUCIONADOR SOL_GER ON OC.NR_MATRIC_GERENTE_SOLUCIONADOR = SOL_GER.NR_MATRIC_SOLUCIONADOR');
    sqlTxt.Add('WHERE REC.DT_RECORRENCIA BETWEEN :DT_INICIAL AND :DT_FINAL ');
    sqlTxt.Add('GROUP BY SOL_SOL.NM_SOLUCIONADOR, SOL_GER.NM_SOLUCIONADOR');
    sqlTxt.Add('ORDER BY TOTAL DESC');

    sqlRelatorio.Close;
    sqlRelatorio.DataSet.CommandText:=sqlTxt.Text;
    sqlRelatorio.DataSet.ParamByName('DT_INICIAL').AsString:=FormatDateTime('DD/MM/YYYY',dataInicial);
    sqlRelatorio.DataSet.ParamByName('DT_FINAL').AsString:=FormatDateTime('DD/MM/YYYY',dataFinal);
    sqlRelatorio.Open;
  finally
    sqlTxt.Free;
  end;
end;

procedure TDM.gerarRelatorioListaSolucaoCadastrada(cdTipoOc,cdSubTipoOc:integer);
var
  sqlTxt: TStringList;

begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT TIPO.CD_TIPO_OCORRENCIA, NM_TIPO_OCORRENCIA, SUBTIPO.CD_SUBTIPO_OCORRENCIA,');
    sqlTxt.Add('NM_SUBTIPO_OCORRENCIA,CD_SUBTIPO_SOLUCAO,  SOLUCAO.CD_SOLUCAO , DS_SOLUCAO');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_TIPO_OCORRENCIA TIPO');
    sqlTxt.Add('JOIN GAMSAC.DC_SAC_SUBTIPO_OCORRENCIA SUBTIPO ON  TIPO.CD_TIPO_OCORRENCIA = SUBTIPO.CD_TIPO_OCORRENCIA');
    sqlTxt.Add('LEFT OUTER JOIN GAMSAC.DC_SAC_SUBTIPO_SOLUCAO SUBTIPO_SOLUCAO ON SUBTIPO.CD_TIPO_OCORRENCIA = SUBTIPO_SOLUCAO.CD_TIPO_OCORRENCIA');
    sqlTxt.Add('  AND SUBTIPO.CD_SUBTIPO_OCORRENCIA = SUBTIPO_SOLUCAO.CD_SUBTIPO_OCORRENCIA');
    sqlTxt.Add('LEFT OUTER JOIN GAMSAC.DC_SAC_SOLUCAO SOLUCAO ON SUBTIPO_SOLUCAO.CD_SOLUCAO = SOLUCAO.CD_SOLUCAO');
    sqlTxt.Add('WHERE TIPO.ID_ATIVO = ''S'' ');
    if cdTipoOc > 0 then
      sqlTxt.Add('AND TIPO.CD_TIPO_OCORRENCIA = :CD_TIPO');
    if cdSubTipoOc > 0 then
      sqlTxt.Add('AND SUBTIPO.CD_SUBTIPO_OCORRENCIA = :CD_SUBTIPO');
    sqlTxt.Add('ORDER BY TIPO.NM_TIPO_OCORRENCIA');


    sqlRelatorio.Close;
    sqlRelatorio.DataSet.CommandText:=sqlTxt.Text;
    if cdTipoOc > 0 then
      sqlRelatorio.DataSet.ParamByName('CD_TIPO').AsInteger:=cdTipoOc;
    if cdSubTipoOc > 0 then
      sqlRelatorio.DataSet.ParamByName('CD_SUBTIPO').AsInteger:=cdSubTipoOc;
    sqlRelatorio.Open;
  finally
    sqlTxt.Free;
  end;
end;

procedure TDM.gerarRelatorioListaCausaCadastrada(cdTipoOc,cdSubTipoOc:integer);
var
  sqlTxt: TStringList;

begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT TIPO.CD_TIPO_OCORRENCIA,NM_TIPO_OCORRENCIA , SUBTIPO.CD_SUBTIPO_OCORRENCIA ,');
    sqlTxt.Add('NM_SUBTIPO_OCORRENCIA,CD_SUBTIPO_CAUSA,CAUSA.CD_CAUSA, DS_CAUSA');
    sqlTxt.Add('FROM GAMSAC.DC_SAC_TIPO_OCORRENCIA TIPO');
    sqlTxt.Add('JOIN GAMSAC.DC_SAC_SUBTIPO_OCORRENCIA SUBTIPO ON  TIPO.CD_TIPO_OCORRENCIA = SUBTIPO.CD_TIPO_OCORRENCIA');
    sqlTxt.Add('LEFT OUTER JOIN GAMSAC.DC_SAC_SUBTIPO_CAUSA SUBTIPO_CAUSA ON SUBTIPO.CD_TIPO_OCORRENCIA = SUBTIPO_CAUSA.CD_TIPO_OCORRENCIA');
    sqlTxt.Add(' AND SUBTIPO.CD_SUBTIPO_OCORRENCIA = SUBTIPO_CAUSA.CD_SUBTIPO_OCORRENCIA');
    sqlTxt.Add('LEFT OUTER JOIN GAMSAC.DC_SAC_CAUSA CAUSA ON SUBTIPO_CAUSA.CD_CAUSA = CAUSA.CD_CAUSA');
    sqlTxt.Add('WHERE TIPO.ID_ATIVO = ''S'' ');
    if cdTipoOc > 0 then
      sqlTxt.Add('AND TIPO.CD_TIPO_OCORRENCIA = :CD_TIPO');
    if cdSubTipoOc > 0 then
      sqlTxt.Add('AND SUBTIPO.CD_SUBTIPO_OCORRENCIA = :CD_SUBTIPO');
    sqlTxt.Add('ORDER BY TIPO.NM_TIPO_OCORRENCIA');

    sqlRelatorio.Close;
    sqlRelatorio.DataSet.CommandText:=sqlTxt.Text;
    if cdTipoOc > 0 then
      sqlRelatorio.DataSet.ParamByName('CD_TIPO').AsInteger:=cdTipoOc;
    if cdSubTipoOc > 0 then
      sqlRelatorio.DataSet.ParamByName('CD_SUBTIPO').AsInteger:=cdSubTipoOc;
    sqlRelatorio.Open;
  finally
    sqlTxt.Free;
  end;
end;




procedure TDM.iniciarListaGerente;
begin
  cdsListaGerenteDepto.IndexFieldNames:='NM_GERENTE';
  cdsListaGerenteDepto.Open;
end;

procedure TDM.iniciarListaMotivoCancelamento;
begin
  cdsMotivoCancelamento.IndexFieldNames:='DS_SAC_MOTIVO_CANCELAMENTO';
  cdsMotivoCancelamento.Open;
end;


procedure TDM.iniciarListaSupervisorArea;
begin
  cdsListaSupervisorArea.IndexFieldNames:='NM_SUPERVISOR';
  cdsListaSupervisorArea.Open;
end;

function TDM.getMatriculaGerenteArea(nrMatricSetor:string):integer;
begin
  Result:=0;
  with cdsSolucionador do
  begin
    open;
    First;
    Filtered:=False;
    if Locate('NR_MATRIC_SOLUCIONADOR',UpperCase(nrMatricSetor),[loPartialKey,loCaseInsensitive]) then
      Result:=cdsSolucionadorCD_GERENTE_DEPTO.AsInteger;
  end;
end;

function TDM.getCodigoSubTipoSolucaoFixa(cdTipoOcorrencia,cdSubTipoOcorrencia:string):integer;
begin
  Result:=0;
  cdsSolucao.Open;
  cdsSolucao.First;
  cdsSolucao.Filtered:=false;
  cdsSolucao.Filter:=Format('CD_TIPO_OCORRENCIA = %s AND CD_SUBTIPO_OCORRENCIA = %s',[cdTipoOcorrencia,cdSubTipoOcorrencia]);
  cdsSolucao.Filtered:=true;

  if not cdsSolucao.IsEmpty then
    Result:=cdsSolucao.FieldByName('CD_SUBTIPO_SOLUCAO').AsInteger;
end;

function TDM.getCodigoSubTipoCausaFixa(cdTipoOcorrencia,cdSubTipoOcorrencia:string):integer;
begin
  Result:=0;
  cdsCausa.Open;
  cdsCausa.First;
  cdsCausa.Filtered:=false;
  cdsCausa.Filter:=Format('CD_TIPO_OCORRENCIA = %s AND CD_SUBTIPO_OCORRENCIA = %s',[cdTipoOcorrencia,cdSubTipoOcorrencia]);
  cdsCausa.Filtered:=true;

  if not cdsCausa.IsEmpty then
    Result:=cdsCausa.FieldByName('CD_SUBTIPO_CAUSA').AsInteger;
end;

function TDM.getCNPJCliente(cdCliente:integer):string;
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    Result:='0';
    sqlTxt.Clear;
    sqlTxt.Add('SELECT TO_CHAR(CGCP_C,''FM00000000000000'')CNPJ FROM PRDDM.DCCLI WHERE NROC_C = :CODIGO');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CODIGO').AsInteger:=cdCliente;
      sqlQuery.Open();
      Result:=sqlQuery.FieldByName('CNPJ').AsString;
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao cadastrar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.execCancelarOcorrenciaRegistrada(cdOcorrencia,
                                               nrItem,
                                               PcdMotivoCancelamento:integer;
                                               dsObservacaoCancelamento: WideString);
var
  lTD : TDBXTransaction;

begin
  try
    {iniciar transação}
    lTD := conexaoProducao.BeginTransaction;

    {cancelar item da ocorrencia}
    cancelarItemOcorrenciaRegistrada(cdOcorrencia,nrItem,PcdMotivoCancelamento,dsObservacaoCancelamento);

    {cancelar ocorrencia}
    if nrItem = 0 then
    begin
      cancelarOcorrenciaRegistrada(cdOcorrencia,PcdMotivoCancelamento,dsObservacaoCancelamento);

      {cancelar soluçao/causa}
      cancelarSolucaoCausaItemOcorrenciaRegistrada(cdOcorrencia);
    end;

    {exec commit}
    conexaoProducao.CommitFreeAndNil(lTD);
  except
    on E:Exception do
    begin
      {exec rollback}
      conexaoProducao.RollbackFreeAndNil(lTD);
      raise Exception.CreateFmt('Erro ao cancelar a ocorrência.Detalhes: %s',[E.Message]);
    end;
  end;
end;

procedure TDM.execExcluirOcorrenciaRegistrada(cdOcorrencia:integer);
var
  lTD : TDBXTransaction;

begin
  try
    {iniciar transação}
    lTD := conexaoProducao.BeginTransaction;

    {excluir item}
    excluirItemOcorrenciaRegistrada(cdOcorrencia);

    {excluir ocorrencia}
    excluirOcorrenciaRegistrada(cdOcorrencia);

    {exec commit}
    conexaoProducao.CommitFreeAndNil(lTD);
  except
    on E:Exception do
    begin
      {exec rollback}
      conexaoProducao.RollbackFreeAndNil(lTD);
      raise Exception.CreateFmt('Erro ao excluir a ocorrência.Detalhes: %s',[E.Message]);
    end;
  end;
end;

procedure TDM.cancelarOcorrenciaRegistrada(cdOcorrencia,pcMotivoCancelamento:integer; dsObservacaoCancelamento: WideString);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_OCORRENCIA SET CD_ST_SOLUCAO_OCORRENCIA = :CD_ST_SOLUCAO_OCORRENCIA,');
    sqlTxt.Add('CD_ST_CAUSA_OCORRENCIA = :CD_ST_CAUSA_OCORRENCIA, DS_OCORRENCIA = :DS_OCORRENCIA ');
    sqlTxt.Add('CD_SAC_MOTIVO_CANCELAMENTO = :PCD_SAC_MOTIVO_CANCELAMENTO');
    sqlTxt.Add('WHERE CD_OCORRENCIA = :CD_OCORRENCIA');
    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_OCORRENCIA').AsString:=inttostr(cdOcorrencia);
      sqlQuery.ParamByName('CD_ST_SOLUCAO_OCORRENCIA').AsString:=inttostr(CD_SITUACAO_OCORRENCIA_CANCELADA);
      sqlQuery.ParamByName('CD_ST_CAUSA_OCORRENCIA').AsString:=inttostr(CD_SITUACAO_OCORRENCIA_CANCELADA);
      sqlQuery.ParamByName('PCD_SAC_MOTIVO_CANCELAMENTO').AsBCD:=pcMotivoCancelamento;
      sqlQuery.ParamByName('DS_OCORRENCIA').AsString:=trim(dsObservacaoCancelamento);
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao excluir ocorrência. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.excluirOcorrenciaRegistrada(cdOcorrencia:integer);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('DELETE GAMSAC.DC_SAC_OCORRENCIA');
    sqlTxt.Add('WHERE CD_OCORRENCIA = :CD_OCORRENCIA');
    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_OCORRENCIA').AsString:=inttostr(cdOcorrencia);
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao excluir ocorrência. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.excluirItemOcorrenciaRegistrada(cdOcorrencia:integer);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('DELETE GAMSAC.DC_SAC_ITEM_OCORRENCIA');
    sqlTxt.Add('WHERE CD_OCORRENCIA = :CD_OCORRENCIA');
    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_OCORRENCIA').AsString:=inttostr(cdOcorrencia);
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao excluir item da ocorrência. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.cancelarItemOcorrenciaRegistrada(cdOcorrencia,nrItem,PcdMotivoCancelamento:integer; dsMotivoCancelamento:WideString);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_ITEM_OCORRENCIA');
    sqlTxt.Add(' SET CD_ST_SOLUCAO_ITEM_OCORRENCIA = :CD_ST_SOLUCAO_ITEM_OCORRENCIA');
    sqlTxt.Add(' ,CD_ST_CAUSA_ITEM_OCORRENCIA = :CD_ST_CAUSA_ITEM_OCORRENCIA ');
    sqlTxt.Add(' ,DS_MOTIVO_CANCELAMENTO = :DS_MOTIVO_CANCELAMENTO ');
    sqlTxt.Add(' ,CD_SAC_MOTIVO_CANCELAMENTO= :PCD_SAC_MOTIVO_CANCELAMENTO');
    sqlTxt.Add('WHERE CD_OCORRENCIA = :CD_OCORRENCIA');
    if nrItem > 0 then
      sqlTxt.Add('AND CD_ITEM_OCORRENCIA = :CD_ITEM_OCORRENCIA');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_OCORRENCIA').AsString:=inttostr(cdOcorrencia);
      if nrItem > 0 then
        sqlQuery.ParamByName('CD_ITEM_OCORRENCIA').AsString:=inttostr(nrItem);
      sqlQuery.ParamByName('DS_MOTIVO_CANCELAMENTO').AsString:=UpperCase(dsMotivoCancelamento);
      sqlQuery.ParamByName('CD_ST_SOLUCAO_ITEM_OCORRENCIA').AsString:=inttostr(CD_SITUACAO_OCORRENCIA_CANCELADA);
      sqlQuery.ParamByName('CD_ST_CAUSA_ITEM_OCORRENCIA').AsString:=inttostr(CD_SITUACAO_OCORRENCIA_CANCELADA);
      sqlQuery.ParamByName('PCD_SAC_MOTIVO_CANCELAMENTO').AsBCD:=PcdMotivoCancelamento;

      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao excluir item da ocorrência. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.cancelarSolucaoCausaItemOcorrenciaRegistrada(cdOcorrencia:integer);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('UPDATE GAMSAC.DC_SAC_SOLUCAO_ITEM_OCORRENCIA');
    sqlTxt.Add(' SET DT_SOLUCAO_ITEM_OCORRENCIA = SYSDATE');
    sqlTxt.Add(' ,DT_CAUSA_ITEM_OCORRENCIA = SYSDATE ');
    sqlTxt.Add('WHERE CD_OCORRENCIA = :CD_OCORRENCIA');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_OCORRENCIA').AsString:=inttostr(cdOcorrencia);
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao excluir item da ocorrência. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;


function TDM.getDadosSolucaoItemExcluido:String;
begin
  Result:=format('CD_OCORRENCIA = %d; '+
                 'CD_ITEM_OCORRENCIA = %d; '+
                 'CD_SUBTIPO_CAUSA = %d; '+
                 'CD_SUBTIPO_SOLUCAO = %d; '+
                 'DS_SOLUCAO_ITEM_OCORRENCIA = %s; '+
                 'NM_USUARIO = %s ',
                 [cdsOcorrenciacdOcorrencia.AsInteger,
                 cdsItemOcorrencianrSequencia.AsInteger,
                  cdsSolucaoItemcdSubTipoSolucao.AsInteger,
                  cdsSolucaoItemcdSubTipoCausa.AsInteger,
                  trim(cdsSolucaoItemdsSolucaoItemOcorrencia.AsString),
                  trim(cdsItemOcorrencianomeSolucionador.AsString)
                 ]);
end;

procedure TDM.excluirSolucaoCausaItemOcorrenciaRegistrada(cdOcorrencia,cdItem:integer);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('DELETE GAMSAC.DC_SAC_SOLUCAO_ITEM_OCORRENCIA');
    sqlTxt.Add('WHERE CD_OCORRENCIA = :CD_OCORRENCIA');
    sqlTxt.Add('AND CD_ITEM_OCORRENCIA = :CD_ITEM_OCORRENCIA');
    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_OCORRENCIA').AsString:=inttostr(cdOcorrencia);
      sqlQuery.ParamByName('CD_ITEM_OCORRENCIA').AsString:=inttostr(cdItem);
      sqlQuery.ExecSQL();

      { gravar log }
      //gravarLogProcesso('DC_SAC_SOLUCAO_ITEM_OCORRENCIA',getDadosSolucaoItemExcluido,'REGISTRO EXCLUIDO');
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao excluir ocorrência. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

function TDM.getVersaoSistema:string;
const
  CD_PROGRAMA = '15';
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT DS_VERSAO');
    sqlTxt.Add('FROM PRDDM.DC_CONTROLE_VERSAO');
    sqlTxt.Add('WHERE CD_PROGRAMA = :CODIGO');
    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CODIGO').AsString:=CD_PROGRAMA;
      sqlQuery.Open();
      Result:=sqlQuery.FieldByName('DS_VERSAO').AsString;
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao consultar versão do sistema. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.execReAbrirOcorrencia(isTodosItem:Boolean);
var
  lTD : TDBXTransaction;
begin
  try
    { iniciar transsação }
    lTD := conexaoProducao.BeginTransaction;

    if not isTodosItem then
    begin
      DM.excluirSolucaoCausaItemOcorrenciaRegistrada(cdsOcorrencia.FieldByName('cdOcorrencia').AsInteger,cdsItemOcorrencia.FieldByName('nrSequencia').AsInteger);

      { atualiza local }
      alterarStatusSolucaoItemLocal(CD_SOLUCAO_PENDENTE_OCORRENCIA,True);
      alterarStatusCausaItemLocal(CD_CAUSA_PENDENTE_OCORRENCIA);

      alterarStatusSolucaoOcorrenciaLocal(CD_SOLUCAO_PENDENTE_OCORRENCIA);
      alterarStatusCausaOcorrenciaLocal(CD_CAUSA_PENDENTE_OCORRENCIA);

      { atualiza tabela }
      alterarStatusSolucaoItemOcorrencia(cdsOcorrencia.FieldByName('cdOcorrencia').AsInteger,cdsItemOcorrencia.FieldByName('nrSequencia').AsInteger,CD_SOLUCAO_PENDENTE_ITEM);
      alterarStatusCausaItemOcorrencia(cdsOcorrencia.FieldByName('cdOcorrencia').AsInteger,cdsItemOcorrencia.FieldByName('nrSequencia').AsInteger,CD_CAUSA_PENDENTE_ITEM);
    end
    else
    begin
      cdsItemOcorrencia.First;
      cdsItemOcorrencia.DisableControls;
      while not cdsItemOcorrencia.Eof do
      begin
        if cdsItemOcorrencia.FieldByName('cdStatusSolucao').AsInteger > 1 then
          DM.excluirSolucaoCausaItemOcorrenciaRegistrada(cdsOcorrencia.FieldByName('cdOcorrencia').AsInteger,cdsItemOcorrencia.FieldByName('nrSequencia').AsInteger);

        { atualiza local }
        alterarStatusSolucaoItemLocal(CD_SOLUCAO_PENDENTE_OCORRENCIA,True);
        alterarStatusCausaItemLocal(CD_CAUSA_PENDENTE_OCORRENCIA);

        alterarStatusSolucaoOcorrenciaLocal(CD_SOLUCAO_PENDENTE_OCORRENCIA);
        alterarStatusCausaOcorrenciaLocal(CD_CAUSA_PENDENTE_OCORRENCIA);

        { atualiza tabela }
        alterarStatusSolucaoItemOcorrencia(cdsOcorrencia.FieldByName('cdOcorrencia').AsInteger,cdsItemOcorrencia.FieldByName('nrSequencia').AsInteger,CD_SOLUCAO_PENDENTE_ITEM);
        alterarStatusCausaItemOcorrencia(cdsOcorrencia.FieldByName('cdOcorrencia').AsInteger,cdsItemOcorrencia.FieldByName('nrSequencia').AsInteger,CD_CAUSA_PENDENTE_ITEM);

        cdsItemOcorrencia.Next;
      end;
      cdsItemOcorrencia.EnableControls;
    end;

    atualizarStatusSolucaoOcorrencia(False,True);
    atualizarStatusCausaOcorrencia(False,True);

    { Se terminar normalmente executa commit }
    conexaoProducao.CommitFreeAndNil(lTD);
  except
    on E:Exception do
    begin
      { Se der problema executa roolback em todos os processos }
      conexaoProducao.RollbackFreeAndNil(lTD);

      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TDM.gravarLogProcesso(dsTabela,dsInformacaoAnterior,dsAlteracao:string);
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('INSERT INTO GAMSAC.DC_SAC_SOLUCAO_ITEM_OCORRENCIA ');
    sqlTxt.Add(' (SQ_SAC_LOG, NM_TABELA, DS_INFORMACAO_ANTERIOR, DS_INFORMACAO_ATUAL, CD_USUARIO, DT_ATUALIZACAO)');
    sqlTxt.Add('VALUES');
    sqlTxt.Add(' (:SQ_SAC_LOG, :NM_TABELA, :DS_INFORMACAO_ANTERIOR, :DS_INFORMACAO_ATUAL, :CD_USUARIO, :DT_ATUALIZACAO)');
    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('SQ_SAC_LOG').AsString:='1';
      sqlQuery.ParamByName('NM_TABELA').AsString:=dsTabela;
      sqlQuery.ParamByName('DS_INFORMACAO_ANTERIOR').AsString:=dsInformacaoAnterior;
      sqlQuery.ParamByName('DS_INFORMACAO_ATUAL').AsString:=dsAlteracao;
      sqlQuery.ParamByName('CD_USUARIO').AsString:=usuario.login;
      sqlQuery.ParamByName('DT_ATUALIZACAO').AsString:='SYSDATE';
      sqlQuery.ExecSQL();
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao inserir registro de log. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

procedure TDM.carregarListaDeEntregador(cdSetor:string);
begin
  try
    sqlListaEntregador.Close;
    sqlListaEntregador.DataSet.ParamByName('SETOR').AsString:=cdSetor;
    sqlListaEntregador.Open;
  except
    on E:Exception do
      raise Exception.CreateFmt('Erro ao carregar lista de entregadores. Detalhes: %s',[E.Message]);
  end;
end;

function TDM.getInfRegistroDeRecallDoLote(cdMercadoria:integer; dsLote: string) : TRecallLote;
var
  sqlData : TSimpleDataSet;
  sqlTxt : TStringList;
  infRecall: TRecallLote;
begin
  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  sqlTxt.Clear;

  infRecall.limparDados;
  try
    try
      sqlTxt.Add('SELECT CD_RECALL_MERCADORIA,DT_AVISO_RECALL_MERCADORIA,DT_RETORNO_FABRICANTE,');
      sqlTxt.Add(' DS_MOTIVO_RECALL_MERCADORIA,RC.NM_USUARIO,RC.DT_ATUALIZACAO');
      sqlTxt.Add('FROM PRDDM.DC_RECALL_MERCADORIA RC, PRDDM.DC_MOTIVO_RECALL_MERCADORIA MR');
      sqlTxt.Add('WHERE RC.CD_MOTIVO_RECALL_MERCADORIA = MR.CD_MOTIVO_RECALL_MERCADORIA');
      sqlTxt.Add(' AND CD_MERCADORIA = :CD_MERCADORIA');
      sqlTxt.Add(' AND DS_LOTE_RECALL_MERCADORIA LIKE :DS_LOTE_RECALL_MERCADORIA');
      sqlTxt.Add('ORDER BY CD_RECALL_MERCADORIA DESC');

      sqlData.Close;
      sqlData.DataSet.CommandText:=sqlTxt.Text;
      sqlData.DataSet.ParamByName('CD_MERCADORIA').AsString:=IntToStr(cdMercadoria);
      sqlData.DataSet.ParamByName('DS_LOTE_RECALL_MERCADORIA').AsString:=Trim(dsLote);
      sqlData.Open;

      if not sqlData.IsEmpty then
      begin
        infRecall.cdRecall:=sqlData.FieldByName('CD_RECALL_MERCADORIA').AsInteger;
        infRecall.dtAvisoRecall:=sqlData.FieldByName('DT_AVISO_RECALL_MERCADORIA').AsDateTime;
        infRecall.dtRetornoFabricRecall:=sqlData.FieldByName('DT_RETORNO_FABRICANTE').AsDateTime;
        infRecall.dsMotivoRecall:=UpperCase(Trim(sqlData.FieldByName('DS_MOTIVO_RECALL_MERCADORIA').AsString));
        infRecall.nmUsuarioRegistro:=sqlData.FieldByName('NM_USUARIO').AsString;
        infRecall.dtRegistro:=sqlData.FieldByName('DT_ATUALIZACAO').AsDateTime;
      end;

      Result:=infRecall;
    except
      on E:Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    sqlData.Close;
    sqlData.Free;
    sqlTxt.Free;
  end;
end;

function TDM.getEmailDoDestinatario(cdIdenticadorDestinatario,cdTipoDestinatario,cdCategoriaEmail:integer):string;
var
  sqlQuery: TSQLQuery;
  sqlTxt : TStringList;
begin
  sqlQuery:=TSQLQuery.Create(nil);
  sqlQuery.SQLConnection:=conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    Result:='';
    sqlTxt.Clear;
    sqlTxt.Add('SELECT ds_endereco_email');
    sqlTxt.Add('FROM PRDDM.DC_EMAIL');
    sqlTxt.Add('WHERE CD_TIPO_DESTINATARIO_EMAIL = :CD_TIPO_DESTINATARIO_EMAIL');
    sqlTxt.Add(' AND CD_CATEGORIA_EMAIL = :CD_CATEGORIA_EMAIL');
    sqlTxt.Add(' AND CD_DESTINATARIO_EMAIL = :CD_DESTINATARIO_EMAIL');

    try
      sqlQuery.Close;
      sqlQuery.SQL.Text:=sqlTxt.Text;
      sqlQuery.ParamByName('CD_TIPO_DESTINATARIO_EMAIL').AsString:=IntToStr(cdTipoDestinatario);
      sqlQuery.ParamByName('CD_CATEGORIA_EMAIL').AsString:=IntToStr(cdCategoriaEmail);
      sqlQuery.ParamByName('CD_DESTINATARIO_EMAIL').AsString:=IntToStr(cdIdenticadorDestinatario);
      sqlQuery.Open();
      Result:=LowerCase((sqlQuery.FieldByName('ds_endereco_email').AsString));
    except
      on E:Exception do
        raise Exception.Createfmt('Erro ao cadastrar informação. Detalhes: %s',[E.Message]);
    end;
  finally
    sqlTxt.Free;
    sqlQuery.Close;
    sqlQuery.Free;
  end;
end;

end.










