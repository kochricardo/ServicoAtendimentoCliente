object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 752
  Width = 934
  object conexaoProducao: TSQLConnection
    ConnectionName = 'RAC'
    DriverName = 'ORACLE'
    GetDriverFunc = 'getSQLDriverORACLE'
    LibraryName = 'dbxora.dll'
    LoginPrompt = False
    Params.Strings = (
      'drivername=ORACLE'
      'database=RAC'
      'user_name=prddm'
      'Password=sidm'
      'blobsize=-1'
      'localecode=0000'
      'isolationlevel=ReadCommitted'
      'rowsetsize=20'
      'os authentication=False'
      'multiple transaction=False'
      'trim char=False'
      'decimal separator=.')
    VendorLib = 'oci.dll'
    AfterConnect = conexaoProducaoAfterConnect
    Connected = True
    Left = 96
    Top = 24
  end
  object conexaoHistorico: TSQLConnection
    ConnectionName = 'SIHST'
    DriverName = 'ORACLE'
    GetDriverFunc = 'getSQLDriverORACLE'
    LibraryName = 'dbxora.dll'
    LoginPrompt = False
    Params.Strings = (
      'drivername=ORACLE'
      'Database=SIHST'
      'User_Name=PRDDM'
      'Password=sidm'
      'blobsize=-1'
      'localecode=0000'
      'isolationlevel=ReadCommitted'
      'rowsetsize=20'
      'os authentication=False'
      'multiple transaction=False'
      'trim char=False'
      'decimal separator=.')
    VendorLib = 'oci.dll'
    AfterConnect = conexaoHistoricoAfterConnect
    Left = 208
    Top = 24
  end
  object sqlConsultaFilaLigacao: TSimpleDataSet
    Aggregates = <>
    Connection = conexaoProducao
    DataSet.CommandText = 
      'SELECT DISTINCT CD_LOG_LIGACAO ID, SAC.NR_TELEFONE TELEFONE, DT_' +
      'LIGACAO HORARIO, Nvl(NROC_C||DIGC_C,0) CODIGO, Nvl(NOMP_P,'#39'SEM I' +
      'DENTIFICACAO'#39') RAZAO_SOCIAL'#13#10'FROM PRDDM.DC_SAC_LOG_LIGACAO SAC'#13#10 +
      'LEFT OUTER JOIN PRDDM.DC_TELEFONE_CLIENTE FONE ON FONE.NR_TELEFO' +
      'NE = SAC.NR_TELEFONE '#13#10'LEFT OUTER JOIN PRDDM.DCCLI CLIENTE ON CL' +
      'IENTE.NROC_C = FONE.NR_CLIENTE AND CLIENTE.ID_SITUACAO_CLIENTE =' +
      ' '#39'A'#39#13#10'LEFT OUTER JOIN PRDDM.DCPES PES ON PES.CGCP_P = CLIENTE.CG' +
      'CP_C'#13#10'WHERE CD_TIPO_ATENDIMENTO = :CD_TIPO_ATENDIMENTO'#13#10'AND  TRU' +
      'NC(SAC.DT_LIGACAO) = TRUNC(SYSDATE)'#13#10'ORDER BY CD_LOG_LIGACAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'CD_TIPO_ATENDIMENTO'
        ParamType = ptInput
      end>
    Params = <>
    Left = 48
    Top = 104
    object sqlConsultaFilaLigacaoID: TFMTBCDField
      FieldName = 'ID'
      Required = True
      Precision = 6
      Size = 0
    end
    object sqlConsultaFilaLigacaoTELEFONE: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      Size = 10
    end
    object sqlConsultaFilaLigacaoHORARIO: TSQLTimeStampField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Required = True
    end
    object sqlConsultaFilaLigacaoCODIGO: TWideStringField
      FieldName = 'CODIGO'
      Size = 80
    end
    object sqlConsultaFilaLigacaoRAZAO_SOCIAL: TWideStringField
      DisplayLabel = 'Razao Social'
      FieldName = 'RAZAO_SOCIAL'
      Size = 40
    end
  end
  object dsConsultaFilaLigacao: TDataSource
    DataSet = sqlConsultaFilaLigacao
    Left = 168
    Top = 104
  end
  object sqlControleLigacao: TSimpleDataSet
    Aggregates = <>
    Connection = conexaoProducao
    DataSet.CommandText = 
      'SELECT  LIGACAO.CD_TIPO_ATENDIMENTO,TIPO.DS_TIPO_ATENDIMENTO, Co' +
      'unt(*) TOTAL'#13#10'FROM PRDDM.DC_SAC_LOG_LIGACAO LIGACAO'#13#10'JOIN PRDDM.' +
      'DC_SAC_TIPO_ATENDIMENTO TIPO ON TIPO.CD_TIPO_ATENDIMENTO = LIGAC' +
      'AO.CD_TIPO_ATENDIMENTO'#13#10'JOIN ACESSO.DC_EMPRESA EMP ON Trunc(LIGA' +
      'CAO.DT_LIGACAO) = EMP.DT_PEDIDO AND EMP.CD_EMPRESA  = 1'#13#10'GROUP B' +
      'Y  LIGACAO.CD_TIPO_ATENDIMENTO,TIPO.DS_TIPO_ATENDIMENTO'#13#10'ORDER B' +
      'Y TIPO.DS_TIPO_ATENDIMENTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 48
    Top = 168
    object sqlControleLigacaoCD_TIPO_ATENDIMENTO: TFMTBCDField
      FieldName = 'CD_TIPO_ATENDIMENTO'
      Required = True
      Precision = 6
      Size = 0
    end
    object sqlControleLigacaoDS_TIPO_ATENDIMENTO: TWideStringField
      DisplayLabel = 'Tipo de Atendimento'
      FieldName = 'DS_TIPO_ATENDIMENTO'
    end
    object sqlControleLigacaoTOTAL: TFMTBCDField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      Precision = 32
    end
  end
  object dsControleLigacao: TDataSource
    DataSet = sqlControleLigacao
    Left = 168
    Top = 168
  end
  object sqlConsultaCliente: TSimpleDataSet
    Aggregates = <>
    Connection = conexaoProducao
    DataSet.CommandText = 
      'SELECT CLIENTE.NROC_C,CLIENTE.DIGC_C,CLIENTE.TIPC_C,CLIENTE.CANC' +
      '_C,PESSOA.NOMP_P,'#13#10'    PESSOA.MUNP_P,PESSOA.UFEP_P,CLIENTE.DUCC_' +
      'C,CLIENTE.CD_EMPRESA_ESTOQUE,'#13#10'    PESSOA.DVAP_P,CLIENTE.NROV_C,' +
      'CLIENTE.ID_SITUACAO_CLIENTE, PESSOA.CGCP_P,SETOR.NOMV_V,DS_LOGRA' +
      'DOURO,NR_LOGRADOURO,NM_BAIRRO,NM_CIDADE,ID_ESTADO,'#13#10'    ENTREGA.' +
      'CD_ENTREGA ENTREGADOR, ENTREGA.DS_ETIQUETA ETIQUETA,ENTREGA.CD_T' +
      'RANSPORTADOR,'#13#10'    PESSOA.ENDP_P ,CLIENTE.NM_EMAIL_NFE DS_EMAIL_' +
      'NFE_PRINCIPAL,'#13#10'    CLIENTE.NM_EMAIL_NFE_COPIA DS_EMAIL_NFE_COPI' +
      'A,Round(CLIENTE.NROV_C / 100) * 100 DISTRITO, '#13#10'    '#39' '#39' DS_EMAIL' +
      '_SAC, '#39' '#39' NM_CONTATO_SAC, '#39'0'#39' NR_TELEFONE'#13#10'FROM PRDDM.DCCLI CLIE' +
      'NTE '#13#10'JOIN PRDDM.DCPES PESSOA ON CLIENTE.CGCP_C = PESSOA.CGCP_P ' +
      #13#10'JOIN PRDDM.DC_ENDERECO_CLIENTE ENDERECO ON CLIENTE.NROC_C = EN' +
      'DERECO.CD_CLIENTE'#13#10'JOIN PRDDM.DCVEN SETOR ON CLIENTE.NROV_C = SE' +
      'TOR.NROV_V '#13#10'JOIN GAMFRETE.DC_ENTREGA ENTREGA ON CLIENTE.CD_ENTR' +
      'EGA_CAMINHAO_SECUNDARIO = ENTREGA.CD_ENTREGA'#13#10'WHERE NROC_C = 1'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 48
    Top = 232
    object sqlConsultaClienteNROC_C: TFMTBCDField
      DisplayLabel = 'Codigo'
      FieldName = 'NROC_C'
      Required = True
      Precision = 6
      Size = 0
    end
    object sqlConsultaClienteDIGC_C: TFMTBCDField
      DisplayLabel = 'Digito'
      FieldName = 'DIGC_C'
      Required = True
      Precision = 1
      Size = 0
    end
    object sqlConsultaClienteNOMP_P: TWideStringField
      DisplayLabel = 'Razao Social'
      FieldName = 'NOMP_P'
      Required = True
      FixedChar = True
      Size = 40
    end
    object sqlConsultaClienteMUNP_P: TWideStringField
      DisplayLabel = 'Cidade'
      FieldName = 'MUNP_P'
      Required = True
      FixedChar = True
    end
    object sqlConsultaClienteUFEP_P: TWideStringField
      DisplayLabel = 'UF'
      FieldName = 'UFEP_P'
      Required = True
      FixedChar = True
      Size = 2
    end
    object sqlConsultaClienteDUCC_C: TSQLTimeStampField
      DisplayLabel = 'Ultima Compra'
      FieldName = 'DUCC_C'
      Required = True
    end
    object sqlConsultaClienteDVAP_P: TSQLTimeStampField
      DisplayLabel = 'Venc. Alvar'#225
      FieldName = 'DVAP_P'
      Required = True
    end
    object sqlConsultaClienteNROV_C: TFMTBCDField
      DisplayLabel = 'Setor'
      FieldName = 'NROV_C'
      Precision = 6
      Size = 0
    end
    object sqlConsultaClienteID_SITUACAO_CLIENTE: TWideStringField
      DisplayLabel = 'Situa'#231#227'o Cliente'
      FieldName = 'ID_SITUACAO_CLIENTE'
      Size = 1
    end
    object sqlConsultaClienteCGCP_P: TFMTBCDField
      DisplayLabel = 'CNPJ'
      FieldName = 'CGCP_P'
      Required = True
      Precision = 14
      Size = 0
    end
    object sqlConsultaClienteNOMV_V: TWideStringField
      DisplayLabel = 'Representante GAM'
      FieldName = 'NOMV_V'
      Required = True
      FixedChar = True
      Size = 40
    end
    object sqlConsultaClienteENDP_P: TWideStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDP_P'
      Required = True
      FixedChar = True
      Size = 40
    end
    object sqlConsultaClienteDS_EMAIL_NFE_PRINCIPAL: TWideStringField
      FieldName = 'DS_EMAIL_NFE_PRINCIPAL'
      Required = True
      Size = 100
    end
    object sqlConsultaClienteDS_EMAIL_NFE_COPIA: TWideStringField
      FieldName = 'DS_EMAIL_NFE_COPIA'
      Required = True
      Size = 100
    end
    object sqlConsultaClienteTIPC_C: TFMTBCDField
      FieldName = 'TIPC_C'
      Required = True
      Precision = 6
      Size = 0
    end
    object sqlConsultaClienteCANC_C: TFMTBCDField
      FieldName = 'CANC_C'
      Required = True
      Precision = 2
      Size = 0
    end
    object sqlConsultaClienteDISTRITO: TFMTBCDField
      FieldName = 'DISTRITO'
      Precision = 32
    end
    object sqlConsultaClienteCD_EMPRESA_ESTOQUE: TFMTBCDField
      FieldName = 'CD_EMPRESA_ESTOQUE'
      Precision = 6
      Size = 0
    end
    object sqlConsultaClienteENTREGADOR: TFMTBCDField
      FieldName = 'ENTREGADOR'
      Required = True
      Precision = 6
      Size = 0
    end
    object sqlConsultaClienteETIQUETA: TWideStringField
      FieldName = 'ETIQUETA'
      Size = 4
    end
    object sqlConsultaClienteCD_TRANSPORTADOR: TFMTBCDField
      FieldName = 'CD_TRANSPORTADOR'
      Required = True
      Precision = 6
      Size = 0
    end
    object sqlConsultaClienteDS_EMAIL_SAC: TWideStringField
      FieldName = 'DS_EMAIL_SAC'
      FixedChar = True
      Size = 1
    end
    object sqlConsultaClienteNM_CONTATO_SAC: TWideStringField
      FieldName = 'NM_CONTATO_SAC'
      FixedChar = True
      Size = 1
    end
    object sqlConsultaClienteNR_TELEFONE: TWideStringField
      FieldName = 'NR_TELEFONE'
      FixedChar = True
      Size = 1
    end
    object sqlConsultaClienteDS_LOGRADOURO: TWideStringField
      FieldName = 'DS_LOGRADOURO'
      Required = True
      Size = 72
    end
    object sqlConsultaClienteNR_LOGRADOURO: TWideStringField
      FieldName = 'NR_LOGRADOURO'
      Required = True
      Size = 5
    end
    object sqlConsultaClienteNM_BAIRRO: TWideStringField
      FieldName = 'NM_BAIRRO'
      Required = True
      Size = 72
    end
    object sqlConsultaClienteNM_CIDADE: TWideStringField
      FieldName = 'NM_CIDADE'
      Required = True
      Size = 72
    end
    object sqlConsultaClienteID_ESTADO: TWideStringField
      FieldName = 'ID_ESTADO'
      Required = True
      Size = 2
    end
  end
  object dsConsultaCliente: TDataSource
    DataSet = sqlConsultaCliente
    Left = 152
    Top = 232
  end
  object dsOcorrencia: TDataSource
    Left = 160
    Top = 312
  end
  object cdsItemOcorrencia: TClientDataSet
    Aggregates = <>
    DataSetField = cdsOcorrenciaidItem
    Params = <>
    Left = 56
    Top = 368
    object cdsItemOcorrencianrSequencia: TIntegerField
      DisplayLabel = 'Seq'
      FieldName = 'nrSequencia'
    end
    object cdsItemOcorrenciacdEmpresa: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'cdEmpresa'
    end
    object cdsItemOcorrencianrNFe: TIntegerField
      DisplayLabel = 'Nr NFe'
      FieldName = 'nrNFe'
    end
    object cdsItemOcorrencianrSerieNFe: TIntegerField
      DisplayLabel = 'Serie NFe'
      FieldName = 'nrSerieNFe'
    end
    object cdsItemOcorrenciadataEmissao: TDateField
      DisplayLabel = 'Data Emissao'
      FieldName = 'dataEmissao'
    end
    object cdsItemOcorrenciacdOrigemPedido: TIntegerField
      FieldName = 'cdOrigemPedido'
    end
    object cdsItemOcorrenciadsOrigemPedido: TStringField
      DisplayLabel = 'Origem Pedido'
      FieldName = 'dsOrigemPedido'
      Size = 30
    end
    object cdsItemOcorrenciacdProduto: TIntegerField
      FieldName = 'cdProduto'
    end
    object cdsItemOcorrenciadigitoProduto: TIntegerField
      FieldName = 'digitoProduto'
    end
    object cdsItemOcorrenciadsProduto: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'dsProduto'
      Size = 60
    end
    object cdsItemOcorrenciaquantProduto: TIntegerField
      DisplayLabel = 'Quant Produto'
      FieldName = 'quantProduto'
    end
    object cdsItemOcorrencianrOrdemDevolucao: TIntegerField
      FieldName = 'nrOrdemDevolucao'
    end
    object cdsItemOcorrenciadsDetalheDevolucao: TStringField
      FieldName = 'dsDetalheDevolucao'
      Size = 50
    end
    object cdsItemOcorrenciadsSituacaoDevolucao: TStringField
      FieldName = 'dsSituacaoDevolucao'
    end
    object cdsItemOcorrenciacdTipoProduto: TIntegerField
      FieldName = 'cdTipoProduto'
    end
    object cdsItemOcorrenciadsTipoProduto: TStringField
      DisplayLabel = 'Tipo Produto'
      FieldName = 'dsTipoProduto'
      Size = 15
    end
    object cdsItemOcorrenciadsLoteProduto: TStringField
      FieldName = 'dsLoteProduto'
    end
    object cdsItemOcorrenciadataValidadeProduto: TDateField
      DisplayLabel = 'Data Validade'
      FieldName = 'dataValidadeProduto'
    end
    object cdsItemOcorrenciaprazoValidade: TIntegerField
      DisplayLabel = 'Prazo Validade'
      FieldName = 'prazoValidade'
    end
    object cdsItemOcorrenciacdSituacaoEmbalagem: TIntegerField
      FieldName = 'cdSituacaoEmbalagem'
    end
    object cdsItemOcorrenciadsSituacaoEmbalagem: TStringField
      DisplayLabel = 'Situacao Embalagem'
      FieldName = 'dsSituacaoEmbalagem'
      Size = 100
    end
    object cdsItemOcorrenciacdTipoOcorrencia: TIntegerField
      FieldName = 'cdTipoOcorrencia'
    end
    object cdsItemOcorrenciadsTipoOcorrencia: TStringField
      DisplayLabel = 'Tipo Ocorrencia'
      FieldName = 'dsTipoOcorrencia'
      Size = 40
    end
    object cdsItemOcorrenciacdSubTipoOcorrencia: TIntegerField
      FieldName = 'cdSubTipoOcorrencia'
    end
    object cdsItemOcorrenciadsSubTipoOcorrencia: TStringField
      DisplayLabel = 'Sub Tipo Ocorrencia'
      FieldName = 'dsSubTipoOcorrencia'
      Size = 60
    end
    object cdsItemOcorrenciadescricaoOcorrencia: TWideStringField
      DisplayLabel = 'Descricao Ocorrencia'
      FieldName = 'descricaoOcorrencia'
      Size = 300
    end
    object cdsItemOcorrenciacdSolucionador: TIntegerField
      FieldName = 'cdSolucionador'
    end
    object cdsItemOcorrencianomeSolucionador: TStringField
      DisplayLabel = 'Nome Solucionador'
      FieldName = 'nomeSolucionador'
      Size = 60
    end
    object cdsItemOcorrenciacdGerenteSolucionador: TIntegerField
      FieldName = 'cdGerenteSolucionador'
    end
    object cdsItemOcorrencianmGerenteSolucionador: TStringField
      FieldName = 'nmGerenteSolucionador'
      Size = 60
    end
    object cdsItemOcorrencianrMatriculaRepresentante: TIntegerField
      FieldName = 'nrMatriculaRepresentante'
    end
    object cdsItemOcorrencianrMatriculaGerenteRepresentante: TIntegerField
      FieldName = 'nrMatriculaGerenteRepresentante'
    end
    object cdsItemOcorrenciacdSetor: TIntegerField
      DisplayLabel = 'Setor'
      FieldName = 'cdSetor'
    end
    object cdsItemOcorrenciacdDistrito: TIntegerField
      DisplayLabel = 'Distrito'
      FieldName = 'cdDistrito'
    end
    object cdsItemOcorrenciacdTransportador: TIntegerField
      FieldName = 'cdTransportador'
    end
    object cdsItemOcorrencianomeTransportador: TStringField
      DisplayLabel = 'Transportador'
      FieldName = 'nomeTransportador'
      Size = 60
    end
    object cdsItemOcorrenciadsTransbordoCarga: TWideStringField
      DisplayLabel = 'Inf Transbordo Carga'
      FieldName = 'dsTransbordoCarga'
      Size = 500
    end
    object cdsItemOcorrenciacdStatusSolucao: TIntegerField
      FieldName = 'cdStatusSolucao'
    end
    object cdsItemOcorrenciadsStatusSolucao: TStringField
      DisplayLabel = 'Status Solucao'
      FieldName = 'dsStatusSolucao'
      Size = 40
    end
    object cdsItemOcorrenciacdStatusCausa: TIntegerField
      FieldName = 'cdStatusCausa'
    end
    object cdsItemOcorrenciadsStatusCausa: TStringField
      DisplayLabel = 'Status Causa'
      FieldName = 'dsStatusCausa'
      Size = 40
    end
    object cdsItemOcorrenciadataLimite: TDateField
      DisplayLabel = 'Data Limite'
      FieldName = 'dataLimite'
    end
    object cdsItemOcorrenciacdAreaOrigem: TIntegerField
      FieldName = 'cdAreaOrigem'
    end
    object cdsItemOcorrenciadsAreaOrigem: TStringField
      DisplayLabel = 'Area Origem'
      FieldName = 'dsAreaOrigem'
    end
    object cdsItemOcorrenciaIdSolucao: TDataSetField
      FieldName = 'IdSolucao'
    end
    object cdsItemOcorrencianomeRepresentante: TStringField
      FieldName = 'nomeRepresentante'
      Size = 60
    end
    object cdsItemOcorrenciaidRecorrencia: TDataSetField
      FieldName = 'idRecorrencia'
    end
    object cdsItemOcorrenciadsEmailSolucionador: TStringField
      FieldName = 'dsEmailSolucionador'
      Size = 100
    end
    object cdsItemOcorrenciadsEmailSupervisor: TStringField
      FieldName = 'dsEmailSupervisor'
      Size = 100
    end
    object cdsItemOcorrenciadsEmailRepresentante: TStringField
      FieldName = 'dsEmailRepresentante'
      Size = 100
    end
    object cdsItemOcorrenciadsEmailCoordenador: TStringField
      FieldName = 'dsEmailCoordenador'
      Size = 100
    end
    object cdsItemOcorrenciadsEmailCopia: TStringField
      FieldName = 'dsEmailCopia'
      Size = 200
    end
    object cdsItemOcorrenciadsEmailCopiaExtra: TStringField
      FieldName = 'dsEmailCopiaExtra'
      Size = 200
    end
    object cdsItemOcorrencianrMatriculaGerenteCanal: TIntegerField
      FieldName = 'nrMatriculaGerenteCanal'
    end
    object cdsItemOcorrenciaidRecolherMercadoria: TBooleanField
      FieldName = 'idRecolherMercadoria'
    end
    object cdsItemOcorrenciaIdAlertarRegistroForaPrazo: TBooleanField
      FieldName = 'IdAlertarRegistroForaPrazo'
    end
    object cdsItemOcorrenciacdOperadorLogistico: TIntegerField
      FieldName = 'cdOperadorLogistico'
    end
    object cdsItemOcorrenciadsDigitadorPedido: TStringField
      FieldName = 'dsDigitadorPedido'
      Size = 40
    end
    object cdsItemOcorrenciadsMotivoCancelamento: TStringField
      FieldName = 'dsMotivoCancelamento'
      Size = 500
    end
    object cdsItemOcorrenciaidNecessitaOrdemColeta: TBooleanField
      FieldName = 'idNecessitaOrdemColeta'
    end
    object cdsItemOcorrenciaidAlertarProdutoTermolabil: TBooleanField
      FieldName = 'idAlertarProdutoTermolabil'
    end
    object cdsItemOcorrenciacdClienteEntrega: TIntegerField
      FieldName = 'cdClienteEntrega'
    end
    object cdsItemOcorrenciaidSelecionado: TStringField
      FieldName = 'idSelecionado'
      Size = 1
    end
    object cdsItemOcorrenciaidEmpresaNFe: TIntegerField
      FieldName = 'idEmpresaNFe'
    end
    object cdsItemOcorrenciaCfop: TIntegerField
      FieldName = 'Cfop'
    end
    object cdsItemOcorrenciacst: TStringField
      FieldName = 'cst'
      Size = 3
    end
    object cdsItemOcorrenciavlrUnitarioMercadoria: TFloatField
      FieldName = 'vlrUnitarioMercadoria'
    end
    object cdsItemOcorrenciavlrUnitarioBcIcms: TFloatField
      FieldName = 'vlrUnitarioBcIcms'
    end
    object cdsItemOcorrenciavlrUnitarioIcms: TFloatField
      FieldName = 'vlrUnitarioIcms'
    end
    object cdsItemOcorrenciavlrUnitarioBcST: TFloatField
      FieldName = 'vlrUnitarioBcST'
    end
    object cdsItemOcorrenciavlrUnitarioST: TFloatField
      FieldName = 'vlrUnitarioST'
    end
  end
  object dsItemOcorrencia: TDataSource
    DataSet = cdsItemOcorrencia
    Left = 160
    Top = 376
  end
  object cdsOcorrencia: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 312
    object cdsOcorrenciacdOcorrencia: TIntegerField
      DisplayLabel = 'Ocorrencia'
      FieldName = 'cdOcorrencia'
    end
    object cdsOcorrenciacdEmpresa: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'cdEmpresa'
    end
    object cdsOcorrenciacdCliente: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'cdCliente'
    end
    object cdsOcorrenciacdUsuario: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'cdUsuario'
    end
    object cdsOcorrenciacdPrioridade: TIntegerField
      DisplayLabel = 'Prioridade'
      FieldName = 'cdPrioridade'
    end
    object cdsOcorrenciadataLimite: TDateField
      DisplayLabel = 'Data Limite'
      FieldName = 'dataLimite'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object cdsOcorrenciadataRegistro: TDateTimeField
      FieldName = 'dataRegistro'
      DisplayFormat = 'DD/MM/YYYY hh:nn:ss'
    end
    object cdsOcorrenciacdStatusSolucao: TIntegerField
      DisplayLabel = 'Status Solucao'
      FieldName = 'cdStatusSolucao'
    end
    object cdsOcorrenciacdStatusCausa: TIntegerField
      FieldName = 'cdStatusCausa'
    end
    object cdsOcorrenciadsContato: TStringField
      FieldName = 'dsContato'
      Size = 60
    end
    object cdsOcorrenciarazaoSocial: TStringField
      FieldName = 'razaoSocial'
      Size = 60
    end
    object cdsOcorrenciadsPrioridade: TStringField
      FieldName = 'dsPrioridade'
    end
    object cdsOcorrenciadsStatusSolucao: TStringField
      DisplayWidth = 30
      FieldName = 'dsStatusSolucao'
      Size = 30
    end
    object cdsOcorrenciadsStatusCausa: TStringField
      DisplayWidth = 30
      FieldName = 'dsStatusCausa'
      Size = 30
    end
    object cdsOcorrenciadescricao: TMemoField
      FieldName = 'descricao'
      BlobType = ftMemo
      Size = 200
    end
    object cdsOcorrenciacodigoDigito: TIntegerField
      FieldName = 'codigoDigito'
    end
    object cdsOcorrenciaidItem: TDataSetField
      FieldName = 'idItem'
    end
    object cdsOcorrenciadsEmailCliente: TStringField
      FieldName = 'dsEmailCliente'
      Size = 100
    end
    object cdsOcorrenciacdMeioDeContato: TIntegerField
      FieldName = 'cdMeioDeContato'
    end
    object cdsOcorrenciaidMostrarAvisoDevolucao: TBooleanField
      FieldName = 'idMostrarAvisoDevolucao'
    end
    object cdsOcorrenciaidSituacaoOrdemColeta: TStringField
      FieldName = 'idSituacaoOrdemColeta'
      Size = 1
    end
    object cdsOcorrenciadtEmissaoOrdemDeColeta: TDateTimeField
      FieldName = 'dtEmissaoOrdemDeColeta'
    end
    object cdsOcorrenciaidOcorrenciaIntegral: TBooleanField
      FieldName = 'idOcorrenciaIntegral'
    end
    object cdsOcorrenciacdDestinoEmailOrdemDeColeta: TIntegerField
      FieldName = 'cdDestinoEmailOrdemDeColeta'
    end
    object cdsOcorrenciadsNomeArquivo: TStringField
      FieldName = 'dsNomeArquivo'
      Size = 50
    end
  end
  object sqlConsultaPedido: TSimpleDataSet
    Aggregates = <>
    Connection = conexaoHistorico
    DataSet.CommandText = 
      'SELECT TIPO_O Tipo,NROO_O Pedido, DATO_O Data, HORO_O Hora,STAO_' +
      'O Status, '#13#10'       SNRO_O Digitador, MOTO_O Observacao '#13#10'FROM PR' +
      'DDM.V_DCORD@sihst '#13#10'WHERE TIPO_O = '#39'V'#39' '#13#10'AND NROC_O = 12 '#13#10'ORDER' +
      ' BY NROO_O DESC'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 296
    Top = 104
  end
  object sqlConsultaNFe: TSimpleDataSet
    Aggregates = <>
    Connection = conexaoProducao
    DataSet.CommandText = 
      'SELECT ID_EMPRESA Empresa, NR_NFE_NF NFe, DEMN_N Emissao, TOTN_N' +
      ' Valor, NRON_N Nota '#13#10'FROM PRDDM.V_DCNOT@sihst '#13#10'WHERE TIPN_N = ' +
      #39'V'#39' '#13#10'AND NROC_N = 12 '#13#10'ORDER BY NR_NFE_NF DESC'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 296
    Top = 168
  end
  object sqlConsultaDuplicata: TSimpleDataSet
    Aggregates = <>
    Connection = conexaoProducao
    DataSet.CommandText = 
      'SELECT ID_EMPRESA Empresa, NR_NFE NFe, NROD_D Duplicata,'#13#10'      ' +
      ' DEMD_D Emissao,DVND_D Vencimento, VDPD_D Valor, SDOD_D Saldo '#13#10 +
      'FROM PRDDM.DCDUP '#13#10'WHERE TIPD_D = '#39'R'#39' '#13#10'AND NROC_D = 12 '#13#10'AND SD' +
      'OD_D > 0  '#13#10'ORDER BY DVND_D'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 296
    Top = 232
  end
  object dsGenerica: TDataSource
    DataSet = sqlConsultaPedido
    Left = 392
    Top = 168
  end
  object sqlItemNFe_PedidoCompra: TSimpleDataSet
    Aggregates = <>
    Connection = conexaoProducao
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 296
    Top = 288
  end
  object dsItemNFe: TDataSource
    DataSet = sqlItemNFe_PedidoCompra
    Left = 400
    Top = 288
  end
  object cdsTipoOcorrencia: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 32
    object cdsTipoOcorrenciaCD_TIPO_OCORRENCIA: TIntegerField
      FieldName = 'CD_TIPO_OCORRENCIA'
    end
    object cdsTipoOcorrenciaNM_TIPO_OCORRENCIA: TStringField
      FieldName = 'NM_TIPO_OCORRENCIA'
      Size = 40
    end
    object cdsTipoOcorrenciaID_CAUSA: TStringField
      FieldName = 'ID_CAUSA'
      Size = 1
    end
    object cdsTipoOcorrenciaID_FILMAGEM: TStringField
      FieldName = 'ID_FILMAGEM'
      Size = 1
    end
    object cdsTipoOcorrenciaID_ESTOQUE: TStringField
      FieldName = 'ID_ESTOQUE'
      Size = 1
    end
    object cdsTipoOcorrenciaCD_DEPTO_PADRAO: TIntegerField
      FieldName = 'CD_DEPTO_PADRAO'
    end
    object cdsTipoOcorrenciaID_TELEVENDAS: TStringField
      FieldName = 'ID_TELEVENDAS'
      Size = 1
    end
    object cdsTipoOcorrenciaID_TRANSP_RESPONSAVEL: TStringField
      FieldName = 'ID_TRANSP_RESPONSAVEL'
      Size = 1
    end
    object cdsTipoOcorrenciaID_EMBALAGEM: TStringField
      FieldName = 'ID_EMBALAGEM'
      Size = 1
    end
    object cdsTipoOcorrenciaID_SUBTIPO_OCORRENCIA: TStringField
      FieldName = 'ID_SUBTIPO_OCORRENCIA'
      Size = 1
    end
    object cdsTipoOcorrenciaID_SOLUCAO: TStringField
      FieldName = 'ID_SOLUCAO'
      Size = 1
    end
    object cdsTipoOcorrenciaID_RECOLHER_MERCADORIA: TStringField
      FieldName = 'ID_RECOLHER_MERCADORIA'
      Size = 1
    end
  end
  object dsTipoOcorrencia: TDataSource
    DataSet = cdsTipoOcorrencia
    Left = 600
    Top = 32
  end
  object cdsSubTipoOcorrencia: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 96
    Data = {
      7D0000009619E0BD0100000018000000030000000000030000007D001243445F
      5449504F5F4F434F5252454E43494104000100000000001543445F5355425449
      504F5F4F434F5252454E4349410400010000000000154E4D5F5355425449504F
      5F4F434F5252454E4349410100490000000100055749445448020002003C0000
      00}
    object cdsSubTipoOcorrenciaCD_TIPO_OCORRENCIA: TIntegerField
      FieldName = 'CD_TIPO_OCORRENCIA'
    end
    object cdsSubTipoOcorrenciaCD_SUBTIPO_OCORRENCIA: TIntegerField
      FieldName = 'CD_SUBTIPO_OCORRENCIA'
    end
    object cdsSubTipoOcorrenciaNM_SUBTIPO_OCORRENCIA: TStringField
      FieldName = 'NM_SUBTIPO_OCORRENCIA'
      Size = 60
    end
  end
  object dsSubTipoOcorrencia: TDataSource
    DataSet = cdsSubTipoOcorrencia
    Left = 616
    Top = 96
  end
  object cdsSituacaoEmbalagem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 152
    object cdsSituacaoEmbalagemCD_SITUACAO_EMBALAGEM: TIntegerField
      FieldName = 'CD_SITUACAO_EMBALAGEM'
    end
    object cdsSituacaoEmbalagemDS_SITUACAO_EMBALAGEM: TStringField
      FieldName = 'DS_SITUACAO_EMBALAGEM'
      Size = 100
    end
  end
  object dsSituacaoEmbalagem: TDataSource
    DataSet = cdsSituacaoEmbalagem
    Left = 616
    Top = 152
  end
  object dsSolucionador: TDataSource
    DataSet = cdsSolucionador
    Left = 608
    Top = 208
  end
  object cdsSolucionador: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 208
    object cdsSolucionadorNR_MATRIC_SOLUCIONADOR: TIntegerField
      FieldName = 'NR_MATRIC_SOLUCIONADOR'
    end
    object cdsSolucionadorNM_SOLUCIONADOR: TStringField
      FieldName = 'NM_SOLUCIONADOR'
      Size = 60
    end
    object cdsSolucionadorDS_EMAIL_SOLUCIONADOR: TStringField
      FieldName = 'DS_EMAIL_SOLUCIONADOR'
      Size = 100
    end
    object cdsSolucionadorCD_DEPTO: TIntegerField
      FieldName = 'CD_DEPTO'
    end
    object cdsSolucionadorDS_DEPTO: TStringField
      FieldName = 'DS_DEPTO'
      Size = 40
    end
    object cdsSolucionadorCD_GERENTE_AREA: TIntegerField
      FieldName = 'CD_GERENTE_AREA'
    end
    object cdsSolucionadorNM_GERENTE_AREA: TStringField
      FieldName = 'NM_GERENTE_AREA'
      Size = 60
    end
    object cdsSolucionadorDS_EMAIL_GERENTE_AREA: TStringField
      FieldName = 'DS_EMAIL_GERENTE_AREA'
      Size = 100
    end
    object cdsSolucionadorQTD_DIAS_SOLUCAO: TIntegerField
      FieldName = 'QTD_DIAS_SOLUCAO'
    end
    object cdsSolucionadorCD_GERENTE_DEPTO: TIntegerField
      FieldName = 'CD_GERENTE_DEPTO'
    end
    object cdsSolucionadorNM_GERENTE_DEPTO: TStringField
      FieldName = 'NM_GERENTE_DEPTO'
      Size = 60
    end
    object cdsSolucionadorDS_EMAIL_GERENTE_DEPTO: TStringField
      FieldName = 'DS_EMAIL_GERENTE_DEPTO'
      Size = 100
    end
    object cdsSolucionadorCD_AREA_ORIGEM: TIntegerField
      FieldName = 'CD_AREA_ORIGEM'
    end
    object cdsSolucionadorCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
    end
  end
  object cdsStatusSolucao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 272
    object cdsStatusSolucaoCD_STATUS_OCORRENCIA: TIntegerField
      FieldName = 'CD_STATUS_OCORRENCIA'
    end
    object cdsStatusSolucaoNM_STATUS_OCORRENCIA: TStringField
      FieldName = 'NM_STATUS_OCORRENCIA'
      Size = 40
    end
  end
  object dsStatusSolucao: TDataSource
    DataSet = cdsStatusSolucao
    Left = 616
    Top = 272
  end
  object cdsStatusCausa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 327
    object cdsStatusCausaCD_ST_CAUSA: TIntegerField
      FieldName = 'CD_ST_CAUSA'
    end
    object cdsStatusCausaNM_ST_CAUSA: TStringField
      FieldName = 'NM_ST_CAUSA'
      Size = 40
    end
  end
  object dsStatusCausa: TDataSource
    DataSet = cdsStatusCausa
    Left = 616
    Top = 327
  end
  object sqlConsultaOcorrencia: TSimpleDataSet
    Aggregates = <>
    Connection = conexaoProducao
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 288
    Top = 360
  end
  object dsConsultaOcorrencia: TDataSource
    DataSet = sqlConsultaOcorrencia
    Left = 400
    Top = 360
  end
  object cdsSolucaoItem: TClientDataSet
    Aggregates = <>
    DataSetField = cdsItemOcorrenciaIdSolucao
    Params = <>
    Left = 56
    Top = 440
    object cdsSolucaoItemcdOcorrencia: TIntegerField
      FieldName = 'cdOcorrencia'
    end
    object cdsSolucaoItemcdItemOcorrencia: TIntegerField
      FieldName = 'cdItemOcorrencia'
    end
    object cdsSolucaoItemcdSubTipoCausa: TIntegerField
      FieldName = 'cdSubTipoCausa'
    end
    object cdsSolucaoItemdsSubTipoCausaItemOcorrencia: TStringField
      FieldName = 'dsSubTipoCausaItemOcorrencia'
      Size = 200
    end
    object cdsSolucaoItemcdSubTipoSolucao: TIntegerField
      FieldName = 'cdSubTipoSolucao'
    end
    object cdsSolucaoItemdsSubTipoSolucaoItemOcorrencia: TStringField
      FieldName = 'dsSubTipoSolucaoItemOcorrencia'
      Size = 200
    end
    object cdsSolucaoItemdsSolucaoItemOcorrencia: TMemoField
      FieldName = 'dsSolucaoItemOcorrencia'
      BlobType = ftMemo
      Size = 300
    end
    object cdsSolucaoItemidFilamgem: TBooleanField
      FieldName = 'idFilamgem'
    end
    object cdsSolucaoItemidImagemVisivel: TBooleanField
      FieldName = 'idImagemVisivel'
    end
    object cdsSolucaoItemnrCamera: TIntegerField
      FieldName = 'nrCamera'
    end
    object cdsSolucaoItemidContagemEstoque: TBooleanField
      FieldName = 'idContagemEstoque'
    end
    object cdsSolucaoItemcdSituacaoEstoque: TIntegerField
      FieldName = 'cdSituacaoEstoque'
    end
    object cdsSolucaoItemdsSituacaoEstoque: TStringField
      FieldName = 'dsSituacaoEstoque'
      Size = 10
    end
    object cdsSolucaoItemcdConferente: TIntegerField
      FieldName = 'cdConferente'
    end
    object cdsSolucaoItemnomeConferente: TStringField
      FieldName = 'nomeConferente'
      Size = 60
    end
    object cdsSolucaoItemidEscutaGravacaoTlv: TBooleanField
      FieldName = 'idEscutaGravacaoTlv'
    end
    object cdsSolucaoItemidResultadoGravacaoTlv: TBooleanField
      FieldName = 'idResultadoGravacaoTlv'
    end
    object cdsSolucaoItemdataRegistroSolucao: TDateField
      FieldName = 'dataRegistroSolucao'
    end
    object cdsSolucaoItemdsTranspRespSolucao: TStringField
      FieldName = 'dsTranspRespSolucao'
      Size = 200
    end
    object cdsSolucaoItemcdSituacaoEmbalagem: TIntegerField
      FieldName = 'cdSituacaoEmbalagem'
    end
    object cdsSolucaoItemdsSituacaoEmbalagem: TStringField
      FieldName = 'dsSituacaoEmbalagem'
      Size = 100
    end
    object cdsSolucaoItemdataRegistroCausa: TDateField
      FieldName = 'dataRegistroCausa'
    end
    object cdsSolucaoItemdsTranspRespCausa: TStringField
      FieldName = 'dsTranspRespCausa'
      Size = 200
    end
    object cdsSolucaoItemdsCausaItem: TMemoField
      FieldName = 'dsCausaItem'
      BlobType = ftMemo
      Size = 300
    end
    object cdsSolucaoItemdsAcaoCausa: TMemoField
      FieldName = 'dsAcaoCausa'
      BlobType = ftMemo
      Size = 300
    end
    object cdsSolucaoItemidRecolheMercadoria: TStringField
      FieldName = 'idRecolheMercadoria'
    end
  end
  object dsSolucaoItem: TDataSource
    DataSet = cdsSolucaoItem
    Left = 160
    Top = 440
  end
  object cdsSolucao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 392
    object cdsSolucaoCD_SOLUCAO: TIntegerField
      FieldName = 'CD_SOLUCAO'
    end
    object cdsSolucaoDS_SOLUCAO: TStringField
      FieldName = 'DS_SOLUCAO'
      Size = 200
    end
    object cdsSolucaoCD_SUBTIPO_SOLUCAO: TIntegerField
      FieldName = 'CD_SUBTIPO_SOLUCAO'
    end
    object cdsSolucaoCD_TIPO_OCORRENCIA: TIntegerField
      FieldName = 'CD_TIPO_OCORRENCIA'
    end
    object cdsSolucaoCD_SUBTIPO_OCORRENCIA: TIntegerField
      FieldName = 'CD_SUBTIPO_OCORRENCIA'
    end
    object cdsSolucaoID_CAUSA: TBooleanField
      FieldName = 'ID_CAUSA'
    end
    object cdsSolucaoID_FILMAGEM: TBooleanField
      FieldName = 'ID_FILMAGEM'
    end
    object cdsSolucaoID_ESTOQUE: TBooleanField
      FieldName = 'ID_ESTOQUE'
    end
    object cdsSolucaoID_TELEVENDAS: TBooleanField
      FieldName = 'ID_TELEVENDAS'
    end
    object cdsSolucaoID_TRANSP_RESPONSAVEL: TBooleanField
      FieldName = 'ID_TRANSP_RESPONSAVEL'
    end
    object cdsSolucaoID_EMBALAGEM: TBooleanField
      FieldName = 'ID_EMBALAGEM'
    end
    object cdsSolucaoID_SUBTIPO_OCORRENCIA: TBooleanField
      FieldName = 'ID_SUBTIPO_OCORRENCIA'
    end
    object cdsSolucaoID_RECOLHE_MERCADORIA: TBooleanField
      FieldName = 'ID_RECOLHE_MERCADORIA'
    end
    object cdsSolucaoID_ACEITE: TStringField
      FieldName = 'ID_ACEITE'
      Size = 1
    end
  end
  object dsSolucao: TDataSource
    DataSet = cdsSolucao
    Left = 624
    Top = 392
  end
  object dsCausa: TDataSource
    DataSet = cdsCausa
    Left = 616
    Top = 448
  end
  object cdsCausa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 464
    object cdsCausaCD_SUBTIPO_CAUSA: TIntegerField
      FieldName = 'CD_SUBTIPO_CAUSA'
    end
    object cdsCausaCD_CAUSA: TIntegerField
      FieldName = 'CD_CAUSA'
    end
    object cdsCausaDS_CAUSA: TStringField
      FieldName = 'DS_CAUSA'
      Size = 200
    end
    object cdsCausaCD_TIPO_OCORRENCIA: TIntegerField
      FieldName = 'CD_TIPO_OCORRENCIA'
    end
    object cdsCausaCD_SUBTIPO_OCORRENCIA: TIntegerField
      FieldName = 'CD_SUBTIPO_OCORRENCIA'
    end
  end
  object sqlGenericaCadastro: TSimpleDataSet
    Aggregates = <>
    Connection = conexaoProducao
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 56
    Top = 568
  end
  object dsGenericaCadastro: TDataSource
    DataSet = sqlGenericaCadastro
    Left = 168
    Top = 568
  end
  object cdsListaSolucao: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 464
    Data = {
      4C0000009619E0BD0100000018000000020000000000030000004C000A43445F
      534F4C5543414F04000100000000000A44535F534F4C5543414F010049000000
      010005574944544802000200C8000000}
    object cdsListaSolucaoCD_SOLUCAO: TIntegerField
      FieldName = 'CD_SOLUCAO'
    end
    object cdsListaSolucaoDS_SOLUCAO: TStringField
      FieldName = 'DS_SOLUCAO'
      Size = 200
    end
  end
  object dsListaSolucao: TDataSource
    DataSet = cdsListaSolucao
    Left = 408
    Top = 464
  end
  object dsListaCausa: TDataSource
    DataSet = cdsListaCausa
    Left = 408
    Top = 520
  end
  object cdsListaCausa: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 520
    Data = {
      480000009619E0BD01000000180000000200000000000300000048000843445F
      434155534104000100000000000844535F434155534101004900000001000557
      4944544802000200C8000000}
    object cdsListaCausaCD_CAUSA: TIntegerField
      FieldName = 'CD_CAUSA'
    end
    object cdsListaCausaDS_CAUSA: TStringField
      FieldName = 'DS_CAUSA'
      Size = 200
    end
  end
  object cdsListaDepartamento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 512
    Top = 512
    object cdsListaDepartamentoCD_DEPTO: TIntegerField
      FieldName = 'CD_DEPTO'
    end
    object cdsListaDepartamentoDS_DEPTO: TStringField
      FieldName = 'DS_DEPTO'
      Size = 40
    end
    object cdsListaDepartamentoNR_MATRIC_GERENTE_DEPTO: TIntegerField
      FieldName = 'NR_MATRIC_GERENTE_DEPTO'
    end
  end
  object dsListaDepartamento: TDataSource
    DataSet = cdsListaDepartamento
    Left = 624
    Top = 512
  end
  object cdsListaUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 512
    Top = 568
    object cdsListaUsuarioNR_MATRICULA: TIntegerField
      FieldName = 'NR_MATRICULA'
    end
    object cdsListaUsuarioNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Size = 60
    end
    object cdsListaUsuarioCD_FUNCAO: TIntegerField
      FieldName = 'CD_FUNCAO'
    end
    object cdsListaUsuarioNM_FUNCAO: TStringField
      FieldName = 'NM_FUNCAO'
      Size = 30
    end
    object cdsListaUsuarioCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
    end
    object cdsListaUsuarioNM_USUARIO_MATRICULA: TStringField
      FieldName = 'NM_USUARIO_MATRICULA'
      Size = 100
    end
  end
  object dsListaUsuario: TDataSource
    DataSet = cdsListaUsuario
    Left = 624
    Top = 568
  end
  object dsListaAreaDepto: TDataSource
    DataSet = cdsListaAreaDepto
    Left = 416
    Top = 584
  end
  object cdsListaAreaDepto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 584
    object cdsListaAreaDeptoCD_AREA_DEPTO: TIntegerField
      FieldName = 'CD_AREA_DEPTO'
    end
    object cdsListaAreaDeptoCD_DEPTO: TIntegerField
      FieldName = 'CD_DEPTO'
    end
    object cdsListaAreaDeptoDS_AREA_DEPTO: TStringField
      FieldName = 'DS_AREA_DEPTO'
      Size = 40
    end
    object cdsListaAreaDeptoQTD_DIAS_SOLUCAO: TIntegerField
      FieldName = 'QTD_DIAS_SOLUCAO'
    end
    object cdsListaAreaDeptoNR_MATRIC_GERENTE_AREA: TIntegerField
      FieldName = 'NR_MATRIC_GERENTE_AREA'
    end
  end
  object dsRecorrenciaItem: TDataSource
    DataSet = cdsRecorrenciaItem
    Left = 160
    Top = 504
  end
  object cdsRecorrenciaItem: TClientDataSet
    Aggregates = <>
    DataSetField = cdsItemOcorrenciaidRecorrencia
    Params = <>
    Left = 56
    Top = 504
    object cdsRecorrenciaItemCD_RECORRENCIA: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CD_RECORRENCIA'
    end
    object cdsRecorrenciaItemCD_ITEM_OCORRENCIA: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'CD_ITEM_OCORRENCIA'
    end
    object cdsRecorrenciaItemDS_RECORRENCIA: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'DS_RECORRENCIA'
      Size = 300
    end
    object cdsRecorrenciaItemDT_RECORRENCIA: TDateTimeField
      DisplayLabel = 'Data Registro'
      FieldName = 'DT_RECORRENCIA'
    end
    object cdsRecorrenciaItemDS_TIPO_RECORRENCIA: TStringField
      DisplayLabel = 'Tipo de Recorrencia'
      FieldName = 'DS_TIPO_RECORRENCIA'
      Size = 10
    end
  end
  object sqlListaDeConferente: TSimpleDataSet
    Aggregates = <>
    Connection = conexaoProducao
    DataSet.CommandText = 
      'SELECT NR_MATRICULA,NM_USUARIO '#13#10'FROM ACESSO.DC_USUARIO '#13#10'WHERE ' +
      'ID_ATIVO = '#39'A'#39' '#13#10'AND CD_FUNCAO IN (60,61,72,126)'#13#10'ORDER BY NM_US' +
      'UARIO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 56
    Top = 616
    object sqlListaDeConferenteNR_MATRICULA: TFMTBCDField
      FieldName = 'NR_MATRICULA'
      Required = True
      Precision = 9
      Size = 0
    end
    object sqlListaDeConferenteNM_USUARIO: TWideStringField
      FieldName = 'NM_USUARIO'
      Required = True
      Size = 60
    end
  end
  object dsListaConferente: TDataSource
    DataSet = sqlListaDeConferente
    Left = 168
    Top = 616
  end
  object sqlRelatorio: TSimpleDataSet
    Aggregates = <>
    Connection = conexaoProducao
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 720
    Top = 40
  end
  object dsRelatorio: TDataSource
    DataSet = sqlRelatorio
    Left = 800
    Top = 40
  end
  object cdsListaEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 728
    Top = 128
    object cdsListaEmpresaCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
    end
    object cdsListaEmpresaNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 60
    end
  end
  object dsListaEmpresa: TDataSource
    DataSet = cdsListaEmpresa
    Left = 816
    Top = 128
  end
  object cdsGeradorRelatorio: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 728
    Top = 200
    Data = {
      FA0100009619E0BD01000000180000000F000000000003000000FA010C646174
      61526567697374726F0100490000000100055749445448020002000700106364
      5469706F4F636F7272656E63696104000100000000001363645375625469706F
      4F636F7272656E6369610400010000000000096364536F6C7563616F04000100
      00000000076364436175736104000100000000001064735469706F4F636F7272
      656E636961010049000000010005574944544802000200640013647353756254
      69706F4F636F7272656E63696101004900000001000557494454480200020064
      00096473536F6C7563616F010049000000010005574944544802000200640007
      6473436175736101004900000001000557494454480200020064001069644578
      6973746546696C6D6167656D0100490000000100055749445448020002000100
      11696446696C6D6167656D5669736976656C0100490000000100055749445448
      020002000100106964436F6E666572654573746F717565010049000000010005
      5749445448020002000100116964536974756163616F4573746F717565010049
      00000001000557494454480200020001000D6964477261766163616F546C7601
      004900000001000557494454480200020001001469644174656E64696D656E74
      6F436F727265746F01004900000001000557494454480200020001000000}
    object cdsGeradorRelatoriodataRegistro: TStringField
      FieldName = 'dataRegistro'
      Size = 7
    end
    object cdsGeradorRelatoriocdTipoOcorrencia: TIntegerField
      FieldName = 'cdTipoOcorrencia'
    end
    object cdsGeradorRelatoriocdSubTipoOcorrencia: TIntegerField
      FieldName = 'cdSubTipoOcorrencia'
    end
    object cdsGeradorRelatoriocdSolucao: TIntegerField
      FieldName = 'cdSolucao'
    end
    object cdsGeradorRelatoriocdCausa: TIntegerField
      FieldName = 'cdCausa'
    end
    object cdsGeradorRelatoriodsTipoOcorrencia: TStringField
      FieldName = 'dsTipoOcorrencia'
      Size = 100
    end
    object cdsGeradorRelatoriodsSubTipoOcorrencia: TStringField
      FieldName = 'dsSubTipoOcorrencia'
      Size = 100
    end
    object cdsGeradorRelatoriodsSolucao: TStringField
      FieldName = 'dsSolucao'
      Size = 100
    end
    object cdsGeradorRelatoriodsCausa: TStringField
      FieldName = 'dsCausa'
      Size = 100
    end
    object cdsGeradorRelatorioidExisteFilmagem: TStringField
      FieldName = 'idExisteFilmagem'
      Size = 1
    end
    object cdsGeradorRelatorioidFilmagemVisivel: TStringField
      FieldName = 'idFilmagemVisivel'
      Size = 1
    end
    object cdsGeradorRelatorioidConfereEstoque: TStringField
      FieldName = 'idConfereEstoque'
      Size = 1
    end
    object cdsGeradorRelatorioidSituacaoEstoque: TStringField
      FieldName = 'idSituacaoEstoque'
      Size = 1
    end
    object cdsGeradorRelatorioidGravacaoTlv: TStringField
      FieldName = 'idGravacaoTlv'
      Size = 1
    end
    object cdsGeradorRelatorioidAtendimentoCorreto: TStringField
      FieldName = 'idAtendimentoCorreto'
      Size = 1
    end
  end
  object sqlListaRedeCliente: TSimpleDataSet
    Aggregates = <>
    Connection = conexaoProducao
    DataSet.CommandText = 
      'SELECT NROT_T CODIGO,SIGT_T ||'#39' ['#39'||NROT_T||'#39']'#39' REDE'#13#10'FROM PRDDM' +
      '.DCTAB '#13#10'WHERE TIPT_T = '#39'C'#39' '#13#10'ORDER BY SIGT_T'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 728
    Top = 272
    object sqlListaRedeClienteCODIGO: TFMTBCDField
      FieldName = 'CODIGO'
      Required = True
      Precision = 6
      Size = 0
    end
    object sqlListaRedeClienteREDE: TWideStringField
      FieldName = 'REDE'
      Size = 58
    end
  end
  object dsListaRedeCliente: TDataSource
    DataSet = sqlListaRedeCliente
    Left = 832
    Top = 272
  end
  object cdsListaAreaOrigem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 640
    object cdsListaAreaOrigemCD_AREA_ORIGEM: TIntegerField
      FieldName = 'CD_AREA_ORIGEM'
    end
    object cdsListaAreaOrigemDS_AREA_ORIGEM: TStringField
      FieldName = 'DS_AREA_ORIGEM'
      Size = 40
    end
  end
  object dsListaAreaOrigem: TDataSource
    DataSet = cdsListaAreaOrigem
    Left = 416
    Top = 640
  end
  object RvSystem: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    DefaultDest = rdFile
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'Rave Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 312
    Top = 32
  end
  object RvRenderPDF: TRvRenderPDF
    DisplayName = 'Adobe Acrobat (PDF)'
    FileExtension = '*.pdf'
    DocInfo.Creator = 'Rave Reports (http://www.nevrona.com/rave)'
    DocInfo.Producer = 'Nevrona Designs'
    Left = 392
    Top = 32
  end
  object cdsListaGerenteDepto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 712
    Top = 368
    object cdsListaGerenteDeptoNR_MATRICULA: TIntegerField
      FieldName = 'NR_MATRICULA'
    end
    object cdsListaGerenteDeptoNM_GERENTE: TStringField
      FieldName = 'NM_GERENTE'
      Size = 60
    end
  end
  object dsListaGerenteDepto: TDataSource
    DataSet = cdsListaGerenteDepto
    Left = 832
    Top = 368
  end
  object cdsListaSupervisorArea: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 712
    Top = 432
    object cdsListaSupervisorAreaNR_MATRICULA: TIntegerField
      FieldName = 'NR_MATRICULA'
    end
    object cdsListaSupervisorAreaNM_SUPERVISOR: TStringField
      FieldName = 'NM_SUPERVISOR'
      Size = 60
    end
  end
  object dsListaSupervisorArea: TDataSource
    DataSet = cdsListaSupervisorArea
    Left = 832
    Top = 432
  end
  object cdsListaEmailUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 640
    object cdsListaEmailUsuarioNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Size = 100
    end
    object cdsListaEmailUsuarioDS_EMAIL: TStringField
      FieldName = 'DS_EMAIL'
      Size = 100
    end
  end
  object dsListaEmailusuario: TDataSource
    DataSet = cdsListaEmailUsuario
    Left = 632
    Top = 640
  end
  object sqlListaEntregador: TSimpleDataSet
    Aggregates = <>
    Connection = conexaoProducao
    DataSet.CommandText = 
      'SELECT DISTINCT ETIQ.CD_ENTREGA_CAMINHAO_SECUNDARIO||'#39'/'#39'||ETIQ.D' +
      'S_ETIQUETA_TRANSPORTE||'#39'['#39' || TRANSP.DS_TRANSPORTADOR || '#39']'#39'DS_E' +
      'TIQUETA,ETIQ.CD_ENTREGA_CAMINHAO_SECUNDARIO'#13#10'FROM PRDDM.DC_ENTRE' +
      'GA_CAMINHAO_SECUNDARIO ETIQ,PRDDM.DCCLI CLIENTE,PRDDM.DC_FRETE_T' +
      'RANSPORTADOR TRANSP '#13#10'WHERE CLIENTE.ID_ENTREGA_CAMINHAO_SECUNDAR' +
      'IO = ETIQ.ID_ENTREGA_CAMINHAO_SECUNDARIO'#13#10'AND CLIENTE.CD_ENTREGA' +
      '_CAMINHAO_SECUNDARIO = ETIQ.CD_ENTREGA_CAMINHAO_SECUNDARIO'#13#10'AND ' +
      'CLIENTE.ID_ENTREGA_CAMINHAO_SECUNDARIO = '#39'E'#39' '#13#10'AND ETIQ.CD_TRANS' +
      'PORTADOR = TRANSP.CD_TRANSPORTADOR'#13#10'AND ID_SITUACAO_CLIENTE = '#39'A' +
      #39#13#10'AND NROV_C = :SETOR'#13#10'ORDER BY DS_ETIQUETA'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'SETOR'
        ParamType = ptInput
      end>
    Params = <>
    Left = 56
    Top = 680
    object sqlListaEntregadorDS_ETIQUETA: TWideStringField
      FieldName = 'DS_ETIQUETA'
      Size = 147
    end
    object sqlListaEntregadorCD_ENTREGA_CAMINHAO_SECUNDARIO: TFMTBCDField
      FieldName = 'CD_ENTREGA_CAMINHAO_SECUNDARIO'
      Required = True
      Precision = 6
      Size = 0
    end
  end
  object dsListaEntregador: TDataSource
    DataSet = sqlListaEntregador
    Left = 160
    Top = 680
  end
  object sqlConsultaOcorrenciaPrazoExpirado: TSimpleDataSet
    Aggregates = <>
    Connection = conexaoProducao
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 288
    Top = 416
  end
  object dsConsultaOcorrenciaPrazoExpirado: TDataSource
    DataSet = sqlConsultaOcorrenciaPrazoExpirado
    Left = 480
    Top = 416
  end
  object _IdFTP: TIdFTP
    IPVersion = Id_IPv4
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 731
    Top = 520
  end
  object _LocalConexao: TLocalConnection
    Left = 808
    Top = 568
  end
  object _sqlGenerica: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      '      SELECT'
      
        '      CD_LOCALIZACAO ENDERECO,NROC_C AS NROC_C,O.NROO_O,N.NRON_N' +
        ','
      '      N.NROO_N,     O.NOTA_O,      N.DENN_N,     Y.NROO_Y,'
      '      SUM(Y.QUAY_Y-Y.QT_AVARIA) AS QUANT,'
      '      CASE'
      '      WHEN Y.ID_PALETE_FRACK='#39'F'#39' THEN '#39'FLOWRACK'#39
      '      WHEN Y.ID_PALETE_FRACK='#39'P'#39' THEN '#39'PALETE'#39
      '      END DESTINO,'
      '      CASE'
      '      WHEN Y.LOTY_Y IS NULL THEN '#39'1012039'#39
      '      WHEN Y.LOTY_Y IS NOT  NULL THEN Y.LOTY_Y'
      
        '      END LOTE,     MERCADORIA.CD_MERCADORIA*10+NR_DV_MERCADORIA' +
        ' CODIGO,'
      
        '      NM_MERCADORIA NOME, DS_APRESENTACAO_MERCADORIA as Apresent' +
        'a'#231#227'o,'
      '      DS_UNIDADE_MEDIDA UN,     N.NRON_N NOTA,'
      '      P.NOMP_P CLIENTE,    QT_FISICO FISICO,'
      '      CD_GRUPO_FORNECEDOR LABORATORIO'
      '      FROM'
      '      PRDDM.DC_MERCADORIA  MERCADORIA,'
      '      PRDDM.DC_COMPRA_MERCADORIA COMPRA,'
      '      PRDDM.DC_LOGISTICA_MERCADORIA LOGISTICA,'
      '      PRDDM.DC_FISCAL_MERCADORIA FISCAL,'
      '      PRDDM.DC_FINANCEIRO_MERCADORIA FINANCEIRO,'
      '      PRDDM.DC_ESTOQUE_MERCADORIA ESTOQUE,'
      '      PRDDM.DCCLI C,'
      '      PRDDM.DCPES  P,'
      '      PRDDM.DCPDC  O,'
      '      PRDDM.DCPDI  Y,'
      '      PRDDIA.DCNOT N '
      '      WHERE'
      '      MERCADORIA.CD_MERCADORIA=COMPRA.CD_MERCADORIA'
      '      AND MERCADORIA.CD_MERCADORIA=LOGISTICA.CD_MERCADORIA'
      '      AND MERCADORIA.CD_MERCADORIA=FISCAL.CD_MERCADORIA'
      '      AND MERCADORIA.CD_MERCADORIA=FINANCEIRO.CD_MERCADORIA'
      '      AND MERCADORIA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA'
      '      AND COMPRA.CD_MERCADORIA=LOGISTICA.CD_MERCADORIA'
      '      AND COMPRA.CD_MERCADORIA=ESTOQUE.CD_MERCADORIA'
      '      AND COMPRA.CD_EMPRESA=ESTOQUE.CD_EMPRESA'
      '      AND COMPRA.CD_EMPRESA=LOGISTICA.CD_EMPRESA'
      '      AND COMPRA.CD_EMPRESA=FISCAL.CD_EMPRESA'
      '      AND COMPRA.CD_EMPRESA=FINANCEIRO.CD_EMPRESA'
      '      AND FINANCEIRO.CD_EMPRESA=ESTOQUE.CD_EMPRESA'
      '      AND P.CGCP_P=C.CGCP_C'
      '      AND Y.NROO_Y=O.NROO_O'
      '      AND CGCP_O=C.CGCP_C'
      '      AND MERCADORIA.CD_MERCADORIA=NROM_Y'
      '      AND NROC_N=NROC_C'
      '      and tipn_n='#39'R'#39
      '      AND O.NROO_O=N.NROO_N'
      
        '      AND TRUNC(DT_FATURAMENTO) BETWEEN '#39'31/10/2014'#39' AND '#39'31/10/' +
        '2014'#39
      '     ---sql.add(PdsFiltro);'
      '      AND O.STAO_O='#39'F'#39
      '      AND ESTOQUE.CD_EMPRESA = 1'
      '      AND MERCADORIA.CD_MERCADORIA NOT IN(13000,2222)'
      '      GROUP BY'
      '      CD_LOCALIZACAO , NROC_C , O.NROO_O,N.NRON_N,'
      '      N.NROO_N       , O.NOTA_O,           N.DENN_N,Y.NROO_Y,'
      
        '      Y.ID_PALETE_FRACK,Y.LOTY_Y,MERCADORIA.CD_MERCADORIA*10+NR_' +
        'DV_MERCADORIA ,'
      
        '      NM_MERCADORIA ,     NM_MERCADORIA,       DS_APRESENTACAO_M' +
        'ERCADORIA,'
      
        '      DS_UNIDADE_MEDIDA ,     N.NRON_N ,P.NOMP_P ,    QT_FISICO ' +
        ',CD_GRUPO_FORNECEDOR')
    SQLConnection = conexaoProducao
    Left = 728
    Top = 624
  end
  object _dspGenerica: TDataSetProvider
    DataSet = _sqlGenerica
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 824
    Top = 624
  end
  object sqlMotivoCancelamento: TSimpleDataSet
    Aggregates = <>
    Connection = conexaoProducao
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 312
    Top = 688
  end
  object dsMotivoCancelamento: TDataSource
    DataSet = cdsMotivoCancelamento
    Left = 432
    Top = 688
  end
  object cdsMotivoCancelamento: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'SELECT * FROM GAMSAC.DC_SAC_MOTIVO_CANCELAMENTO'
    Params = <>
    ProviderName = '_dspGenerica'
    RemoteServer = _LocalConexao
    Left = 536
    Top = 688
    object cdsMotivoCancelamentoCD_SAC_MOTIVO_CANCELAMENTO: TFMTBCDField
      DisplayLabel = 'Codigo'
      FieldName = 'CD_SAC_MOTIVO_CANCELAMENTO'
      Required = True
      Precision = 6
      Size = 0
    end
    object cdsMotivoCancelamentoDS_SAC_MOTIVO_CANCELAMENTO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o Motivo'
      DisplayWidth = 60
      FieldName = 'DS_SAC_MOTIVO_CANCELAMENTO'
      Size = 255
    end
  end
end
