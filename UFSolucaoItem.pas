unit UFSolucaoItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, ImgList, ToolWin, DBCtrls, UUtils,
  UDadosOcorrencia, UMsgPadrao, Menus;

type
  TFSolucaoItem = class(TForm)
    StatusBar1: TStatusBar;
    tBarSolucao: TToolBar;
    tBtnCancelar: TToolButton;
    tBtnExcluiritem: TToolButton;
    tBtnFechar: TToolButton;
    GroupBox1: TGroupBox;
    gbxControleOcorrencia: TGroupBox;
    lblControle: TLabel;
    lblHorarioRegistro: TLabel;
    gbxControleItem: TGroupBox;
    lblSeqItem: TLabel;
    lblEdtStatusSolu��o: TLabeledEdit;
    gbxDadosSolucao: TGroupBox;
    gbxSolucaoChekOut: TGroupBox;
    Label7: TLabel;
    Label10: TLabel;
    gbxSolucaoEstoque: TGroupBox;
    gbxSolucaoTelevendas: TGroupBox;
    cbxIdFilmagem: TComboBox;
    cbxIdConfirmaEnvio: TComboBox;
    cbxIdConferirEstoque: TComboBox;
    cbxIdEstoqueCorreto: TComboBox;
    cbxIdExisteGravacao: TComboBox;
    cbxIdAtendimentoCorreto: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dblcbSolucao: TDBLookupComboBox;
    dblcbSituacaoEmbalagem: TDBLookupComboBox;
    cbxTransResponsavel: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    memObservacao: TMemo;
    tbtnSalvar: TToolButton;
    lblContMemo: TLabel;
    PopupMenu1: TPopupMenu;
    AtualizarDadosExternos1: TMenuItem;
    ImageList: TImageList;
    dbLkcbxNomeConferente: TDBLookupComboBox;
    edtNrCamera: TEdit;
    Label13: TLabel;
    cbxIdRecolherMercadoria: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure tBtnFecharClick(Sender: TObject);
    procedure dblcbSolucaoCloseUp(Sender: TObject);
    procedure dblcbSituacaoEmbalagemCloseUp(Sender: TObject);
    procedure cbxTransResponsavelCloseUp(Sender: TObject);
    procedure cbxIdFilmagemCloseUp(Sender: TObject);
    procedure cbxIdConfirmaEnvioCloseUp(Sender: TObject);
    procedure cbxNomeConferenteCloseUp(Sender: TObject);
    procedure cbxIdConferirEstoqueCloseUp(Sender: TObject);
    procedure cbxIdEstoqueCorretoCloseUp(Sender: TObject);
    procedure cbxIdExisteGravacaoCloseUp(Sender: TObject);
    procedure cbxIdAtendimentoCorretoCloseUp(Sender: TObject);
    procedure tbtnSalvarClick(Sender: TObject);
    procedure memObservacaoChange(Sender: TObject);
    procedure memObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure AtualizarDadosExternos1Click(Sender: TObject);
    procedure dbLkcbxNomeConferenteCloseUp(Sender: TObject);
    procedure edtNrCameraExit(Sender: TObject);
    procedure tBtnCancelarClick(Sender: TObject);
    procedure cbxIdRecolherMercadoriaCloseUp(Sender: TObject);
  private
    procedure iniciarInterface;
    procedure mostrarDadosOcorrencia;
    procedure liberarCamposParaSolucao;
    procedure limpaEdit;
    procedure salvarSolucaoItem;
    procedure carregarIdRecolherMercadoria;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSolucaoItem: TFSolucaoItem;

implementation

uses UDm, UFItemOcorrencia;

{$R *.dfm}

procedure TFSolucaoItem.limpaEdit;
var
  I : integer;
begin
  for I:=0 to componentcount -1 do
  begin
    if components[I] is TLabeledEdit then
      (components[I] as TLabeledEdit).Clear;

    if (Components[i] is TMemo) then
     (Components[i] as TMemo).Clear;

    if (Components[i] is TComboBox) then
    begin
     (Components[i] as TComboBox).ItemIndex:=-1;
     (Components[i] as TComboBox).Enabled:=False;
    end;

  end;
end;

procedure TFSolucaoItem.AtualizarDadosExternos1Click(Sender: TObject);
begin
  try
    DM.atualizarDataSetLocalGeral;
    Application.MessageBox('Dados atualizados com sucesso!','',0 + 64);
  except
    on E:Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFSolucaoItem.cbxIdAtendimentoCorretoCloseUp(Sender: TObject);
begin
  if cbxIdAtendimentoCorreto.ItemIndex >= 0 then
    ocorrencia.item.solucao.idGravacaoCorreta:=inttostr(cbxIdAtendimentoCorreto.ItemIndex + 1);
