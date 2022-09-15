unit UFVisualizacaoOcorrencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ImgList, ToolWin, ExtCtrls, Grids, DBGrids,
  UParametroSistema, Mask, DBCtrls, DB, pngimage, Buttons, UMsgPadrao,
  UDadosOcorrencia, Menus, UUsuario;

type
  TFVisualizacaoOcorrencia = class(TForm)
    StatusBar1: TStatusBar;
    gbxOcorrencia: TGroupBox;
    gbxDadosPrincipais: TGroupBox;
    gbxItem: TGroupBox;
    gbxSolucao: TGroupBox;
    gbxCausa: TGroupBox;
    tBarAtendimento: TToolBar;
    tBtnCancelar: TToolButton;
    tBtnExcluirOcorrencia: TToolButton;
    tBtnFechar: TToolButton;
    tbtnRecorrencia: TToolButton;
    dbgItem: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    dbEdtDescSolucao: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    gbxSolucaoChekOut: TGroupBox;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    gbxSolucaoEstoque: TGroupBox;
    DBCheckBox3: TDBCheckBox;
    gbxSolucaoTelevendas: TGroupBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    Label12: TLabel;
    DBEdit3: TDBEdit;
    DataSource1: TDataSource;
    Label13: TLabel;
    DBEdit4: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    Label15: TLabel;
    DBEdit13: TDBEdit;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    Label17: TLabel;
    dbEdtPrioridade: TDBEdit;
    Label18: TLabel;
    dbEdtStatusSolucao: TDBEdit;
    Label19: TLabel;
    dbEdtStatusCausa: TDBEdit;
    BalloonHint: TBalloonHint;
    Label21: TLabel;
    dbEdtSituacaoEstoque: TDBEdit;
    imgMaisInformSolucao: TImage;
    imgMaisInformCausa: TImage;
    imgMaisInformOcorrencia: TImage;
    ImageList: TImageList;
    imgAlertaRecorrencia: TImage;
    PopupMenu: TPopupMenu;
    menuReabrirOcorrencia: TMenuItem;
    tBtnCancelarOcorrencia: TToolButton;
    lblMsgRegistroDeDevolucao: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    gbxOrdemDeColeta: TGroupBox;
    lblSituacaoDaOrdemDeColeta: TLabel;
    btnReEnviarOrdemDeColeta: TBitBtn;
    edtEnderecoEmailContato: TEdit;
    rdgDestinatarioEmailOrdemDeColeta: TRadioGroup;
    DBEdit5: TDBEdit;
    Label4: TLabel;
    _btnLocalizaArquivo: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tBtnFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgItemDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgItemKeyPress(Sender: TObject; var Key: Char);
    procedure imgMaisInformSolucaoMouseEnter(Sender: TObject);
    procedure imgMaisInformCausaMouseEnter(Sender: TObject);
    procedure imgMaisInformOcorrenciaMouseEnter(Sender: TObject);
    procedure dbgItemCellClick(Column: TColumn);
    procedure dbgItemMouseEnter(Sender: TObject);
    procedure dbgItemTitleClick(Column: TColumn);
    procedure dbgItemDblClick(Sender: TObject);
    procedure tbtnRecorrenciaClick(Sender: TObject);
    procedure imgAlertaRecorrenciaClick(Sender: TObject);
    procedure imgAlertaRecorrenciaMouseEnter(Sender: TObject);
    procedure dbEdtStatusSolucaoChange(Sender: TObject);
    procedure dbEdtStatusCausaChange(Sender: TObject);
    procedure tBtnExcluirOcorrenciaClick(Sender: TObject);
    procedure menuReabrirOcorrenciaClick(Sender: TObject);
    procedure tBtnCancelarOcorrenciaClick(Sender: TObject);
    procedure btnReEnviarOrdemDeColetaClick(Sender: TObject);
    procedure _btnLocalizaArquivoClick(Sender: TObject);
  private
    procedure configurarInterfaceTela;
    procedure mostrarHintResumoItemOcorrencia;
    procedure abrirTelaItemOcorrencia;
    procedure iniciarTelaRegistroRecorrencia;
    procedure iniciarTelaVisualizacaoRecorrencia;
    procedure configurarOpcaoReabeturaOcorrencia;
    procedure verificarRecorrenciaRegistrada;
    procedure iniciarTelaCancelarOcorrencia;
    procedure execReenvioDeOrdemDeColeta;
    function importaArquivoFtp(dsLocalArquivo, dsDestinoArquivo, nmArquivo,
      dsTNSMAQUINA, nmUsuario, dsSenhaUsuatio: STRING): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVisualizacaoOcorrencia: TFVisualizacaoOcorrencia;

