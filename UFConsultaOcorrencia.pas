unit UFConsultaOcorrencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, DBCtrls, UMsgPadrao, Buttons, Grids,
  DBGrids, UParametroSistema, ImgList, UDadosOcorrencia, UUtils, ToolWin, jpeg,
  ExtCtrls, pngimage, UDadosCliente;

type
  TFConsultaOcorrencia = class(TForm)
    StatusBar1: TStatusBar;
    gbxPrincipal: TGroupBox;
    gbxFiltroPesquisa: TGroupBox;
    gbxRelacaoOcorrencia: TGroupBox;
    Label1: TLabel;
    edtCodCliente: TEdit;
    Label4: TLabel;
    edtNroOcorrencia: TEdit;
    Label5: TLabel;
    dbcbxStatusSolucao: TDBLookupComboBox;
    mEdtDataRegistro: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtNroSetor: TEdit;
    cbxMesAtual: TCheckBox;
    BalloonHint: TBalloonHint;
    btnConsultar: TBitBtn;
    dbgRelacaoOcorrencia: TDBGrid;
    Label9: TLabel;
    dbcbxStatusCausa: TDBLookupComboBox;
    tBarAtendimento: TToolBar;
    tBtnCancelar: TToolButton;
    tBtnExcluiritem: TToolButton;
    tBtnFechar: TToolButton;
    ImageList: TImageList;
    Label2: TLabel;
    edtNroNFe: TEdit;
    Image1: TImage;
    procedure cbxMesAtualMouseEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure dbgRelacaoOcorrenciaTitleClick(Column: TColumn);
    procedure dbcbxStatusCausaCloseUp(Sender: TObject);
    procedure dbcbxStatusSolucaoCloseUp(Sender: TObject);
    procedure tBtnCancelarClick(Sender: TObject);
    procedure tBtnFecharClick(Sender: TObject);
    procedure dbgRelacaoOcorrenciaDblClick(Sender: TObject);
    procedure dbgRelacaoOcorrenciaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure dbgRelacaoOcorrenciaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgRelacaoOcorrenciaMouseEnter(Sender: TObject);
    procedure edtCodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mEdtDataRegistroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbcbxStatusSolucaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1MouseEnter(Sender: TObject);
  private
    procedure limparDados;
    procedure carregaDadosConsulta;
    procedure configurarGridOcorrencia;
    procedure visualizarOcorrencia;
    procedure carregarDadosOcorrencia;
    procedure prepararVisualizacaoOcorrencia;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultaOcorrencia: TFConsultaOcorrencia;
  consulta: TConsultaOcorrencia;

implementation

uses UDm, UFVisualizacaoOcorrencia;

{$R *.dfm}

procedure TFConsultaOcorrencia.limparDados;
begin
  consulta.limparDados;
  DM.inicializarDataSetLocal(False,True,False);
  DM.sqlConsultaOcorrencia.Close;

  edtCodCliente.Clear;
  edtNroOcorrencia.Clear;
  edtNroNFe.Clear;
  edtNroSetor.Clear;
  mEdtDataRegistro.Clear;
  cbxMesAtual.Checked:=False;
  edtCodCliente.SetFocus;

  btnConsultar.Enabled:=True;
  tBtnCancelar.Enabled:=False;
  Application.ProcessMessages;
end;

procedure TFConsultaOcorrencia.mEdtDataRegistroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_ESCAPE : TMaskEdit(Sender).Clear;
    VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TFConsultaOcorrencia.tBtnCancelarClick(Sender: TObject);
begin
  limparDados;
end;