end;

procedure TFSolucaoItem.cbxIdConferirEstoqueCloseUp(Sender: TObject);
begin
  if cbxIdConferirEstoque.ItemIndex >= 0 then
    ocorrencia.item.solucao.idContagemEstoque:=stringToBoolean(cbxIdConferirEstoque.Items[cbxIdConferirEstoque.ItemIndex]);
end;

procedure TFSolucaoItem.cbxIdConfirmaEnvioCloseUp(Sender: TObject);
begin
  if cbxIdConfirmaEnvio.ItemIndex >= 0 then
    ocorrencia.item.solucao.idFilmagemVisivel:=stringToBoolean(cbxIdConfirmaEnvio.Items[cbxIdConfirmaEnvio.ItemIndex]);
end;

procedure TFSolucaoItem.cbxIdEstoqueCorretoCloseUp(Sender: TObject);
begin
  if cbxIdEstoqueCorreto.ItemIndex >= 0 then
    ocorrencia.item.solucao.cdSituacaoEstoque:=cbxIdEstoqueCorreto.ItemIndex + 1;
end;

procedure TFSolucaoItem.cbxIdExisteGravacaoCloseUp(Sender: TObject);
begin
  if cbxIdExisteGravacao.ItemIndex >= 0 then
    ocorrencia.item.solucao.idGravacaoTlv:=stringToBoolean(cbxIdExisteGravacao.Items[cbxIdExisteGravacao.ItemIndex]);
end;

procedure TFSolucaoItem.cbxIdFilmagemCloseUp(Sender: TObject);
begin
  if cbxIdFilmagem.ItemIndex >= 0 then
    ocorrencia.item.solucao.idFilmagem:=stringToBoolean(cbxIdFilmagem.Items[cbxIdFilmagem.ItemIndex]);
end;

procedure TFSolucaoItem.cbxIdRecolherMercadoriaCloseUp(Sender: TObject);
begin
  if cbxIdRecolherMercadoria.ItemIndex >= 0 then
    ocorrencia.item.solucao.idRecolherMercadoria:=copy(cbxIdRecolherMercadoria.Items[cbxIdRecolherMercadoria.ItemIndex],1,1);
end;

procedure TFSolucaoItem.cbxNomeConferenteCloseUp(Sender: TObject);
begin
  ocorrencia.item.solucao.cdConferente:=1;
end;

procedure TFSolucaoItem.cbxTransResponsavelCloseUp(Sender: TObject);
begin
  if cbxTransResponsavel.ItemIndex >= 0 then
    ocorrencia.item.solucao.dsTransporte:=cbxTransResponsavel.Items[cbxTransResponsavel.ItemIndex];
end;

procedure TFSolucaoItem.dblcbSituacaoEmbalagemCloseUp(Sender: TObject);
begin
  if dblcbSituacaoEmbalagem.KeyValue > 0 then
    ocorrencia.item.solucao.cdSituacaoEmbalagem:=dblcbSituacaoEmbalagem.KeyValue;
end;

procedure TFSolucaoItem.carregarIdRecolherMercadoria;
begin
  { valor cadastrado na tabela de solu��o }
  case DM.cdsSolucaoID_ACEITE.AsString[1] of
    'N' : cbxIdRecolherMercadoria.ItemIndex:=0;
    'S' : cbxIdRecolherMercadoria.ItemIndex:=1;
  end;

  if cbxIdRecolherMercadoria.ItemIndex >= 0 then
    ocorrencia.item.solucao.idRecolherMercadoria:=copy(cbxIdRecolherMercadoria.Items[cbxIdRecolherMercadoria.ItemIndex],1,1);
end;

procedure TFSolucaoItem.dblcbSolucaoCloseUp(Sender: TObject);
begin
  if dblcbSolucao.KeyValue > 0 then
  begin
    liberarCamposParaSolucao;
    ocorrencia.item.solucao.cdSubTipoSolucao:=dblcbSolucao.KeyValue;
    carregarIdRecolherMercadoria;
  end;
end;

procedure TFSolucaoItem.dbLkcbxNomeConferenteCloseUp(Sender: TObject);
begin
  if dbLkcbxNomeConferente.KeyValue > 0 then
    ocorrencia.item.solucao.cdConferente:=dbLkcbxNomeConferente.KeyValue;
end;

procedure TFSolucaoItem.edtNrCameraExit(Sender: TObject);
begin
  ocorrencia.item.solucao.nrCamera:=StrToIntDef(edtNrCamera.Text,0);
end;

procedure TFSolucaoItem.FormActivate(Sender: TObject);
begin
  iniciarInterface;