implementation

uses UDm, UFItemOcorrencia, UFRegistroRecorrencia, UFVisualizacaoRecorrencia,
  UFCancelamentoOcorrencia;

{$R *.dfm}

procedure TFVisualizacaoOcorrencia.dbEdtStatusCausaChange(Sender: TObject);
begin
  { solucao e causa }
  case DM.cdsOcorrencia.FieldByName('cdStatusCausa').AsInteger of
    1 : dbEdtStatusCausa.Font.Color:=clRed;
    2 : dbEdtStatusCausa.Font.Color:=clYellow;
    3 : dbEdtStatusCausa.Font.Color:=clGreen;
    4 : dbEdtStatusCausa.Font.Color:=clBlue;
  end;
  {
  if DM.cdsOcorrencia.FieldByName('cdStatusCausa').AsInteger = 1 then
    dbEdtStatusCausa.Font.Color:=clRed
  else
    if DM.cdsOcorrencia.FieldByName('cdStatusCausa').AsInteger = 2 then
      dbEdtStatusCausa.Font.Color:=clYellow
    else
      if DM.cdsOcorrencia.FieldByName('cdStatusCausa').AsInteger in [3,4] then
        dbEdtStatusCausa.Font.Color:=clGreen;
  }
end;

procedure TFVisualizacaoOcorrencia.dbEdtStatusSolucaoChange(Sender: TObject);
begin
  { solucao e causa }
  case DM.cdsOcorrencia.FieldByName('cdStatusSolucao').AsInteger of
    1 : dbEdtStatusSolucao.Font.Color:=clRed;
    2 : dbEdtStatusSolucao.Font.Color:=clYellow;
    3 : dbEdtStatusSolucao.Font.Color:=clGreen;
    4 : dbEdtStatusSolucao.Font.Color:=clBlue;

  end;
  {
  if DM.cdsOcorrencia.FieldByName('cdStatusSolucao').AsInteger = 1 then
    dbEdtStatusSolucao.Font.Color:=clRed
  else
    if DM.cdsOcorrencia.FieldByName('cdStatusSolucao').AsInteger = 2 then
      dbEdtStatusSolucao.Font.Color:=clYellow
    else
      if DM.cdsOcorrencia.FieldByName('cdStatusSolucao').AsInteger = 3 then
        dbEdtStatusSolucao.Font.Color:=clGreen;
  }
end;

procedure TFVisualizacaoOcorrencia.dbgItemCellClick(Column: TColumn);
begin
  { alerta de Recorrencia }
  verificarRecorrenciaRegistrada;
end;

procedure TFVisualizacaoOcorrencia.dbgItemDblClick(Sender: TObject);
begin
  abrirTelaItemOcorrencia;
end;