procedure TFConsultaOcorrencia.tBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFConsultaOcorrencia.carregaDadosConsulta;
begin
  Screen.Cursor:=crSQLWait;
  try
    consulta.cdCliente:=   StrToIntDef(edtCodCliente.Text,0);
    consulta.cdOcorrencia:=StrToIntDef(edtNroOcorrencia.Text,0);
    consulta.nrNFe:=       StrToIntDef(edtNroNFe.Text,0);
    consulta.cdSetor:=     StrToIntDef(edtNroSetor.Text,0);

    { valida data digitada }
    if isDataValida(mEdtDataRegistro.Text) then
      consulta.dsDataRegistro:=mEdtDataRegistro.Text
    else
      consulta.dsDataRegistro:='';

    try
      DM.execConsultaOcorrencia(consulta,cbxMesAtual.Checked);
      if not DM.sqlConsultaOcorrencia.IsEmpty then
        configurarGridOcorrencia
      else
        Application.MessageBox('Nenhuma ocorrência localizada.','Consulta Ocorrência',0 + 64);
    except
      on E:Exception do
       raise Exception.Create(E.Message);
    end;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFConsultaOcorrencia.configurarGridOcorrencia;
begin
  dbgRelacaoOcorrencia.Columns.Items[0].Title.Caption:='Protocolo';
  dbgRelacaoOcorrencia.Columns.Items[0].Width:=60;
  dbgRelacaoOcorrencia.Columns.Items[1].Title.Caption:='Codigo';
  dbgRelacaoOcorrencia.Columns.Items[1].Width:=50;
  dbgRelacaoOcorrencia.Columns.Items[2].Title.Caption:='Setor';
  dbgRelacaoOcorrencia.Columns.Items[2].Width:=40;
  dbgRelacaoOcorrencia.Columns.Items[3].Title.Caption:='Razão Social';
  dbgRelacaoOcorrencia.Columns.Items[3].Width:=250;
  dbgRelacaoOcorrencia.Columns.Items[4].Title.Caption:='Cidade';
  dbgRelacaoOcorrencia.Columns.Items[4].Width:=200;
  dbgRelacaoOcorrencia.Columns.Items[5].Title.Caption:='Bairro';
  dbgRelacaoOcorrencia.Columns.Items[5].Width:=200;

  dbgRelacaoOcorrencia.Columns.Items[6].Title.Caption:='UF';
  dbgRelacaoOcorrencia.Columns.Items[6].Width:=30;
  dbgRelacaoOcorrencia.Columns.Items[7].Title.Caption:='Data de Registro';
  dbgRelacaoOcorrencia.Columns.Items[7].Width:=130;
  dbgRelacaoOcorrencia.Columns.Items[8].Title.Caption:='Data Limite';
  dbgRelacaoOcorrencia.Columns.Items[8].Width:=90;
  dbgRelacaoOcorrencia.Columns.Items[9].Title.Caption:='Status da Solução';
  dbgRelacaoOcorrencia.Columns.Items[9].Width:=180;
  dbgRelacaoOcorrencia.Columns.Items[10].Title.Caption:='Status da Causa';
  dbgRelacaoOcorrencia.Columns.Items[10].Width:=180;
  dbgRelacaoOcorrencia.Columns.Items[24].Title.Caption:='Sit. da Ordem de Coleta';
  dbgRelacaoOcorrencia.Columns.Items[24].Width:=180;
  dbgRelacaoOcorrencia.Columns.Items[25].Title.Caption:='Data de Emissão';
  dbgRelacaoOcorrencia.Columns.Items[25].Width:=90;

  dbgRelacaoOcorrencia.Columns.Items[11].Visible:=False;
  dbgRelacaoOcorrencia.Columns.Items[12].Visible:=False;
  dbgRelacaoOcorrencia.Columns.Items[13].Visible:=False;
  dbgRelacaoOcorrencia.Columns.Items[14].Visible:=False;
  dbgRelacaoOcorrencia.Columns.Items[15].Visible:=False;
  dbgRelacaoOcorrencia.Columns.Items[16].Visible:=False;
  dbgRelacaoOcorrencia.Columns.Items[17].Visible:=False;
  dbgRelacaoOcorrencia.Columns.Items[18].Visible:=False;
  dbgRelacaoOcorrencia.Columns.Items[19].Visible:=False;
  dbgRelacaoOcorrencia.Columns.Items[20].Visible:=False;
  dbgRelacaoOcorrencia.Columns.Items[21].Visible:=False;
  dbgRelacaoOcorrencia.Columns.Items[22].Visible:=False;
  dbgRelacaoOcorrencia.Columns.Items[23].Visible:=False;
  dbgRelacaoOcorrencia.Columns.Items[24].Visible:=False;
  dbgRelacaoOcorrencia.Columns.Items[25].Visible:=False;
  Application.ProcessMessages;

  dbgRelacaoOcorrencia.SetFocus;
