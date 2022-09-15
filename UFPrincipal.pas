unit UFPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, ComCtrls, UUsuario, UParametroSistema,
  Menus, UTelefoneAtendimento, Grids, DBGrids, ImgList, UFRelatorio, UUtils,
  UTelaSistema,IniFiles, USendEmail, DateUtils;

type
  TFPrincipal = class(TForm)
    StatusBar: TStatusBar;
    gbxPrincipal: TGroupBox;
    imgLogoGAM: TImage;
    gbxInformacaoSistema: TGroupBox;
    lblSac: TLabel;
    lblNomeOperador: TLabel;
    lblVersaoSistema: TLabel;
    MainMenu: TMainMenu;
    itemMenuCadastro: TMenuItem;
    itemMenuAtendimento: TMenuItem;
    itemMenuConsulta: TMenuItem;
    itemMenuFechar: TMenuItem;
    itemMenuFiladeLigacao: TMenuItem;
    itemMenuIniciarAtendimento: TMenuItem;
    N1: TMenuItem;
    itemMenuConsultaOcorrencia: TMenuItem;
    ImageList1: TImageList;
    itemMenuRelatorio: TMenuItem;
    itemMenuRelatorioControleOcorrencia: TMenuItem;
    itemMenuRelatorioControleRecorrencia: TMenuItem;
    itemMenuRelatorioControledeLigacao: TMenuItem;
    lblAmbiente: TLabel;
    itemMenuRelacaodeSolucaoCadastrada: TMenuItem;
    itemMenuRelacaodeCausasCadastrada: TMenuItem;
    itemMenuIniciarCadastro: TMenuItem;
    N2: TMenuItem;
    PopupMenu: TPopupMenu;
    ConfigurarContadeEmail1: TMenuItem;
    ConfigurarRamal1: TMenuItem;
    tmrEnvioOcorrenciaPendente: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure itemMenuFiladeLigacaoClick(Sender: TObject);
    procedure itemMenuIniciarAtendimentoClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure itemMenuFecharClick(Sender: TObject);
    procedure itemMenuConsultaOcorrenciaClick(Sender: TObject);
    procedure itemMenuRelatorioControleOcorrenciaClick(Sender: TObject);
    procedure itemMenuRelatorioControleRecorrenciaClick(Sender: TObject);
    procedure itemMenuRelatorioControledeLigacaoClick(Sender: TObject);
    procedure itemMenuRelacaodeSolucaoCadastradaClick(Sender: TObject);
    procedure itemMenuRelacaodeCausasCadastradaClick(Sender: TObject);
    procedure itemMenuIniciarCadastroClick(Sender: TObject);
    procedure ConfigurarContadeEmail1Click(Sender: TObject);
    procedure ConfigurarRamal1Click(Sender: TObject);
    procedure tmrEnvioOcorrenciaPendenteTimer(Sender: TObject);
  private
    procedure criarVariaveisPrincipais;
    procedure finalizarVariaveisPrincipais;
    procedure carregaDadosTela;
    procedure carregaDadosPastaSistema;
    function getNomeMenu(cdTela: integer): TMenuItem;
    procedure liberarMenuUsuario;
    procedure desabilitarMenuGeral;
    procedure configurarContaDeEmail;
    procedure gravarConfiguracaoContaDeEmail;
    procedure verificarConfiguracaoDeEmail;
    procedure configurarRamalVoip;
    procedure gravarConfiguracaoTelefoniaVoip;
    procedure verificarConfiguracaoRamalVoip;
    procedure iniciarEnvioDeEmailAutomatico;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses UFLogin, UDm, UFFilaLigacao, UFAtendimentoCliente, UFConsultaOcorrencia,
  UFCadastroGeral, UFRelatorioDeRecorrencia, UFRelatorioLigacao,
  UFRelatorioSolucaoCadastrada, UFRelatorioCausaCadastrada,
  UFEnviaEmailOcorrenciaPendente;

{$R *.dfm}

procedure TFPrincipal.iniciarEnvioDeEmailAutomatico;
begin
  if DaysBetween(StrToDateDef(dadosEmail.dataEnvioAutomatico,Date),dadosEmpresa.dataSistema) > 0 then
  begin
    if Application.MessageBox('Deseja iniciar o envio de email para as ocorrências pendentes?','Confirmação de Processsamento',4 + 32) = 6 then
    begin
      if FEnvioEmailOcorrenciaPendente = nil then
        FEnvioEmailOcorrenciaPendente:=TFEnvioEmailOcorrenciaPendente.Create(Application);

      FEnvioEmailOcorrenciaPendente.Show;
    end;
  end;