procedure TFVisualizacaoOcorrencia.dbgItemDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if ((DM.cdsItemOcorrencia.FieldByName('cdStatusSolucao').AsInteger = CD_SOLUCAO_PENDENTE_OCORRENCIA) and
      (DM.cdsItemOcorrencia.FieldByName('cdStatusCausa').AsInteger in [CD_CAUSA_PENDENTE_OCORRENCIA])) then
    dbgItem.Canvas.Brush.Color:=clWebOrange;

  if ((DM.cdsItemOcorrencia.FieldByName('cdStatusSolucao').AsInteger = CD_SOLUCAO_PENDENTE_OCORRENCIA) and
      (DM.cdsItemOcorrencia.FieldByName('cdStatusCausa').AsInteger in [CD_CAUSA_PENDENTE_OCORRENCIA]) and
      (DM.cdsItemOcorrencia.FieldByName('dataLimite').AsDateTime < dadosEmpresa.dataSistema)) then
    dbgItem.Canvas.Brush.Color:=clWebRed;

  if ((DM.cdsItemOcorrencia.FieldByName('cdStatusSolucao').AsInteger = CD_SOLUCAO_PARCIAL_OCORRENCIA) and
      (DM.cdsItemOcorrencia.FieldByName('cdStatusCausa').AsInteger in [CD_CAUSA_PENDENTE_OCORRENCIA])) then
    dbgItem.Canvas.Brush.Color:=clYellow;

  if ((DM.cdsItemOcorrencia.FieldByName('cdStatusSolucao').AsInteger = CD_SOLUCAO_PARCIAL_OCORRENCIA) and
      (DM.cdsItemOcorrencia.FieldByName('cdStatusCausa').AsInteger in [CD_SOLUCAO_PARCIAL_OCORRENCIA,CD_SOLUCAO_FINALIZADA_OCORRENCIA])) then
    dbgItem.Canvas.Brush.Color:=clWebLightGreen;

  if ((DM.cdsItemOcorrencia.FieldByName('cdStatusSolucao').AsInteger = CD_SITUACAO_OCORRENCIA_CANCELADA) and
      (DM.cdsItemOcorrencia.FieldByName('cdStatusCausa').AsInteger in [CD_SITUACAO_OCORRENCIA_CANCELADA])) then
    dbgItem.Canvas.Brush.Color:=clAqua;

  if DM.cdsItemOcorrencia.FieldByName('nrOrdemDevolucao').AsInteger > 0 then
  begin
    dbgItem.Canvas.Font.Color:=clWebRed;
    dbgItem.Canvas.Font.Style:=[fsBold];
  end;

  if gdSelected in State then
  begin
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := clCream;
      FillRect(Rect);
      Font.Color := clBlack;
      Font.Style := [fsbold]
    end;
  end;

  dbgItem.DefaultDrawDataCell(rect,dbgItem.Columns[datacol].Field,State);
end;

procedure TFVisualizacaoOcorrencia.abrirTelaItemOcorrencia;
begin
  if FItemOcorrencia = nil then
    FItemOcorrencia:=TFItemOcorrencia.Create(nil);

  FItemOcorrencia.MODO_TELA:=visualizacao;
  FItemOcorrencia.ShowModal;
end;

procedure TFVisualizacaoOcorrencia.dbgItemKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    abrirTelaItemOcorrencia;
  end;
end;

procedure TFVisualizacaoOcorrencia.dbgItemMouseEnter(Sender: TObject);
begin
  //mostrarHintResumoItemOcorrencia;
end;

procedure TFVisualizacaoOcorrencia.dbgItemTitleClick(Column: TColumn);
begin
  DM.ordenarGridD(DM.cdsItemOcorrencia,Column.FieldName);
end;

procedure TFVisualizacaoOcorrencia.mostrarHintResumoItemOcorrencia;
begin
  dbgItem.Hint:=Format('Resumo da Ocorrência|Solucionador: %s'+#13+
                                            'Observação: %s'+#13#13+
                                            '|0',
                      [DM.cdsItemOcorrencianomeSolucionador.AsString,
                      DM.cdsItemOcorrenciadescricaoOcorrencia.AsString]);
end;

procedure TFVisualizacaoOcorrencia.menuReabrirOcorrenciaClick(Sender: TObject);
begin
  try
    if DM.cdsItemOcorrencia.RecordCount > 1 then
    begin
      if Application.MessageBox('Deseja reabrir todos os itens da ocorrência?','Confirmação',4 + 32) = 6 then
      begin
        try
          DM.execReAbrirOcorrencia(True);
          Application.MessageBox('Ocorrência reaberta com sucesso!','',0 + 64);
        except
          on E:Exception do
            raise Exception.Create(E.Message);
        end;
      end;
    end
    else
    begin
      if Application.MessageBox('Deseja reabrir a ocorrência?','Confirmação',4 + 32) = 6 then
      begin
        try
          DM.execReAbrirOcorrencia(False);
          Application.MessageBox('Ocorrência reaberta com sucesso!','',0 + 64);
        except
          on E:Exception do
            raise Exception.Create(E.Message);
        end;
      end;
    end;
  finally
    { atualizar tela }
    configurarInterfaceTela;
  end;
end;

