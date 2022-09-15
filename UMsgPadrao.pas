unit UMsgPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes;

const
  { hints de mensagens }
  HINT_ITEM_NFE = ' LEGENDA / TECLAS DE ATALHO | '+
                  '* LINHA VERMELHO: POSSIBILIDADE DE LOTES DIFERENTES.'+ #13 +
                  '* LINHA AZUL: PRODUTO REFRIGERADO.'+#13+
                  '* LINHA VERDE: PRODUTO ANTINEOPLASICO(ONCOLOGICO).'+#13+
                  ' '+#13+
                  '* ALT + "C" = PESQUISA PRODUTO PELO CODIGO.'+#13+
                  '* ALT + "N" PESQUISA PRODUTO PELO NOME.'+#13+
                  '* "F1" = GRAVAR DADOS DA NOTA E DO ITEM SELECIONADO.'+#13+
                  '* "ESC" = FECHA RELA��O DE ITENS.'+#13+
                  ' '+#13+'|9';

  HINT_NFE = ' LEGENDA / TECLAS DE ATALHO | '+
                  '* "F1" = GRAVAR DADOS DA NOTA SELECIONADA.'+#13+
                  '* "ESC" = FECHA RELA��O DE NOTAS/PEDIDOS/DUPLICATAS.'+#13+
                  '* "ENTER" = ABRE RELA��O DE ITENS DA(O) NOTA/PEDIDO.'+#13+
                  ' '+#13+'|9';

  HINT_OBSERVACAO = ' LEGENDA / TECLAS DE ATALHO | '+
                  '* "CTRL + "Q" = QUER EFETUAR A DEVOLU��O.'+#13+
                  '* "CTRL + "F" = FAR� A DEVOLU��O.'+#13+
                  '* "CTRL + "E" = CLIENTE SOLICITOU POR ENGANO VIA EGAM'+#13+
                  '* "CTRL + "R" = SR. REPRESENTANTE, FAVOR RECOLHER MERCADORIA'+#13+
                  ' '+#13+'|9';

  HINT_RELACAO_OCORRENCIA = ' LEGENDADE CORES / TECLAS DE ATALHO | '+
                  '* LINHA LARANJA: OCORRENCIA PENDENTE (DENTRO DO LIMITE).'+ #13 +
                  '* LINHA VERMELHA: OCORRENCIA PENDENTE (LIMITE ULTRAPASSADO).'+#13+
                  '* LINHA AMARELA: OCORRENCIA FINALIZADA PARCIALMENTE.'+ #13 +
                  '* LINHA VERDE: OCORRENCIA FINALIZADA.'+#13+
                  '* LINHA AZUL: OCORRENCIA CANCELADA.'+#13+
                  ' '+#13+
                  '* "ENTER" = VISUALIZAR OCORRENCIA.'+#13+
                  ' '+#13+'|9';

  HINT_FILTRO_MES_ATUAL = 'FILTROS|MARQUE PARA LISTAR SOMENTE OCORR�NCIAS DO M�S ATUAL!|0';

  HINT_DEFINIR_SOLUCIONADOR = 'SOLUCIONADOR|CLIQUE PARA DEFINIR O '+#13+'REPRESENTANTE COMO SOLUCIONADOR!'+#13+'|0';

  HINT_ALTERAR_SOLUCIONADOR = 'SOLUCIONADOR|CLIQUE PARA HABILITAR ALTERA��O DO SOLUCIONADOR!'+#13+'|0';


  CD_SITUACAO_OCORRENCIA_CANCELADA = 4;

  { codigos solu��o - ocorrencia }
  CD_SOLUCAO_PENDENTE_OCORRENCIA = 1;
  CD_SOLUCAO_PARCIAL_OCORRENCIA = 2;
  CD_SOLUCAO_FINALIZADA_OCORRENCIA = 3;

  { codigos causa - ocorrencia }
  CD_CAUSA_PENDENTE_OCORRENCIA = 1;
  CD_CAUSA_PARCIAL_OCORRENCIA = 2;
  CD_CAUSA_FINALIZADA_OCORRENCIA = 3;
  DS_CAUSA_PENDENTE_ITEM = 'Pendente';
  DS_CAUSA_FINALIZADA_ITEM = 'Finalizada';

  { codigos solu��o - item }
  CD_SOLUCAO_PENDENTE_ITEM = 1;
  CD_SOLUCAO_FINALIZADA_ITEM = 2;
  DS_SOLUCAO_PENDENTE_ITEM = 'Pendente';
  DS_SOLUCAO_FINALIZADA_ITEM = 'Finalizada';

  { codigos causa - item }
  CD_CAUSA_PENDENTE_ITEM = 1;
  CD_CAUSA_SEM_NECESSIDADE_ITEM = 2;
  CD_CAUSA_FINALIZADA_ITEM = 3;

  { dados do solucionador padr�o para "Grandes Redes"}
  NR_MATRICULA_SOLUCIONADOR_GAM_1 = 1228;  {WILLIAN PEREIRA NUNES . ss.32836 }
  NR_MATRICULA_SOLUCIONADOR_GAM_2 = 1592;  { HEITOR SPINDOLA ANSELMO - SS.: 33301 }
  NR_MATRICULA_SOLUCIONADOR_GAM_3 = 2116;  { FREDERICO ALCEU DIAS PEREIRA - SS.: 20415  }
  NR_MATRICULA_SOLUCIONADOR_GAM_4 = 1603;  { Morgana Delfino Costa }
  NR_MATRICULA_SOLUCIONADOR_GAM_5 = 1394;  { Cesar K }
  NR_MATRICULA_SOLUCIONADOR_GAM_6 = 1473;  { Renan Marcos Izidoro }

  DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_1 = 'willian.pereira@gam.com.br';
  DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_2 = 'heitor.anselmo@gam.com.br';
  DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_3 = 'frederico.pereira@gam.com.br';
  DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_4 = 'morgana.costa@gam.com.br';
  DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_5 = 'cesark@gam.com.br';
  DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_6 = 'renan.izidoro@gam.com.br';

  DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_RS = 'nagia.cortes@gam.com.br';
  DS_EMAIL_TRANSLOG = 'marlon.silveira@translogtransportes.com.br;devolucao@translogtransportes.com.br;atendimento06@translogtransportes.com.br;claudia.honorio@translogtransportes.com.br';
  DS_EMAIL_PADRAO_LOGISTICA_GAM_SC = 'alex.francisco@gam.com.br;leandro.sartor@gam.com.br';

  CAPTION_DEMAIS_INFORMACOES = '   Demais   '+#13+'Informa��es ->';

  { observa��es fixas }
  MSG_DEVOLUCAO_1 = ' QUER EFETUAR DEVOLUCAO.';
  MSG_DEVOLUCAO_2 = ' FARA DEVOLUCAO.';
  MSG_ENGANO_CLIENTE_1 = ' CLIENTE SOLICITOU POR ENGANO VIA EGAM.';
  MSG_RECOLHIMENTO_MERCADORIA = ' SR. REPRESENTANTE, FAVOR RECOLHER MERCADORIA.';

  { codigo da empresa }
  CD_GAM_SC = 1;
  CD_GAM_RS = 4;

  { tipo de ocorrencia }
  CD_TIPO_OCORRENCIA_PRODUTO_AVARIADO = 2;
  CD_TIPO_OCORRENCIA_PRODUTO_AVARIADO_48_HORAS = 15;
  CD_TIPO_OCORRENCIA_PRODUTO_COM_DEFEITO = 6;
  CD_TIPO_OCORRENCIA_DEVOLUCAO = 7;
  CD_TIPO_OCORRENCIA_DEVOLUCAO_HOSPITALAR = 13;
  CD_TIPO_OCORRENCIA_DEVOLUCAO_TELEVENDAS = 14;
  CD_TIPO_OCORRENCIA_PESQUISA = 17;

  CD_SUBTIPO_OCORRENCIA_VENC_CURTO1 = 17;
  CD_SUBTIPO_OCORRENCIA_VENC_CURTO2 = 31;
  CD_SUBTIPO_DEFEITO_FABRICA = 1;
  CD_SUBTIPO_PRODUTO_RECOLHIDO = 11;

  DS_ALERTA_RECALL_LOTE = '**RECALL**';

  { Ordem de Coleta }
  ID_SITUACAO_ORDEM_DE_COLETA_NAO_SE_APLICA = 'N';
  ID_SITUACAO_ORDEM_DE_COLETA_AGUARDANDO = 'A';
  ID_SITUACAO_ORDEM_DE_COLETA_EMITIDA = 'E';

implementation



end.