unit USendEmail;

interface

{
   ssleay32.dll e libeay32.dll
}

uses
  Classes,Sysutils,IdMessage,IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,IdSSLOpenSSL,
  IdAttachmentFile,IdText, IdIOHandler, IdIOHandlerSocket,IdEMailAddress,
  UDadosOcorrencia, UDadosCliente, UUsuario, UUtils;

type

  TDadosEmail = class(TObject)
  const
    emailSistema  = 'correa@gam.com.br';


  private
    FServidorEmail : string;
    FContaEmail : string;
    FSenhaEmail : string;
    FEmailRemetente : string;
    FEmailResposta : string;
    FEmailDestino : string;
    FEmailCopia : string;

    procedure setServidor(aServidor:string);
    function getServidor:string;
    procedure setContaEmail(aUsuario:string);
    function getContaEmail:string;
    procedure setSenhaEmail(aSenha:string);
    function getSenhaEmail:string;
    procedure setEmailRemetente(aEmail:string);
    function getEmailRemetente:string;
    procedure setEmailResposta(aEmail:string);
    function getEmailResposta:string;
    procedure setEmailDestino(aEmail:string);
    function getEmailDestino:string;
    procedure setEmailCopia(aEmail:string);
    function getEmailCopia:string;
    function montarCorpoMensagemReCorrencia: WideString;
    function montarCorpoMensagemOcorrencia(dadosMsg: array of TDadosMensagem): WideString;
    function montarCorpoMensagemAlertaSolucaoEmAberto: WideString;
    function montarCorpoMensagemCancelamentoOcorrencia: WideString;
  public
    property servidor : string read getServidor write setServidor;
    property conta : string read getContaEmail write setContaEmail;
    property senha : string read getSenhaEmail write setSenhaEmail;
    property emailRemetente : string read getEmailRemetente write setEmailRemetente;
    property emailDestinatario : string read getEmailDestino write setEmailDestino;
    property emailCopia : string read getEmailCopia write setEmailCopia;
    property emailResposta : string read getEmailResposta write setEmailResposta;

    procedure testarContaDeEmail;
    procedure enviarEmailAlerta;
    procedure enviarEmailRecorrencia(dadosMensagem: TDadosMensagem);
    procedure enviarEmailOcorrencia(dadosMensagem: array of  TDadosMensagem);
    procedure enviarEmailSolucaoPendente(dadosMensagem: TDadosMensagem);
    procedure enviarEmailCancelamentoOcorrencia(dadosMensagem: TDadosMensagem);

    function EmailTipoMIME( TipoMIME : Integer ) : String;
    procedure zeraVariavelDestino;

    procedure free; overload;
    constructor create(aServidor,aConta,aSenha,aEmailRemetente:string);
  end;

implementation

uses UFPrincipal;

constructor TDadosEmail.create(aServidor,aConta,aSenha,aEmailRemetente:string);
begin
  servidor      := aServidor;
  conta         := aConta;
  senha         := aSenha;
  emailRemetente:= aEmailRemetente;
end;

function TDadosEmail.EmailTipoMIME( TipoMIME : Integer ) : String;
begin
  case TipoMIME of
    0 : result := 'text/plain';
    1 : result := 'text/html';
    2 : result := 'text/richtext';
    3 : result := 'text/x-aiff';
    4 : result := 'audio/basic';
    5 : result := 'audio/wav';
    6 : result := 'image/gif';
    7 : result := 'image/jpeg';
    8 : result := 'image/pjpeg';
    9 : result := 'image/tiff';
    10 : result := 'mage/x-png';
    11 : result := 'mage/x-xbitmap';
    12 : result := 'mage/bmp';
    13 : result := 'mage/x-jg';
    14 : result := 'image/x-emf';
    15 : result := 'image/x-wmf';
    16 : result := 'video/avi';
    17 : result := 'video/mpeg';
    18 : result := 'application/postscript';
    19 : result := 'application/base64';
    20 : result := 'application/macbinhex40';
    21 : result := 'application/pdf';
    22 : result := 'application/x-compressed';
    23 : result := 'application/x-zip-compressed';
    24 : result := 'application/x-gzip-compressed';
    25 : result := 'application/java';
    26 : result := 'application/x-msdownload';
    27 : result := 'application/octet-stream'; // arquivos .dat !!!!
    28 : result := 'multipart/mixed';
    29 : result := 'multipart/relative';
    30 : result := 'multipart/digest';
    31 : result := 'multipart/alternative';
    32 : result := 'multipart/related';
    33 : result := 'multipart/report';
    34 : result := 'multipart/signed';
    35 : result := 'multipart/encrypted';
  end;