procedure TFVisualizacaoOcorrencia.configurarOpcaoReabeturaOcorrencia;
begin
  menuReabrirOcorrencia.Enabled:=False;

  DM.cdsItemOcorrencia.DisableControls;
  while not DM.cdsItemOcorrencia.Eof do
  begin
    if DM.cdsItemOcorrenciacdStatusSolucao.AsInteger in [2,3] then
    begin
      menuReabrirOcorrencia.Enabled:=True;
      Break;
    end;
    DM.cdsItemOcorrencia.Next;
  end;
  DM.cdsItemOcorrencia.EnableControls;
end;

procedure TFVisualizacaoOcorrencia.verificarRecorrenciaRegistrada;
begin
  { alerta de Recorrencia }
  if usuario.isControleGeralDoSistema then
  begin
    if not DM.cdsRecorrenciaItem.IsEmpty then
    begin
      imgAlertaRecorrencia.Visible:=True;
      tBtnExcluirOcorrencia.Enabled:=False;
    end
    else
    begin
      imgAlertaRecorrencia.Visible:=False;
      tBtnExcluirOcorrencia.Enabled:=True;
    end;
  end;
end;

procedure TFVisualizacaoOcorrencia._btnLocalizaArquivoClick(Sender: TObject);
begin
      if    importaArquivoFtp('',
                           'C:\SAC\Arquivos\',
                           DBEdit5.Text,
                           'j8.gam.com.br',
                           'recall', //nmUsuario,
                           'recall..gam' {dsSenhaUsuatio:STRING}
                           ) then
                         ShowMessage('Arquivo Importado com Sucesso!!!!')
    else
        ShowMessage('Falha na importação do Arquivo !!!!');

end;

procedure TFVisualizacaoOcorrencia.execReenvioDeOrdemDeColeta;
var
  dsEmailDestinatario: string;
begin
  Screen.Cursor:=crSQLWait;
  try
    if trim(edtEnderecoEmailContato.Text) <> trim(ocorrencia.emailContato) then
      dsEmailDestinatario:=edtEnderecoEmailContato.Text;


    DM.reenviarOrdemDeColeta(ocorrencia.cdOcorrencia,ocorrencia.cdDestinoEmailOrdemDeColeta,dsEmailDestinatario);
    ShowMessage('Dados da Ordem de Coleta alterados com sucesso!');
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFVisualizacaoOcorrencia.btnReEnviarOrdemDeColetaClick(
  Sender: TObject);
begin
  if Application.MessageBox('Confirma o reenvio da Ordem de Coleta?','Ordem de Coleta',4 + 32) = 6 then
  begin
    ocorrencia.cdDestinoEmailOrdemDeColeta:=rdgDestinatarioEmailOrdemDeColeta.ItemIndex;
    execReenvioDeOrdemDeColeta;
  end;
end;

