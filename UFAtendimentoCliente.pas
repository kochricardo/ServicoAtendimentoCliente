unit UFAtendimentoCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  UParametroSistema, UDadosCliente, UDadosOcorrencia, ImgList, ToolWin, UUtils,
  UUsuario, UMsgPadrao, pngimage, OleCtrls, SHDocVw, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP;

type
  TFAtendimentoCliente = class(TForm)
    StatusBar: TStatusBar;
    gbxPrincipal: TGroupBox;
    gbxDadosOcorrencia: TGroupBox;
    gbxDadosCliente: TGroupBox;
    gbxIdentificacaoCliente: TGroupBox;
    gbxControleOcorrencia: TGroupBox;
    lblControle: TLabel;
    lblHorarioAtual: TLabel;
    rdpFiltroPesquisa: TRadioGroup;
    gbxFiltroPesquisa: TGroupBox;
    lblEdtRazaoSocial: TLabeledEdit;
    lblEdtCidade: TLabeledEdit;
    lblEdtUF: TLabeledEdit;
    lblEdtSetor: TLabeledEdit;
    lblEdtDtUltimaCompra: TLabeledEdit;
    lblEdtVencAlvara: TLabeledEdit;
    lblEdtSituacaoCliente: TLabeledEdit;
    lblEdtCodigoCliente: TLabeledEdit;
    lblEdtCNPJ: TLabeledEdit;
    lblEdtEnderecoCliente: TLabeledEdit;
    lblEdtEmailNFe1: TLabeledEdit;
    lblEdtEmailNFe2: TLabeledEdit;
    TBarAtendimento: TToolBar;
    tBtnInicar: TToolButton;
    tBtnCancelar: TToolButton;
    tBtnSalvar: TToolButton;
    tBtnInicarPesquisaSatisfacao: TToolButton;
    tBtnFechar: TToolButton;
    tmrHorario: TTimer;
    lblFiltroPesquisa: TLabel;
    edtFiltroPesquisa: TEdit;
    gbxItemOcorrencia: TGroupBox;
    dbgrItemOcorrencia: TDBGrid;
    gbxInformacaoAdicional: TGroupBox;
    lblObservacao: TLabel;
    lblContMemo: TLabel;
    memObsOcorrencia: TMemo;
    rdpPrioridade: TRadioGroup;
    lblEdtContato: TLabeledEdit;
    btnAdicioaritemOcorrencia: TBitBtn;
    ImageList: TImageList;
    lblEdtEntregador: TLabeledEdit;
    wbLigacaoAuto: TWebBrowser;
    lblEdtTelefoneCliente: TLabeledEdit;
    lblEdtEmailSacCliente: TLabeledEdit;
    rdpMeioDeContato: TRadioGroup;
    _lbeArquivoOcorrencia: TLabeledEdit;
    _btnLocalizaArquivo: TBitBtn;
    _opdLocalizaArquivo: TOpenDialog;
    _IdFTP: TIdFTP;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAdicioaritemOcorrenciaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tBtnFecharClick(Sender: TObject);
    procedure tBtnInicarClick(Sender: TObject);
    procedure tBtnCancelarClick(Sender: TObject);
    procedure tmrHorarioTimer(Sender: TObject);
    procedure rdpFiltroPesquisaClick(Sender: TObject);
    procedure edtFiltroPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure memObsOcorrenciaKeyPress(Sender: TObject; var Key: Char);
    procedure memObsOcorrenciaChange(Sender: TObject);
    procedure lblEdtContatoKeyPress(Sender: TObject; var Key: Char);
    procedure lblEdtVencAlvaraChange(Sender: TObject);
    procedure dbgrItemOcorrenciaTitleClick(Column: TColumn);
    procedure memObsOcorrenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tBtnSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rdpPrioridadeClick(Sender: TObject);
    procedure dbgrItemOcorrenciaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgrItemOcorrenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wbLigacaoAutoDocumentComplete(ASender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure lblEdtTelefoneClienteEnter(Sender: TObject);
    procedure lblEdtTelefoneClienteExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure wbLigacaoAutoDownloadBegin(Sender: TObject);
    procedure wbLigacaoAutoQuit(Sender: TObject);
    procedure _btnLocalizaArquivoClick(Sender: TObject);
  private
    procedure fecharFormulario;
    procedure limparDadosAtendimento;
    procedure salvarOcorrencia;
    procedure iniciarPesquisaSatisfacao;
    procedure limpaEdit;
    procedure consultarDadosCliente;
    procedure carregarDadosOcorrencia;
    procedure atualizarHorarioTela;
    procedure abrirTelaItemOcorrencia;
    procedure validarVersãoSistema;
    procedure execIniciarLigacaoAutomatica;
    function GravaArquivoOcorrencia: Boolean;
    function TranfereArquivoFtp(dsLocalArquivo, dsDestinoArquivo, nmArquivo,
      dsTNSMAQUINA, nmUsuario, dsSenhaUsuatio: STRING): Boolean;
    { Private declarations }
  public
    dslocalArquivo,
    dsNomeArquivo :String;
    procedure carregaDadosCliente;
    procedure iniciarNovoAtendimento;
    { Public declarations }

  end;

var
  FAtendimentoCliente: TFAtendimentoCliente;

implementation

uses UFItemOcorrencia, UFFilaLigacao, UDm, URelacaoCliente;

{$R *.dfm}

procedure TFAtendimentoCliente.btnAdicioaritemOcorrenciaClick(Sender: TObject);
begin
  if DM.cdsOcorrencia.IsEmpty then
  begin
    cliente.contato:=lblEdtContato.Text;

    { grava dados da ocorrencia }
    carregarDadosOcorrencia;

    { grava dataSet Local }
    DM.gravarOcorrenciaLocal;
    lblControle.Caption:=FormatFloat('000000',ocorrencia.cdOcorrencia);
    Application.ProcessMessages;
  end;
  lblEdtTelefoneCliente.SetFocus;
  Application.ProcessMessages;

  if FItemOcorrencia = nil then
    FItemOcorrencia:=TFItemOcorrencia.Create(nil);

  FItemOcorrencia.MODO_TELA:=normal;
  FItemOcorrencia.ShowModal;
end;

procedure TFAtendimentoCliente.lblEdtContatoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key=#13 then
   begin
     key:=#0;
     perform(wm_nextdlgctl,0,0);
   end;
end;

procedure TFAtendimentoCliente.lblEdtTelefoneClienteEnter(Sender: TObject);
begin
  TLabeledEdit(Sender).SelectAll;
end;

procedure TFAtendimentoCliente.lblEdtTelefoneClienteExit(Sender: TObject);
begin
  if lblEdtTelefoneCliente.Text <> EmptyStr then
    lblEdtTelefoneCliente.Text:=formataNumeroTelefone(lblEdtTelefoneCliente.Text);
end;

procedure TFAtendimentoCliente.lblEdtVencAlvaraChange(Sender: TObject);
begin
  if cliente.dataVencAlvara < dadosEmpresa.dataSistema then
    lblEdtVencAlvara.Font.Color:=clRed
  else
    lblEdtVencAlvara.Font.Color:=clBlack;
end;

procedure TFAtendimentoCliente.limpaEdit;
var
  I : integer;
begin
  for I:=0 to componentcount -1 do
  begin
    if components[I] is TLabeledEdit then
      (components[I] as TLabeledEdit).Clear;

    if (Components[i] is TEdit) then
     (Components[i] as TEdit).Clear;

    if (Components[i] is TRadioButton) then
     (Components[i] as TRadioButton).Checked:=false;
  end;
end;

procedure TFAtendimentoCliente.memObsOcorrenciaChange(Sender: TObject);
var
  cont: integer;
begin
  { habilita o botao salvar (se tiver algum item gravado) }
  if not DM.cdsItemOcorrencia.IsEmpty then
    tBtnSalvar.Enabled:=True;

  cont:=Length(memObsOcorrencia.Text);
  lblContMemo.Caption:=inttostr(cont)+'/200';
  Application.ProcessMessages;
end;

procedure TFAtendimentoCliente.memObsOcorrenciaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ((Shift = [ssAlt]) and (key = 83)) then  { ctrl + "S" }
  begin
    key:=0;
    if not DM.cdsItemOcorrencia.IsEmpty then
    begin
      tBtnSalvar.Enabled:=True;
      tBarAtendimento.SetFocus;
      salvarOcorrencia;
    end;
  end;

  if ((Shift = [ssCtrl]) and (key = 81)) then { ctrl + "Q" }
  begin
    key:=0;
    memObsOcorrencia.Lines.Add(MSG_DEVOLUCAO_1);
  end;

  if ((Shift = [ssCtrl]) and (key = 70)) then { ctrl + "F" }
  begin
    key:=0;
    memObsOcorrencia.Lines.Add(MSG_DEVOLUCAO_2);
  end;

  if ((Shift = [ssCtrl]) and (key = 69)) then { ctrl + "E" }
  begin
    key:=0;
    memObsOcorrencia.Lines.Add(MSG_ENGANO_CLIENTE_1);
  end;

end;

procedure TFAtendimentoCliente.memObsOcorrenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
  key := Upcase(Key) ;
  if (key in ['Ç','ç','Ã','ã','Ê','ê','Í','í','´','`','~','^']) then
  begin
    Beep;
    key:=#0;
  end;

  if key = #27 then
  begin
    memObsOcorrencia.Clear;
    lblContMemo.Caption:='0/200';
    Application.ProcessMessages;
  end;
end;

procedure TFAtendimentoCliente.rdpFiltroPesquisaClick(Sender: TObject);
begin
  case rdpFiltroPesquisa.ItemIndex of
    0 : begin
          filtroConsulta.idFiltro:=0;
          lblFiltroPesquisa.Caption:='Código';
          edtFiltroPesquisa.Alignment:=taRightJustify;
          edtFiltroPesquisa.Left:=55;
          edtFiltroPesquisa.Width:=60;
    end;
    1 : begin
          filtroConsulta.idFiltro:=1;
          lblFiltroPesquisa.Caption:='CNPJ';
          edtFiltroPesquisa.Alignment:=taRightJustify;
          edtFiltroPesquisa.Left:=45;
          edtFiltroPesquisa.Width:=110;
    end;
    2 : begin
          filtroConsulta.idFiltro:=2;
          lblFiltroPesquisa.Caption:='Nota Fiscal';
          edtFiltroPesquisa.Alignment:=taRightJustify;
          edtFiltroPesquisa.Left:=75;
          edtFiltroPesquisa.Width:=75;
    end;
    3 : begin
          filtroConsulta.idFiltro:=3;
          lblFiltroPesquisa.Caption:='Duplicata';
          edtFiltroPesquisa.Alignment:=taRightJustify;
          edtFiltroPesquisa.Left:=70;
          edtFiltroPesquisa.Width:=80;
    end;
    4 : begin
          filtroConsulta.idFiltro:=4;
          lblFiltroPesquisa.Caption:='Razão Social';
          edtFiltroPesquisa.Alignment:=taLeftJustify;
          edtFiltroPesquisa.Left:=85;
          edtFiltroPesquisa.Width:=105;
    end;
  end;
  edtFiltroPesquisa.SetFocus;
end;

procedure TFAtendimentoCliente.rdpPrioridadeClick(Sender: TObject);
begin
  case rdpPrioridade.ItemIndex of
    0 : ocorrencia.cdPrioridade:=1; { normal }
    1 : ocorrencia.cdPrioridade:=2; { alta prioridade }
  end;
end;

procedure TFAtendimentoCliente.fecharFormulario;
begin
  if ocorrencia.cdOcorrencia > 0 then
  begin
    if Application.MessageBox('Foi iniciado um novo atendimento.'+#13+
                               'Deseja realmente fechar a janela?','SAC',4 + 32) = 7 then
    begin
      exit;
    end
  end;

  if FFilaLigacao <> nil then
  begin
    FFilaLigacao.WindowState:=wsNormal;
    FFilaLigacao.btnAtualizaDadosClick(self);
  end;
  close;
end;

procedure TFAtendimentoCliente.iniciarPesquisaSatisfacao;
begin

end;

procedure TFAtendimentoCliente.salvarOcorrencia;
begin
  if Application.MessageBox(pchar('Deseja salvar a ocorrência '+ inttostr(ocorrencia.cdOcorrencia)+'?'),'Confirmação de Gravação',4 + 32) = 6 then
  begin
    try
      DM.carregaDataSistema;

      if DM.cdsItemOcorrencia.IsEmpty then
      begin
        ShowMessage('Nenhum item encontrado na ocorrência atual.');
        btnAdicioaritemOcorrencia.SetFocus;
        exit;
      end;

      { atualiza dados diversos }
        { Contato }
      if lblEdtContato.Text <> EmptyStr then
      begin
        cliente.contato:=trim(lblEdtContato.Text);

        if ocorrencia.contato <> cliente.contato then
          ocorrencia.contato:=cliente.contato;
      end
      else
      begin
        ShowMessage('Informe o nome do contato.');
        lblEdtContato.SetFocus;
        exit;
      end;

        { Email }
      if trim(lblEdtEmailSacCliente.Text) <> cliente.emailSac then
        cliente.emailSac:=trim(lblEdtEmailSacCliente.Text)
      else
      begin
         cliente.isGravarEmailCliente:=False;
         cliente.isAtualizarEmailCliente:=False;
      end;

      ocorrencia.emailContato:=cliente.emailSac;

      { Set Nome Arquivo Ocorrencia}
      ocorrencia.dsArquivoOcorrencia:=trim(_lbeArquivoOcorrencia.Text);


        { Telefone }
      if trim(lblEdtTelefoneCliente.Text) <> formataNumeroTelefone(cliente.telefoneContato) then
        cliente.telefoneContato:=limparCampoTelefone(trim(lblEdtTelefoneCliente.Text))
      else
      begin
        cliente.isGravarTelefoneCliente:=False;
        cliente.isAtualizarTelefoneCliente:=False;
      end;
      ocorrencia.telefone:=cliente.telefoneContato;

      { texto de informações adicionais - Principal }
      if memObsOcorrencia.Text <> EmptyStr then
        ocorrencia.descricao:=StringReplace(memObsOcorrencia.Text,#13#10,'',[rfReplaceAll]);

      { prioridade de solução }
      case rdpPrioridade.ItemIndex of
        0 : ocorrencia.cdPrioridade:=CD_PRIORIDADE_NORMAL; { normal }
        1 : ocorrencia.cdPrioridade:=CD_PRIORIDADE_ALTA;   { alta prioridade }
      end;
      ocorrencia.dsPrioridade:=cdPrioridadeToDescricao(ocorrencia.cdPrioridade);
      ocorrencia.dataRegistro:=dadosEmpresa.dataHora;

      { ocorrencia necessita gerar ordem de coleta }
      ocorrencia.idSituacaoOrdemColeta:=DM.getIdNessidadeEmissaoOrdemDeColeta;

      { meio de contato - origem da ocorrência  }
      case rdpMeioDeContato.ItemIndex of
        0 : ocorrencia.cdMeioDeOrigemDoContato:=CD_MEIO_CONTATO_INTERNO_GAM;  { interno  }
        1 : ocorrencia.cdMeioDeOrigemDoContato:=CD_MEIO_CONTATO_EMAIL;        { email }
        2 : ocorrencia.cdMeioDeOrigemDoContato:=CD_MEIO_CONTATO_TELEFONE_SAC; { 0800 SAC }
        else
          begin
            ShowMessage('Informe o meio de contato que originou a ocorrência.');
            exit;
          end;
      end;

      tBtnSalvar.Enabled:=False;
      btnAdicioaritemOcorrencia.Enabled:=False;
      try

        { atualiza dados - data limite, descricao }
        DM.atualizarDadosOcorrenciaLocal;

        if ocorrencia.idSituacaoOrdemColeta = ID_SITUACAO_ORDEM_DE_COLETA_AGUARDANDO then
        begin
          if ocorrencia.emailContato = EmptyStr then
          begin
            Application.MessageBox('Informe o email de contato do cliente.','Atenção',0 + 64);
            exit;
          end;
        end;

        { atualizar status da ocorrencia }
        DM.atualizarStatusCausaOcorrencia(True,False);
        DM.atualizarStatusSolucaoOcorrencia(True,False);

        { iniciar gravação dos dados }
        if usuario.ambiente = Producao then
        begin
          if not DM.isProtocoloGravado(ocorrencia.cdOcorrencia) then
          begin
            DM.gravarNovaOcorrencia;
             if dsNomeArquivo <> EmptyStr then
             begin
               if not GravaArquivoOcorrencia then
                  Application.MessageBox('Arquivo não foi salvo Na area de Doc. Sac!','GAM SAC',0 + 64);
             end;
            Application.MessageBox('Ocorrência Registrada com Sucesso!','GAM SAC',0 + 64);
          end;

          { enviar email }
          try
            StatusBar.SimpleText:='Enviando email, aguarde ...';
            Application.ProcessMessages;

            DM.enviarEmailOcorrencia(False,ocorrencia.isOcorrenciaIntegral,'');

            StatusBar.SimpleText:='';
            Application.ProcessMessages;

          except
            on E:Exception do
              raise Exception.CreateFmt('Erro ao enviar mensagem. Detalhes: %s',[E.Message]);
          end;
        end
        else
        begin
          try
            DM.enviarEmailOcorrencia(False,ocorrencia.isOcorrenciaIntegral,'');
          except
            on E:Exception do
              raise Exception.CreateFmt('Erro ao enviar mensagem. Detalhes: %s',[E.Message]);
          end;
        end;

        if Application.MessageBox('Deseja Limpar os dados?','GAM SAC',4 + 32) = 6 then
          limparDadosAtendimento;
      except
        on E:Exception  do
        begin
          tBtnSalvar.Enabled:=True;
          raise Exception.Create(E.Message);
        end;
      end;
    finally
      StatusBar.SimpleText:='';
      Application.ProcessMessages;
    end;
  end;
end;

procedure TFAtendimentoCliente.limparDadosAtendimento;
begin
  { limpar variaveies }
  cliente.limparDados;
  ocorrencia.limparDados;
  dadosLigacao.limparDados;
  dslocalArquivo:='';
  dsNomeArquivo:='';

  { limpar campos de informações }
  limpaEdit;

  { controle de botoes }
  tBtnInicar.Enabled:=True;
  tBtnCancelar.Enabled:=False;
  tBtnInicarPesquisaSatisfacao.Enabled:=False;
  tBtnSalvar.Enabled:=False;
  btnAdicioaritemOcorrencia.Enabled:=False;

  { prioridade Default = Normal }
  rdpPrioridade.ItemIndex:=0;

 { meio de origem da ocorrencia }
  rdpMeioDeContato.ItemIndex:=CD_MEIO_CONTATO_INTERNO_GAM;

  { filtro pesquisa }
  rdpFiltroPesquisa.Enabled:=False;
  rdpFiltroPesquisa.ItemIndex:=0;
  edtFiltroPesquisa.Enabled:=False;

  { informações diversas }
  lblControle.Caption:='000000';
  filtroConsulta.limparDados;
  memObsOcorrencia.Clear;
  lblContMemo.Caption:='0/200';
  gbxDadosOcorrencia.Enabled:=False;
  TBarAtendimento.SetFocus;

  { limpar dataSet Local }
  DM.inicializarDataSetLocal(True,True,False);

  if FFilaLigacao <> nil then
  begin
    FFilaLigacao.WindowState:=wsNormal;
    FFilaLigacao.Show;
  end;

  Application.ProcessMessages;
end;

procedure TFAtendimentoCliente.carregaDadosCliente;
var
  dsMatriculaTemp: string;
begin
  try
    cliente.codigo:=DM.sqlConsultaCliente.FieldByName('NROC_C').AsInteger;
    cliente.digito:=DM.sqlConsultaCliente.FieldByName('DIGC_C').AsInteger;
    cliente.cdEmpresa:=DM.sqlConsultaCliente.FieldByName('CD_EMPRESA_ESTOQUE').AsInteger;
    cliente.cnpj:=formatfloat('00000000000000',DM.sqlConsultaCliente.FieldByName('CGCP_P').Value);
    cliente.razaoSocial:=trim(DM.sqlConsultaCliente.FieldByName('NOMP_P').AsString);
    cliente.endereco:=UpperCase(trim(DM.sqlConsultaCliente.FieldByName('DS_LOGRADOURO').AsString));
    cliente.numero:=UpperCase(trim(DM.sqlConsultaCliente.FieldByName('NR_LOGRADOURO').AsString));
    cliente.bairro:=UpperCase(trim(DM.sqlConsultaCliente.FieldByName('NM_BAIRRO').AsString));
    cliente.cidade:=UpperCase(trim(DM.sqlConsultaCliente.FieldByName('NM_CIDADE').AsString));
    cliente.estado:=UpperCase(trim(DM.sqlConsultaCliente.FieldByName('ID_ESTADO').AsString));
    cliente.dataUltimaCompra:=DM.sqlConsultaCliente.FieldByName('DUCC_C').AsDateTime;
    cliente.dataVencAlvara:=DM.sqlConsultaCliente.FieldByName('DVAP_P').AsDateTime;
    case DM.sqlConsultaCliente.FieldByName('ID_SITUACAO_CLIENTE').AsString[1] of
      'A': cliente.situacaoCliente:='ATIVO';
      'I': cliente.situacaoCliente:='INATIVO';
      else
        cliente.situacaoCliente:=format('INDETERMINADO [%s]',[DM.sqlConsultaCliente.FieldByName('ID_SITUACAO_CLIENTE').AsString[1]]);
    end;
    cliente.setor:=DM.sqlConsultaCliente.FieldByName('NROV_C').AsInteger;
    cliente.nomeRepresentante:=trim(DM.sqlConsultaCliente.FieldByName('NOMV_V').AsString);
    cliente.emailNFe1:=LowerCase(trim(DM.sqlConsultaCliente.FieldByName('DS_EMAIL_NFE_PRINCIPAL').AsString));
    cliente.emailNFe2:=LowerCase(trim(DM.sqlConsultaCliente.FieldByName('DS_EMAIL_NFE_COPIA').AsString));
    cliente.contato:=UpperCase(trim(DM.sqlConsultaCliente.FieldByName('NM_CONTATO_SAC').AsString));
    cliente.tipo:=DM.sqlConsultaCliente.FieldByName('TIPC_C').AsInteger;
    cliente.distrito:=DM.sqlConsultaCliente.FieldByName('DISTRITO').AsInteger;

    dsMatriculaTemp:=Format('%d%d',[cliente.distrito,cliente.setor]);
    cliente.emailSetor:=DM.getEmailSolucionador(dsMatriculaTemp,'');

    dsMatriculaTemp:=Format('%d%d',[cliente.distrito,cliente.distrito]);
    cliente.emailDistrito:=DM.getEmailSolucionador(dsMatriculaTemp,'');

    { canal de venda }
    case DM.sqlConsultaCliente.FieldByName('CANC_C').AsInteger of
      1 : cliente.canalVenda:=Farma;
      2 : cliente.canalVenda:=Alimentar;
      3 : cliente.canalVenda:=Hospitalar;
    end;
    cliente.entregador:=DM.sqlConsultaCliente.FieldByName('ENTREGADOR').AsString;
    cliente.etiquetaEntrega:=DM.sqlConsultaCliente.FieldByName('ETIQUETA').AsString;
    cliente.cdTransportador:=DM.sqlConsultaCliente.FieldByName('CD_TRANSPORTADOR').AsInteger;
    cliente.emailTransportador:=DM.getEmailDoDestinatario(cliente.cdTransportador,CD_TIPO_DESTINO_EMAIL_SAC_DOMINIO,CD_CATEGORIA_EMAIL_SAC_DOMINIO);

    if cliente.emailTransportador = EmptyStr then
      Application.MessageBox('O Transportador/Entregador deste cliente não possui endereço de email cadastrado.'+#13+'Caso seja necessário enviar uma "Ordem de Coleta", o mesmo não será informado.','Atenção',0 + 64);

    { email de contato no SAC }
    cliente.emailSac:=LowerCase(trim(DM.sqlConsultaCliente.FieldByName('DS_EMAIL_SAC').AsString));
    if cliente.emailSac <> EmptyStr then
      cliente.isAtualizarEmailCliente:=True
    else
      cliente.isGravarEmailCliente:=True;

    { telefone de contato no SAC }
    cliente.telefoneContato:=DM.sqlConsultaCliente.FieldByName('NR_TELEFONE').AsString;
    if cliente.telefoneContato <> EmptyStr then
      cliente.isAtualizarTelefoneCliente:=True
    else
      cliente.isGravarTelefoneCliente:=True;

  except
    on E:Exception do
      raise Exception.Create('Erro carregar dados do cliente.Erro: ' + e.Message);
  end;
end;

procedure TFAtendimentoCliente.carregarDadosOcorrencia;
begin
  try
    ocorrencia.limparDados;
    ocorrencia.cdOcorrencia:=DM.getNovoNumeroOcorrencia;
    ocorrencia.cdEmpresa:=cliente.cdEmpresa;
    ocorrencia.cdCliente:=cliente.codigo;
    ocorrencia.cdUsuario:=usuario.matricula;
    ocorrencia.contato:=lblEdtContato.Text;
    ocorrencia.telefone:=lblEdtTelefoneCliente.Text;
    ocorrencia.codigoDigito:=StrToInt(Format('%d%d',[cliente.codigo,cliente.digito]));
    ocorrencia.razaoSocial:=cliente.razaoSocial;
    ocorrencia.cdMeioDeOrigemDoContato:=rdpMeioDeContato.ItemIndex;

    _lbeArquivoOcorrencia.Enabled:=true;
    _btnLocalizaArquivo.Enabled:=true;
    _lbeArquivoOcorrencia.ReadOnly:=true;


  except
    on E:Exception do
      raise Exception.CreateFmt('Erro ao carregar dados da ocorrência. Detalhes: %s',[E.Message]);
  end;
end;

procedure TFAtendimentoCliente.consultarDadosCliente;
  procedure mostrarDadosCliente;
  begin
    lblEdtCodigoCliente.Text:=inttostr(cliente.codigo) + '/' + inttostr(cliente.digito);
    lblEdtCNPJ.Text:=formataCNPJ(cliente.cnpj);
    lblEdtRazaoSocial.Text:=cliente.razaoSocial;
    lblEdtEnderecoCliente.Text:=cliente.endereco;
    lblEdtCidade.Text:=cliente.cidade;
    lblEdtUF.Text:=cliente.estado;
    lblEdtSetor.Text:=inttostr(cliente.setor) + ' - ' + cliente.nomeRepresentante;
    lblEdtEntregador.Text:=Format('%s/%s',[cliente.entregador,cliente.etiquetaEntrega]);
    lblEdtDtUltimaCompra.Text:=FormatDateTime('DD/MM/YYYY',cliente.dataUltimaCompra);
    lblEdtVencAlvara.Text:=FormatDateTime('DD/MM/YYYY',cliente.dataVencAlvara);
    lblEdtSituacaoCliente.Text:=cliente.situacaoCliente;
    lblEdtEmailNFe1.Text:=cliente.emailNFe1;
    lblEdtEmailNFe2.Text:=cliente.emailNFe2;
    { email de contato no SAC }
    if cliente.emailSac <> EmptyStr then
    begin
      lblEdtEmailSacCliente.Text:=cliente.emailSac;
      lblEdtContato.Text:=cliente.contato;
    end;

    Application.ProcessMessages;
  end;

  procedure execConsultaCliente;
  var
    dsDigito : string;

  begin
    cliente.limparDados;
    dsDigito:='';

    { executa sql de pesquisa }
    DM.consultarCliente;

    if DM.sqlConsultaCliente.RecordCount > 0 then
    begin
      if DM.sqlConsultaCliente.RecordCount = 1 then
      begin
        if filtroConsulta.idFiltro = 0 then
        begin
          dsDigito:=copy(filtroConsulta.dsFiltro,length(filtroConsulta.dsFiltro),
                                                 length(filtroConsulta.dsFiltro)-1);
          if DM.sqlConsultaCliente.FieldByName('DIGC_C').AsString <> dsDigito then
            raise Exception.Create('Digito verificador inválido!');
        end;

       { grava dados  do cliente no objeto cliente }
        carregaDadosCliente;
      end
      else
      begin
        if FRelacaoCliente=nil then
          FRelacaoCliente:=TFRelacaoCliente.Create(nil);
        FRelacaoCliente.ShowModal;
      end;
    end
    else
      raise Exception.Create('Cliente não encontrado!');

    if cliente.codigo > 0 then
    begin
      mostrarDadosCliente;
      ocorrencia.cdEmpresa:=cliente.cdEmpresa;
      ocorrencia.cdCliente:=cliente.codigo;
    end;
  end;

var
  nrTelefone: string;
begin
  if Length(trim(edtFiltroPesquisa.Text)) > 0 then
  begin
    if cliente.codigo = 0 then
    begin
      filtroConsulta.dsFiltro:=trim(edtFiltroPesquisa.Text);
      execConsultaCliente;
    end;

    if dadosLigacao.nrTelefone <> EmptyStr then
    begin
      lblEdtTelefoneCliente.Text:=formataNumeroTelefone(dadosLigacao.nrTelefone);
      rdpMeioDeContato.ItemIndex:=CD_MEIO_CONTATO_TELEFONE_SAC;

      if ((dadosLigacao.codigoCliente = 0) and (cliente.telefoneContato = EmptyStr)) then
      begin
        if Application.MessageBox(pchar(format('Deseja cadastrar o telefone do cliente %s?',[inttostr(cliente.codigo)])),'Cadastro de Telefone/Cliente',4 + 32) = 6 then
        begin
          try
            DM.insertTelefoneCliente(ID_TELEFONE_CLIENTE_IDENTIFICADOR,dadosLigacao.nrTelefone,cliente);
          except
            on E:Exception do
              raise Exception.CreateFmt('Erro ao cadastrar telefone %s',[nrTelefone]);
          end;
        end;
      end;
    end
    else
    begin
      nrTelefone:=DM.getTelefoneIdentificacaoCliente(inttostr(cliente.codigo));
      if nrTelefone = EmptyStr then
      begin
        if Application.MessageBox(pchar(format('Deseja cadastrar o telefone do cliente %s?',[inttostr(cliente.codigo)])),'Cadastro de Telefone/Cliente',4 + 32) = 6 then
        begin
          nrTelefone:=limparCampoTelefone(InputBox('Cadastro de Telefone','Informe o telefone','(  )    -    '));
          try
            DM.insertTelefoneCliente(ID_TELEFONE_CLIENTE_IDENTIFICADOR,nrTelefone,cliente);
          except
            on E:Exception do
              raise Exception.CreateFmt('Erro ao cadastrar telefone %s',[nrTelefone]);
          end;
        end;
      end;

      if nrTelefone <> EmptyStr then
        lblEdtTelefoneCliente.Text:=formataNumeroTelefone(nrTelefone);
    end;

    if cliente.codigo > 0 then
    begin
      //tBtnInicarPesquisaSatisfacao.Enabled:=True;
      btnAdicioaritemOcorrencia.Enabled:=True;
      btnAdicioaritemOcorrencia.SetFocus;
      lblEdtContato.SetFocus;
      StatusBar.SimpleText:='';
      Application.ProcessMessages;
    end;
  end;
end;

procedure TFAtendimentoCliente.dbgrItemOcorrenciaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  { linha impar ou par }
  if odd(DM.cdsItemOcorrencia.RecNo) then
    dbgrItemOcorrencia.Canvas.Brush.Color:= clmenubar
  else
    dbgrItemOcorrencia.Canvas.Brush.Color:= clCream;

  TDbGrid(Sender).Canvas.font.Color:= clBlack;

  { se a linha estiver seleciona }
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color := clmoneygreen;
    FillRect(Rect);
    Font.Style := [fsbold]
  end;
  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TFAtendimentoCliente.abrirTelaItemOcorrencia;
begin
  if FItemOcorrencia = nil then
    FItemOcorrencia:=TFItemOcorrencia.Create(nil);

  FItemOcorrencia.MODO_TELA:=edicao;
  FItemOcorrencia.ShowModal;
end;

procedure TFAtendimentoCliente.dbgrItemOcorrenciaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    abrirTelaItemOcorrencia;
  end;
end;

procedure TFAtendimentoCliente.dbgrItemOcorrenciaTitleClick(Column: TColumn);
begin
  DM.ordenarGridD(DM.cdsItemOcorrencia,Column.FieldName);
end;

procedure TFAtendimentoCliente.edtFiltroPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_ESCAPE : begin
      limpaEdit;
      cliente.limparDados;
    end;

    VK_RETURN : consultarDadosCliente;
  end;
end;

procedure TFAtendimentoCliente.execIniciarLigacaoAutomatica;
const
  URL_CONEXAO = 'http://%s/integrador/library/discador/discar.php?origem=%d&destino=%s';
var
  dsUrlLigacao: string;

begin
  try
    dsUrlLigacao:=URL_CONEXAO;
    //dadosLigacao.nrTelefone:='8103';
    dsUrlLigacao:=format(dsUrlLigacao,[usuario.telefonia.servidor,usuario.telefonia.nrRamalVoip,dadosLigacao.nrTelefone]);
    wbLigacaoAuto.Navigate(dsUrlLigacao);
  except
    on E:Exception do
      raise Exception.CreateFmt('Erro ao discar para o número desejado. Erro: %s',[E.Message]);
  end;
end;

procedure TFAtendimentoCliente.iniciarNovoAtendimento;
begin
  try
    tBtnInicar.Enabled:=False;
    tBtnCancelar.Enabled:=true;

    _lbeArquivoOcorrencia.Enabled:=false;
    _btnLocalizaArquivo.Enabled:=false;

    edtFiltroPesquisa.Enabled:=true;
    edtFiltroPesquisa.SetFocus;

    filtroConsulta.limparDados;
    rdpFiltroPesquisa.Enabled:=true;
    rdpFiltroPesquisa.ItemIndex:=filtroConsulta.idFiltro;

    gbxDadosOcorrencia.Enabled:=True;

    { se vier do formulario de fila de espera }
    if dadosLigacao.codigoCliente > 0 then
    begin
      edtFiltroPesquisa.Text:=IntToStr(dadosLigacao.codigoCliente);
      edtFiltroPesquisa.SelectAll;
    end;

    if ((usuario.telefonia.nrRamalVoip > 0) and (dadosLigacao.isIniciarLigacao)) then
    begin
      if Application.MessageBox(pchar('Deseja iniciar a ligação para o telefone: ' + formataNumeroTelefone(dadosLigacao.nrTelefone)+' ?'),'Confirmação de ligação',4 + 32) = 6 then
        execIniciarLigacaoAutomatica;
    end;

    Application.ProcessMessages;
  except
    on E:Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFAtendimentoCliente.tBtnCancelarClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja limpar os dados da ocorrência?','GAM - SAC',4 + 32) = 6 then
    limparDadosAtendimento;
end;

procedure TFAtendimentoCliente.tBtnFecharClick(Sender: TObject);
begin
  fecharFormulario;
end;

procedure TFAtendimentoCliente.validarVersãoSistema;
var
  dsVersaoBase: string;
begin
  { controle de versão }
  dsVersaoBase:=DM.getVersaoSistema;
  if VERSAO_SISTEMA <> dsVersaoBase then
    Application.MessageBox(pchar(format('Foi liberada uma nova versão do sistema(%s).Favor atualizar.',[dsVersaoBase])),'Alerta de Versão',0 + 64);
end;

procedure TFAtendimentoCliente.wbLigacaoAutoDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);

var
  retDoc : Variant;
  posIni: integer;
  posFinal: integer;
  dsHtml: string;
begin
  wbLigacaoAuto.Stop;
  //retDoc:=wbLigacaoAuto.Document;
  //dsHtml:=retDoc.body.innerHTML;
  //StatusBar.SimpleText:='Ligando para: '+ dadosLigacao.nrTelefone;
  //Application.ProcessMessages;
end;

procedure TFAtendimentoCliente.wbLigacaoAutoDownloadBegin(Sender: TObject);
begin
  StatusBar.SimpleText:='Ligando para: '+ dadosLigacao.nrTelefone;
  Application.ProcessMessages;
end;

procedure TFAtendimentoCliente.wbLigacaoAutoQuit(Sender: TObject);
begin
  StatusBar.SimpleText:='';
  Application.ProcessMessages;
end;

procedure TFAtendimentoCliente.tBtnInicarClick(Sender: TObject);
begin
  { validar versao }
  validarVersãoSistema;
  { iniciar atendimento }
  iniciarNovoAtendimento;
end;

procedure TFAtendimentoCliente.tBtnSalvarClick(Sender: TObject);
begin
  try
    salvarOcorrencia;
  except
    on E:Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFAtendimentoCliente.atualizarHorarioTela;
begin
  lblHorarioAtual.Caption:=FormatDateTime('DD/MM/YYYY HH:MM:SS',Now);
  Application.ProcessMessages;
end;

procedure TFAtendimentoCliente._btnLocalizaArquivoClick(Sender: TObject);
var
 nrPosicaoPonto:Integer;
 stExt :String;

begin
  dslocalArquivo:='';
  dsNomeArquivo:='';
  if not _opdLocalizaArquivo.Execute then
     Exit;
  dslocalArquivo:=_opdLocalizaArquivo.FileName;
  _lbeArquivoOcorrencia.Text := _opdLocalizaArquivo.FileName;

  //nrPosicaoPonto:=  pos('.',_lbeArquivoOcorrencia.Text);
  //stExt:=trim(copy(_lbeArquivoOcorrencia.Text,nrPosicaoPonto+1,5));
  stExt:=ExtractFileExt(_lbeArquivoOcorrencia.Text);
  //dsNomeArquivo:=FormatFloat('00000000',ocorrencia.cdOcorrencia)+'.'+stExt;
  dsNomeArquivo:=FormatFloat('00000000',ocorrencia.cdOcorrencia) + stExt;
  _lbeArquivoOcorrencia.Text:=dsNomeArquivo;

end;

procedure TFAtendimentoCliente.tmrHorarioTimer(Sender: TObject);
begin
  atualizarHorarioTela;
end;

procedure TFAtendimentoCliente.FormActivate(Sender: TObject);
begin
  { preparar para novo atendimento }
  if dadosLigacao.codigoLigacao > 0 then
    iniciarNovoAtendimento
  else
    TBarAtendimento.SetFocus;
end;

procedure TFAtendimentoCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cliente.free;
  cliente:=nil;
  ocorrencia.free;
  ocorrencia:=nil;
  FAtendimentoCliente:=nil;
  Action:=caFree;
end;

procedure TFAtendimentoCliente.FormCreate(Sender: TObject);
begin
  atualizarHorarioTela;
  tmrHorario.Enabled:=True;
  if cliente = nil then
    cliente:=TCliente.create
  else
    cliente.limparDados;
  ocorrencia:=TOcorrencia.Create;
  DM.inicializarDataSetLocal(True,True,False);
end;

procedure TFAtendimentoCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F1 then
  begin
    if tBtnInicar.Enabled then
      tBtnInicar.Click;
  end;
end;

procedure TFAtendimentoCliente.FormShow(Sender: TObject);
begin
  Top:=tamanhoTela.topo;
  Left:=tamanhoTela.esquerda;
  Height:=tamanhoTela.altura;
  Width:=tamanhoTela.largura;
end;

function TFAtendimentoCliente.GravaArquivoOcorrencia:Boolean;
begin

     result:=false;
      if    TranfereArquivoFtp(dslocalArquivo,
                          '.',
                           dsNomeArquivo,
                           'j8.gam.com.br',
                           'recall', //nmUsuario,
                           'recall..gam' {dsSenhaUsuatio:STRING}
                           ) then
             result:=true;
end;


function TFAtendimentoCliente.TranfereArquivoFtp(dsLocalArquivo,
                                                   dsDestinoArquivo,
                                                   nmArquivo,
                                                   dsTNSMAQUINA,
                                                   nmUsuario,
                                                   dsSenhaUsuatio:STRING):Boolean;
var
 LocalDestino,
 LocalOrigem:String;

BEGIN
  try
     result:=false;
     LocalDestino:=dsDestinoArquivo;
     LocalOrigem :=dsLocalArquivo;
     _IdFTP.Disconnect();
     _IdFTP.Host :=dsTNSMAQUINA;
     _IdFTP.Port := 21;
     _IdFTP.Username := nmUSUARIO;
     _IdFTP.Password := dsSenhaUsuatio;

     try
        { Espera até 10 segundos pela conexão }
        _IdFTP.Connect;
     except
   on E: Exception do
      begin
      ShowMessage('Falha na conecção FTP...'+#13+
                    E.Message);
       result:=false;

      end;
     end;
     _IdFTP.MakeDir('SAC');
     _IdFTP.ChangeDir('SAC');

     _IdFTP.ChangeDir(trim(dsDestinoArquivo));
     _IdFTP.Put(LocalOrigem,TRIM(nmArquivo),false);
      result:=true;
  except
   begin
    _IdFTP.MakeDir('SAC');
   // _IdFTP.MakeDir(dsDestinoArquivo);
    result:=false;

   END;
  END;
END;


end.