end;

procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  finalizarVariaveisPrincipais;
  Action:=caFree;
end;

procedure TFPrincipal.desabilitarMenuGeral;
var
  I : integer;
begin
  { desabilita todos os itens do menu, com exceção do item  com a propriedade "Tag" = 1 }
  for I:=0 to pred(componentcount) do
  begin
    if (Components[i] is TMenuItem) then
    begin
     if (Components[i] as TMenuItem).Tag = 0 then
       (Components[i] as TMenuItem).Enabled:=False;
    end;
  end;
end;

procedure TFPrincipal.liberarMenuUsuario;
var
  i: integer;
begin
  try
    for i := 0 to 99 do
    begin
      if telaLiberada[i].codigo > 0 then
      begin
        telaLiberada[i].nomeMenu:= getNomeMenu(telaLiberada[i].codigo);

        TMenuItem (telaLiberada[i].nomeMenu).Enabled:=True;
      end
      else
        exit;
    end;
  except
    on E:Exception do
      raise Exception.CreateFmt('Erro ao montar menu do usuário. Detalhes: %s',[E.Message]);
  end;
end;

procedure TFPrincipal.tmrEnvioOcorrenciaPendenteTimer(Sender: TObject);
begin
  try
    tmrEnvioOcorrenciaPendente.Enabled:=False;
    if usuario.ambiente = Producao then
      iniciarEnvioDeEmailAutomatico;
  finally

  end;
end;

procedure TFPrincipal.carregaDadosPastaSistema;
begin
  pastaSistema:=TPastaSistema.create;
  pastaSistema.principal:=ExtractFilePath(Application.ExeName);
  pastaSistema.docRave:=pastaSistema.principal + 'DocRave\';
  pastaSistema.relatorio:=pastaSistema.principal + 'Relatorio\';

  if not DirectoryExists(pastaSistema.docRave) then
    ForceDirectories(pastaSistema.docRave);

  if not DirectoryExists(pastaSistema.relatorio) then
    ForceDirectories(pastaSistema.relatorio);
end;

function TFPrincipal.getNomeMenu(cdTela:integer):TMenuItem;
begin
  case cdTela of
    501 : Result:= itemMenuIniciarCadastro;
    502 : begin
            usuario.isControleGeralDoSistema:=True;
            Result:= itemMenuIniciarAtendimento;
    end;
    503 : Result:= itemMenuFiladeLigacao;
    504 : Result:= itemMenuConsultaOcorrencia;
    505 : Result:= itemMenuRelatorioControleOcorrencia;
    506 : Result:= itemMenuRelatorioControleRecorrencia;
    507 : Result:= itemMenuRelatorioControledeLigacao;
    508 : Result:= itemMenuRelacaodeCausasCadastrada;
    509 : Result:= itemMenuRelacaodeSolucaoCadastrada;
  end;
end;

procedure TFPrincipal.itemMenuIniciarCadastroClick(Sender: TObject);
begin
  if FCadastroGeral = nil then
    FCadastroGeral:=TFCadastroGeral.Create(self);

  FCadastroGeral.ShowModal;

end;

procedure TFPrincipal.FormCreate(Sender: TObject);
var
  dsVersaoBase: string;