procedure TFVisualizacaoOcorrencia.configurarInterfaceTela;
begin
  { atualiza horario }
  DM.carregaDataSistema;

  if DM.cdsItemOcorrencia.RecordCount = 1 then
    verificarRecorrenciaRegistrada;

  { possibilidade de exclusão da ocorrencica }
  if DM.cdsOcorrencia.FieldByName('cdStatusSolucao').AsInteger = 1 then
  begin
    tBtnExcluirOcorrencia.Enabled:=True;
    tBtnCancelarOcorrencia.Enabled:=True;
    if trim(DM.cdsOcorrencia.FieldByName('dsNomeArquivo').AsString)<>'' then
       _btnLocalizaArquivo.Enabled:=true;

  end
  else
  begin
    tBtnExcluirOcorrencia.Enabled:=False;
    tBtnCancelarOcorrencia.Enabled:=False;
    tbtnRecorrencia.Enabled:=False;
  end;

  { prioridade de solucao }
  if DM.cdsOcorrencia.FieldByName('cdPrioridade').AsInteger = 1 then
    dbEdtPrioridade.Font.Color:=clGreen
  else
    dbEdtPrioridade.Font.Color:=clRed;

  { prioridade de solucao }
  if DM.cdsSolucaoItem.FieldByName('cdSituacaoEstoque').AsInteger > 1 then
    dbEdtSituacaoEstoque.Font.Color:=clRed
  else
    dbEdtSituacaoEstoque.Font.Color:=clGreen;

  { verifica a possibilidade reabertura da ocorrencia }
  configurarOpcaoReabeturaOcorrencia;

  if not usuario.isControleGeralDoSistema then
  begin
    tBtnCancelar.Enabled:=False;
    tBtnExcluirOcorrencia.Enabled:=False;
    tbtnRecorrencia.Enabled:=False;
    tBtnCancelarOcorrencia.Enabled:=False;
    gbxDadosPrincipais.Enabled:=False;
  end;

  { mostrar aviso de devolução vinculada a NFe da ocorrencia }
  lblMsgRegistroDeDevolucao.Visible:=DM.cdsOcorrenciaidMostrarAvisoDevolucao.AsBoolean;

  { Ordem de Coleta }
  case DM.cdsOcorrencia.FieldByName('idSituacaoOrdemColeta').AsString[1] of
    'N' : begin
            lblSituacaoDaOrdemDeColeta.Caption:='Não requer registro';
            lblSituacaoDaOrdemDeColeta.Font.Color:=clBlack;
            btnReEnviarOrdemDeColeta.Enabled:=False;
            edtEnderecoEmailContato.Text:=ocorrencia.emailContato;
            rdgDestinatarioEmailOrdemDeColeta.ItemIndex:=DM.cdsOcorrencia.FieldByName('cdDestinoEmailOrdemDeColeta').AsInteger;
            edtEnderecoEmailContato.ReadOnly:=True;
    end;
    'A' : begin
            lblSituacaoDaOrdemDeColeta.Caption:='Aguardando liberação';
            lblSituacaoDaOrdemDeColeta.Font.Color:=clWebRed;
            btnReEnviarOrdemDeColeta.Enabled:=False;
            edtEnderecoEmailContato.Text:=ocorrencia.emailContato;
            rdgDestinatarioEmailOrdemDeColeta.ItemIndex:=DM.cdsOcorrencia.FieldByName('cdDestinoEmailOrdemDeColeta').AsInteger;
            edtEnderecoEmailContato.ReadOnly:=True;
    end;
    'E' : begin
            lblSituacaoDaOrdemDeColeta.Caption:=format('Enviada em %s',[formatdatetime('dd/mm/yyyy hh:nn:ss',DM.cdsOcorrencia.FieldByName('dtEmissaoOrdemDeColeta').AsDateTime)]);
            lblSituacaoDaOrdemDeColeta.Font.Color:=clWebGreen;
            btnReEnviarOrdemDeColeta.Enabled:=True;
            edtEnderecoEmailContato.Text:=ocorrencia.emailContato;
            rdgDestinatarioEmailOrdemDeColeta.ItemIndex:=DM.cdsOcorrencia.FieldByName('cdDestinoEmailOrdemDeColeta').AsInteger;
            edtEnderecoEmailContato.ReadOnly:=False;
    end;
  end;


  Application.ProcessMessages;
end;
procedure TFVisualizacaoOcorrencia.FormActivate(Sender: TObject);
begin
  dbgItem.SetFocus;
  configurarInterfaceTela;
end;

procedure TFVisualizacaoOcorrencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.cdsOcorrencia.Close;
  FVisualizacaoOcorrencia:=nil;
  Action:=caFree;
end;

procedure TFVisualizacaoOcorrencia.FormShow(Sender: TObject);
begin
  Top:=tamanhoTela.topo;
  Left:=tamanhoTela.esquerda;
  Height:=tamanhoTela.altura;
  Width:=tamanhoTela.largura;
end;

procedure TFVisualizacaoOcorrencia.imgAlertaRecorrenciaClick(Sender: TObject);
begin
  iniciarTelaVisualizacaoRecorrencia;
end;

procedure TFVisualizacaoOcorrencia.imgAlertaRecorrenciaMouseEnter(
  Sender: TObject);
begin
  imgAlertaRecorrencia.Hint:='Alerta de Recorrência|Existe(m) Recorrência(s) vinculadas a esta ocorrência.|0';
end;

procedure TFVisualizacaoOcorrencia.imgMaisInformCausaMouseEnter(Sender: TObject);
begin
  imgMaisInformCausa.Hint:=Format('Dados Adicionais da Causa|Transportador: %s'+#13+
                                             'Observação: %s'+#13#13+
                                             '|0',
                      [DM.cdsSolucaoItemdsTranspRespCausa.AsString,
                      DM.cdsSolucaoItemdsCausaItem.AsString]);
end;

procedure TFVisualizacaoOcorrencia.imgMaisInformOcorrenciaMouseEnter(
  Sender: TObject);
