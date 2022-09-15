unit UFItemOcorrencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, UParametroSistema, DBCtrls,
  UDadosOcorrencia, UDadosCliente, UUtils, ImgList, ToolWin, Grids, DBGrids,
  jpeg, UMsgPadrao, Menus, pngimage, Mask, UUsuario,DB ;

type
  TModoTela = (normal,edicao,visualizacao);
  TControleGridItem = (Ativo,Inativo);

  TBuscaNome = record
    contCaracter:integer;
    dsBusca:string;
    dsResultado: string;
    isConcluida: Boolean;
    isIncluirNovo: Boolean;
    posicaoInicial: integer;

    procedure limparDados;
  end;

  TFItemOcorrencia = class(TForm)
    StatusBar: TStatusBar;
    gbxPrincipal: TGroupBox;
    gbxDadosCliente: TGroupBox;
    lblEdtCodigoCliente: TLabeledEdit;
    lblEdtRazaoSocial: TLabeledEdit;
    lblEdtContatoCliente: TLabeledEdit;
    gbxControleOcorrencia: TGroupBox;
    lblControle: TLabel;
    lblHorarioAtual: TLabel;
    gbxConsulta: TGroupBox;
    rbtNFe: TRadioButton;
    rbtDuplicata: TRadioButton;
    rbtPedido: TRadioButton;
    edtConsulta: TEdit;
    btnBuscar: TBitBtn;
    gbxControleItem: TGroupBox;
    lblSeqItem: TLabel;
    lblEdtStatusSolucao: TLabeledEdit;
    lblEdtStatusCausaProblema: TLabeledEdit;
    gbxDadosItem: TGroupBox;
    lblEdtNFe: TLabeledEdit;
    lblEdtDataEmissaoNFe: TLabeledEdit;
    lblEdtOrigemPedido: TLabeledEdit;
    lblEdtCodigoProduto: TLabeledEdit;
    lblEdtNomeProduto: TLabeledEdit;
    lblEdtTipoProduto: TLabeledEdit;
    lblEdtDataValidadeProduto: TLabeledEdit;
    lblEdtPeriodoValidade: TLabeledEdit;
    lblEdtQuantProduto: TLabeledEdit;
    dbLcbTipoOcorrencia: TDBLookupComboBox;
    dbLcbSubTipoOcorrencia: TDBLookupComboBox;
    dbLcbSituacaoEmbalagem: TDBLookupComboBox;
    dbLcbSolucionador: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblEdtNomeCoordenadorSolucionador: TLabeledEdit;
    lblEdtDataLimiteSolucao: TLabeledEdit;
    lblEdtNomeRepresentante: TLabeledEdit;
    lblEdtTransportador: TLabeledEdit;
    lblEdtDadosTransbordo: TLabeledEdit;
    memObservacao: TMemo;
    Label5: TLabel;
    tmrHorario: TTimer;
    tBarAtendimento: TToolBar;
    tBtnLimpar: TToolButton;
    tBtnSalvarItem: TToolButton;
    tBtnExcluiritem: TToolButton;
    tBtnSolucao: TToolButton;
    tBtnFechar: TToolButton;
    tbtnCausa: TToolButton;
    lblContMemo: TLabel;
    gbxConsultaGenerica: TGroupBox;
    dbgConsultaGenerica: TDBGrid;
    gbxRelacaoItemNFe: TGroupBox;
    dbgItemNFe: TDBGrid;
    lblTipoFiltro: TLabel;
    lblEdtLoteProduto: TLabeledEdit;
    BalloonHint: TBalloonHint;
    PopupMenu: TPopupMenu;
    AtualizarDadosExternos1: TMenuItem;
    ImageList: TImageList;
    lblEdtEmailExtra: TLabeledEdit;
    dblkEmailExtra: TDBLookupListBox;
    cbxAutorizarRecMercadoria: TCheckBox;
    imgSolucionador: TImage;
    N1: TMenuItem;
    menuReEnviarEmail: TMenuItem;
    N2: TMenuItem;
    menuReabrirOcorrencia: TMenuItem;
    mEdtDataEmissaoConsulta: TMaskEdit;
    Label6: TLabel;
    StatusBarGridConsultaGenerica: TStatusBar;
    cbxAlertarRegistroForaPrazo: TCheckBox;
    StatusBarItemConsulta: TStatusBar;
    tBtnCancelarRegistro: TToolButton;
    chkIncluirEmailDoTransportador: TCheckBox;
    chkIncluirTodosItens: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tmrHorarioTimer(Sender: TObject);
    procedure tBtnFecharClick(Sender: TObject);
    procedure tbtnCausaClick(Sender: TObject);
    procedure tBtnSolucaoClick(Sender: TObject);
    procedure tBtnExcluiritemClick(Sender: TObject);
    procedure tBtnSalvarItemClick(Sender: TObject);
    procedure tBtnLimparClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure memObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure btnBuscarClick(Sender: TObject);
    procedure dbgConsultaGenericaDblClick(Sender: TObject);
    procedure dbgConsultaGenericaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgItemNFeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgItemNFeDblClick(Sender: TObject);
    procedure dbgItemNFeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbtPedidoClick(Sender: TObject);
    procedure memObservacaoChange(Sender: TObject);
    procedure dbLcbTipoOcorrenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbLcbSubTipoOcorrenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbLcbSituacaoEmbalagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbLcbSolucionadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure memObservacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblEdtDadosTransbordoClick(Sender: TObject);
    procedure dbgItemNFeMouseEnter(Sender: TObject);
    procedure dbgItemNFeTitleClick(Column: TColumn);
    procedure dbgConsultaGenericaTitleClick(Column: TColumn);
    procedure dbLcbSubTipoOcorrenciaMouseEnter(Sender: TObject);
    procedure dbLcbTipoOcorrenciaMouseEnter(Sender: TObject);
    procedure AtualizarDadosExternos1Click(Sender: TObject);
    procedure dbLcbTipoOcorrenciaEnter(Sender: TObject);
    procedure dbLcbSubTipoOcorrenciaEnter(Sender: TObject);
    procedure dbLcbSituacaoEmbalagemEnter(Sender: TObject);
    procedure dbLcbSolucionadorEnter(Sender: TObject);
    procedure dbLcbTipoOcorrenciaClick(Sender: TObject);
    procedure dbLcbSubTipoOcorrenciaClick(Sender: TObject);
    procedure dbLcbSituacaoEmbalagemClick(Sender: TObject);
    procedure dbLcbSolucionadorClick(Sender: TObject);
    procedure lblEdtQuantProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblEdtEmailExtraChange(Sender: TObject);
    procedure lblEdtEmailExtraEnter(Sender: TObject);
    procedure lblEdtEmailExtraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure dblkEmailExtraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblkEmailExtraDblClick(Sender: TObject);
    procedure dbgConsultaGenericaMouseEnter(Sender: TObject);
    procedure memObservacaoMouseEnter(Sender: TObject);
    procedure imgSolucionadorMouseEnter(Sender: TObject);
    procedure imgSolucionadorClick(Sender: TObject);
    procedure menuReEnviarEmailClick(Sender: TObject);
    procedure menuReabrirOcorrenciaClick(Sender: TObject);
    procedure edtConsultaExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tBtnCancelarRegistroClick(Sender: TObject);
  private
    procedure carregaDadosPrincipaisNovoItem;
    procedure cancelarLimparItem(isLimparTodosDados:Boolean);
    procedure salvarItem;
    procedure excluirItem;
    procedure iniciarTelaSolucao;
    procedure iniciarTelaCausa;
    procedure fecharTela;
    procedure execConsultaPedidoCompra(nrPedido: integer);
    procedure execConsultaNFe(nrNFe: integer);
    procedure execConsultaDuplicata(nrDuplicata: integer);
    procedure execListaItem;
    procedure execListaItemNFe(isMotrarGridDeItem:Boolean);
    procedure execListaItemPedidoCompra;
    procedure mostrarDadosNFe;
    procedure mostrarDadosProduto;
    procedure carregarDadosProduto;
    procedure mostrarDadosSolucionador;
    procedure gravarTipoOcorrencia;
    procedure gravarSubTipoOcorrencia;
    procedure gravarSituacaoEmbalagemVolume;
    procedure gravarSolucionador;
    procedure gravarDadosNFe(isExecListaItemNFe: Boolean);
    procedure limpaEdit;
    function isItemValidoParaGravacao: Boolean;
    procedure incluirEnderecoDeEmail;
    procedure atualizaPainelControleItem;
    procedure execListaTipoVolumeItemNFe;
    procedure verificarAvisoDeRecallDeLote;
    procedure verificarAvisoDeRecallDeLoteNaLista(isInformarAlertaNaTela:Boolean);
    procedure consultarRegistroDaNFe;
    procedure iniciarTelaCancelarOcorrencia;
    procedure verificarDescontoFinanceiroNoItem;
    procedure salvarItemNFeIntegral;
    procedure incluirProdutoNaOcorrencia;
    procedure filtraItensSeleciona;
    procedure salvarItemNFeSelecionado;
    function SetIdSelecionado(PidSelecao: String): boolean;
    procedure ResetItensSelecioandos;
    { Private declarations }
  public
    MODO_TELA : TModoTela;

    ConsultaLoteF2:boolean;


    procedure carregaDadosItemVisualizacao(isParcial:Boolean);
    { Public declarations }
  end;

var
  FItemOcorrencia: TFItemOcorrencia;
  buscaEmail: TBuscaNome;
  controleGridItem: TControleGridItem;

implementation

uses UDm, UFDadosTransbordoCarga, UFSolucaoItem, UFCausaItem,
  UFCancelamentoOcorrencia, uFRelacaoVolumeNota;

{$R *.dfm}

function TFItemOcorrencia.isItemValidoParaGravacao:Boolean;
begin
  Result:=False;

  try
    if ocorrencia.item.cdTipoOcorrencia = 0 then
    begin
      dbLcbTipoOcorrencia.SetFocus;
      raise Exception.Create('Informe o tipo de ocorrência');
    end;

    if ocorrencia.item.cdSubTipoOcorrencia = 0 then
    begin
      dbLcbSubTipoOcorrencia.SetFocus;
      raise Exception.Create('Informe o subTipo de ocorrência');
    end;

    if ocorrencia.item.cdSolucionador = 0 then
    begin
      dbLcbSolucionador.SetFocus;
      raise Exception.Create('Informe o solucionador da ocorrência');
    end;

    Result:=True;
  except
    on E:Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFItemOcorrencia.lblEdtDadosTransbordoClick(Sender: TObject);
begin
  if ocorrencia.item.dsTransbordoCarga <> EmptyStr then
  begin
    if FDadosTransbordoCarga = nil then
      FDadosTransbordoCarga:=TFDadosTransbordoCarga.Create(nil);

    FDadosTransbordoCarga.ShowModal;
  end;
end;