end;

function TDadosEmail.montarCorpoMensagemOcorrencia(dadosMsg:array of TDadosMensagem) : WideString;
var
  codigoHtml : WideString;
  I: Integer;
begin
  codigoHtml:=             '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">';
  codigoHtml:=codigoHtml + '<html lang="en">';
  codigoHtml:=codigoHtml + '<head><title>Registro de Ocorr�ncia</title>';
  codigoHtml:=codigoHtml + '  <meta http-equiv="content-type" content="text/html; charset=utf-8" >';
  codigoHtml:=codigoHtml + '  <style type="text/css">';
  codigoHtml:=codigoHtml + '    body{	font-family: "Tahoma",sans-serif;	font-size: 16pt;}</style>';
  codigoHtml:=codigoHtml + '  </style>';
  codigoHtml:=codigoHtml + '</head>';
  codigoHtml:=codigoHtml + '<body>';
  codigoHtml:=codigoHtml + '<p style = "font-weight: bold;">  Sr(s), favor verificar na <font color="red">intranet</font> a ocorr�ncia abaixo.';
  codigoHtml:=codigoHtml + '<br/>';
  codigoHtml:=codigoHtml + '    <table border="1" width="75%">';
  codigoHtml:=codigoHtml + '      <tr>';
  codigoHtml:=codigoHtml + '        <td><strong> Dados da Ocorr�ncia </strong>';
  codigoHtml:=codigoHtml + '          <br>N� Ocorr�ncia: '+ inttostr(ocorrencia.cdOcorrencia);
  codigoHtml:=codigoHtml + '          <br>Data Registro: '+ DateTimeToStr(ocorrencia.dataRegistro);
  codigoHtml:=codigoHtml + '          <br>Data Limite  :<strong><font color="red"> '+ datetostr(ocorrencia.dataLimite)+'</font></strong>';
  if ocorrencia.cdPrioridade = 2 then
    codigoHtml:=codigoHtml + '        <br>Prioridade   : <strong><font color="red">'+ ocorrencia.dsPrioridade+'</font></strong>'
  else
    codigoHtml:=codigoHtml + '        <br>Prioridade   : <strong><font color="black">'+ ocorrencia.dsPrioridade+'</strong></font>';

  codigoHtml:=codigoHtml + '          <br>Solucionador:<font color="red"><strong>'+ dadosMsg[0].dsSolucionador +'</strong></font>';
  codigoHtml:=codigoHtml + '          <br>';
  for I := Low(dadosMsg) to High(dadosMsg) do
  begin
    codigoHtml:=codigoHtml + '          <br>Tipo: <strong>'+ dadosMsg[I].dsTipoOcorrencia +'</strong>';
    codigoHtml:=codigoHtml + '          <br>SubTipo: <strong>'+ dadosMsg[I].dsSubTipoOcorrencia +'</strong>';
    codigoHtml:=codigoHtml + '          <br>NFe: <strong>'+ dadosMsg[I].nrNFe +'</strong>';
    if StrToIntDef(dadosMsg[I].nrNFe,0) > 0 then
      codigoHtml:=codigoHtml + '          <br>Emiss�o: <strong>'+ dadosMsg[I].dataEmissaoNFe +'</strong>';
    codigoHtml:=codigoHtml + '          <br>Produto: <strong>'+ dadosMsg[I].dsProduto +'</strong>';
    codigoHtml:=codigoHtml + '          <br>Observa��o: <strong>'+ dadosMsg[I].dsObservacao +'</strong>';
    codigoHtml:=codigoHtml + '          <br>';

    if dadosMsg[I].isEnviarMensagemRecolhimentoMercadoria then
    begin
      codigoHtml:=codigoHtml + '          <br>Aten��o    :<strong><font color="red"> Recolhimento de mercadoria  autorizado!</font></strong>';
      codigoHtml:=codigoHtml + '          <br>';
    end;

    if dadosMsg[I].isEnviarMensagemForaPrazoRegistro then
    begin
      codigoHtml:=codigoHtml + '          <br>Aten��o    :<strong><font color="red"> OCORR�NCIA REGISTRADA FORA DO PRAZO!</font></strong>';
      codigoHtml:=codigoHtml + '          <br>';
    end;

    if dadosMsg[I].isEnviarMensagemProdutoTermolabil then
    begin
      codigoHtml:=codigoHtml + '          <br><font color="red">Orienta��o :</font> Se autorizada a devolu��o do produto termol�bil, repasse ao cliente e ao entregador as orienta��es contidas no link <a href="' + LINK_MENSAGEM_PRODUTO_TERMOLABIL + '"> Devolu��o Termol�beis</a> (clique para acessar).';
      codigoHtml:=codigoHtml + '          <br>';
    end;
  end;

  codigoHtml:=codigoHtml + '        </td>';
  codigoHtml:=codigoHtml + '      </tr>';
  codigoHtml:=codigoHtml + '    </table>';
  codigoHtml:=codigoHtml + '    <table border="1" width="75%">';
  codigoHtml:=codigoHtml + '      <tr>';
  codigoHtml:=codigoHtml + '        <td><strong> Dados do Cliente </strong>';
  codigoHtml:=codigoHtml + '          <br>C�digo      : ' + inttostr(cliente.codigo) + '/' + inttostr(cliente.digito);
  codigoHtml:=codigoHtml + '          <br>CNPJ: ' + cliente.cnpj;
  codigoHtml:=codigoHtml + '          <br>Raz�o Social: ' + cliente.razaoSocial;
  codigoHtml:=codigoHtml + '          <br>Endere�o: ' + cliente.endereco +', '+ cliente.numero;
  codigoHtml:=codigoHtml + '          <br>Bairro: ' + cliente.bairro + ' - Cidade: ' + cliente.cidade + ' - UF: ' + cliente.estado;
  codigoHtml:=codigoHtml + '          <br>Setor       : ' + inttostr(cliente.setor);
  codigoHtml:=codigoHtml + '          <br>Entregador  : ' + cliente.entregador;
  codigoHtml:=codigoHtml + '          <br>Solicitante: ' + ocorrencia.contato + ' - ' + ocorrencia.telefone;
  codigoHtml:=codigoHtml + '          <br>Email para retorno(Cliente): ' + ocorrencia.emailContato;
  codigoHtml:=codigoHtml + '          <br>Email para retorno(Entregador): ' + cliente.emailTransportador;
  codigoHtml:=codigoHtml + '        </td>';
  codigoHtml:=codigoHtml + '      </tr>';
  codigoHtml:=codigoHtml + '    </table>';
  codigoHtml:=codigoHtml + '</p>';
  codigoHtml:=codigoHtml + '<br>' + formatarNomePessoa(usuario.nomeCompleto);
  codigoHtml:=codigoHtml + '<br/><strong>SAC - GAM</strong>';
  codigoHtml:=codigoHtml + '</body>';
  codigoHtml:=codigoHtml + '</html>';
  Result:=codigoHtml;
