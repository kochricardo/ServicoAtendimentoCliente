program ServicoAtendimentoCliente;

uses
  Forms,
  UFPrincipal in 'UFPrincipal.pas' {FPrincipal},
  UFLogin in 'UFLogin.pas' {FLogin},
  UDm in 'UDm.pas' {DM: TDataModule},
  UUsuario in 'UUsuario.pas',
  UtilConexao in 'UtilConexao.pas',
  UTelefoneAtendimento in 'UTelefoneAtendimento.pas',
  UMsgPadrao in 'UMsgPadrao.pas',
  UFFilaLigacao in 'UFFilaLigacao.pas' {FFilaLigacao},
  UParametroSistema in 'UParametroSistema.pas',
  UFAtendimentoCliente in 'UFAtendimentoCliente.pas' {FAtendimentoCliente},
  UFItemOcorrencia in 'UFItemOcorrencia.pas' {FItemOcorrencia},
  UDadosOcorrencia in 'UDadosOcorrencia.pas',
  UDadosCliente in 'UDadosCliente.pas',
  UUtils in 'UUtils.pas',
  URelacaoCliente in 'URelacaoCliente.pas' {FRelacaoCliente},
  UFDadosTransbordoCarga in 'UFDadosTransbordoCarga.pas' {FDadosTransbordoCarga},
  UFConsultaOcorrencia in 'UFConsultaOcorrencia.pas' {FConsultaOcorrencia},
  UFVisualizacaoOcorrencia in 'UFVisualizacaoOcorrencia.pas' {FVisualizacaoOcorrencia},
  UFSolucaoItem in 'UFSolucaoItem.pas' {FSolucaoItem},
  UFCausaItem in 'UFCausaItem.pas' {FCausaItem},
  UFCadastroGeral in 'UFCadastroGeral.pas' {FCadastroGeral},
  UFRegistroRecorrencia in 'UFRegistroRecorrencia.pas' {FRegistroReCorrencia},
  UFVisualizacaoRecorrencia in 'UFVisualizacaoRecorrencia.pas' {FVisualizacaoRecorrencia},
  MessageDigest_5 in 'MessageDigest_5.pas',
  USendEmail in 'USendEmail.pas',
  UFRelatorio in 'UFRelatorio.pas' {FRelatorio},
  UTipoRelatorio in 'UTipoRelatorio.pas',
  UFRelatorioDeRecorrencia in 'UFRelatorioDeRecorrencia.pas' {FRelatorioDeRecorrencia},
  UFRelatorioLigacao in 'UFRelatorioLigacao.pas' {FRelatorioLigacao},
  UFRelatorioSolucaoCadastrada in 'UFRelatorioSolucaoCadastrada.pas' {FRelatorioSolucaoCadastrada},
  UFRelatorioCausaCadastrada in 'UFRelatorioCausaCadastrada.pas' {FRelatorioCausaCadastrada},
  UTelaSistema in 'UTelaSistema.pas',
  UFEnviaEmailOcorrenciaPendente in 'UFEnviaEmailOcorrenciaPendente.pas' {FEnvioEmailOcorrenciaPendente},
  UFCancelamentoOcorrencia in 'UFCancelamentoOcorrencia.pas' {FCancelamentoDeOcorrencia},
  uFRelacaoVolumeNota in 'uFRelacaoVolumeNota.pas' {FRelacaoVolumeDaNota};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'SAC';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFRelatorioLigacao, FRelatorioLigacao);
  Application.Run;
end.