procedure TFItemOcorrencia.lblEdtEmailExtraChange(Sender: TObject);
begin
  if not buscaEmail.isConcluida then
  begin
    dblkEmailExtra.Visible:=False;
    buscaEmail.contCaracter:=Length(trim(lblEdtEmailExtra.Text));
    if not buscaEmail.isIncluirNovo then
      buscaEmail.posicaoInicial:=1
    else
      buscaEmail.contCaracter:=(buscaEmail.contCaracter - buscaEmail.posicaoInicial) + 1;

    if buscaEmail.contCaracter > 2 then
    begin
      buscaEmail.dsBusca:=copy(UpperCase(lblEdtEmailExtra.Text),buscaEmail.posicaoInicial,buscaEmail.contCaracter);
      if buscaEmail.dsBusca <> EmptyStr then
      begin
        if buscaEmail.dsBusca[buscaEmail.contCaracter] in [#32,'A'..'Z']then
        begin
          buscaEmail.dsResultado:=DM.getEmailExtra(buscaEmail.dsBusca);
          if buscaEmail.dsResultado <> buscaEmail.dsBusca then
          begin
            dblkEmailExtra.Visible:=True;
            dblkEmailExtra.SetFocus;

            if not buscaEmail.isIncluirNovo then
              lblEdtEmailExtra.SelStart:=buscaEmail.contCaracter
            else
              lblEdtEmailExtra.SelStart:=buscaEmail.contCaracter + buscaEmail.posicaoInicial;
          end;
        end;
      end;
    end;
  end;
end;

procedure TFItemOcorrencia.lblEdtEmailExtraEnter(Sender: TObject);
begin
  buscaEmail.limparDados;
end;

procedure TFItemOcorrencia.lblEdtEmailExtraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    191: begin
      buscaEmail.isConcluida:=False;
      buscaEmail.isIncluirNovo:=True;
      buscaEmail.posicaoInicial:=Length(lblEdtEmailExtra.Text) + 2;
      ocorrencia.item.contatoEmail.dsEmailCopiaExtra:=trim(lblEdtEmailExtra.Text);
    end;

    VK_ESCAPE : begin
                  dblkEmailExtra.Visible:=False;
                  lblEdtEmailExtra.Clear;
                  buscaEmail.limparDados;
                  ocorrencia.item.contatoEmail.dsEmailCopiaExtra:='';
    end;
    {
    VK_DOWN : begin
      if dblkEmailExtra.Visible then
        dblkEmailExtra.SetFocus;
    end;
    }
    VK_RETURN : begin
      if lblEdtEmailExtra.Text <> EmptyStr then
        ocorrencia.item.contatoEmail.dsEmailCopiaExtra:=trim(lblEdtEmailExtra.Text);
      Perform(WM_NEXTDLGCTL,0,0);
    end;
  end;
end;

procedure TFItemOcorrencia.lblEdtQuantProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_RETURN : perform(wm_nextdlgctl,0,0);
    VK_RIGHT :  perform(wm_nextdlgctl,0,1);
  end;
end;

procedure TFItemOcorrencia.limpaEdit;
var
  I : integer;
begin
  for I:=0 to componentcount -1 do
  begin
    if components[I] is TLabeledEdit then
      (components[I] as TLabeledEdit).Clear;

    if (Components[i] is TEdit) then
     (Components[i] as TEdit).Clear;

    if (Components[i] is TCheckBox) then
     (Components[i] as TCheckBox).Checked:=False;

    if components[I] is TMaskEdit then
      (components[I] as TMaskEdit).Clear;

  end;
end;

procedure TFItemOcorrencia.execConsultaDuplicata(nrDuplicata:integer);
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.consultaDuplicata(nrDuplicata,cliente.codigo);

    dbgConsultaGenerica.Columns.Items[0].Width:=60;
    dbgConsultaGenerica.Columns.Items[1].Width:=60;
    dbgConsultaGenerica.Columns.Items[2].Width:=70;
    dbgConsultaGenerica.Columns.Items[3].Width:=60;
    dbgConsultaGenerica.Columns.Items[4].Width:=70;
    dbgConsultaGenerica.Columns.Items[5].Width:=60;
    dbgConsultaGenerica.Columns.Items[6].Width:=60;
    dbgConsultaGenerica.SetFocus;
    Application.ProcessMessages;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFItemOcorrencia.execConsultaNFe(nrNFe:integer);
var
 dsDataEmissao: string;
begin
  Screen.Cursor:=crSQLWait;
  try
    if isDataValida(mEdtDataEmissaoConsulta.Text) then
      dsDataEmissao:=mEdtDataEmissaoConsulta.Text
    else
      dsDataEmissao:='';

    DM.consultaNFe(nrNFe,cliente.codigo,dsDataEmissao);

    if not DM.sqlConsultaNFe.IsEmpty then
    begin
      gbxConsultaGenerica.Top:=285;
      gbxConsultaGenerica.Left:=15;
      gbxConsultaGenerica.Height:=255;
      gbxConsultaGenerica.Width:=980;

      dbgConsultaGenerica.Columns.Items[0].Width:=80;
      dbgConsultaGenerica.Columns.Items[1].Width:=130;
      dbgConsultaGenerica.Columns.Items[2].Width:=70;
      dbgConsultaGenerica.Columns.Items[3].Width:=40;
      dbgConsultaGenerica.Columns.Items[4].Width:=60;
      dbgConsultaGenerica.Columns.Items[5].Width:=60;
      dbgConsultaGenerica.Columns.Items[6].Width:=80;
      dbgConsultaGenerica.Columns.Items[7].Width:=150;
      dbgConsultaGenerica.Columns.Items[16].Width:=250;

      {colunas que nao precisam ser mostradas }
      dbgConsultaGenerica.Columns.Items[8].Visible:=False;
      dbgConsultaGenerica.Columns.Items[9].Visible:=False;
      dbgConsultaGenerica.Columns.Items[10].Visible:=False;
      dbgConsultaGenerica.Columns.Items[11].Visible:=False;
      dbgConsultaGenerica.Columns.Items[12].Visible:=False;
      dbgConsultaGenerica.Columns.Items[13].Visible:=False;
      dbgConsultaGenerica.Columns.Items[14].Visible:=False;
      dbgConsultaGenerica.Columns.Items[15].Visible:=False;
      dbgConsultaGenerica.Columns.Items[16].Visible:=False;

      gbxConsultaGenerica.Visible:=True;
      dbgConsultaGenerica.SetFocus;
      Application.ProcessMessages;
    end
    else
      ShowMessage('Nenhuma NFe foi localizada.');

  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFItemOcorrencia.execConsultaPedidoCompra(nrPedido:integer);
begin
  DM.consultaPedidoCompra(nrPedido,cliente.codigo);
  if not DM.sqlConsultaPedido.IsEmpty then
  begin
    gbxConsultaGenerica.Top:=328;
    gbxConsultaGenerica.Left:=15;
    gbxConsultaGenerica.Width:=800;
    gbxConsultaGenerica.Height:=210;
    dbgConsultaGenerica.Columns.Items[0].Width:=50;
    dbgConsultaGenerica.Columns.Items[1].Width:=50;
    dbgConsultaGenerica.Columns.Items[2].Width:=60;
    dbgConsultaGenerica.Columns.Items[3].Width:=50;
    dbgConsultaGenerica.Columns.Items[4].Width:=60;
    dbgConsultaGenerica.Columns.Items[5].Width:=70;
    dbgConsultaGenerica.Columns.Items[6].Width:=200;
    dbgConsultaGenerica.Columns.Items[7].Width:=250;
    gbxConsultaGenerica.Visible:=true;
    dbgConsultaGenerica.SetFocus;
    Application.ProcessMessages;
  end
  else
    ShowMessage('Nenhum Pedido foi localizado.');
end;

procedure TFItemOcorrencia.AtualizarDadosExternos1Click(Sender: TObject);
begin
  try
    DM.atualizarDataSetLocalGeral;
    Application.MessageBox('Dados atualizados com sucesso!','',0 + 64);
  except
    on E:Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFItemOcorrencia.btnBuscarClick(Sender: TObject);
begin
  Screen.Cursor:=crSQLWait;
  try
    controleGridItem:=Ativo;
    StatusBarGridConsultaGenerica.SimplePanel:=False;

    if rbtPedido.Checked then
      {consulta lista pedido }
      execConsultaPedidoCompra(StrToIntDef(edtConsulta.Text,0))
    else
      if rbtNFe.Checked then
      begin
        {consulta lista de NFe }
        StatusBarGridConsultaGenerica.SimplePanel:=True;

        tabelaPesquisa.limparDados;
        execConsultaNFe(StrToIntDef(edtConsulta.Text,0));
      end
      else
        if rbtDuplicata.Checked then
          {consulta lista de duplicatas }
          execConsultaDuplicata(StrToIntDef(edtConsulta.Text,0))
       else
         ShowMessage('Escolha um tipo de consulta.');
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFItemOcorrencia.cancelarLimparItem(isLimparTodosDados:Boolean);
begin
  limpaEdit;
  DM.inicializarDataSetLocal(False,True,False);

  if isLimparTodosDados then
  begin
    { desmarcar filtro }
    if rbtPedido.Checked then
      rbtPedido.Checked:=False;
    if rbtNFe.Checked then
      rbtNFe.Checked:=False;
    if rbtDuplicata.Checked then
      rbtDuplicata.Checked:=False;

    ocorrencia.item.limparDados;
    lblEdtDataEmissaoNFe.Font.Color:=clBlack;
  end
  else
    ocorrencia.item.limparDadosParcial;

  { carregar dados da ocorrencia }
  carregaDadosPrincipaisNovoItem;

  { sequencial dos itens }
  ocorrencia.item.nrSequencia:=DM.getSequencialItem;
  lblSeqItem.Caption:=FormatFloat('000',ocorrencia.item.nrSequencia);

  if gbxRelacaoItemNFe.Visible then
    gbxRelacaoItemNFe.Visible:=False;

  if gbxConsultaGenerica.Visible then
    gbxConsultaGenerica.Visible:=False;

  { habilitar opção de enviar email para o transportador }
  chkIncluirEmailDoTransportador.Enabled:=cliente.emailTransportador <> EmptyStr;
  chkIncluirTodosItens.Checked:=False;

  buscaEmail.limparDados;
  memObservacao.Clear;
  lblContMemo.Caption:='0/300';
  StatusBarItemConsulta.SimpleText:='';
  Application.ProcessMessages;
end;

procedure TFItemOcorrencia.salvarItem;
begin
  if Application.MessageBox('Confirma a inclusão do item?','Salvar Item',4 + 32) = 6 then
  begin

    tBtnSalvarItem.Enabled:=False;

    { campo observação do item }
    if memObservacao.Text <> EmptyStr then
      ocorrencia.item.descricaoOcorrencia:=StringReplace(memObservacao.Text,#13#10,'',[rfReplaceAll]);

    { aviso de recolhimento de mercadoria }
    ocorrencia.item.isRecolherMercadoria :=cbxAutorizarRecMercadoria.Checked;

    { Definir Emissao de Ordem de Coleta }
    if ocorrencia.item.isRecolherMercadoria then
      ocorrencia.idSituacaoOrdemColeta:=ID_SITUACAO_ORDEM_DE_COLETA_AGUARDANDO;

    { aviso de registro fora de prazo }
    ocorrencia.item.isAlertarRegistroForaDoPrazo :=cbxAlertarRegistroForaPrazo.Checked;

    { envio de email para translog - somente se for para aviso de recolhimento }
    // Desativado devido a implementação da ordem de coleta
    //if ((cliente.cdTransportador = 10) and (not ocorrencia.item.isRecolherMercadoria)) then
    //  ocorrencia.item.contatoEmail.dsEmailCopia:=StringReplace(ocorrencia.item.contatoEmail.dsEmailCopia,DS_EMAIL_TRANSLOG+';','',[rfReplaceAll]);

    if (ocorrencia.item.quantProduto <> StrToIntDef(lblEdtQuantProduto.Text,0)) then
      ocorrencia.item.quantProduto:=StrToIntDef(lblEdtQuantProduto.Text,0);

    { email extra }
    if (trim(lblEdtEmailExtra.Text) <> ocorrencia.item.contatoEmail.dsEmailCopiaExtra) then
      ocorrencia.item.contatoEmail.dsEmailCopiaExtra:=trim(lblEdtEmailExtra.Text);

    if ((cliente.emailTransportador <> EmptyStr) and (chkIncluirEmailDoTransportador.Checked)) then
      ocorrencia.item.contatoEmail.dsEmailCopiaExtra:=ocorrencia.item.contatoEmail.dsEmailCopiaExtra + ';' + cliente.emailTransportador ;

    { adicionar item no dataset Local }
    DM.gravarNovoItemOcorrenciaLocal(ocorrencia.item);

    if Application.MessageBox('Deseja adicionar um novo item ?','Adicionar novo item',4 + 32) = 6 then
    begin
      if Application.MessageBox('Deseja utilizar os dados da NFe atual ?','Adicionar novo item',4 + 32) = 6 then
      begin
        { limpar informações de tela }
        cancelarLimparItem(False);
        { carrega dados do cliente }
        carregaDadosPrincipaisNovoItem;
        { mostra dados da NFe na tela }
        mostrarDadosNFe;

        gbxRelacaoItemNFe.Visible:=True;
        dbgItemNFe.SetFocus;
      end
      else
      begin
        if ocorrencia.item.cdClienteEntrega <> ocorrencia.cdCliente then
          Application.MessageBox('A NFe informada anteriormente possui "cliente de entrega" '+#13+
                                 'diferente do "cliente do faturamento".'+#13+
                                 'Esse tipo de operação possibilita apenas uma NFe vinculada a ocorrência. ','Atenção',0 + 16);

        { limpar informações de tela }
        cancelarLimparItem(True);
        { carrega dados do cliente }
        carregaDadosPrincipaisNovoItem;
      end;

      { limpar combos de dados - item da ocorrencia }
      DM.inicializarDataSetLocal(False,True,False);
    end
    else
      fecharTela;
  end;
end;
procedure TFItemOcorrencia.salvarItemNFeIntegral;
begin
  if Application.MessageBox('Confirma a inclusão de todos os itens da NFe?','Salvar Item',4 + 32) = 6 then
  begin
    tBtnSalvarItem.Enabled:=False;
    DM.sqlItemNFe_PedidoCompra.First;
    while not DM.sqlItemNFe_PedidoCompra.Eof do
    begin
      ocorrencia.item.nrSequencia:= DM.getSequencialItem;
      carregarDadosProduto;

      { campo observação do item }
      if memObservacao.Text <> EmptyStr then
        ocorrencia.item.descricaoOcorrencia:=StringReplace(memObservacao.Text,#13#10,'',[rfReplaceAll]);

      { aviso de recolhimento de mercadoria }
      ocorrencia.item.isRecolherMercadoria:=cbxAutorizarRecMercadoria.Checked;

      { Definir Emissao de Ordem de Coleta }
      if ocorrencia.item.isRecolherMercadoria then
        ocorrencia.idSituacaoOrdemColeta:=ID_SITUACAO_ORDEM_DE_COLETA_AGUARDANDO;

      { aviso de registro fora de prazo }
      ocorrencia.item.isAlertarRegistroForaDoPrazo:=cbxAlertarRegistroForaPrazo.Checked;

      { envio de email para translog - somente se for para aviso de recolhimento }
      // Desativado devido a implementação da ordem de coleta
      //if ((cliente.cdTransportador = 10) and (not ocorrencia.item.isRecolherMercadoria)) then
      //  ocorrencia.item.contatoEmail.dsEmailCopia:=StringReplace(ocorrencia.item.contatoEmail.dsEmailCopia,DS_EMAIL_TRANSLOG+';','',[rfReplaceAll]);

      { email extra }
      if (trim(lblEdtEmailExtra.Text) <> ocorrencia.item.contatoEmail.dsEmailCopiaExtra) then
        ocorrencia.item.contatoEmail.dsEmailCopiaExtra:=trim(lblEdtEmailExtra.Text);

      if ((cliente.emailTransportador <> EmptyStr) and (chkIncluirEmailDoTransportador.Checked)) then
        ocorrencia.item.contatoEmail.dsEmailCopiaExtra:=ocorrencia.item.contatoEmail.dsEmailCopiaExtra + ';' + cliente.emailTransportador ;

      { adicionar item no dataset Local }
      DM.gravarNovoItemOcorrenciaLocal(ocorrencia.item);

      DM.sqlItemNFe_PedidoCompra.Next;
    end;

    if Application.MessageBox('Os itens forma incluídos na ocorrência com sucesso!'+#13+'Deseja finalizar a ocorrência ?' ,'Atenção',4 + 32) = 6 then
    begin
      DM.cdsItemOcorrencia.First;
      fecharTela;
    end;
  end;
end;


procedure TFItemOcorrencia.salvarItemNFeSelecionado;
begin
  if Application.MessageBox('Confirma a inclusão de todos os itens selecionados da NFe?','Salvar Item',4 + 32) = 6 then
  begin
    tBtnSalvarItem.Enabled:=False;
    filtraItensSeleciona;
    DM.sqlItemNFe_PedidoCompra.First;


    while not DM.sqlItemNFe_PedidoCompra.Eof do
    begin
      ocorrencia.item.nrSequencia:=DM.getSequencialItem;
      carregarDadosProduto;

      { campo observação do item }
      if memObservacao.Text <> EmptyStr then
        ocorrencia.item.descricaoOcorrencia:=StringReplace(memObservacao.Text,#13#10,'',[rfReplaceAll]);

      { aviso de recolhimento de mercadoria }
      ocorrencia.item.isRecolherMercadoria:=cbxAutorizarRecMercadoria.Checked;

      { Definir Emissao de Ordem de Coleta }
      if ocorrencia.item.isRecolherMercadoria then
        ocorrencia.idSituacaoOrdemColeta:=ID_SITUACAO_ORDEM_DE_COLETA_AGUARDANDO;

      { aviso de registro fora de prazo }
      ocorrencia.item.isAlertarRegistroForaDoPrazo:=cbxAlertarRegistroForaPrazo.Checked;

      { envio de email para translog - somente se for para aviso de recolhimento }
      // Desativado devido a implementação da ordem de coleta
      //if ((cliente.cdTransportador = 10) and (not ocorrencia.item.isRecolherMercadoria)) then
      //  ocorrencia.item.contatoEmail.dsEmailCopia:=StringReplace(ocorrencia.item.contatoEmail.dsEmailCopia,DS_EMAIL_TRANSLOG+';','',[rfReplaceAll]);

      { email extra }
      if (trim(lblEdtEmailExtra.Text) <> ocorrencia.item.contatoEmail.dsEmailCopiaExtra) then
        ocorrencia.item.contatoEmail.dsEmailCopiaExtra:=trim(lblEdtEmailExtra.Text);

      if ((cliente.emailTransportador <> EmptyStr) and (chkIncluirEmailDoTransportador.Checked)) then
        ocorrencia.item.contatoEmail.dsEmailCopiaExtra:=ocorrencia.item.contatoEmail.dsEmailCopiaExtra + ';' + cliente.emailTransportador ;

      { adicionar item no dataset Local }
      DM.gravarNovoItemOcorrenciaLocal(ocorrencia.item);

      DM.sqlItemNFe_PedidoCompra.Next;
    end;
    DM.sqlItemNFe_PedidoCompra.Filtered:=false;
    ResetItensSelecioandos;
     if Application.MessageBox('Deseja adicionar um novo item ?','Adicionar novo item',4 + 32) = 6 then
    begin
      if Application.MessageBox('Deseja utilizar os dados da NFe atual ?','Adicionar novo item',4 + 32) = 6 then
      begin
        { limpar informações de tela }
        cancelarLimparItem(False);
        { carrega dados do cliente }
        carregaDadosPrincipaisNovoItem;
        { mostra dados da NFe na tela }
        mostrarDadosNFe;

        gbxRelacaoItemNFe.Visible:=True;
        dbgItemNFe.SetFocus;
      end
      else
      begin
        if ocorrencia.item.cdClienteEntrega <> ocorrencia.cdCliente then
          Application.MessageBox('A NFe informada anteriormente possui "cliente de entrega" '+#13+
                                 'diferente do "cliente do faturamento".'+#13+
                                 'Esse tipo de operação possibilita apenas uma NFe vinculada a ocorrência. ','Atenção',0 + 16);

        { limpar informações de tela }
        cancelarLimparItem(True);
        { carrega dados do cliente }
        carregaDadosPrincipaisNovoItem;
      end;

      { limpar combos de dados - item da ocorrencia }
      DM.inicializarDataSetLocal(False,True,False);
    end
    else
      fecharTela;
  end;

end;





procedure TFItemOcorrencia.edtConsultaExit(Sender: TObject);
begin
  if rbtNFe.Checked then
    mEdtDataEmissaoConsulta.SetFocus;
end;

procedure TFItemOcorrencia.excluirItem;
begin
  try
    DM.excluirItemOcorrencia;
  finally

  end;
end;

procedure TFItemOcorrencia.fecharTela;
begin
  //cancelarLimparItem(True);
  Close;
end;

procedure TFItemOcorrencia.iniciarTelaSolucao;
begin
  if FSolucaoItem = nil then
    FSolucaoItem:=TFSolucaoItem.Create(nil);

  FSolucaoItem.ShowModal;
end;

procedure TFItemOcorrencia.iniciarTelaCausa;
begin
  if FCausaItem = nil then
    FCausaItem:=TFCausaItem.Create(nil);

  FCausaItem.ShowModal;
end;

procedure TFItemOcorrencia.memObservacaoChange(Sender: TObject);
var
  cont: integer;
begin
  cont:=Length(memObservacao.Text);
  lblContMemo.Caption:=inttostr(cont)+'/300';
  Application.ProcessMessages;
end;

procedure TFItemOcorrencia.memObservacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Shift = [ssAlt]) and (key = 83)) then
  begin
    key:=0;
    tBarAtendimento.SetFocus;
    salvarItem;
  end;

  if ((Shift = [ssCtrl]) and (key = 81)) then { ctrl + "Q" }
  begin
    key:=0;
    memObservacao.Lines.Add(MSG_DEVOLUCAO_1);
  end;

  if ((Shift = [ssCtrl]) and (key = 70)) then { ctrl + "F" }
  begin
    key:=0;
    memObservacao.Lines.Add(MSG_DEVOLUCAO_2);
  end;

  if ((Shift = [ssCtrl]) and (key = 69)) then { ctrl + "E" }
  begin
    key:=0;
    memObservacao.Lines.Add(MSG_ENGANO_CLIENTE_1);
  end;

  if ((Shift = [ssCtrl]) and (key = 82)) then { ctrl + "R" }
  begin
    key:=0;
    memObservacao.Lines.Add(MSG_RECOLHIMENTO_MERCADORIA);
  end;

end;

procedure TFItemOcorrencia.memObservacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  key := Upcase(Key) ;
  if (key in ['Ç','ç','À','Á','Ã','ã','à','á','Ê','ê','Í','í','´','`','~','^']) then
  begin
    Beep;
    key:=#0;
  end;

  if key = #27 then
  begin
    memObservacao.Clear;
    lblContMemo.Caption:='0/300';
    Application.ProcessMessages;
  end;

  if ((key = #13) and (length(trim(memObservacao.Text)) = 0)) then
    tBtnSalvarItem.Click;
end;

procedure TFItemOcorrencia.memObservacaoMouseEnter(Sender: TObject);
begin
  memObservacao.Hint:=HINT_OBSERVACAO;
end;

procedure TFItemOcorrencia.FormActivate(Sender: TObject);
begin
  DM.inicializarDataSetLocal(False,True,False);

  case MODO_TELA of
    normal: carregaDadosPrincipaisNovoItem;
    visualizacao,edicao : carregaDadosItemVisualizacao(False);
  end;

  if not usuario.isControleGeralDoSistema then
  begin
    tBtnLimpar.Enabled:=False;
    tBtnSolucao.Enabled:=False;
    tbtnCausa.Enabled:=False;
    tBtnCancelarRegistro.Enabled:=False;
  end;

end;

procedure TFItemOcorrencia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FItemOcorrencia:=nil;
  Action:=caFree;
end;

procedure TFItemOcorrencia.FormCreate(Sender: TObject);
begin
  buscaEmail.limparDados;
end;

procedure TFItemOcorrencia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F4 : begin
      if not cbxAutorizarRecMercadoria.Checked then
        cbxAutorizarRecMercadoria.Checked:=True
      else
        cbxAutorizarRecMercadoria.Checked:=False;
    end;

    VK_F6 : begin
      if not cbxAutorizarRecMercadoria.Checked then
        chkIncluirEmailDoTransportador.Checked:=True
      else
        chkIncluirEmailDoTransportador.Checked:=False;
    end;

    VK_F7 : begin
      if not chkIncluirTodosItens.Checked then
        chkIncluirTodosItens.Checked:=True
      else
        chkIncluirTodosItens.Checked:=False;
    end;

  end;

end;

procedure TFItemOcorrencia.FormShow(Sender: TObject);
begin
  { configura tamanho do formulario }
  Top:=tamanhoTela.topo;
  Left:=tamanhoTela.esquerda;
  Height:=tamanhoTela.altura;
  Width:=tamanhoTela.largura;
end;

procedure TFItemOcorrencia.tBtnLimparClick(Sender: TObject);
begin
  cancelarLimparItem(True);
end;

procedure TFItemOcorrencia.iniciarTelaCancelarOcorrencia;
begin
  if FCancelamentoDeOcorrencia = nil then
    FCancelamentoDeOcorrencia:=TFCancelamentoDeOcorrencia.Create(self);

  FCancelamentoDeOcorrencia.NR_ITEM_OCORRENCIA:=ocorrencia.item.nrSequencia;
  FCancelamentoDeOcorrencia.ShowModal;
end;

procedure TFItemOcorrencia.tBtnCancelarRegistroClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja cancelar o item da ocorrência atual?','Cancelar Item de Ocorrência',4 + 32) = 6 then
    iniciarTelaCancelarOcorrencia
  else
    Application.MessageBox('Operação não executada!','SAC',0 + 64);

end;

procedure TFItemOcorrencia.tbtnCausaClick(Sender: TObject);
begin
  iniciarTelaCausa;
end;

procedure TFItemOcorrencia.tBtnExcluiritemClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir este item da ocorrência?','Confirmação de Processo',4 + 32) = 6 then
  begin
    try
      excluirItem;
      tBtnExcluiritem.Enabled:=False;
      Application.MessageBox('Item excluido com sucesso!','Resultado do Processo',0 + 64);
    except
      on E:Exception do
        raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TFItemOcorrencia.tBtnFecharClick(Sender: TObject);
begin
  fecharTela;
end;

procedure TFItemOcorrencia.tBtnSalvarItemClick(Sender: TObject);
begin
  if MODO_TELA = normal then
    if isItemValidoParaGravacao then
    begin
      DM.sqlItemNFe_PedidoCompra.Filtered:=false;
      ocorrencia.isOcorrenciaIntegral:= chkIncluirTodosItens.Checked;

      if ocorrencia.isOcorrenciaIntegral then
        salvarItemNFeIntegral
      else
        begin
          filtraItensSeleciona;

          if DM.sqlItemNFe_PedidoCompra.RecordCount > 1 then
             salvarItemNFeSelecionado
          else
           begin
            DM.sqlItemNFe_PedidoCompra.Filtered:=false;
            salvarItem;

           end;

        end;
    end;

  { alteração do solucionador - atraves da tela de consulta de ocorrência }
  if MODO_TELA = visualizacao then
  begin
    Screen.Cursor:=crSQLWait;
    try
      try
        DM.gravarNovoSolucionadorItemOcorrenciaLocal(ocorrencia.item);
        DM.execAlterarSolucionadorItemOcorrencia;
        DM.enviarEmailOcorrencia(True,False,'');
        Application.MessageBox('Solucionador alterado com sucesso!','Confirmação',0 + 64);
        tBtnSalvarItem.Enabled:=False;
      except
        on E:Exception do
          raise Exception.CreateFmt('Erro ao alterar solucionador. Detalhes: %s',[E.Message]);
      end;
    finally
      Screen.Cursor:=crDefault;
    end;
  end;
end;

procedure TFItemOcorrencia.tBtnSolucaoClick(Sender: TObject);
begin
  iniciarTelaSolucao;
end;

procedure TFItemOcorrencia.tmrHorarioTimer(Sender: TObject);
begin
  lblHorarioAtual.Caption:=FormatDateTime('DD/MM/YYYY - HH:MM:SS',Now);
  Application.ProcessMessages;
end;

procedure TFItemOcorrencia.carregaDadosItemVisualizacao(isParcial:Boolean);
begin
  { parar timer de horario }
  tmrHorario.Enabled:=False;

  { dados situacao da ocorrencia }
  lblEdtStatusSolucao.Text:=DM.cdsItemOcorrencia.FieldByName('dsStatusSolucao').AsString;
  lblEdtStatusCausaProblema.Text:=DM.cdsItemOcorrencia.FieldByName('dsStatusCausa').AsString;
  Application.ProcessMessages;

  if DM.cdsItemOcorrencia.FieldByName('cdStatusSolucao').AsInteger = CD_SOLUCAO_PENDENTE_ITEM then
  begin
    menuReabrirOcorrencia.Enabled:=False;
    lblEdtStatusSolucao.Font.Color:=clRed;
    tbtnCausa.Enabled:=False;
  end
  else
  begin
    if DM.cdsItemOcorrencia.FieldByName('cdStatusSolucao').AsInteger = CD_SITUACAO_OCORRENCIA_CANCELADA then
    begin
      menuReabrirOcorrencia.Enabled:=False;
      tBtnSolucao.Enabled:=False;
      tbtnCausa.Enabled:=False;
      lblEdtStatusSolucao.Font.Color:=clBlue;
    end
    else
    begin
      menuReabrirOcorrencia.Enabled:=True;
      lblEdtStatusSolucao.Font.Color:=clGreen;
      tBtnSolucao.Enabled:=False;
    end;
  end;

  if DM.cdsItemOcorrencia.FieldByName('cdStatusCausa').AsInteger = CD_CAUSA_PENDENTE_ITEM then
    lblEdtStatusCausaProblema.Font.Color:=clRed
  else
  begin
    tbtnCausa.Enabled:=False;
    if DM.cdsItemOcorrencia.FieldByName('cdStatusCausa').AsInteger = CD_SITUACAO_OCORRENCIA_CANCELADA then
      lblEdtStatusCausaProblema.Font.Color:=clAqua
    else
      lblEdtStatusCausaProblema.Font.Color:=clGreen;
  end;

  if not isParcial then
  begin
    { atualiza variavel ocorrencia }
    ocorrencia.item.limparDados;
    ocorrencia.item.nrSequencia:=DM.cdsItemOcorrencia.FieldByName('nrSequencia').AsInteger;
    ocorrencia.item.cdSituacaoEmbalagem:=DM.cdsItemOcorrencia.FieldByName('cdSituacaoEmbalagem').AsInteger;
    ocorrencia.contato:=DM.cdsOcorrencia.FieldByName('dsContato').AsString;

    { dados de controle e do cliente }
    lblEdtCodigoCliente.Text:=DM.cdsOcorrencia.FieldByName('codigoDigito').AsString;
    lblEdtRazaoSocial.Text:=DM.cdsOcorrencia.FieldByName('razaoSocial').AsString;
    lblEdtContatoCliente.Text:=DM.cdsOcorrencia.FieldByName('dsContato').AsString;
    lblControle.Caption:=FormatFloat('000000',DM.cdsOcorrencia.FieldByName('cdOcorrencia').AsInteger);
    lblSeqItem.Caption:=formatfloat('000',DM.cdsItemOcorrencia.FieldByName('nrSequencia').AsInteger);
    lblHorarioAtual.Caption:=FormatDateTime('dd/mm/yyyy hh:nn:ss',DM.cdsOcorrencia.FieldByName('dataRegistro').AsDateTime);

    { dados do item }
    lblEdtNFe.Text:=DM.cdsItemOcorrencia.FieldByName('nrNFe').AsString;
    lblEdtDataEmissaoNFe.Text:=DM.cdsItemOcorrencia.FieldByName('dataEmissao').AsString;
    lblEdtOrigemPedido.Text:=DM.cdsItemOcorrencia.FieldByName('dsOrigemPedido').AsString;
    lblEdtTransportador.Text:=DM.cdsItemOcorrencia.FieldByName('nomeTransportador').AsString;
    lblEdtDadosTransbordo.Text:=DM.cdsItemOcorrencia.FieldByName('dsTransbordoCarga').AsString;
    lblEdtCodigoProduto.Text:=DM.cdsItemOcorrencia.FieldByName('cdProduto').AsString;
    lblEdtNomeProduto.Text:=DM.cdsItemOcorrencia.FieldByName('dsProduto').AsString;
    lblEdtTipoProduto.Text:=DM.cdsItemOcorrencia.FieldByName('dsTipoProduto').AsString;
    lblEdtLoteProduto.Text:=DM.cdsItemOcorrencia.FieldByName('dsLoteProduto').AsString;
    lblEdtDataValidadeProduto.Text:=DM.cdsItemOcorrencia.FieldByName('dataValidadeProduto').AsString;
    lblEdtPeriodoValidade.Text:=DM.cdsItemOcorrencia.FieldByName('prazoValidade').AsString + ' meses';
    lblEdtQuantProduto.Text:=DM.cdsItemOcorrencia.FieldByName('quantProduto').AsString;

    dbLcbTipoOcorrencia.KeyValue:=DM.cdsItemOcorrencia.FieldByName('cdTipoOcorrencia').AsInteger;
    dbLcbTipoOcorrencia.DropDown;
    dbLcbTipoOcorrencia.CloseUp(False);
    DM.execFiltroSubTipoOcorrencia(DM.cdsItemOcorrencia.FieldByName('cdTipoOcorrencia').AsInteger);

    dbLcbSubTipoOcorrencia.KeyValue:=DM.cdsItemOcorrencia.FieldByName('cdSubTipoOcorrencia').AsInteger;
    dbLcbSubTipoOcorrencia.DropDown;
    dbLcbSubTipoOcorrencia.CloseUp(False);

    dbLcbSituacaoEmbalagem.KeyValue:=DM.cdsItemOcorrencia.FieldByName('cdSituacaoEmbalagem').AsInteger;
    dbLcbSituacaoEmbalagem.DropDown;
    dbLcbSituacaoEmbalagem.CloseUp(False);

    dbLcbSolucionador.KeyValue:=DM.cdsItemOcorrencia.FieldByName('cdSolucionador').AsInteger;
    dbLcbTipoOcorrencia.DropDown;
    dbLcbTipoOcorrencia.CloseUp(False);

    lblEdtNomeCoordenadorSolucionador.Text:=DM.cdsItemOcorrencia.FieldByName('nmGerenteSolucionador').AsString;
    lblEdtDataLimiteSolucao.Text:=DM.cdsOcorrencia.FieldByName('dataLimite').AsString;
    lblEdtNomeRepresentante.Text:=DM.cdsItemOcorrencia.FieldByName('nomeRepresentante').AsString;

    memObservacao.Lines.Add(DM.cdsItemOcorrencia.FieldByName('descricaoOcorrencia').AsString);
    if DM.cdsItemOcorrencia.FieldByName('dsMotivoCancelamento').AsString <> EmptyStr then
    begin
      memObservacao.Lines.Add(' ');
      memObservacao.Lines.Add(' ');
      memObservacao.Lines.Add('--------------------------------------------------');
      memObservacao.Lines.Add('----------  OCORRENCIA CANCELADA   ---------------');
      memObservacao.Lines.Add('--------------------------------------------------');
      memObservacao.Lines.Add(' ');
      memObservacao.Lines.Add(DM.cdsItemOcorrencia.FieldByName('dsMotivoCancelamento').AsString);
    end;

    lblContMemo.Caption:=inttostr(Length(trim(memObservacao.Text)))+'/300';
    menuReEnviarEmail.Enabled:=True;

    cbxAlertarRegistroForaPrazo.Checked:=DM.cdsItemOcorrencia.FieldByName('IdAlertarRegistroForaPrazo').AsBoolean;
    Application.ProcessMessages;

    { desabilitar campos }
    if MODO_TELA = visualizacao then
    begin
      gbxConsulta.Enabled:=False;
      tBtnExcluiritem.Enabled:=False;
      tBtnLimpar.Enabled:=False;
      //tBtnSolucao.Enabled:=False;
      //tbtnCausa.Enabled:=False;

      lblEdtQuantProduto.Enabled:=false;
      dbLcbTipoOcorrencia.Enabled:=false;
      dbLcbSubTipoOcorrencia.Enabled:=false;
      dbLcbSituacaoEmbalagem.Enabled:=false;
      dbLcbSolucionador.Enabled:=False;
      memObservacao.Enabled:=False;
      cbxAutorizarRecMercadoria.Enabled:=False;
      cbxAlertarRegistroForaPrazo.Enabled:=False;
      chkIncluirEmailDoTransportador.Enabled:=False;
      lblEdtEmailExtra.Enabled:=False;

      if DM.cdsItemOcorrencia.FieldByName('cdStatusSolucao').AsInteger = CD_SOLUCAO_PENDENTE_ITEM then
      begin
        imgSolucionador.Enabled:=true;
        tBtnCancelarRegistro.Enabled:=True;
      end
      else
        imgSolucionador.Enabled:=False;
    end;

    if MODO_TELA = edicao then
    begin
      tBtnExcluiritem.Enabled:=True;
      tBtnLimpar.Enabled:=False;
      tBtnSolucao.Enabled:=False;
      tbtnCausa.Enabled:=False;
    end;
  end;
end;

procedure TFItemOcorrencia.atualizaPainelControleItem;
begin
  if ocorrencia.item.cdStatusSolucao = 1 then
    lblEdtStatusSolucao.Font.Color:=clRed
  else
    lblEdtStatusSolucao.Font.Color:=clGreen;

  if ocorrencia.item.cdStatusCausa = 1 then
    lblEdtStatusCausaProblema.Font.Color:=clRed
  else
    lblEdtStatusCausaProblema.Font.Color:=clGreen;
end;

procedure TFItemOcorrencia.carregaDadosPrincipaisNovoItem;
begin
  lblEdtCodigoCliente.Text:=inttostr(cliente.codigo) + '/' + inttostr(cliente.digito);
  lblEdtRazaoSocial.Text:=cliente.razaoSocial;
  lblEdtContatoCliente.Text:=cliente.contato;

  if DM.cdsItemOcorrencia.IsEmpty then
  begin
    case filtroConsulta.idFiltro of
      2 : begin
        rbtNFe.Checked:=True;
        lblTipoFiltro.Caption:='Nº NFe';
        edtConsulta.Text:=filtroConsulta.dsFiltro;
      end;
      3 : begin
        rbtDuplicata.Checked:=True;
        lblTipoFiltro.Caption:='Nº Duplicata';
        edtConsulta.Text:=filtroConsulta.dsFiltro;
      end;
      else
      begin
        rbtPedido.Checked:=True;
        lblTipoFiltro.Caption:='Nº Pedido';
      end;
    end;
  end;

  { painel controle do item }
  lblControle.Caption:=FormatFloat('000000',ocorrencia.cdOcorrencia);
  lblEdtStatusSolucao.Text:=cdSolucaoOcorrenciaToDescricao(ocorrencia.cdStatusSolucao);
  lblEdtStatusCausaProblema.Text:=cdCausaOcorrenciaToDescricao(ocorrencia.cdStatusCausa);

  { destaque da situação da causa/solução do item }
  atualizaPainelControleItem;

  { sequencial dos itens }
  ocorrencia.item.limparDados;
  ocorrencia.item.nrSequencia:=DM.getSequencialItem;

  ocorrencia.item.cdEmpresa:=ocorrencia.cdEmpresa;
  ocorrencia.item.cdDistrito:=cliente.distrito;
  ocorrencia.item.cdSetor:=cliente.setor;
  ocorrencia.item.cdTransportador:=cliente.cdTransportador;
  ocorrencia.item.contatoEmail.dsEmailRepresentante:=cliente.emailSetor;
  ocorrencia.item.contatoEmail.dsEmailCoordenador:=cliente.emailDistrito;

  { SS.: 13974 - a Parte dos emails sendo enviada conforme cadsatro na tabela PRDDM.DC_EMAIL }
  //if (((cliente.setor = 129) or (cliente.setor = 130)) and (cliente.tipo > 1)) then
  if ((cliente.canalVenda <> Hospitalar) and ((cliente.setor = 129) or (cliente.setor = 130)) and (cliente.tipo > 1)) then
  begin
    ocorrencia.item.contatoEmail.dsEmailRepresentante:='';
    ocorrencia.item.contatoEmail.dsEmailCoordenador:='';
  end;

  { limpa dados do solucionador }
  ocorrencia.item.cdSolucionador:=0;
  ocorrencia.item.isSolucionadorGAM:=False;
  ocorrencia.item.contatoEmail.dsEmailCopiaExtra:='';


  { SS.: 18038  }
  { Desativado conforme SS.:18553
  if ((cliente.setor = 129) or (cliente.setor = 105))then
  begin
    ocorrencia.item.contatoEmail.dsEmailRepresentante:='';
    ocorrencia.item.isSolucionadorGAM:=True;
    ocorrencia.item.cdSolucionador:=NR_MATRICULA_SOLUCIONADOR_GAM_5;
  end;
  }

  { email extra - envia copia para transportadoras  - solicitacao Keyte - 03/10/2012}
  { envio de email cancelado conforme SS: 21224 - 30/08/2018
  if cliente.emailTransportador <> EmptyStr then
    ocorrencia.item.contatoEmail.dsEmailCopiaExtra:=cliente.emailTransportador;
  }


  { Última alteração feita conforme SS: 17261 em 11/05/2017 }
  case cliente.tipo of

    { 10 Sesi - 11 CIA Latino - 120 Nissei - 78 Brair / São João - 274 Dimed/Panvel }
    10,11,78,274 :  begin
                              if ocorrencia.item.contatoEmail.dsEmailCopia <> EmptyStr then
                                ocorrencia.item.contatoEmail.dsEmailCopia:=ocorrencia.item.contatoEmail.dsEmailCopia + ';'+ DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_1
                              else
                                ocorrencia.item.contatoEmail.dsEmailCopia:=DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_1;

                              ocorrencia.item.isSolucionadorGAM:=True;
                              ocorrencia.item.cdSolucionador:=NR_MATRICULA_SOLUCIONADOR_GAM_1;
    end;

    { 120 Nissei - 155 Wal mart  - 112 Callfarma  - SS 23526 -23522}
    120,155,112 :  begin
                              if ocorrencia.item.contatoEmail.dsEmailCopia <> EmptyStr then
                                ocorrencia.item.contatoEmail.dsEmailCopia:=ocorrencia.item.contatoEmail.dsEmailCopia + ';'+ DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_6
                              else
                                ocorrencia.item.contatoEmail.dsEmailCopia:=DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_6;

                              ocorrencia.item.isSolucionadorGAM:=True;
                              ocorrencia.item.cdSolucionador:=NR_MATRICULA_SOLUCIONADOR_GAM_6;
    end;

    { 029 - ANGELONI, 047 - COPPER, 168 - Santo Andre }
    029,047,168 :  begin
                   if ocorrencia.item.contatoEmail.dsEmailCopia <> EmptyStr then
                     ocorrencia.item.contatoEmail.dsEmailCopia:=ocorrencia.item.contatoEmail.dsEmailCopia + ';'+ DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_4
                   else
                     ocorrencia.item.contatoEmail.dsEmailCopia:=DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_4;

                   ocorrencia.item.isSolucionadorGAM:=True;
                   ocorrencia.item.cdSolucionador:=NR_MATRICULA_SOLUCIONADOR_GAM_4;
    end;

    {016 - AGAFARMA ,028 - ASSOCIADAS ,025 - DROGABEL,160 - ERECHIM,072 - MAIS ECON.,137 - MAIS FELIZ,
     071 - MAXXI ECONÔMICA, 465 - MINHA FARMA,171 - PREÇO MAIS POPULAR,044 - REDE SANAR,054 - REDE TCHÊ
     141 - SOMAR,153 - VIDA FARMÁCIAS  }

    016,028,025,160,
    072,137,071,465,
    171,044,054,141,
    153       : begin
                 if ocorrencia.item.contatoEmail.dsEmailCopia <> EmptyStr then
                   ocorrencia.item.contatoEmail.dsEmailCopia:=ocorrencia.item.contatoEmail.dsEmailCopia + ';'+ DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_2
                 else
                   ocorrencia.item.contatoEmail.dsEmailCopia:=DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_1;  { SS 51677  troca email NR_MATRICULA_SOLUCIONADOR_GAM_2 por NR_MATRICULA_SOLUCIONADOR_GAM_2   }

                 ocorrencia.item.isSolucionadorGAM:=True;
                 ocorrencia.item.cdSolucionador:=NR_MATRICULA_SOLUCIONADOR_GAM_1;   { SS 51677  troca email NR_MATRICULA_SOLUCIONADOR_GAM_2 por NR_MATRICULA_SOLUCIONADOR_GAM_1   }
    end;

    { 82 Vale Verde - 86 São Paulo - 127 irmãos pavesi }
    82, 86, 127 :  begin
             if ocorrencia.item.contatoEmail.dsEmailCopia <> EmptyStr then
               ocorrencia.item.contatoEmail.dsEmailCopia:=ocorrencia.item.contatoEmail.dsEmailCopia + ';'+ DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_6
             else
               ocorrencia.item.contatoEmail.dsEmailCopia:=DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_6;

             ocorrencia.item.isSolucionadorGAM:=True;
             ocorrencia.item.cdSolucionador:=NR_MATRICULA_SOLUCIONADOR_GAM_6;
    end;

    {  170 Trajano - 86 São Paulo -  89 Glapinsk - 167 Estrela - 159 Descontão }
    170,89,167,159 :  begin
             if ocorrencia.item.contatoEmail.dsEmailCopia <> EmptyStr then
               ocorrencia.item.contatoEmail.dsEmailCopia:=ocorrencia.item.contatoEmail.dsEmailCopia + ';'+ DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_1
             else
               ocorrencia.item.contatoEmail.dsEmailCopia:=DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_1;

             ocorrencia.item.isSolucionadorGAM:=True;
             ocorrencia.item.cdSolucionador:=NR_MATRICULA_SOLUCIONADOR_GAM_1;
    end;

  end;

  if length(trim(ocorrencia.item.contatoEmail.dsEmailCopia)) > 0 then
  begin
    if Application.MessageBox(pchar('Deseja encaminhar cópia do email para '+ocorrencia.item.contatoEmail.dsEmailCopia + '?'),'Email Extra',4 + 32) = 7 then
      ocorrencia.item.contatoEmail.dsEmailCopia:='';
  end;

  { copia para responsavel no CD de Santa Cruz do Sul, conforme S.S. Nº 9548 (05/02/2014) }
  { Desativado. Foi incluido os emails como  copia para o Haroldo e o Ramon Vargas.
  if ocorrencia.item.cdEmpresa = CD_GAM_RS then
  begin
    if length(trim(ocorrencia.item.contatoEmail.dsEmailCopia)) > 0 then
      ocorrencia.item.contatoEmail.dsEmailCopia:=ocorrencia.item.contatoEmail.dsEmailCopia + ';' + DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_RS
    else
      ocorrencia.item.contatoEmail.dsEmailCopia:=DS_EMAIL_PADRAO_SOLUCIONADOR_GAM_RS;
  end;
  }
  { ********** final email extra *********************  }

  lblSeqItem.Caption:=FormatFloat('000',ocorrencia.item.nrSequencia);
  lblEdtNomeRepresentante.Text:=format('Setor: %d - %s',[cliente.setor,cliente.nomeRepresentante]);

  {tabela de consulta de nfe }
  tabelaPesquisa.limparDados;

  imgSolucionador.Enabled:=False;
  tBtnSalvarItem.Enabled:=False;
  tBtnSolucao.Enabled:=False;
  tbtnCausa.Enabled:=False;
  gbxConsulta.SetFocus;
  Application.ProcessMessages;
end;

procedure TFItemOcorrencia.execListaItemNFe(isMotrarGridDeItem:Boolean);
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.listarItemNFe;

    gbxRelacaoItemNFe.Top:=285;
    gbxRelacaoItemNFe.Left:=15;
    gbxRelacaoItemNFe.Height:=255;
    gbxRelacaoItemNFe.Width:=1290;

    dbgItemNFe.Columns.Items[0].Width:=50;
    dbgItemNFe.Columns.Items[1].Width:=30;
    dbgItemNFe.Columns.Items[2].Width:=150;
    dbgItemNFe.Columns.Items[3].Width:=150;
    dbgItemNFe.Columns.Items[4].Width:=50;
    dbgItemNFe.Columns.Items[5].Width:=90;
    dbgItemNFe.Columns.Items[6].Width:=150;
    dbgItemNFe.Columns.Items[8].Width:=50;
    dbgItemNFe.Columns.Items[9].Width:=80;
    dbgItemNFe.Columns.Items[10].Width:=80;
    dbgItemNFe.Columns.Items[16].Width:=150;

    {colunas que nao precisam ser mostradas }
    dbgItemNFe.Columns.Items[7].Visible:=False;
    //dbgItemNFe.Columns.Items[10].Visible:=False;
    dbgItemNFe.Columns.Items[12].Visible:=False;
    dbgItemNFe.Columns.Items[13].Visible:=False;
    dbgItemNFe.Columns.Items[15].Visible:=False;
    dbgItemNFe.Columns.Items[17].Visible:=False;
    dbgItemNFe.Columns.Items[18].Visible:=False;

    TFloatField (DM.sqlItemNFe_PedidoCompra.Fields[5]).DisplayFormat := '#,##0.00';

    if isMotrarGridDeItem then
    begin
      gbxRelacaoItemNFe.Visible:=true;
      dbgItemNFe.SetFocus;
      Application.ProcessMessages;
    end;

    if DM.isProdutoRefrigeradoLocalizado then
    begin
      if not isMotrarGridDeItem then
        ocorrencia.item.isEnviarMensagemProdutoTermolabil:=True;

      Application.MessageBox('"Produto Refrigerado" localizado.','Atenção',0 + 64);
    end;

    if DM.isProdutoOncologicoLocalizado then
      Application.MessageBox('"Produto Oncológico" localizado.','Atenção',0 + 64);

    verificarAvisoDeRecallDeLoteNaLista(isMotrarGridDeItem);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFItemOcorrencia.execListaItemPedidoCompra;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.listaItemPedido;

    gbxRelacaoItemNFe.Top:=150;
    gbxRelacaoItemNFe.Left:=15;
    gbxRelacaoItemNFe.Height:=400;
    gbxRelacaoItemNFe.Width:=1290;
    gbxRelacaoItemNFe.Visible:=true;

    dbgItemNFe.Columns.Items[0].Width:=60;
    dbgItemNFe.Columns.Items[1].Width:=150;
    dbgItemNFe.Columns.Items[2].Width:=150;
    dbgItemNFe.Columns.Items[3].Width:=40;
    dbgItemNFe.Columns.Items[4].Width:=90;
    dbgItemNFe.Columns.Items[5].Width:=90;
    dbgItemNFe.Columns.Items[6].Width:=30;
    dbgItemNFe.Columns.Items[10].Width:=250;

    dbgItemNFe.Columns.Items[7].Visible:=False;
    dbgItemNFe.Columns.Items[8].Visible:=False;
    dbgItemNFe.Columns.Items[9].Visible:=False;

    dbgItemNFe.SetFocus;
    Application.ProcessMessages;

    if DM.isProdutoRefrigeradoLocalizado then
      Application.MessageBox('"Produto Refrigerado" localizado.','Atenção',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFItemOcorrencia.execListaTipoVolumeItemNFe;
begin
  Screen.Cursor:=crSQLWait;
  try
   // Application.ProcessMessages;
    //DM.listaTipoVolumeItemNFe;

     nrRomaneio :=dm.sqlConsultaNFe.FieldByName('NotaControle').Asinteger;
     dtRomaneio :=dm.sqlConsultaNFe.FieldByName('Emissao').AsString ;
     nrEmpresa  :=dm.sqlConsultaNFe.FieldByName('cd_empresa').AsInteger;

   //   FRelacaoVolumeDaNota:= TFRelacaoVolumeDaNota.create(Self);

      Application.CreateForm(TFRelacaoVolumeDaNota,FRelacaoVolumeDaNota);

      FRelacaoVolumeDaNota.ShowModal;
       FreeAndNil(FRelacaoVolumeDaNota);


  //  sqltxt:=sqltxt + ' AND I.CD_EMPRESA = ' + sqlConsultaNFe.FieldByName('cd_empresa').AsString;
  //  sqltxt:=sqltxt +  format('AND P.NRON_R = %s ',[sqlConsultaNFe.FieldByName('NotaControle').AsString]);
  //  sqltxt:=sqltxt + ' AND P.DATO_R = '+ QuotedStr(sqlConsultaNFe.FieldByName('Emissao').AsString);


    {if not DM.sqlItemNFe_PedidoCompra.IsEmpty then
    begin
      gbxRelacaoItemNFe.Top:=150;
      gbxRelacaoItemNFe.Left:=15;
      gbxRelacaoItemNFe.Height:=400;
      gbxRelacaoItemNFe.Width:=560;
      gbxRelacaoItemNFe.Visible:=true;

      dbgItemNFe.Columns.Items[0].Width:=60;
      dbgItemNFe.Columns.Items[1].Width:=200;
      dbgItemNFe.Columns.Items[2].Width:=60;
      dbgItemNFe.Columns.Items[3].Width:=100;
      dbgItemNFe.Columns.Items[4].Width:=80;
      dbgItemNFe.SetFocus;
    end
    else
      Application.MessageBox('A informação do volume desta NFe não disponível para visualização.','Alerta do Sistema',0 + 64); }

    Application.ProcessMessages;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFItemOcorrencia.consultarRegistroDaNFe;
var
  strMsg: TStringList;
  cdOcorrenciaRegistrada: integer;
begin
  strMsg:=TStringList.Create;
  try
    cdOcorrenciaRegistrada:=DM.getOcorrenciaRegistradaDaNFe(ocorrencia.item.cdEmpresa,ocorrencia.item.nrNFe,ocorrencia.item.nrSerieNFe,ocorrencia.item.cdProduto);
    if cdOcorrenciaRegistrada > 0 then
    begin
      strMsg.Add('----------------------------------------------------------------');
      strMsg.Add('    O sistema identificou uma ocorrência vinculada a NFe atual  ');
      strMsg.Add('----------------------------------------------------------------');
      strMsg.Add(format('Nº Protocolo: %d',[cdOcorrenciaRegistrada]));
      strMsg.Add(format('Nº NFe: %d',[ocorrencia.item.nrNFe]));
      strMsg.Add(format('Serie: %d',[ocorrencia.item.nrSerieNFe]));
      if ocorrencia.item.cdProduto > 0 then
      begin
        strMsg.Add(format('Cod. do Produto: %d/%d',[ocorrencia.item.cdProduto,ocorrencia.item.digitoProduto]));
        strMsg.Add(format('Desc. do Produto: %s',[ocorrencia.item.dsProduto]));
      end;

      Application.MessageBox(pchar(strMsg.Text),'Alerta do Sistema',0 + 64);
    end;
  finally
    strMsg.Free;
  end;
end;

procedure TFItemOcorrencia.execListaItem;
begin
  if rbtNFe.Checked then
    execListaItemNFe(True);

  if rbtPedido.Checked then
    execListaItemPedidoCompra;
end;

procedure TFItemOcorrencia.dbgConsultaGenericaDblClick(Sender: TObject);
begin
  execListaItem;
end;

procedure TFItemOcorrencia.mostrarDadosNFe;
begin
  if edtConsulta.Text = EmptyStr then
    edtConsulta.Text:=inttostr(ocorrencia.item.nrNFe);

  lblEdtNFe.Text:=inttostr(ocorrencia.item.nrNFe);
  lblEdtDataEmissaoNFe.Text:= FormatDateTime('DD/MM/YYYY',ocorrencia.item.dataEmissao);

  { alerta para controle de avarias de notas emitidas em ate 48 horas - Desabilitado conforme SS.: 35116}
  {
  if ((not ocorrencia.item.isEmissaoDentroPrazo48Horas) and (cliente.canalVenda = Farma)) then
    lblEdtDataEmissaoNFe.Font.Color:= clRed
  else
    lblEdtDataEmissaoNFe.Font.Color:= clBlack;
  }

  lblEdtOrigemPedido.Text:= ocorrencia.item.dsOrigemPedido;
  lblEdtTransportador.Text:= ocorrencia.item.nomeTransportador;
  lblEdtDadosTransbordo.Text:= ocorrencia.item.dsTransbordoCarga;

  Application.ProcessMessages;
end;

procedure TFItemOcorrencia.gravarDadosNFe(isExecListaItemNFe: Boolean);
begin
  try
    ocorrencia.item.cdEmpresa:= DM.sqlConsultaNFe.FieldByName('CD_EMPRESA').AsInteger;
    ocorrencia.item.nrNFe:= DM.sqlConsultaNFe.FieldByName('NFe').AsInteger;
    ocorrencia.item.nrSerieNFe:= DM.sqlConsultaNFe.FieldByName('Serie').AsInteger;
    ocorrencia.item.dataEmissao:= DM.sqlConsultaNFe.FieldByName('Emissao').AsDateTime;
    ocorrencia.item.cdCaminhao:= DM.sqlConsultaNFe.FieldByName('Caminhao').AsInteger;
    ocorrencia.item.cdCaminhaoSecundario:= DM.sqlConsultaNFe.FieldByName('cdCaminhaoSecundario').AsInteger;
    ocorrencia.item.cdOrigemPedido:= DM.sqlConsultaNFe.FieldByName('cdOrigemPedido').AsInteger;
    ocorrencia.item.dsOrigemPedido:= DM.sqlConsultaNFe.FieldByName('Origem').AsString;
    ocorrencia.item.cdSetor:= DM.sqlConsultaNFe.FieldByName('Setor').AsInteger;
    ocorrencia.item.nrNFeControle:= DM.sqlConsultaNFe.FieldByName('NotaControle').AsInteger;
    { Controle de avarias de notas emitidas em ate 48 horas - Desabilitado conforme SS.: 35116 }
    //ocorrencia.item.isEmissaoDentroPrazo48Horas:= getIntervaloEntreData(dadosEmpresa.dataSistema, ocorrencia.item.dataEmissao) <= 3;
    ocorrencia.item.isEmissaoDentroPrazo48Horas:= False;
    ocorrencia.item.cdClienteEntrega:= DM.sqlConsultaNFe.FieldByName('cd_cliente_entrega').AsInteger;

    { busca dados do transportador }
    DM.consultarDadosTransportador;

    { busca dados adicionais da NFe - Transbordo de carga }
    DM.consultarDadosAdicionaisNFe;

    { visualizar dados }
    mostrarDadosNFe;

    { Consultar a existencia de registros com a NFe atual }
    if ocorrencia.item.nrNFe > 0 then
      consultarRegistroDaNFe;

    { consulta os itens da NFe somente para validar os itens - Não mostra o Grid na tela }
    if isExecListaItemNFe then
      execListaItemNFe(False);
  except
     on E:Exception do
       raise Exception.CreateFmt('Erro ao carregar dados da NFe.Detalhes: %s',[E.Message]);
  end;
end;

procedure TFItemOcorrencia.dbgConsultaGenericaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_F1 : begin
              if rbtNFe.Checked then
              begin
                gravarDadosNFe(True);
              end;
            end;

    VK_RETURN : execListaItem;

    VK_ESCAPE : begin
                  gbxConsultaGenerica.Visible:=False;
                  if ocorrencia.item.nrNFe > 0 then
                  begin
                    if ocorrencia.item.quantProduto > 0 then
                    begin
                      lblEdtQuantProduto.SetFocus;
                      lblEdtQuantProduto.SelectAll;
                    end
                    else
                    begin
                      DM.inicializarDataSetLocal(False,True,False);
                      dbLcbTipoOcorrencia.SetFocus;
                    end;
                  end;
                end;
    VK_F2 : begin
              if rbtNFe.Checked then
              begin
                { desabilita evento - dbgItemNFeDrawColumnCell }
                controleGridItem:=Inativo;

                { Evita o dulpo click na consulta de Lote}
                ConsultaLoteF2:=true;


                { Consulta tipo de volume dos item volume }
                execListaTipoVolumeItemNFe;
              end;
            end;

  end;
end;

procedure TFItemOcorrencia.dbgConsultaGenericaMouseEnter(Sender: TObject);
begin
  dbgConsultaGenerica.Hint:=HINT_NFE;
end;

procedure TFItemOcorrencia.dbgConsultaGenericaTitleClick(Column: TColumn);
begin
  DM.ordenarGridS(DM.sqlConsultaNFe,Column.FieldName);
end;

procedure TFItemOcorrencia.verificarAvisoDeRecallDeLoteNaLista(isInformarAlertaNaTela:Boolean);
var
  infRecallLote: TRecallLote;
  contLoteComRecall: integer;
begin
  contLoteComRecall:=0;
  StatusBarItemConsulta.SimpleText:='';

  DM.sqlItemNFe_PedidoCompra.First;
  while not DM.sqlItemNFe_PedidoCompra.Eof do
  begin
    { consulta registro de recall ( produto e lote ) na tabela PRDDM.DC_RECALL_MERCADORIA }
    infRecallLote:=DM.getInfRegistroDeRecallDoLote(DM.sqlItemNFe_PedidoCompra.FieldByName('CODIGO').AsInteger,DM.sqlItemNFe_PedidoCompra.FieldByName('LOTE').AsString);
    if infRecallLote.cdRecall > 0 then
    begin
      DM.marcarMercadoriaComAvisoDeRecall;
      inc(contLoteComRecall);
    end;
    DM.sqlItemNFe_PedidoCompra.Next;
  end;
  DM.sqlItemNFe_PedidoCompra.First;

  if contLoteComRecall > 0 then
  begin
    if isInformarAlertaNaTela then
    begin
      StatusBarItemConsulta.SimpleText:=' Atenção - Mercadoria com aviso de Recall localizada!';
      Application.ProcessMessages;
    end
    else
      ShowMessage(' Atenção - Mercadoria com aviso de Recall localizada!');
  end;
end;

procedure TFItemOcorrencia.verificarAvisoDeRecallDeLote;
var
  infRecallLote: TRecallLote;
  strMsgRecall: TStringList;
begin
  strMsgRecall:=TStringList.Create;
  try
    { consulta registro de recall ( produto e lote ) na tabela PRDDM.DC_RECALL_MERCADORIA }
    infRecallLote:=DM.getInfRegistroDeRecallDoLote(ocorrencia.item.cdProduto,ocorrencia.item.dsLote);

    if infRecallLote.cdRecall > 0 then
    begin
      strMsgRecall.Add(format('Lote : [ %s ]',[ocorrencia.item.dsLote]));
      strMsgRecall.Add(format('Codigo do Recall : %d',[infRecallLote.cdRecall]));
      strMsgRecall.Add(format('Data do Aviso de Recolhimento : %s',[FormatDateTime('dd/mm/yyyy',infRecallLote.dtAvisoRecall)]));
      strMsgRecall.Add(format('Data de Retorno ao Fabricante : %s',[FormatDateTime('dd/mm/yyyy',infRecallLote.dtRetornoFabricRecall)]));
      strMsgRecall.Add(format('Motivo           : %s',[infRecallLote.dsMotivoRecall]));
      strMsgRecall.Add(format('Responsável      : %s',[infRecallLote.nmUsuarioRegistro]));
      strMsgRecall.Add(format('Data do Registro : %s',[FormatDateTime('dd/mm/yyyy hh:nn:ss',infRecallLote.dtRegistro)]));

      Application.MessageBox(pchar(strMsgRecall.Text),'SAC - Aviso de Recall do Lote',0 + 16);
    end;
  finally
    strMsgRecall.Free;
  end;
end;

procedure TFItemOcorrencia.verificarDescontoFinanceiroNoItem;
var
  infRecallLote: TRecallLote;
  strMsg: TStringList;
begin
  strMsg:=TStringList.Create;
  try

    if DM.sqlItemNFe_PedidoCompra.FieldByName('DescFinanceiro').AsFloat > 0 then
    begin
      strMsg.Add(format('Codigo : [ %d/%d ]',[ocorrencia.item.cdProduto,ocorrencia.item.digitoProduto]));
      strMsg.Add(format('Produto : %s',[ocorrencia.item.dsProduto]));
      strMsg.Add(format('Desc Financeiro : %s',[formatfloat('###,##0.00',DM.sqlItemNFe_PedidoCompra.FieldByName('DescFinanceiro').AsFloat)]));
      strMsg.Add('');
      strMsg.Add(' ######   Informar o cliente sobre esse desconto. #######');
      strMsg.Add('O produto na NFe de devolução deverá ser faturado considerando esse desconto.');
      strMsg.Add('');
      strMsg.Add('');


      Application.MessageBox(pchar(strMsg.Text),'SAC - Aviso de Desconto Financeiro',0 + 16);
    end;
  finally
    strMsg.Free;
  end;
end;

procedure TFItemOcorrencia.mostrarDadosProduto;
begin
  lblEdtCodigoProduto.Text:= inttostr(ocorrencia.item.cdProduto)+ '/'+inttostr(ocorrencia.item.digitoProduto);
  lblEdtNomeProduto.Text:= ocorrencia.item.dsProduto;
  lblEdtTipoProduto.Text:= ocorrencia.item.dsTipoProduto;
  lblEdtLoteProduto.Text:= ocorrencia.item.dsLote;
  lblEdtDataValidadeProduto.Text:= FormatDateTime('DD/MM/YYYY',ocorrencia.item.dataValidadeProduto);
  lblEdtPeriodoValidade.Text:= inttostr(ocorrencia.item.periodoValidade) + ' meses';
  lblEdtQuantProduto.Text:= IntToStr(ocorrencia.item.quantProduto);

  Application.ProcessMessages;
end;

procedure TFItemOcorrencia.rbtPedidoClick(Sender: TObject);
begin
  lblTipoFiltro.Caption:=TRadioButton(Sender).Caption;
  btnBuscar.SetFocus;
end;

procedure TFItemOcorrencia.menuReabrirOcorrenciaClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja reabrir o item da ocorrência?','Confirmação',4 + 32) = 6 then
  begin
    try
      DM.execReAbrirOcorrencia(False);
      atualizaPainelControleItem;
      Application.MessageBox('Item da ocorrência reaberto com sucesso!','',0 + 64);
    except
      on E:Exception do
        raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TFItemOcorrencia.menuReEnviarEmailClick(Sender: TObject);
var
  dsEmailDestino: string;
begin
  try
    if Application.MessageBox('Deseja informar o "Email do destinatário" manualmente ?','Envio de Email',4 + 32) = 6 then
    begin
      dsEmailDestino:=LowerCase(InputBox('Destinatário do Email','Endereço de Email:',''));
      if not isEmailValido(dsEmailDestino) then
        raise Exception.Create('O endereço de Email informado é inválido.');
    end;

    DM.enviarEmailOcorrencia(True,False,dsEmailDestino);
    Application.MessageBox('Email enviado com sucesso!','Confirmação de Envio',0 + 64);
  except
    on E:Exception do
      raise Exception.CreateFmt('Erro ao envia mensagem.Detalhes: %s',[E.Message]);
  end;
end;

procedure TFItemOcorrencia.incluirProdutoNaOcorrencia;
begin
  if rbtNFe.Checked then
  begin
    Screen.Cursor:=crHourGlass;
    try
      if ocorrencia.item.nrNFe = 0 then
        gravarDadosNFe(False)
      else
      begin
        if ocorrencia.item.nrNFe <> DM.sqlConsultaNFe.FieldByName('NFe').AsInteger then
          raise Exception.Create('NFe atual difere da NFe escolhida anteriormente!');
      end;

      carregarDadosProduto;
      mostrarDadosProduto;
      verificarAvisoDeRecallDeLote;
      if not ConsultaLoteF2 then
        if DM.sqlItemNFe_PedidoCompra.RecordCount > 1 then
            verificarDescontoFinanceiroNoItem;

      { Consultar a existencia de registros com a NFe e o item atual }
      if ocorrencia.item.nrNFe > 0 then
        consultarRegistroDaNFe;
    finally
      Screen.Cursor:=crDefault;
    end;
  end;
end;

procedure TFItemOcorrencia.dbgItemNFeDblClick(Sender: TObject);
begin
  //idDuploClickF2:=true;
  incluirProdutoNaOcorrencia;
  //idDuploClickF2:=false;

end;

procedure TFItemOcorrencia.carregarDadosProduto;
  function limparLote(dsLote:string):string;
  begin
    Result:=StringReplace(dsLote,DS_ALERTA_RECALL_LOTE,'',[rfReplaceAll]);
  end;
begin

  ocorrencia.item.quantProduto  :=DM.sqlItemNFe_PedidoCompra.FieldByName('QUANT').AsInteger;
  ocorrencia.item.cdProduto     :=DM.sqlItemNFe_PedidoCompra.FieldByName('CODIGO').AsInteger;

 if not ConsultaLoteF2 then
 begin
  ocorrencia.item.digitoProduto :=DM.sqlItemNFe_PedidoCompra.FieldByName('DIG').AsInteger;
  ocorrencia.item.dsProduto     :=DM.sqlItemNFe_PedidoCompra.FieldByName('NOME').AsString + ' ' +
                                  DM.sqlItemNFe_PedidoCompra.FieldByName('APRESENTACAO').AsString;
  ocorrencia.item.cdTipoProduto       :=DM.sqlItemNFe_PedidoCompra.FieldByName('ECNM_M').AsInteger;
  ocorrencia.item.dsLote              :=limparLote(DM.sqlItemNFe_PedidoCompra.FieldByName('LOTE').AsString);
  ocorrencia.item.dataValidadeProduto :=DM.sqlItemNFe_PedidoCompra.FieldByName('VALIDADE').AsDateTime;
  ocorrencia.item.cdOperadorLogistico :=DM.sqlItemNFe_PedidoCompra.FieldByName('cd_operador_logistico').AsInteger;
  ocorrencia.item.dsDigitadorPedido   :=DM.sqlConsultaNFe.FieldByName('Digitador').AsString;
  ocorrencia.item.isEnviarMensagemProdutoTermolabil :=stringToBoolean(DM.sqlItemNFe_PedidoCompra.FieldByName('REF').AsString);

  ocorrencia.item.Cfop:= DM.sqlItemNFe_PedidoCompra.FieldByName('cfop_i').AsInteger;
  ocorrencia.item.Cst:= DM.sqlItemNFe_PedidoCompra.FieldByName('cstm_i1').AsString;
  ocorrencia.item.VlrUnitarioMercadoria:= DM.sqlItemNFe_PedidoCompra.FieldByName('vl_unitario').AsFloat;
  ocorrencia.item.VlrUnitarioBcIcms:= DM.sqlItemNFe_PedidoCompra.FieldByName('bc_icms').AsFloat / ocorrencia.item.quantProduto ;
  ocorrencia.item.VlrUnitarioIcms:= DM.sqlItemNFe_PedidoCompra.FieldByName('vl_icms').AsFloat / ocorrencia.item.quantProduto;
  ocorrencia.item.VlrUnitarioBcST:= DM.sqlItemNFe_PedidoCompra.FieldByName('bc_st').AsFloat;
  ocorrencia.item.VlrUnitarioST:= DM.sqlItemNFe_PedidoCompra.FieldByName('vl_st').AsFloat;
  end;

end;

procedure TFItemOcorrencia.dbgItemNFeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if rbtNFe.Checked then
  begin

    if ((DM.sqlItemNFe_PedidoCompra.RecordCount > 0) and (controleGridItem = Ativo)) then
    begin

      { produto Selecionado para  }
      if DM.sqlItemNFe_PedidoCompra.FieldByName('ID_SELECIONADO').AsString = 'S' then
      begin
        dbgItemNFe.Canvas.Font.Color:=clwHITE;
        dbgItemNFe.Canvas.Brush.Color:=clGreen;
      end;
      { produto Selecionado para  }
      if DM.sqlItemNFe_PedidoCompra.FieldByName('ID_SELECIONADO').AsString = 'L' then
      begin
        dbgItemNFe.Canvas.Font.Color:=clWhite;
        dbgItemNFe.Canvas.Brush.Color:=clRed;
      end;


      if DM.sqlItemNFe_PedidoCompra.FieldByName('ECNM_M').AsInteger = TIPO_PRODUTO_MEDICAMENTO then
      begin
        if DM.sqlItemNFe_PedidoCompra.FieldByName('QTLOTE').AsString <> DM.sqlItemNFe_PedidoCompra.FieldByName('QUANT').AsString then
        begin
          dbgItemNFe.Canvas.Font.Color:=clRed;
          dbgItemNFe.Canvas.Font.Style:=[fsBold];
        end;

        { produto refrigerado }
        if DM.sqlItemNFe_PedidoCompra.FieldByName('REF').AsString = 'S' then
        begin
          dbgItemNFe.Canvas.Font.Color:=clBlue;
          dbgItemNFe.Canvas.Font.Style:=[fsBold];
        end;


        { Produtos Oncologicos - SS.: 13045 - somente senão for refrigerado }
        if ((Trim(DM.sqlItemNFe_PedidoCompra.FieldByName('ESPECIALIDADE').AsString) = DS_ESPECIALIDADE_ANTINEOPLASICO) and (DM.sqlItemNFe_PedidoCompra.FieldByName('REF').AsString = 'N')) then
        begin
          dbgItemNFe.Canvas.Font.Color:=clGreen;
          dbgItemNFe.Canvas.Font.Style:=[fsBold];
        end;

        { produto com aviso de recall no lote }
        if DM.sqlItemNFe_PedidoCompra.FieldByName('ID_RECALL').AsString = 'S' then
        begin
          dbgItemNFe.Canvas.Font.Color:=clWebOrange;
          dbgItemNFe.Canvas.Font.Style:=[fsBold];
        end;

      end;

      dbgItemNFe.DefaultDrawDataCell(rect,dbgItemNFe.Columns[datacol].Field,State);
    end;
  end;
end;

procedure TFItemOcorrencia.dbgItemNFeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of

    83 :begin
          if dm.sqlItemNFe_PedidoCompra.FieldByName('ID_SELECIONADO').AsString='L' then
          begin
             Application.MessageBox('Item Já Lançado!','',0 + 64);
             exit;
          end;
          if  dm.sqlItemNFe_PedidoCompra.FieldByName('ID_SELECIONADO').AsString='N' then
               SetIdSelecionado('S')
           else
               SetIdSelecionado('N');

        end;

    VK_ESCAPE : begin
                  controleGridItem:=Ativo;

                  // Para evitar duplo click na consulta de lote F2
                  ConsultaLoteF2:=false;

                  gbxRelacaoItemNFe.Visible:=false;
                  if gbxConsultaGenerica.Visible then
                    dbgConsultaGenerica.SetFocus
                  else
                  begin
                    if ocorrencia.item.quantProduto > 0 then
                    begin
                      lblEdtQuantProduto.SelectAll;
                      lblEdtQuantProduto.SetFocus;
                    end;
                  end;

                end;

    VK_F1,VK_RETURN : begin
                        Screen.Cursor:=crHourGlass;
                        try
                          if controleGridItem = Ativo then
                            incluirProdutoNaOcorrencia;

                        finally
                          Screen.Cursor:=crDefault;
                        end;
    end;
  end;

  { consulta por C_odigo do produto - Alt + "C" }
  if ((Shift = [ssAlt]) and (key = 67)) then
  begin
    key:=0;
    DM.localizaProdutoLista('CODIGO',InputBox('Localizar produto','Informe o codigo:',''));
    dbgItemNFe.SetFocus;
  end;

  { consulta pelo N_ome do produto - Alt + "N" }
  if ((Shift = [ssAlt]) and (key = 78)) then
  begin
    key:=0;
    DM.localizaProdutoLista('NOME',InputBox('Localizar produto','Informe o nome:',''));
    dbgItemNFe.SetFocus;
  end;
end;

procedure TFItemOcorrencia.dbgItemNFeMouseEnter(Sender: TObject);
begin
  dbgItemNFe.Hint:=HINT_ITEM_NFE;
end;

procedure TFItemOcorrencia.dbgItemNFeTitleClick(Column: TColumn);
begin
  DM.ordenarGridS(DM.sqlItemNFe_PedidoCompra,Column.FieldName);
end;

procedure TFItemOcorrencia.gravarSituacaoEmbalagemVolume;
begin
  if dbLcbSituacaoEmbalagem.KeyValue > 0 then
  begin
    ocorrencia.item.cdSituacaoEmbalagem:=dbLcbSituacaoEmbalagem.KeyValue;
    ocorrencia.item.dsSituacaoEmbalagem:=DM.cdsSituacaoEmbalagemDS_SITUACAO_EMBALAGEM.AsString;
  end;
  perform(wm_nextdlgctl,0,0);
end;

procedure TFItemOcorrencia.mostrarDadosSolucionador;
begin
  lblEdtNomeCoordenadorSolucionador.Text:=ocorrencia.item.nomeGerenteSolucionador;
  lblEdtDataLimiteSolucao.Text:=FormatDateTime('DD/MM/YYYY',ocorrencia.item.dataLimite);
  Application.ProcessMessages;
end;

procedure TFItemOcorrencia.dbLcbSituacaoEmbalagemClick(Sender: TObject);
begin
  if MODO_TELA = normal then
    gravarSituacaoEmbalagemVolume;
end;

procedure TFItemOcorrencia.dbLcbSituacaoEmbalagemEnter(Sender: TObject);
begin
  if MODO_TELA = normal then
    dbLcbSituacaoEmbalagem.DropDown;
end;

procedure TFItemOcorrencia.dbLcbSituacaoEmbalagemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_RETURN : begin
                  if MODO_TELA = normal then
                    gravarSituacaoEmbalagemVolume;
    end;
    VK_LEFT :  perform(wm_nextdlgctl,1,0);
    VK_RIGHT :  perform(wm_nextdlgctl,0,1);
  end;
end;

procedure TFItemOcorrencia.gravarSolucionador;
begin
  if dbLcbSolucionador.KeyValue > 0 then
  begin
    ocorrencia.item.cdSolucionador:=dbLcbSolucionador.KeyValue;
    ocorrencia.item.nomeSolucionador:=DM.cdsSolucionadorNM_SOLUCIONADOR.AsString;
    ocorrencia.item.contatoEmail.dsEmailSolucionador:=trim(DM.cdsSolucionadorDS_EMAIL_SOLUCIONADOR.AsString);

    if DM.cdsSolucionadorCD_GERENTE_AREA.AsInteger <> ocorrencia.item.cdSolucionador then
    begin
      ocorrencia.item.cdGerenteSolucionador         := DM.cdsSolucionadorCD_GERENTE_AREA.AsInteger;
      ocorrencia.item.nomeGerenteSolucionador       := DM.cdsSolucionadorNM_GERENTE_AREA.AsString;
      ocorrencia.item.contatoEmail.dsEmailSupervisor:=  trim(DM.cdsSolucionadorDS_EMAIL_GERENTE_AREA.AsString);
    end
    else
    begin
      ocorrencia.item.cdGerenteSolucionador         := DM.cdsSolucionadorCD_GERENTE_DEPTO.AsInteger;
      ocorrencia.item.nomeGerenteSolucionador       := DM.cdsSolucionadorNM_GERENTE_DEPTO.AsString;
      ocorrencia.item.contatoEmail.dsEmailSupervisor:= trim(DM.cdsSolucionadorDS_EMAIL_GERENTE_DEPTO.AsString);
    end;
    ocorrencia.item.quantDiasPrazoSolucao:=DM.cdsSolucionadorQTD_DIAS_SOLUCAO.AsInteger;
    ocorrencia.item.cdAreaOrigem:=DM.cdsSolucionadorCD_AREA_ORIGEM.AsInteger;

    { calcular data limite da solução }
    ocorrencia.item.calcularDataLimiteSolucao;
    ocorrencia.validarDataLimite;

    { mostrar dados do solucionador }
    mostrarDadosSolucionador;

    tBtnSalvarItem.Enabled:=True;
    lblEdtEmailExtra.SetFocus;
  end
  else
  begin
    ShowMessage('Informe um solucionador para este item de ocorrência.');
    dbLcbSolucionador.SetFocus;
  end;
end;

procedure TFItemOcorrencia.dbLcbSolucionadorClick(Sender: TObject);
begin
  if MODO_TELA in [normal,visualizacao] then
    gravarSolucionador;
end;

procedure TFItemOcorrencia.dbLcbSolucionadorEnter(Sender: TObject);
begin
  if MODO_TELA = normal then
    dbLcbSolucionador.DropDown;
end;

procedure TFItemOcorrencia.dbLcbSolucionadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_RETURN : begin
                  if MODO_TELA = normal then
                    gravarSolucionador;
    end;
    VK_LEFT :  perform(wm_nextdlgctl,1,0);
    VK_RIGHT :  perform(wm_nextdlgctl,0,1);
  end;
end;

procedure TFItemOcorrencia.gravarSubTipoOcorrencia;
begin
  if dbLcbSubTipoOcorrencia.KeyValue > 0 then
  begin
    ocorrencia.item.cdSubTipoOcorrencia:=dbLcbSubTipoOcorrencia.KeyValue;
    ocorrencia.item.dsSubTipoOcorrencia:=DM.cdsSubTipoOcorrenciaNM_SUBTIPO_OCORRENCIA.AsString;
  end;
  perform(wm_nextdlgctl,0,0);
end;

procedure TFItemOcorrencia.dbLcbSubTipoOcorrenciaClick(Sender: TObject);
begin
  if MODO_TELA = normal then
    gravarSubTipoOcorrencia;
end;

procedure TFItemOcorrencia.dbLcbSubTipoOcorrenciaEnter(Sender: TObject);
begin
  if MODO_TELA = normal then
    dbLcbSubTipoOcorrencia.DropDown;
end;

procedure TFItemOcorrencia.dbLcbSubTipoOcorrenciaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_RETURN : begin
                  if MODO_TELA = normal then
                    gravarSubTipoOcorrencia;
    end;
    VK_LEFT :  perform(wm_nextdlgctl,1,0);
    VK_RIGHT :  perform(wm_nextdlgctl,0,1);
  end;
end;

procedure TFItemOcorrencia.dbLcbSubTipoOcorrenciaMouseEnter(Sender: TObject);
begin
  if dbLcbSubTipoOcorrencia.KeyValue > 0 then
    dbLcbSubTipoOcorrencia.Hint:='DESCRIÇÃO|'+DM.cdsSubTipoOcorrenciaNM_SUBTIPO_OCORRENCIA.AsString+'|0';;
end;

procedure TFItemOcorrencia.gravarTipoOcorrencia;
const
  CD_DEPARTAMENTO_HOSPITALAR = 9;
var
  isSolucionadorRepresentante: Boolean;
  isListarTodosSolucionadores: Boolean;
  dsMatriculaRep: string;
begin
  if dbLcbTipoOcorrencia.KeyValue > 0 then
  begin
    isSolucionadorRepresentante:=False;
    isListarTodosSolucionadores:=False;
    dsMatriculaRep:='';

    ocorrencia.item.cdTipoOcorrencia:=dbLcbTipoOcorrencia.KeyValue;
    ocorrencia.item.dsTipoOcorrencia:=DM.cdsTipoOcorrenciaNM_TIPO_OCORRENCIA.AsString;

    { valida opção de preenchimento do subtipo de ocorrencia }
    dbLcbSubTipoOcorrencia.Enabled:=stringToBoolean(DM.cdsTipoOcorrenciaID_SUBTIPO_OCORRENCIA.AsString);
    if dbLcbSubTipoOcorrencia.Enabled then
      DM.execFiltroSubTipoOcorrencia(ocorrencia.item.cdTipoOcorrencia);

    { valida opção de preenchimento da situacao da embalagem }
    dbLcbSituacaoEmbalagem.Enabled:=stringToBoolean(DM.cdsTipoOcorrenciaID_EMBALAGEM.AsString);

    { verifica se a necessidade de solucao e causa da ocorrencia }
    if DM.cdsTipoOcorrenciaID_SOLUCAO.AsString = 'N' then
    begin
      ocorrencia.item.cdStatusSolucao:=CD_SOLUCAO_FINALIZADA_ITEM;
      ocorrencia.item.dsStatusSolucao:=DS_SOLUCAO_FINALIZADA_ITEM;

      if DM.cdsTipoOcorrenciaID_CAUSA.AsString = 'N' then
      begin
        ocorrencia.item.cdStatusCausa:=CD_CAUSA_SEM_NECESSIDADE_ITEM;
        ocorrencia.item.dsStatusCausa:=DS_CAUSA_FINALIZADA_ITEM;
      end;

      {
      if not ocorrencia.item.isSolucionadorGAM then
      begin
        isSolucionadorRepresentante:=True;
        dsMatriculaRep:=format('%d%d',[cliente.distrito,cliente.setor]);
      end;
      }
    end
    else
    begin
      { tipo de ocorrencia = produto avariado(2) ja entra finalizado para o canal farma
        conforme solicitação do sr. Esio - 14/04/2014 }

      { tipo de ocorrencia = Psquisa(17) ja entra finalizado
        conforme solicitação SS.:15159 - 02/09/2016 }

      if ((cliente.canalVenda = Farma) and (ocorrencia.item.cdTipoOcorrencia = CD_TIPO_OCORRENCIA_PRODUTO_AVARIADO) or (ocorrencia.item.cdTipoOcorrencia = CD_TIPO_OCORRENCIA_PESQUISA) ) then
      begin
        ocorrencia.item.cdStatusSolucao:=CD_SOLUCAO_FINALIZADA_ITEM;
        ocorrencia.item.dsStatusSolucao:=DS_SOLUCAO_FINALIZADA_ITEM;

        ocorrencia.item.cdStatusCausa:=CD_CAUSA_SEM_NECESSIDADE_ITEM;
        ocorrencia.item.dsStatusCausa:=DS_CAUSA_FINALIZADA_ITEM;
      end
      else
      begin
        ocorrencia.item.cdStatusSolucao:=CD_SOLUCAO_PENDENTE_ITEM;
        ocorrencia.item.dsStatusSolucao:=DS_SOLUCAO_PENDENTE_ITEM;

        ocorrencia.item.cdStatusCausa:=CD_CAUSA_PENDENTE_ITEM;
        ocorrencia.item.dsStatusCausa:=DS_CAUSA_PENDENTE_ITEM;
      end;
    end;

    { atualiza dados do status do item }
    lblEdtStatusSolucao.Text:=ocorrencia.item.dsStatusSolucao;
    lblEdtStatusCausaProblema.Text:=ocorrencia.item.dsStatusCausa;

    { destaque da situação da causa/solução do item }
    atualizaPainelControleItem;

    if DM.cdsTipoOcorrenciaID_RECOLHER_MERCADORIA.AsString = 'S' then
    begin
      ocorrencia.item.isNecessitaOrdemDeColeta:=True;

      { produto avariado e produto com defeito }
      if ocorrencia.item.cdTipoOcorrencia in [CD_TIPO_OCORRENCIA_PRODUTO_AVARIADO,
                                              CD_TIPO_OCORRENCIA_PRODUTO_AVARIADO_48_HORAS,
                                              CD_TIPO_OCORRENCIA_PRODUTO_COM_DEFEITO] then
      begin
        cbxAutorizarRecMercadoria.Checked:=True;
        isListarTodosSolucionadores:=True;
      end
      else
        cbxAutorizarRecMercadoria.Checked:=False;
    end
    else
      ocorrencia.item.isNecessitaOrdemDeColeta:=False;

    { filtro do solucionador }
    if ocorrencia.item.isSolucionadorGAM then
    begin
      if Application.MessageBox('Existe um "solucionador padrão" para este cliente ou setor.'+#13+'Deseja alterar este solucionador ?','Aviso do Sistema',4 + 32 + 0) = 6 then
      begin
        ocorrencia.item.isSolucionadorGAM:=False;
        ocorrencia.item.cdSolucionador:=0;
      end;
    end;

    if ocorrencia.item.cdSolucionador > 0 then
      DM.execFiltroSolucionador(0,DM.cdsTipoOcorrenciaCD_DEPTO_PADRAO.AsInteger,inttostr(ocorrencia.item.cdSolucionador),True,False,True,False)
    else
    begin
      if DM.cdsTipoOcorrenciaCD_DEPTO_PADRAO.AsInteger > 0 then
      begin
        if DM.cdsTipoOcorrenciaCD_DEPTO_PADRAO.AsInteger in [7,17] then { distrito farma e alimentar }
        begin
          isSolucionadorRepresentante:=True;
          dsMatriculaRep:=format('%d%d',[cliente.distrito,cliente.setor]);
        end;

        { canal hospitalar - a ocorrencia de "erro de cliente" não vai para o representante }
        if ((cliente.canalVenda = Hospitalar) and (ocorrencia.item.cdTipoOcorrencia = 3)) then
          DM.execFiltroSolucionador(0,CD_DEPARTAMENTO_HOSPITALAR,'',False,False,True,False)
        else
          DM.execFiltroSolucionador(0,DM.cdsTipoOcorrenciaCD_DEPTO_PADRAO.AsInteger,dsMatriculaRep,isSolucionadorRepresentante,False,True,False);

      end
      else
        { consulta geral }
        DM.execFiltroSolucionador(0,0,'',False,False,True,isListarTodosSolucionadores);
    end;

    imgSolucionador.Enabled:=True;
    Application.ProcessMessages;

    perform(wm_nextdlgctl,0,0);
  end
  else
  begin
    ShowMessage('Informe o Tipo de Ocorrência para este item.');
    dbLcbTipoOcorrencia.SetFocus;
  end;
end;

procedure TFItemOcorrencia.dbLcbTipoOcorrenciaClick(Sender: TObject);
begin
  if MODO_TELA = normal then
    gravarTipoOcorrencia;
end;

procedure TFItemOcorrencia.dbLcbTipoOcorrenciaEnter(Sender: TObject);
var
  isControlarTipoOcorrencia: Boolean;
begin
  if MODO_TELA = normal then
  begin
    { limpa os dados de tipo, subtipo, etc }
    ocorrencia.item.limparTipoOcorrencia(ocorrencia.item.isSolucionadorGAM);
    isControlarTipoOcorrencia:= True;

    { Controle de avarias de notas emitidas em ate 48 horas - Desabilitado conforme SS.: 35116 }
    {
    if cliente.canalVenda = Hospitalar then
    begin
      if ocorrencia.item.isEmissaoDentroPrazo48Horas then
        ocorrencia.item.isEmissaoDentroPrazo48Horas:=False;
    end;
    }

    DM.inicializarDataSetLocal(False, ocorrencia.item.isEmissaoDentroPrazo48Horas, isControlarTipoOcorrencia);

    lblEdtNomeCoordenadorSolucionador.Clear;
    lblEdtDataLimiteSolucao.Clear;
    cbxAutorizarRecMercadoria.Checked:=False;

    dbLcbTipoOcorrencia.DropDown;
  end;
end;

procedure TFItemOcorrencia.dbLcbTipoOcorrenciaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_RETURN : begin
                  if MODO_TELA = normal then
                    gravarTipoOcorrencia;
    end;
    VK_LEFT :  perform(wm_nextdlgctl,1,0);
    VK_RIGHT :  perform(wm_nextdlgctl,0,1);
  end;
end;

procedure TFItemOcorrencia.dbLcbTipoOcorrenciaMouseEnter(Sender: TObject);
begin
  if dbLcbTipoOcorrencia.KeyValue > 0 then
    dbLcbTipoOcorrencia.Hint:='DESCRIÇÃO|'+DM.cdsTipoOcorrenciaNM_TIPO_OCORRENCIA.AsString+'|7';;
end;

procedure TFItemOcorrencia.imgSolucionadorClick(Sender: TObject);
begin
  if MODO_TELA = visualizacao then
  begin
    dbLcbSolucionador.Enabled:=True;
    memObservacao.Enabled:=True;
    cbxAutorizarRecMercadoria.Enabled:=True;
    lblEdtEmailExtra.Enabled:=True;
  end;

  if MODO_TELA = normal then
  begin
    DM.execFiltroSolucionador(0,DM.cdsTipoOcorrenciaCD_DEPTO_PADRAO.AsInteger,format('%d%d',[cliente.distrito,cliente.setor]),True,False,True,False);
    dbLcbSolucionador.DropDown;
  end;
end;

procedure TFItemOcorrencia.imgSolucionadorMouseEnter(Sender: TObject);
begin
  if imgSolucionador.Enabled then
  begin
    if MODO_TELA = normal then
      imgSolucionador.Hint:=HINT_DEFINIR_SOLUCIONADOR;

    if MODO_TELA = visualizacao then
      imgSolucionador.Hint:=HINT_ALTERAR_SOLUCIONADOR;
  end;
end;

procedure TFItemOcorrencia.incluirEnderecoDeEmail;
begin
  if dblkEmailExtra.KeyValue <> EmptyStr then
  begin
    buscaEmail.isConcluida:=True;
    dblkEmailExtra.Visible:=False;
    if ocorrencia.item.contatoEmail.dsEmailCopiaExtra <> EmptyStr then
      lblEdtEmailExtra.Text:=ocorrencia.item.contatoEmail.dsEmailCopiaExtra + ';'+ dblkEmailExtra.KeyValue
    else
      lblEdtEmailExtra.Text:=dblkEmailExtra.KeyValue;
    lblEdtEmailExtra.SetFocus;
  end;
end;

procedure TFItemOcorrencia.dblkEmailExtraDblClick(Sender: TObject);
begin
  incluirEnderecoDeEmail;
end;

procedure TFItemOcorrencia.dblkEmailExtraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_RETURN : incluirEnderecoDeEmail;

    VK_ESCAPE : begin
      dblkEmailExtra.Visible:=False;
      lblEdtEmailExtra.SetFocus;
      ocorrencia.item.contatoEmail.dsEmailCopiaExtra:='';
      buscaEmail.limparDados;
    end;
  end;
end;

{ TBuscaNome }

procedure TBuscaNome.limparDados;
begin
  contCaracter:=0;
  dsBusca:='';
  dsResultado:='';
  isConcluida:=false;
  isIncluirNovo:=False;
  posicaoInicial:=1;
end;


procedure TFItemOcorrencia.filtraItensSeleciona;
begin
   with DM.sqlItemNFe_PedidoCompra do
   begin
     Filter:='ID_SELECIONADO=''S''';
     Filtered:=true;
   end;
end;



function TFItemOcorrencia.SetIdSelecionado(PidSelecao:String):boolean;
begin
  try
          result:=true;
//           dm.sqlItemNFe_PedidoCompra.open;
           dm.sqlItemNFe_PedidoCompra.edit;
           dm.sqlItemNFe_PedidoCompra.FieldByName('ID_SELECIONADO').AsString:=PidSelecao;
//           dm.sqlItemNFe_PedidoCompra.post;
  Except
      result:=false;
  end;

end;

procedure TFItemOcorrencia.ResetItensSelecioandos;
begin

    repeat
       filtraItensSeleciona;
       DM.sqlItemNFe_PedidoCompra.First;
      while not DM.sqlItemNFe_PedidoCompra.Eof do
      begin
        SetIdSelecionado('L');
        DM.sqlItemNFe_PedidoCompra.Next;
      end;
    until  DM.sqlItemNFe_PedidoCompra.IsEmpty;
    DM.sqlItemNFe_PedidoCompra.Filtered:=false;


end;


end.