end;

procedure TFConsultaOcorrencia.dbcbxStatusCausaCloseUp(Sender: TObject);
begin
  consulta.cdStatusCausa:=dbcbxStatusCausa.KeyValue;
end;

procedure TFConsultaOcorrencia.dbcbxStatusSolucaoCloseUp(Sender: TObject);
begin
  consulta.cdStatusSolucao:=dbcbxStatusSolucao.KeyValue;
end;

procedure TFConsultaOcorrencia.dbcbxStatusSolucaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TFConsultaOcorrencia.carregarDadosOcorrencia;
begin
  ocorrencia.limparDados;
  ocorrencia.cdOcorrencia:=DM.sqlConsultaOcorrencia.FieldByName('PROTOCOLO').AsInteger;
  ocorrencia.cdEmpresa:=DM.sqlConsultaOcorrencia.FieldByName('EMPRESA').AsInteger;
  ocorrencia.cdCliente:=DM.sqlConsultaOcorrencia.FieldByName('CD_CLIENTE').AsInteger;
  ocorrencia.codigoDigito:=DM.sqlConsultaOcorrencia.FieldByName('CODIGO').AsInteger;
  ocorrencia.cdUsuario:=DM.sqlConsultaOcorrencia.FieldByName('USUARIO').AsInteger;
  ocorrencia.descricao:=DM.sqlConsultaOcorrencia.FieldByName('OBSERVACAO').AsString;
  ocorrencia.cdPrioridade:=DM.sqlConsultaOcorrencia.FieldByName('PRIORIDADE').AsInteger;
  ocorrencia.dataRegistro:=DM.sqlConsultaOcorrencia.FieldByName('DATA_REGISTRO').AsDateTime;
  ocorrencia.dataLimite:=DM.sqlConsultaOcorrencia.FieldByName('DATA_LIMITE').AsDateTime;
  ocorrencia.cdStatusSolucao:=DM.sqlConsultaOcorrencia.FieldByName('ST_SOLUCAO').AsInteger;
  ocorrencia.cdStatusCausa:=DM.sqlConsultaOcorrencia.FieldByName('ST_CAUSA').AsInteger;
  ocorrencia.contato:=DM.sqlConsultaOcorrencia.FieldByName('CONTATO').AsString;
  ocorrencia.emailContato:=DM.sqlConsultaOcorrencia.FieldByName('DS_EMAIL_CLIENTE').AsString;
  ocorrencia.razaoSocial:=DM.sqlConsultaOcorrencia.FieldByName('RAZAO_SOCIAL').AsString;
  ocorrencia.dsPrioridade:=cdPrioridadeToDescricao(DM.sqlConsultaOcorrencia.FieldByName('PRIORIDADE').AsInteger);
  ocorrencia.dsStatusSolucao:=cdSolucaoOcorrenciaToDescricao(DM.sqlConsultaOcorrencia.FieldByName('ST_SOLUCAO').AsInteger);
  ocorrencia.dsStatusCausa:=cdCausaOcorrenciaToDescricao(DM.sqlConsultaOcorrencia.FieldByName('ST_CAUSA').AsInteger);
  ocorrencia.idSituacaoOrdemColeta:=DM.sqlConsultaOcorrencia.FieldByName('ID_SITUACAO_ORDEM_COLETA').AsString;
  ocorrencia.dataEmissaoOrdemDeColeta:=DM.sqlConsultaOcorrencia.FieldByName('DT_EMISSAO_ORDEM_COLETA').AsDateTime;
  ocorrencia.cdDestinoEmailOrdemDeColeta:=DM.sqlConsultaOcorrencia.FieldByName('CD_DESTINO_EMAIL_ORDEM_COLETA').AsInteger;
  ocorrencia.dsArquivoOcorrencia:=DM.sqlConsultaOcorrencia.FieldByName('NM_ARQUIVO_ANEXO').AsString;