end;

procedure TFSolucaoItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.sqlListaDeConferente.Close;
  FSolucaoItem:=nil;
  Action:=caFree;
end;

procedure TFSolucaoItem.liberarCamposParaSolucao;
begin
  { check-out }
  cbxIdFilmagem.Enabled:=DM.cdsSolucaoID_FILMAGEM.AsBoolean;
  cbxIdConfirmaEnvio.Enabled:=DM.cdsSolucaoID_FILMAGEM.AsBoolean;
  edtNrCamera.Enabled:=DM.cdsSolucaoID_FILMAGEM.AsBoolean;

  if DM.cdsSolucaoID_FILMAGEM.AsBoolean then
  begin
    DM.consultarListaDeConferente;
    dbLkcbxNomeConferente.Enabled:=DM.cdsSolucaoID_FILMAGEM.AsBoolean;
  end;

  { estoque }
  cbxIdConferirEstoque.Enabled:=DM.cdsSolucaoID_ESTOQUE.AsBoolean;
  cbxIdEstoqueCorreto.Enabled:=DM.cdsSolucaoID_ESTOQUE.AsBoolean;

  { televendas }
  cbxIdExisteGravacao.Enabled:=DM.cdsSolucaoID_TELEVENDAS.AsBoolean;
  cbxIdAtendimentoCorreto.Enabled:=DM.cdsSolucaoID_TELEVENDAS.AsBoolean;

  { situacao da embalagem }
  dblcbSituacaoEmbalagem.Enabled:=DM.cdsSolucaoID_EMBALAGEM.AsBoolean;

  { dados do transportador (transbordo de carga) }
  cbxTransResponsavel.Enabled:=DM.cdsSolucaoID_TRANSP_RESPONSAVEL.AsBoolean;

  { avisar recolhimento da mercadoria }
  cbxIdRecolherMercadoria.Enabled:=DM.cdsSolucaoID_RECOLHE_MERCADORIA.AsBoolean;

  Application.ProcessMessages;
end;

procedure TFSolucaoItem.memObservacaoChange(Sender: TObject);
var
  cont: integer;