begin
  try
    try
      {iniciar conexao com a base de dados - cria e carrega dataset de dados }
      DM.carregaConexao;

      if not DirectoryExists('C:\SAC\Arquivos') then
           ForceDirectories('C:\SAC\Arquivos');



      { controle de versão }
      dsVersaoBase:=DM.getVersaoSistema;
      if VERSAO_SISTEMA <> dsVersaoBase then
      begin
        Application.MessageBox(pchar(format('Foi liberada uma nova versão do sistema (%s). Favor atualizar!',[dsVersaoBase])),'Alerta de Versão',0 + 64);
        Application.Terminate;
      end;

      { variaveis (objetos principais }
      criarVariaveisPrincipais;

      { Tela de Login }
      FLogin:=TFLogin.create(Application);
      FLogin.ModalResult:=mrcancel;
      if FLogin.ShowModal <> mroK then
      begin
        Application.Terminate;
        exit;
      end;

      if usuario.ambiente = Homologacao then
      begin
        if Application.MessageBox('Sistema configurado para ambiente de homologação.'+#13+'Deseja mudar para ambiente de produção?','',4 + 32) = 6 then
          usuario.ambiente:=Producao;
      end;

      lblNomeOperador.Caption:= format('Operador : %s',[usuario.nomeCompleto]);
      lblAmbiente.Caption:=     format('Ambiente: %s',[TipoAmbienteToAString(usuario.ambiente)]);
      lblVersaoSistema.Caption:=format('Versão: %s',[VERSAO_SISTEMA]);
      StatusBar.Panels[0].Text:=format('Base de dados: %s',[DM.conexaoProducao.Params.Values['database']]);

      { desabililitar itens do menu }
      desabilitarMenuGeral;

      { liberar menu de acesso }
      liberarMenuUsuario;

      { configuração de email para envio das mensagens }
      verificarConfiguracaoDeEmail;
      { ramal voip }
      verificarConfiguracaoRamalVoip;

      { habilitar envio de email de ocorrências pendentes de solução }
      tmrEnvioOcorrenciaPendente.Enabled:=True;

      Application.ProcessMessages;
    except
      on E:Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    if FLogin <> nil then
      FLogin.Free;
  end;
end;

procedure TFPrincipal.FormResize(Sender: TObject);
begin
  { grava dimensoes da tela principal }
  carregaDadosTela;
end;

procedure TFPrincipal.itemMenuIniciarAtendimentoClick(Sender: TObject);
begin
  if FAtendimentoCliente = nil then
    FAtendimentoCliente:=TFAtendimentoCliente.Create(self);

  FAtendimentoCliente.Show;
end;

procedure TFPrincipal.itemMenuFecharClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente sair do sistema?','SAC - Confirmação de saída do sistema',4 + 32) = 6 then
    Application.Terminate;
end;

procedure TFPrincipal.itemMenuFiladeLigacaoClick(Sender: TObject);
begin
  if FFilaLigacao = nil then
    FFilaLigacao:=TFFilaLigacao.Create(self);

  FFilaLigacao.Show;
end;

procedure TFPrincipal.itemMenuConsultaOcorrenciaClick(Sender: TObject);
begin
  if FConsultaOcorrencia = nil then
    FConsultaOcorrencia:=TFConsultaOcorrencia.Create(self);

  FConsultaOcorrencia.ShowModal;
end;

procedure TFPrincipal.carregaDadosTela;
begin
  if tamanhoTela <> nil then
  begin
    tamanhoTela.topo    :=Top + 55;
    tamanhoTela.esquerda:=Left + 10;
    tamanhoTela.largura :=Width - 20;
    tamanhoTela.altura  :=Height - 80;
  end;
end;

procedure TFPrincipal.finalizarVariaveisPrincipais;
begin
  InicializarDadosTelaSistema;
  pastaSistema.free;
  usuario.free;
  tamanhoTela.Free;
  dadosLigacao.Free;
end;

procedure TFPrincipal.itemMenuRelatorioControleOcorrenciaClick(Sender: TObject);
begin
  if FRelatorio = nil then
    FRelatorio:=TFRelatorio.Create(self);

  FRelatorio.ShowModal;

end;

procedure TFPrincipal.itemMenuRelatorioControleRecorrenciaClick(Sender: TObject);
begin
  if FRelatorioDeRecorrencia = nil then
    FRelatorioDeRecorrencia:=TFRelatorioDeRecorrencia.Create(self);

  FRelatorioDeRecorrencia.ShowModal;
end;

procedure TFPrincipal.itemMenuRelatorioControledeLigacaoClick(Sender: TObject);
begin
  if FRelatorioLigacao = nil then
    FRelatorioLigacao:=TFRelatorioLigacao.Create(self);

  FRelatorioLigacao.ShowModal;
end;

procedure TFPrincipal.itemMenuRelacaodeCausasCadastradaClick(Sender: TObject);
begin
  if FRelatorioCausaCadastrada = nil then
    FRelatorioCausaCadastrada:=TFRelatorioCausaCadastrada.Create(self);

  FRelatorioCausaCadastrada.ShowModal;
end;

procedure TFPrincipal.itemMenuRelacaodeSolucaoCadastradaClick(Sender: TObject);
begin
  if FRelatorioSolucaoCadastrada = nil then
    FRelatorioSolucaoCadastrada:=TFRelatorioSolucaoCadastrada.Create(self);

  FRelatorioSolucaoCadastrada.ShowModal;
end;

procedure TFPrincipal.configurarRamalVoip;
var
 ArqIni:TIniFile;
begin
  ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'ConfigRamalVoip.ini');
  try
    try
      usuario.telefonia.servidor:=ArqIni.ReadString('Voip','servidor','0');
      usuario.telefonia.nrRamalVoip:=ArqIni.ReadInteger('Voip','conta',0);
    except
      on E:Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    ArqIni.Free;
  end;
end;

procedure TFPrincipal.configurarContaDeEmail;
var
 ArqIni:TIniFile;
begin
  ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'ConfigEmail.ini');
  try
    try
      dadosEmail.limparDados;

      dadosEmail.servidorMsgExterna:=ArqIni.ReadString('email','servidorMsgExterna','');
      dadosEmail.servidorMsgInterna:=ArqIni.ReadString('email','servidorMsgInterna','');
      dadosEmail.conta:=ArqIni.ReadString('email','conta','');
      dadosEmail.senha:=DesEncriptaSenhaEmail(ArqIni.ReadString('email','senha',''));
      dadosEmail.email:=ArqIni.ReadString('email','email','');
      dadosEmail.dataEnvioAutomatico:=ArqIni.ReadString('email','dataEnvioAutomatico','');

      if dadosEmail.dataEnvioAutomatico = EmptyStr then
       dadosEmail.dataEnvioAutomatico:=FormatDateTime('dd/mm/yyyy',IncDay(dadosEmpresa.dataSistema,-1));

      if ((dadosEmail.servidorMsgExterna = EmptyStr) or (dadosEmail.conta = EmptyStr) or (dadosEmail.senha = EmptyStr) or (dadosEmail.email = EmptyStr)) then
        raise Exception.Create('Os dados do email não estão configurados corretamente. Arquivo: ConfigEmail.ini ');
    except
      on E:Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    ArqIni.Free;
  end;