end;

procedure TFConsultaOcorrencia.visualizarOcorrencia;
begin
  if FVisualizacaoOcorrencia = nil then
    FVisualizacaoOcorrencia:=TFVisualizacaoOcorrencia.Create(nil);

  FVisualizacaoOcorrencia.ShowModal;
end;


procedure TFConsultaOcorrencia.prepararVisualizacaoOcorrencia;
begin
  try
    carregarDadosOcorrencia;
    DM.gravarOcorrenciaLocal;
    DM.execConsultarItemOcorrencia;

    { dados do cliente }
    if cliente = nil then
      cliente:=TCliente.create
    else
      cliente.limparDados;

    cliente.codigo:=ocorrencia.cdCliente;
    cliente.razaoSocial:=ocorrencia.razaoSocial;
    cliente.cnpj:=DM.getCNPJCliente(ocorrencia.cdCliente);
    cliente.setor:=DM.sqlConsultaOcorrencia.FieldByName('SETOR').AsInteger;
    cliente.digito:=getDigitoVerificador(ocorrencia.codigoDigito);
    cliente.endereco:=DM.sqlConsultaOcorrencia.FieldByName('DS_LOGRADOURO').AsString;
    cliente.numero:=DM.sqlConsultaOcorrencia.FieldByName('NR_LOGRADOURO').AsString;
    cliente.bairro:=DM.sqlConsultaOcorrencia.FieldByName('NM_BAIRRO').AsString;
    cliente.cidade:=DM.sqlConsultaOcorrencia.FieldByName('CIDADE').AsString;
    cliente.estado:=DM.sqlConsultaOcorrencia.FieldByName('UF').AsString;
    cliente.entregador:=DM.sqlConsultaOcorrencia.FieldByName('CD_ENTREGA_CAMINHAO_SECUNDARIO').AsString;
    cliente.contato:=DM.sqlConsultaOcorrencia.FieldByName('CONTATO').AsString;
    cliente.emailSac:=DM.sqlConsultaOcorrencia.FieldByName('DS_EMAIL_CLIENTE').AsString;
    cliente.cdTransportador:=DM.sqlConsultaOcorrencia.FieldByName('CD_TRANSPORTADOR').AsInteger;
    cliente.emailTransportador:=DM.getEmailDoDestinatario(cliente.cdTransportador,CD_TIPO_DESTINO_EMAIL_SAC_DOMINIO,CD_CATEGORIA_EMAIL_SAC_DOMINIO);


    visualizarOcorrencia;
  except
    on E:Exception  do
      raise Exception.Create(E.Message);
  end;
end;


procedure TFConsultaOcorrencia.dbgRelacaoOcorrenciaDblClick(Sender: TObject);
begin
  prepararVisualizacaoOcorrencia;
end;