end;

function TDadosEmail.montarCorpoMensagemReCorrencia : WideString;
var
  codigoHtml : WideString;
begin
  codigoHtml:=             '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">';
  codigoHtml:=codigoHtml + '<html lang="en">';
  codigoHtml:=codigoHtml + '<head><title>Registro de Recorr�ncia</title>';
  codigoHtml:=codigoHtml + '  <meta http-equiv="content-type" content="text/html; charset=utf-8" >';
  codigoHtml:=codigoHtml + '  <style type="text/css">';
  codigoHtml:=codigoHtml + '    body{	font-family: "Tahoma",sans-serif;	font-size: 16pt;}</style>';
  codigoHtml:=codigoHtml + '  </style>';
  codigoHtml:=codigoHtml + '</head>';
  codigoHtml:=codigoHtml + '<body>';
  codigoHtml:=codigoHtml + format('<p style = "font-weight: bold;">  O cliente <font color="red"> %d/%s </font color="red">, entrou em contato <font color="red">novamente</font color="red"> com o SAC, pois a ocorr�ncia %d, registrada em %s, ainda est� pendente, aguardando a solu��o.',[ocorrencia.codigoDigito,ocorrencia.razaoSocial,ocorrencia.cdOcorrencia,datetostr(ocorrencia.dataRegistro)]);
  codigoHtml:=codigoHtml + '<br/>';
  codigoHtml:=codigoHtml + format( '<br/>Novo contato feito pelo cliente/Atendente SAC: %s',[datetostr(recorrencia.dataRecorrencia)]);
  codigoHtml:=codigoHtml + format( '<br/>Prazo da Ocorr�ncia:<font color="red"> %s</font>',[datetostr(ocorrencia.dataLimite)]);
  codigoHtml:=codigoHtml + format( '<br/>Observa��o:<font color="red"> %s</font>',[recorrencia.descRecorrencia]);
  codigoHtml:=codigoHtml + '</p>';
  codigoHtml:=codigoHtml + '<br>' + formatarNomePessoa(usuario.nomeCompleto);
  codigoHtml:=codigoHtml + '<br/><strong>SAC - GAM</strong>';
  codigoHtml:=codigoHtml + '</body>';
  codigoHtml:=codigoHtml + '</html>';
  Result:=codigoHtml;