end;

procedure TFPrincipal.ConfigurarContadeEmail1Click(Sender: TObject);
begin
  if Application.MessageBox('Deseja alterar a configuração de email do sistema ?','Confirmação de Alteração de Email',4 + 32) = 6 then
    gravarConfiguracaoContaDeEmail;
end;

procedure TFPrincipal.ConfigurarRamal1Click(Sender: TObject);
begin
  if Application.MessageBox('Deseja alterar a configuração de telefonia Voip do Sistema ?','Confirmação de Alteração de Telefonia',4 + 32) = 6 then
    gravarConfiguracaoTelefoniaVoip;
end;

procedure TFPrincipal.gravarConfiguracaoContaDeEmail;
var
 ArqIni:TIniFile;
 sendEmail:TDadosEmail;
 dsArquivoConfig: string;
begin
  dsArquivoConfig:=ExtractFilePath(Application.ExeName)+'ConfigEmail.ini';

  ArqIni := TIniFile.Create(dsArquivoConfig);
  try
    try
      dadosEmail.limparDados;
      dadosEmail.servidorMsgInterna:=InputBox('Servidor de Email - Interno','Servidor:',NM_SMTP_MSG_INTERNA);
      dadosEmail.servidorMsgExterna:=InputBox('Servidor de Email - Externo','Servidor:',NM_SMTP_MSG_EXTERNA);
      dadosEmail.conta:=   InputBox('Conta de acesso','Conta:','sac');
      dadosEmail.senha:=   InputBox('Senha de acesso','Senha:','');
      dadosEmail.email:=   InputBox('Endereço de Email','Email:','sac@gam.com.br');
      dadosEmail.dataEnvioAutomatico:= FormatDateTime('dd/mm/yyyy',dadosEmpresa.dataSistema);


      if ((dadosEmail.servidorMsgExterna = EmptyStr) or (dadosEmail.conta = EmptyStr) or (dadosEmail.senha = EmptyStr) or (dadosEmail.email = EmptyStr)) then
        raise Exception.Create('Verificar configuração de email. O arquivo de configuração não será criado e não será possível enviar mensagens pelo sistema.')
      else
      begin
        try
          { testar conta de email }
          sendEmail:=TDadosEmail.create(dadosEmail.servidorMsgExterna,dadosEmail.conta,dadosEmail.senha,dadosEmail.email);
          sendEmail.testarContaDeEmail;

          ArqIni.WriteString('email','servidorMsgExterna',dadosEmail.servidorMsgExterna);
          ArqIni.WriteString('email','servidorMsgInterna',NM_SMTP_MSG_INTERNA);
          ArqIni.WriteString('email','conta',dadosEmail.conta);

          dadosEmail.senha:=EncriptaSenhaEmail(dadosEmail.senha);
          ArqIni.WriteString('email','senha',dadosEmail.senha);
          ArqIni.WriteString('email','email',dadosEmail.email);
          ArqIni.WriteString('email','dataEnvioAutomatico',dadosEmail.dataEnvioAutomatico);

          if FileExists(dsArquivoConfig) then
            Application.MessageBox('Dados de email configurados com sucesso!','Informação do sistema',0 + 64)
          else
            Application.MessageBox('Ocorreu algum erro na gravação do arquivo de configuração. Tente novamente ou entre em contato com a área de TI.','Informação do sistema',0 + 16);
        except
          on E:Exception do
            raise Exception.Create('Não foi possível conectar no servidor de email. Confirme as informações de acesso com o administrador de redes.');
        end;
      end;
    except
      on E:Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    if sendEmail <> nil then
      sendEmail.free;

    ArqIni.Free;
  end;