procedure TFConsultaOcorrencia.dbgRelacaoOcorrenciaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if ((DM.sqlConsultaOcorrencia.FieldByName('ST_SOLUCAO').AsInteger = 1) and
      (DM.sqlConsultaOcorrencia.FieldByName('ST_CAUSA').AsInteger in [1])) then
    dbgRelacaoOcorrencia.Canvas.Brush.Color:=clWebOrange;

  if ((DM.sqlConsultaOcorrencia.FieldByName('ST_SOLUCAO').AsInteger = 1) and
      (DM.sqlConsultaOcorrencia.FieldByName('ST_CAUSA').AsInteger in [1]) and
      (FormatDateTime('ddmmyyyy',DM.sqlConsultaOcorrencia.FieldByName('DATA_LIMITE').AsDateTime) > FormatDateTime('ddmmyyyy',dadosEmpresa.dataSistema))) then
    dbgRelacaoOcorrencia.Canvas.Brush.Color:=clWebRed;

  if ((DM.sqlConsultaOcorrencia.FieldByName('ST_SOLUCAO').AsInteger in [2,3]) and (DM.sqlConsultaOcorrencia.FieldByName('ST_CAUSA').AsInteger in [1,2])) then
    dbgRelacaoOcorrencia.Canvas.Brush.Color:=clWebYellow;

  if ((DM.sqlConsultaOcorrencia.FieldByName('ST_SOLUCAO').AsInteger = 3) and (DM.sqlConsultaOcorrencia.FieldByName('ST_CAUSA').AsInteger in [3,4])) then
    dbgRelacaoOcorrencia.Canvas.Brush.Color:=clWebLightGreen;

  if ((DM.sqlConsultaOcorrencia.FieldByName('ST_SOLUCAO').AsInteger = 4) and
      (DM.sqlConsultaOcorrencia.FieldByName('ST_CAUSA').AsInteger in [4])) then
    dbgRelacaoOcorrencia.Canvas.Brush.Color:=clWebBlue;

  if gdSelected in State then
  begin
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := clCream;
      FillRect(Rect);
      Font.Color := clBlack;
      Font.Style := [fsbold];
    end;
  end;

  dbgRelacaoOcorrencia.DefaultDrawDataCell(rect,dbgRelacaoOcorrencia.Columns[datacol].Field,State);
end;

procedure TFConsultaOcorrencia.dbgRelacaoOcorrenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    prepararVisualizacaoOcorrencia;
end;

procedure TFConsultaOcorrencia.dbgRelacaoOcorrenciaMouseEnter(Sender: TObject);
begin
  // dbgRelacaoOcorrencia.Hint:=HINT_RELACAO_OCORRENCIA;
end;

procedure TFConsultaOcorrencia.dbgRelacaoOcorrenciaTitleClick(Column: TColumn);
begin
  DM.ordenarGridS(DM.sqlConsultaOcorrencia,Column.FieldName);
end;

procedure TFConsultaOcorrencia.edtCodClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_ESCAPE : TEdit(Sender).Clear;
    VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TFConsultaOcorrencia.btnConsultarClick(Sender: TObject);
begin
  try
    btnConsultar.Enabled:=False;
    tBtnCancelar.Enabled:=True;
    { preparar consulta }
    carregaDadosConsulta;
  except
    on E:Exception  do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFConsultaOcorrencia.cbxMesAtualMouseEnter(Sender: TObject);
begin
  cbxMesAtual.Hint:=HINT_FILTRO_MES_ATUAL;
end;

procedure TFConsultaOcorrencia.FormActivate(Sender: TObject);
begin
  DM.inicializarDataSetLocal(False,True,False);
  consulta.limparDados;
end;

procedure TFConsultaOcorrencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ocorrencia.free;
  ocorrencia:=nil;
  DM.sqlConsultaOcorrencia.Close;
  FConsultaOcorrencia:=nil;
  Action:=caFree;
end;

procedure TFConsultaOcorrencia.FormCreate(Sender: TObject);
begin
  if ocorrencia = nil then
    ocorrencia:=TOcorrencia.create;
end;

procedure TFConsultaOcorrencia.FormShow(Sender: TObject);
begin
  Top:=tamanhoTela.topo;
  Left:=tamanhoTela.esquerda;
  Height:=tamanhoTela.altura;
  Width:=tamanhoTela.largura;
end;

procedure TFConsultaOcorrencia.Image1MouseEnter(Sender: TObject);
begin
  Image1.Hint:=HINT_RELACAO_OCORRENCIA;
end;

end.
