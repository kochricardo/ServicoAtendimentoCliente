unit UFEnviaEmailOcorrenciaPendente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, UDadosOcorrencia, USendEmail, UParametroSistema, StdCtrls,
  IniFiles;

type
  TFEnvioEmailOcorrenciaPendente = class(TForm)
    StatusBar1: TStatusBar;
    lblMsgEnvio: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    procedure iniciarEnvioDeEmail;
    procedure carregarDadosDaOcorrencia;
    procedure enviarEmailPendencia;
    procedure atualizarUltimaDataDeEnvioDeEmail;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEnvioEmailOcorrenciaPendente: TFEnvioEmailOcorrenciaPendente;
  dadosMensagem: TDadosMensagem;

implementation

uses UDm;

{$R *.dfm}

procedure TFEnvioEmailOcorrenciaPendente.atualizarUltimaDataDeEnvioDeEmail;
var
 ArqIni:TIniFile;
 dsArquivoConfig: string;
begin
  dsArquivoConfig:=ExtractFilePath(Application.ExeName)+'ConfigEmail.ini';

  ArqIni := TIniFile.Create(dsArquivoConfig);
  try
    try
      ArqIni.WriteString('email','dataEnvioAutomatico',FormatDateTime('dd/mm/yyyy',dadosEmpresa.dataSistema));

    except
      on E:Exception do
        raise Exception.Create('Não foi possível atualizar a data de envio dos emails automaticos.');
    end;
  finally
    ArqIni.Free;
  end;
end;

procedure TFEnvioEmailOcorrenciaPendente.enviarEmailPendencia;
var
  sendEmail: TDadosEmail;
begin
  sendEmail:=TDadosEmail.create(dadosEmail.servidorMsgInterna,dadosEmail.conta,dadosEmail.senha,dadosEmail.email);
  try
    dadosMensagem.emailDestinatario:=solucaoPendente.emailDoSolucionador;

    { enviar email }
    sendEmail.enviarEmailSolucaoPendente(dadosMensagem);
  finally
    sendEmail.free;
  end;
end;


procedure TFEnvioEmailOcorrenciaPendente.carregarDadosDaOcorrencia;
begin
  solucaoPendente.limparDados;
  solucaoPendente.cdOcorrencia:=DM.sqlConsultaOcorrenciaPrazoExpirado.FieldByName('protocolo').AsInteger;
  solucaoPendente.emailDoSolucionador:=DM.sqlConsultaOcorrenciaPrazoExpirado.FieldByName('ds_email').AsString;
  solucaoPendente.dataRegistro:=DM.sqlConsultaOcorrenciaPrazoExpirado.FieldByName('data_registro').AsDateTime;
  solucaoPendente.dataLimiteSolucao:=DM.sqlConsultaOcorrenciaPrazoExpirado.FieldByName('data_limite').AsDateTime;
end;

procedure TFEnvioEmailOcorrenciaPendente.iniciarEnvioDeEmail;
var
  cont: integer;
  total: integer;
begin
  try
    { consulta ocorrencias pendentes de solução (prazo expirado) }
    DM.execConsultaOcorrenciaComPrazoExpirado;

    total:=DM.sqlConsultaOcorrenciaPrazoExpirado.RecordCount;
    cont:=0;
    while not DM.sqlConsultaOcorrenciaPrazoExpirado.Eof do
    begin
      try
        inc(cont);
        StatusBar1.SimpleText:=format('Enviando %d de %d registros.',[cont,total]);
        Application.ProcessMessages;
        { carrega dados para gerar informaçoes da mensagem }
        carregarDadosDaOcorrencia;
        { enviar email }
        enviarEmailPendencia;

        DM.sqlConsultaOcorrenciaPrazoExpirado.Next;
      except
        on E:Exception do
          raise Exception.CreateFmt('Erro ao enviar mensagem. Detalhes: %s',[E.Message]);
      end;
    end;
  finally
    StatusBar1.SimpleText:=format('Enviados %d de %d registros.',[cont,total]);
    Application.ProcessMessages;
  end;
end;

procedure TFEnvioEmailOcorrenciaPendente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFEnvioEmailOcorrenciaPendente.FormShow(Sender: TObject);
begin
  try
    try
      atualizarUltimaDataDeEnvioDeEmail;
      iniciarEnvioDeEmail;
    except

    end;
  finally
    Close;
  end;
end;

end.