end;

procedure TFPrincipal.verificarConfiguracaoDeEmail;
begin
  if itemMenuIniciarAtendimento.Enabled then
  begin
    if FileExists(pastaSistema.principal + 'ConfigEmail.ini') then
      configurarContaDeEmail
    else
    begin
      if Application.MessageBox('Arquivo de configuração de email não localizado. Deseja iniciar a configuração?','Configuração de Email',4 + 32) = 6 then
        gravarConfiguracaoContaDeEmail;
    end;
  end;
end;

procedure TFPrincipal.gravarConfiguracaoTelefoniaVoip;
var
 ArqIni:TIniFile;
 dsArquivoConfig: string;
begin
  dsArquivoConfig:=ExtractFilePath(Application.ExeName)+'ConfigRamalVoip.ini';

  try
    try
      usuario.telefonia.limparDados;
      usuario.telefonia.servidor    :=InputBox('Servidor Voip','IP:','10.1.1.23');
      usuario.telefonia.nrRamalVoip :=StrToIntDef(InputBox('Ramal Voip','Ramal:','0'),0);


      if ((usuario.telefonia.servidor = EmptyStr) or (usuario.telefonia.nrRamalVoip = 0)) then
        raise Exception.Create('Verificar configuração de telefonia Voip. O arquivo de configuração não será criado e não será possível iniciar chamadas pelo sistema.')
      else
      begin
        try
          ArqIni := TIniFile.Create(dsArquivoConfig);

          ArqIni.WriteString('Voip','servidor',usuario.telefonia.servidor);
          ArqIni.WriteInteger('Voip','conta',usuario.telefonia.nrRamalVoip);


          if FileExists(dsArquivoConfig) then
            Application.MessageBox('Dados de telefonia configurados com sucesso!','Informação do sistema',0 + 64)
          else
            Application.MessageBox('Ocorreu algum erro na gravação do arquivo de configuração. Tente novamente ou entre em contato com a área de TI.','Informação do sistema',0 + 16);
        except
          on E:Exception do
            raise Exception.Create(E.Message);
        end;
      end;
    except
      on E:Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    ArqIni.Free;
  end;
end;

procedure TFPrincipal.verificarConfiguracaoRamalVoip;
begin
  if itemMenuIniciarAtendimento.Enabled then
  begin
    if FileExists(pastaSistema.principal + 'ConfigRamalVoip.ini') then
      configurarRamalVoip
    else
    begin
      if Application.MessageBox('Arquivo de configuração da telefonia Voip não localizado. Deseja iniciar a configuração?','Configuração de Telefonia',4 + 32) = 6 then
        gravarConfiguracaoTelefoniaVoip;
    end;
  end;
end;

procedure TFPrincipal.criarVariaveisPrincipais;
begin
  carregaDadosPastaSistema;

  usuario:=TUsuario.create;
  tamanhoTela:=TDimensaoTela.create;
  dadosLigacao:=TFDadosLigacao.Create;
end;

end.