end;

function TDadosEmail.montarCorpoMensagemCancelamentoOcorrencia : WideString;
var
  codigoHtml : WideString;
begin
  codigoHtml:=             '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">';
  codigoHtml:=codigoHtml + '<html lang="en">';
  codigoHtml:=codigoHtml + '<head><title>Ocorr�ncia Cancelada</title>';
  codigoHtml:=codigoHtml + '  <meta http-equiv="content-type" content="text/html; charset=utf-8" >';
  codigoHtml:=codigoHtml + '  <style type="text/css">';
  codigoHtml:=codigoHtml + '    body{	font-family: "Tahoma",sans-serif;	font-size: 16pt;}</style>';
  codigoHtml:=codigoHtml + '  </style>';
  codigoHtml:=codigoHtml + '</head>';
  codigoHtml:=codigoHtml + '<body>';
  codigoHtml:=codigoHtml + '<p style = "font-weight: bold;"> Para conhecimento, </font>';
  codigoHtml:=codigoHtml + '<br/>';
  codigoHtml:=codigoHtml + format('<p style = "font-weight: bold;">  Informamos que a ocorr�ncia Nro. %d, registrada em %s, foi cancelada.</font>',[ocorrencia.cdOcorrencia,datetostr(ocorrencia.dataRegistro)]);
  codigoHtml:=codigoHtml + '<br/>';
  codigoHtml:=codigoHtml + format( '<br/>Motivo do cancelamento:<font color="red"> %s</font>',[ocorrencia.item.dsMotivoCancelamento]);
  codigoHtml:=codigoHtml + '</p>';
  codigoHtml:=codigoHtml + '<br>' + formatarNomePessoa(usuario.nomeCompleto);
  codigoHtml:=codigoHtml + '<br/><strong>SAC - GAM</strong>';
  codigoHtml:=codigoHtml + '</body>';
  codigoHtml:=codigoHtml + '</html>';
  Result:=codigoHtml;
end;

function TDadosEmail.montarCorpoMensagemAlertaSolucaoEmAberto : WideString;
var
  codigoHtml : WideString;
begin
  codigoHtml:=             '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">';
  codigoHtml:=codigoHtml + '<html lang="en">';
  codigoHtml:=codigoHtml + '<head><title>Registro de Recorr�ncia</title>';
  codigoHtml:=codigoHtml + '  <meta http-equiv="content-type" content="text/html; charset=utf-8" >';
  codigoHtml:=codigoHtml + '  <style type="text/css">';
  codigoHtml:=codigoHtml + '    body{	font-family: "Tahoma",sans-serif;	font-size: 16pt;}</style>';
  codigoHtml:=codigoHtml + '  </style>';
  codigoHtml:=codigoHtml + '</head>';
  codigoHtml:=codigoHtml + '<body>';
  codigoHtml:=codigoHtml + format( '<br/> O protocolo %d, registrado em %s, data limite de solu��o %s, encontra-se pendente aguardando a solu��o.',[solucaoPendente.cdOcorrencia,formatdatetime('dd/mm/yyyy',solucaoPendente.dataRegistro),formatdatetime('dd/mm/yyyy',solucaoPendente.dataLimiteSolucao)]);
  codigoHtml:=codigoHtml + '</p>';
  codigoHtml:=codigoHtml + '<br/>Favor finalizar o mais breve poss�vel.';
  codigoHtml:=codigoHtml + '</p>';
  codigoHtml:=codigoHtml + '</p>';
  codigoHtml:=codigoHtml + '<br>' + formatarNomePessoa(usuario.nomeCompleto);
  codigoHtml:=codigoHtml + '<br/><strong>SAC - GAM</strong>';
  codigoHtml:=codigoHtml + '</body>';
  codigoHtml:=codigoHtml + '</html>';
  Result:=codigoHtml;
end;


procedure TDadosEmail.enviarEmailAlerta;
var
  IdSMTP : TIdSMTP;
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  IdMessage : TIdMessage;
  IdCorpo : TIdText;