begin
  cont:=Length(memObservacao.Text);
  lblContMemo.Caption:=inttostr(cont)+'/300';
  ocorrencia.item.solucao.dsSolucao:=StringReplace(memObservacao.Text,#13#10,'',[rfReplaceAll]);
  Application.ProcessMessages;
end;

procedure TFSolucaoItem.memObservacaoKeyPress(Sender: TObject; var Key: Char);
begin
  key := Upcase(Key) ;
  if (key in ['�','�','�','�','�','�','�','�','�','�','�','�','�','`','~','^']) then
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
end;

procedure TFSolucaoItem.mostrarDadosOcorrencia;
begin
  { dados de controle e do cliente }
  lblControle.Caption:=FormatFloat('000000',DM.cdsOcorrencia.FieldByName('cdOcorrencia').AsInteger);
  lblSeqItem.Caption:=formatfloat('000',DM.cdsItemOcorrencia.FieldByName('nrSequencia').AsInteger);
  lblHorarioRegistro.Caption:=FormatDateTime('dd/mm/yyyy hh:nn:ss',DM.cdsOcorrencia.FieldByName('dataRegistro').AsDateTime);

  lblEdtStatusSolu��o.Text:=DM.cdsOcorrencia.FieldByName('dsStatusSolucao').AsString;
  if DM.cdsOcorrencia.FieldByName('cdStatusSolucao').AsInteger = 1 then
    lblEdtStatusSolu��o.Font.Color:=clRed
  else
    lblEdtStatusSolu��o.Font.Color:=clGreen;

  { filtra a solu��o cadastrada para o tipo de ocorrencia }
  DM.execFiltroSolucaoItemOcorrencia(DM.cdsItemOcorrencia.FieldByName('cdTipoOcorrencia').AsInteger,
    DM.cdsItemOcorrenciacdSubTipoOcorrencia.AsInteger,0);

  { desmembrar dados do transbordo da carga }
  cbxTransResponsavel:=getListaTransbordo(DM.cdsItemOcorrencia.FieldByName('dsTransbordoCarga').AsString,cbxTransResponsavel);
  cbxTransResponsavel.Enabled:=True;

  {area de Origem}
  DM.carregaListaAreaDeOrigem;
end;

procedure TFSolucaoItem.iniciarInterface;
begin
  limpaEdit;
  ocorrencia.item.solucao.limparDados;
  mostrarDadosOcorrencia;
  dblcbSolucao.SetFocus;
end;

procedure TFSolucaoItem.tBtnCancelarClick(Sender: TObject);
begin
  iniciarInterface;
end;

procedure TFSolucaoItem.tBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFSolucaoItem.tbtnSalvarClick(Sender: TObject);
begin
  salvarSolucaoItem;
end;

procedure TFSolucaoItem.salvarSolucaoItem;
  function isCamposValidados:Boolean;
  begin
    { situacao da embalagem }
    if dblcbSituacaoEmbalagem.Enabled then
    begin
      if dblcbSituacaoEmbalagem.KeyValue = 0 then
      begin
        ShowMessage('Informe a situa��o da embalagem.');
        dblcbSituacaoEmbalagem.SetFocus;
        Result:=False;
        exit;
      end;
    end;

    { transportador }
    if cbxTransResponsavel.Enabled then
    begin
      if cbxTransResponsavel.ItemIndex < 0 then
      begin
        ShowMessage('Informe o transportador respons�vel.');
        cbxTransResponsavel.SetFocus;
        Result:=False;
        exit;
      end;
    end;

    { filmagem da conferencia }
    if cbxIdFilmagem.Enabled then
    begin
      if cbxIdFilmagem.ItemIndex < 0 then
      begin
        ShowMessage('Informe se havia filmagem da confer�ncia.');
        cbxIdFilmagem.SetFocus;
        Result:=False;
        exit;
      end;
    end;

    { filmagem clara }
    if cbxIdConfirmaEnvio.Enabled then
    begin
      if cbxIdConfirmaEnvio.ItemIndex < 0 then
      begin
        ShowMessage('Informe se pela filmagem o produto foi enviado.');
        cbxIdConfirmaEnvio.SetFocus;
        Result:=False;
        exit;
      end;
    end;

    if edtNrCamera.Enabled then
    begin
      if StrToIntDef(edtNrCamera.Text,0) = 0 then
      begin
        ShowMessage('Informe o N� da Camera de filmagem.');
        edtNrCamera.SetFocus;
        Result:=False;
        exit;
      end;
    end;

    { necessita conferencia de estoque }
    if cbxIdConferirEstoque.Enabled then
    begin
      if cbxIdConferirEstoque.ItemIndex < 0 then
      begin
        ShowMessage('Informe se foi conferido o estoque do produto.');
        cbxIdConferirEstoque.SetFocus;
        Result:=False;
        exit;
      end;
    end;

    { situacao do estoque }
    if cbxIdEstoqueCorreto.Enabled then
    begin
      if cbxIdEstoqueCorreto.ItemIndex < 0 then
      begin
        ShowMessage('Informe a situa��o do estoque.');
        cbxIdEstoqueCorreto.SetFocus;
        Result:=False;
        exit;
      end;
    end;

    { grava��o do atendimento }
    if cbxIdExisteGravacao.Enabled then
    begin
      if cbxIdExisteGravacao.ItemIndex < 0 then
      begin
        ShowMessage('Informe se existe grava��o no TeleVendas.');
        cbxIdExisteGravacao.SetFocus;
        Result:=False;
        exit;
      end;
    end;

    { resultado da grava��o }
    if cbxIdAtendimentoCorreto.Enabled then
    begin
      if cbxIdAtendimentoCorreto.ItemIndex < 0 then
      begin
        ShowMessage('Informe se pela grava��o, o atendimento foi correto.');
        cbxIdAtendimentoCorreto.SetFocus;
        Result:=False;
        exit;
      end;
    end;

    { resultado da recolhimento de mercadoria }
    if cbxIdRecolherMercadoria.Enabled then
    begin
      if cbxIdRecolherMercadoria.ItemIndex < 0 then
      begin
        ShowMessage('Informe se a mercadoria deve ser recolhida.');
        cbxIdRecolherMercadoria.SetFocus;
        Result:=False;
        exit;
      end;
    end;


    Result:=True;
  end;

begin
  Screen.Cursor:=crSQLWait;
  try
    if isCamposValidados then
    begin
      if Application.MessageBox('Confirma a grava��o da solu��o?','Solu��o de Ocorr�ncia',4 + 32) = 6 then
      begin
        try
          tbtnSalvar.Enabled:=False;

          { gravar dados}
          DM.execProcessoGravarSolucaoItem();

          { atualizar informa��es da tela }
          mostrarDadosOcorrencia;

          { atualiza tela de item - tela anterior }
          FItemOcorrencia.carregaDadosItemVisualizacao(True);

          Application.MessageBox('Solu�ao gravada com sucesso!','Solu��o Ocorr�ncia',0 + 64);
        except
          on E:Exception do
            raise Exception.Createfmt('Erro ao gravar solu��o. Detalhes: %s',[E.Message]);
        end;
      end;
    end;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

end.