begin
  imgMaisInformOcorrencia.Hint:=Format('Dados Adicionais da Ocorrência|Observação: %s'+#13#13+
                                             '|0',[DM.cdsOcorrenciadescricao.AsString]);
end;

procedure TFVisualizacaoOcorrencia.imgMaisInformSolucaoMouseEnter(Sender: TObject);
begin
  imgMaisInformSolucao.Hint:=Format('Dados Adicionais da Solução|Situação Embalagem: %s'+#13+
                                             'Transportador: %s'+#13+
                                             'Observação: %s'+#13#13+
                                             '|0',
                      [DM.cdsItemOcorrenciadsSituacaoEmbalagem.AsString,
                      DM.cdsSolucaoItemdsTranspRespSolucao.AsString,
                      DM.cdsSolucaoItemdsSolucaoItemOcorrencia.AsString]);
end;

procedure TFVisualizacaoOcorrencia.tBtnCancelarOcorrenciaClick(Sender: TObject);
begin
    if Application.MessageBox('Deseja cancelar a ocorrência atual?','Cancelar Ocorrência',4 + 32) = 6 then
      iniciarTelaCancelarOcorrencia
    else
      Application.MessageBox('Operação não executada!','SAC',0 + 64);
end;

procedure TFVisualizacaoOcorrencia.tBtnExcluirOcorrenciaClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir a ocorrência?','Confirmação',4 + 32) = 6 then
  begin
    try
      DM.execExcluirOcorrenciaRegistrada(ocorrencia.cdOcorrencia);
      Application.MessageBox('Ocorrência excluída com sucesso!','Resultado',0 + 64);
    except
      on E:Exception do
        raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TFVisualizacaoOcorrencia.tBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFVisualizacaoOcorrencia.iniciarTelaCancelarOcorrencia;
begin
  if FCancelamentoDeOcorrencia = nil then
    FCancelamentoDeOcorrencia:=TFCancelamentoDeOcorrencia.Create(self);

  FCancelamentoDeOcorrencia.NR_ITEM_OCORRENCIA:=0;
  FCancelamentoDeOcorrencia.ShowModal;
end;

procedure TFVisualizacaoOcorrencia.iniciarTelaRegistroRecorrencia;
begin
  if FRegistroReCorrencia = nil then
    FRegistroReCorrencia:=TFRegistroReCorrencia.Create(self);

  FRegistroReCorrencia.ShowModal;
end;

procedure TFVisualizacaoOcorrencia.iniciarTelaVisualizacaoRecorrencia;
begin
  if FVisualizacaoRecorrencia = nil then
    FVisualizacaoRecorrencia:=TFVisualizacaoRecorrencia.Create(self);

  FVisualizacaoRecorrencia.Show;
end;

procedure TFVisualizacaoOcorrencia.tbtnRecorrenciaClick(Sender: TObject);
begin
  recorrencia.limparDados;
  if DM.cdsItemOcorrencia.RecordCount > 1 then
    if Application.MessageBox('Deseja registrar a recorrencia para todos os itens?','Registro de Recorrência',4 + 32) = 6 then
      recorrencia.isRegistrarPendentes:=true;

  iniciarTelaRegistroRecorrencia;
end;


function TFVisualizacaoOcorrencia.importaArquivoFtp(dsLocalArquivo,
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
     DM._IdFTP.Disconnect();
     DM._IdFTP.Host :=dsTNSMAQUINA;
     DM._IdFTP.Port := 21;
     DM._IdFTP.Username := nmUSUARIO;
     DM._IdFTP.Password := dsSenhaUsuatio;

     try
        { Espera até 10 segundos pela conexão }
        DM._IdFTP.Connect;
     except
   on E: Exception do
      begin
      ShowMessage('Falha na conecção FTP...'+#13+
                    E.Message);
       result:=false;

      end;
     end;
     DM._IdFTP.ChangeDir('SAC');
//     DM._IdFTP.get(LocalOrigem,TRIM(nmArquivo),false);
     DM._IdFTP.get(nmArquivo, 'C:\SAC\Arquivos\'+nmArquivo, true, false);
      result:=true;
  except
   begin
    DM._IdFTP.MakeDir('SAC');
    DM._IdFTP.ChangeDir(dsDestinoArquivo);
    result:=false;

   END;
  END;
END;


end.