begin
  IdSMTP:=TIdSMTP.Create(nil);
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  IdMessage:=TIdMessage.Create(nil);
  try
    // Configura��o do protocolo SSL (TIdSSLIOHandlerSocketOpenSSL)
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

    IdMessage.Clear;
    IdMessage.IsEncoded:= True;
    IdMessage.AttachmentEncoding:='MIME';
    IdMessage.Encoding:=meMIME;
    IdMessage.ConvertPreamble:= True;
    IdMessage.Priority:= mpHigh;
    IdMessage.ContentType:='multipart/mixed';
    IdMessage.CharSet:='ISO-8859-1';
    IdMessage.Date:=Now;

    IdMessage.Subject:='Alerta Sistema SAC';

    IdMessage.From.Name:='Genesio A. Mendes & Cia Ltda';
    IdMessage.From.Address:=EmailRemetente;

    // Desinat�rio e copia
    IdMessage.Recipients.EMailAddresses:=emailSistema;

    IdCorpo := TIdText.Create(IdMessage.MessageParts,nil);
    IdCorpo.ContentType:= EmailTipoMIME(1);
    IdCorpo.ContentDescription:= 'multipart-1';
    IdCorpo.CharSet:= 'ISO-8859-1';
    IdCorpo.ContentTransfer:='16bit';
    IdCorpo.Body.Clear;
    IdCorpo.Body.Add('Erro no processo.');

    try
      IdSMTP.Host:=servidor;
      IdSMTP.Username:=conta;
      IdSMTP.Password:=senha;
      IdSMTP.AuthType:=satDefault;
      IdSMTP.IOHandler := IdSSLIOHandlerSocket;
      IdSMTP.UseTLS := utUseImplicitTLS;
      IdSMTP.Port:=465;
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E:Exception do
        raise Exception.Create(e.Message);
    end;

    try
      IdSMTP.Send(IdMessage);
    except
      on E:Exception do
        raise Exception.Create(e.Message);
    end;

  finally
    //UnLoadOpenSSLLibrary;
    IdSMTP.Disconnect();
    IdSSLIOHandlerSocket.Free;
    IdSMTP.Free;
    IdMessage.Free;
  end;
end;

procedure TDadosEmail.testarContaDeEmail;
var
  IdSMTP : TIdSMTP;
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  IdMessage : TIdMessage;
  IdCorpo : TIdText;

begin
  IdSMTP:=TIdSMTP.Create(nil);
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  IdMessage:=TIdMessage.Create(nil);
  try
    try
      // Configura��o do protocolo SSL (TIdSSLIOHandlerSocketOpenSSL)
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
      IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

      IdSMTP.Host:=servidor;
      IdSMTP.Username:=conta;
      IdSMTP.Password:=senha;
      IdSMTP.AuthType:=satDefault;
      IdSMTP.IOHandler := IdSSLIOHandlerSocket;
      IdSMTP.UseTLS := utUseImplicitTLS;
      IdSMTP.Port:=465;
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E:Exception do
        raise Exception.Create(e.Message);
    end;
  finally
    IdSMTP.Disconnect();
    IdSSLIOHandlerSocket.Free;
    IdSMTP.Free;
    IdMessage.Free;
  end;
end;

procedure TDadosEmail.enviarEmailOcorrencia(dadosMensagem: array of TDadosMensagem);
var
  IdSMTP : TIdSMTP;
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  IdMessage : TIdMessage;
  IdCorpo : TIdText;
  i: integer;
begin
  IdSMTP:=TIdSMTP.Create(nil);
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  IdMessage:=TIdMessage.Create(nil);

  // Configura��o do protocolo SSL (TIdSSLIOHandlerSocketOpenSSL)
  IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
  IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

  try
    IdMessage.Clear;
    IdMessage.IsEncoded:= True;
    IdMessage.AttachmentEncoding:='MIME';
    IdMessage.Encoding:=meMIME;
    IdMessage.ConvertPreamble:= True;
    IdMessage.Priority:= mpHigh;
    IdMessage.ContentType:='multipart/mixed';
    IdMessage.CharSet:='ISO-8859-1';
    IdMessage.Date:=Now;

    emailResposta:=emailRemetente;

    IdMessage.From.Name:='GAM - SAC';
    IdMessage.From.Address:=emailRemetente;
    IdMessage.ReplyTo.EMailAddresses:=emailResposta;

    //IdMessage.Subject:='SAC - Ocorr�ncia n.:' + inttostr(ocorrencia.cdOcorrencia) + ' c/ ' + formatarNomePessoa(usuario.nomeCompleto);
    { Altera��o do assunto do email - SS.: 14149 }
    IdMessage.Subject:=format('SAC - Protocolo N� %d - Tipo: %s - Setor: %d - Cliente: %d/%d %s',[ocorrencia.cdOcorrencia,dadosMensagem[0].dsTipoOcorrencia,cliente.setor,cliente.codigo,cliente.digito,cliente.razaoSocial]);

    if usuario.ambiente = Producao then
    begin
      { email do Destinat�rio }
      IdMessage.Recipients.EMailAddresses:=dadosMensagem[0].emailDestinatario;
      IdMessage.CCList.EMailAddresses:=emailRemetente + ';' + dadosMensagem[0].listaEmailCopia;
    end
    else
      { teste de mensagem }
      IdMessage.Recipients.EMailAddresses:=emailSistema;

    { Corpo da mensagem }
    IdCorpo := TIdText.Create(IdMessage.MessageParts,nil);
    IdCorpo.ContentType:= EmailTipoMIME(1);
    IdCorpo.ContentDescription:= 'multipart-1';
    IdCorpo.CharSet:= 'ISO-8859-1';
    IdCorpo.ContentTransfer:='16bit';
    IdCorpo.Body.Clear;
    IdCorpo.Body.Add(montarCorpoMensagemOcorrencia(dadosMensagem));

    try
      IdSMTP.Host:=servidor;
      IdSMTP.Username:=conta;
      IdSMTP.Password:=senha;
      IdSMTP.AuthType:=satDefault;
      IdSMTP.IOHandler := IdSSLIOHandlerSocket;
      IdSMTP.UseTLS := utUseImplicitTLS;
      IdSMTP.Port:=465;
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E:Exception do
        raise Exception.CreateFmt('Erro ao autenticar conta de email.Detalhes: %s',[E.Message]);
    end;

    try
      IdSMTP.Send(IdMessage);
    except
      on E:Exception do
        raise Exception.CreateFmt('Erro ao enviar mensagem para "%s.".Detalhes: %s',[IdMessage.CCList.EMailAddresses,e.Message]);
    end;

  finally
    IdSMTP.Disconnect();
    IdSMTP.Free;
    IdSSLIOHandlerSocket.Free;
    IdMessage.Free;
  end;
end;

procedure TDadosEmail.enviarEmailRecorrencia(dadosMensagem: TDadosMensagem);
var
  IdSMTP : TIdSMTP;
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  IdMessage : TIdMessage;
  IdCorpo : TIdText;
begin
  IdSMTP:=TIdSMTP.Create(nil);
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  IdMessage:=TIdMessage.Create(nil);

  try
    // Configura��o do protocolo SSL (TIdSSLIOHandlerSocketOpenSSL)
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

    IdMessage.Clear;
    IdMessage.IsEncoded:= True;
    IdMessage.AttachmentEncoding:='MIME';
    IdMessage.Encoding:=meMIME;
    IdMessage.ConvertPreamble:= True;
    IdMessage.Priority:= mpHigh;
    IdMessage.ContentType:='multipart/mixed';
    IdMessage.CharSet:='ISO-8859-1';
    IdMessage.Date:=Now;

    emailResposta:=emailRemetente;

    IdMessage.From.Name:='GAM - SAC';
    IdMessage.From.Address:=emailRemetente;
    IdMessage.ReplyTo.EMailAddresses:=emailResposta;
    IdMessage.Subject:='SAC - Recorr�ncia n.:' + inttostr(recorrencia.cdRecorrencia) + ' c/ ' + formatarNomePessoa(usuario.nomeCompleto);

    if usuario.ambiente = Producao then
    begin
      { email do Desinat�rio }
      IdMessage.Recipients.EMailAddresses:=dadosMensagem.emailDestinatario;
      IdMessage.CCList.EMailAddresses:=emailRemetente +';'+ dadosMensagem.listaEmailCopia;
    end
    else
      { teste de mensagem }
      IdMessage.Recipients.EMailAddresses:=emailSistema;


    { Corpo da mensagem }
    IdCorpo := TIdText.Create(IdMessage.MessageParts,nil);
    IdCorpo.ContentType:= EmailTipoMIME(1);
    IdCorpo.ContentDescription:= 'multipart-1';
    IdCorpo.CharSet:= 'ISO-8859-1';
    IdCorpo.ContentTransfer:='16bit';
    IdCorpo.Body.Clear;
    IdCorpo.Body.Add(montarCorpoMensagemReCorrencia);

    try
      IdSMTP.Host:=servidor;
      IdSMTP.Username:=conta;
      IdSMTP.Password:=senha;
      IdSMTP.AuthType:=satDefault;
      IdSMTP.IOHandler := IdSSLIOHandlerSocket;
      IdSMTP.UseTLS := utUseImplicitTLS;
      IdSMTP.Port:=465;
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E:Exception do
        raise Exception.Create(e.Message);
    end;

    try
      IdSMTP.Send(IdMessage);
    except
      on E:Exception do
        raise Exception.CreateFmt('Erro ao enviar mensagem para "%s.".Detalhes: %s',[IdMessage.CCList.EMailAddresses,e.Message]);
    end;

  finally
    IdSMTP.Disconnect();
    IdSSLIOHandlerSocket.Free;
    IdSMTP.Free;
    IdMessage.Free;
  end;
end;

procedure TDadosEmail.enviarEmailCancelamentoOcorrencia(dadosMensagem: TDadosMensagem);
var
  IdSMTP : TIdSMTP;
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  IdMessage : TIdMessage;
  IdCorpo : TIdText;
begin
  IdSMTP:=TIdSMTP.Create(nil);
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  IdMessage:=TIdMessage.Create(nil);

  try
    // Configura��o do protocolo SSL (TIdSSLIOHandlerSocketOpenSSL)
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

    IdMessage.Clear;
    IdMessage.IsEncoded:= True;
    IdMessage.AttachmentEncoding:='MIME';
    IdMessage.Encoding:=meMIME;
    IdMessage.ConvertPreamble:= True;
    IdMessage.Priority:= mpHigh;
    IdMessage.ContentType:='multipart/mixed';
    IdMessage.CharSet:='ISO-8859-1';
    IdMessage.Date:=Now;

    emailResposta:=emailRemetente;

    IdMessage.From.Name:='GAM - SAC';
    IdMessage.From.Address:=emailRemetente;
    IdMessage.ReplyTo.EMailAddresses:=emailResposta;
    IdMessage.Subject:='SAC - Aviso de Cancelamento de Ocorr�ncia n.:' + inttostr(ocorrencia.cdOcorrencia) + ' c/ ' + formatarNomePessoa(usuario.nomeCompleto);

    if usuario.ambiente = Producao then
    begin
      { email do Desinat�rio }
      IdMessage.Recipients.EMailAddresses:=dadosMensagem.emailDestinatario;
      IdMessage.CCList.EMailAddresses:=emailRemetente +';'+ dadosMensagem.listaEmailCopia;
    end
    else
      { teste de mensagem }
      IdMessage.Recipients.EMailAddresses:=emailSistema;

    { Corpo da mensagem }
    IdCorpo := TIdText.Create(IdMessage.MessageParts,nil);
    IdCorpo.ContentType:= EmailTipoMIME(1);
    IdCorpo.ContentDescription:= 'multipart-1';
    IdCorpo.CharSet:= 'ISO-8859-1';
    IdCorpo.ContentTransfer:='16bit';
    IdCorpo.Body.Clear;
    IdCorpo.Body.Add(montarCorpoMensagemCancelamentoOcorrencia);

    try
      IdSMTP.Host:=servidor;
      IdSMTP.Username:=conta;
      IdSMTP.Password:=senha;
      IdSMTP.AuthType:=satDefault;
      IdSMTP.IOHandler := IdSSLIOHandlerSocket;
      IdSMTP.UseTLS := utUseImplicitTLS;
      IdSMTP.Port:=465;
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E:Exception do
        raise Exception.Create(e.Message);
    end;

    try
      IdSMTP.Send(IdMessage);
    except
      on E:Exception do
        raise Exception.CreateFmt('Erro ao enviar mensagem para "%s.".Detalhes: %s',[IdMessage.CCList.EMailAddresses,e.Message]);
    end;

  finally
    IdSMTP.Disconnect();
    IdSSLIOHandlerSocket.Free;
    IdSMTP.Free;
    IdMessage.Free;
  end;
end;


procedure TDadosEmail.enviarEmailSolucaoPendente(dadosMensagem: TDadosMensagem);
var
  IdSMTP : TIdSMTP;
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  IdMessage : TIdMessage;
  IdCorpo : TIdText;
begin
  IdSMTP:=TIdSMTP.Create(nil);
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  IdMessage:=TIdMessage.Create(nil);

  try
    // Configura��o do protocolo SSL (TIdSSLIOHandlerSocketOpenSSL)
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

    IdMessage.Clear;
    IdMessage.IsEncoded:= True;
    IdMessage.AttachmentEncoding:='MIME';
    IdMessage.Encoding:=meMIME;
    IdMessage.ConvertPreamble:= True;
    IdMessage.Priority:= mpHigh;
    IdMessage.ContentType:='multipart/mixed';
    IdMessage.CharSet:='ISO-8859-1';
    IdMessage.Date:=Now;

    emailResposta:=emailRemetente;

    IdMessage.From.Name:='GAM - SAC';
    IdMessage.From.Address:=emailRemetente;
    IdMessage.ReplyTo.EMailAddresses:=emailResposta;
    IdMessage.Subject:='SAC - Solu��o de Ocorr�ncia Pendente - Protocolo: ' + inttostr(solucaoPendente.cdOcorrencia);

    if usuario.ambiente = Producao then
    begin
      { email do Desinat�rio }
      IdMessage.Recipients.EMailAddresses:=dadosMensagem.emailDestinatario;
      //IdMessage.CCList.EMailAddresses:=emailRemetente; { SS.: 16056 - N�o enviar copia do email para o Sac }
    end
    else
      { teste de mensagem }
      IdMessage.Recipients.EMailAddresses:=emailSistema;


    { Corpo da mensagem }
    IdCorpo := TIdText.Create(IdMessage.MessageParts,nil);
    IdCorpo.ContentType:= EmailTipoMIME(1);
    IdCorpo.ContentDescription:= 'multipart-1';
    IdCorpo.CharSet:= 'ISO-8859-1';
    IdCorpo.ContentTransfer:='16bit';
    IdCorpo.Body.Clear;
    IdCorpo.Body.Add(montarCorpoMensagemAlertaSolucaoEmAberto);

    try
      IdSMTP.Host:=servidor;
      IdSMTP.Username:=conta;
      IdSMTP.Password:=senha;
      IdSMTP.AuthType:=satDefault;
      IdSMTP.IOHandler := IdSSLIOHandlerSocket;
      IdSMTP.UseTLS := utUseImplicitTLS;
      IdSMTP.Port:=465;
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E:Exception do
        raise Exception.Create(e.Message);
    end;

    try
      IdSMTP.Send(IdMessage);
    except
      on E:Exception do
        raise Exception.CreateFmt('Erro ao enviar mensagem para "%s.".Detalhes: %s',[IdMessage.CCList.EMailAddresses,e.Message]);
    end;

  finally
    IdSMTP.Disconnect();
    IdSSLIOHandlerSocket.Free;
    IdSMTP.Free;
    IdMessage.Free;
  end;
end;

procedure TDadosEmail.free;
begin
  destroy;
end;

{ TDadosEmail }

function TDadosEmail.getContaEmail: string;
begin
  Result:=FContaEmail;
end;

function TDadosEmail.getEmailCopia: string;
begin
  Result:=FEmailCopia;
end;

function TDadosEmail.getEmailDestino: string;
begin
  Result:=FEmailDestino;
end;

function TDadosEmail.getEmailRemetente: string;
begin
  Result:=FEmailRemetente;
end;

function TDadosEmail.getEmailResposta: string;
begin
  Result:=FEmailResposta;
end;

function TDadosEmail.getSenhaEmail: string;
begin
  Result:=FSenhaEmail;
end;

function TDadosEmail.getServidor: string;
begin
  Result:=FServidorEmail;
end;

procedure TDadosEmail.setContaEmail(aUsuario: string);
begin
  FContaEmail:=trim(aUsuario);
end;

procedure TDadosEmail.setEmailCopia(aEmail: string);
begin
  FEmailCopia:=trim(aEmail);
end;

procedure TDadosEmail.setEmailDestino(aEmail: string);
begin
  FEmailDestino:=trim(aEmail);
end;

procedure TDadosEmail.setEmailRemetente(aEmail: string);
begin
  FEmailRemetente:=trim(aEmail);
end;

procedure TDadosEmail.setEmailResposta(aEmail: string);
begin
  FEmailResposta:=trim(aEmail);
end;

procedure TDadosEmail.setSenhaEmail(aSenha: string);
begin
  FSenhaEmail:=trim(aSenha);
end;

procedure TDadosEmail.setServidor(aServidor: string);
begin
  FServidorEmail:=trim(aServidor);
end;

procedure TDadosEmail.zeraVariavelDestino;
begin
  FEmailDestino:='';
  FEmailCopia:='';
end;

end.
