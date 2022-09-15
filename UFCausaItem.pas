unit UFCausaItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, ToolWin, StdCtrls, ExtCtrls, DBCtrls,
  UDadosOcorrencia, UUtils, Menus;

type
  TFCausaItem = class(TForm)
    StatusBar1: TStatusBar;
    tBarSolucao: TToolBar;
    tBtnCancelar: TToolButton;
    tBtnExcluiritem: TToolButton;
    tbtnSalvar: TToolButton;
    tBtnFechar: TToolButton;
    gbxPainelPrincipal: TGroupBox;
    gbxControleOcorrencia: TGroupBox;
    lblControle: TLabel;
    lblHorarioRegistro: TLabel;
    gbxControleItem: TGroupBox;
    lblSeqItem: TLabel;
    lblEdtStatusCausa: TLabeledEdit;
    gbxDadosCausa: TGroupBox;
    dbLcbCausaItem: TDBLookupComboBox;
    Label1: TLabel;
    Label11: TLabel;
    cbxTransResponsavel: TComboBox;
    Label12: TLabel;
    lblContMemo: TLabel;
    memObservacao: TMemo;
    gbxAcao: TGroupBox;
    memObsAcaoRealizada: TMemo;
    lblContMemoAcao: TLabel;
    PopupMenu1: TPopupMenu;
    AtualizarDadosExternos1: TMenuItem;
    ImageList: TImageList;
    procedure tBtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure dbLcbCausaItemCloseUp(Sender: TObject);
    procedure cbxTransResponsavelCloseUp(Sender: TObject);
    procedure memObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure memObservacaoChange(Sender: TObject);
    procedure memObsAcaoRealizadaKeyPress(Sender: TObject; var Key: Char);
    procedure memObsAcaoRealizadaChange(Sender: TObject);
    procedure tbtnSalvarClick(Sender: TObject);
    procedure AtualizarDadosExternos1Click(Sender: TObject);
  private
    procedure iniciarInterface;
    procedure limpaEdit;
    procedure mostrarDadosOcorrencia;
    procedure liberarCamposParaCausa;
    procedure salvarCausaItem;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCausaItem: TFCausaItem;

implementation

uses UDm, UFItemOcorrencia;

{$R *.dfm}

procedure TFCausaItem.limpaEdit;
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

procedure TFCausaItem.memObsAcaoRealizadaChange(Sender: TObject);
var
  cont: integer;
begin
  cont:=Length(memObsAcaoRealizada.Text);
  lblContMemoAcao.Caption:=inttostr(cont)+'/2000';
  ocorrencia.item.causa.dsAcaoTomada:=StringReplace(memObsAcaoRealizada.Text,#13#10,'',[rfReplaceAll]);
  Application.ProcessMessages;
end;

procedure TFCausaItem.memObsAcaoRealizadaKeyPress(Sender: TObject;
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
    memObsAcaoRealizada.Clear;
    lblContMemoAcao.Caption:='0/300';
    Application.ProcessMessages;
  end;
end;

procedure TFCausaItem.memObservacaoChange(Sender: TObject);
var
  cont: integer;
begin
  cont:=Length(memObservacao.Text);
  lblContMemo.Caption:=inttostr(cont)+'/2000';
  ocorrencia.item.causa.dsCausa:=StringReplace(memObservacao.Text,#13#10,'',[rfReplaceAll]);
  Application.ProcessMessages;
end;

procedure TFCausaItem.memObservacaoKeyPress(Sender: TObject; var Key: Char);
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
end;

procedure TFCausaItem.mostrarDadosOcorrencia;
begin
  { dados de controle e do cliente }
  lblControle.Caption:=FormatFloat('000000',DM.cdsOcorrencia.FieldByName('cdOcorrencia').AsInteger);
  lblSeqItem.Caption:=formatfloat('000',DM.cdsItemOcorrencia.FieldByName('nrSequencia').AsInteger);
  lblHorarioRegistro.Caption:=FormatDateTime('dd/mm/yyyy hh:nn:ss',DM.cdsOcorrencia.FieldByName('dataRegistro').AsDateTime);

  lblEdtStatusCausa.Text:=DM.cdsOcorrencia.FieldByName('dsStatusCausa').AsString;
  if DM.cdsOcorrencia.FieldByName('cdStatusCausa').AsInteger = 1 then
    lblEdtStatusCausa.Font.Color:=clRed
  else
    lblEdtStatusCausa.Font.Color:=clGreen;

  { filtra a causa cadastrada para o tipo de ocorrencia }
  DM.execFiltroCausaItemOcorrencia(DM.cdsItemOcorrencia.FieldByName('cdTipoOcorrencia').AsInteger,
    DM.cdsItemOcorrenciacdSubTipoOcorrencia.AsInteger);

  { desmembrar dados do transbordo da carga }
  cbxTransResponsavel:=getListaTransbordo(DM.cdsItemOcorrencia.FieldByName('dsTransbordoCarga').AsString,cbxTransResponsavel);
end;

procedure TFCausaItem.iniciarInterface;
begin
  limpaEdit;
  ocorrencia.item.causa.limparDados;
  mostrarDadosOcorrencia;
  Application.ProcessMessages;
end;

procedure TFCausaItem.liberarCamposParaCausa;
begin
  { dados do transportador (transbordo de carga) }
  { filtra a solução cadastrada para o tipo de ocorrencia e para a solução atribuida ao item da ocorrencia }
  DM.execFiltroSolucaoItemOcorrencia(DM.cdsItemOcorrencia.FieldByName('cdTipoOcorrencia').AsInteger,
    DM.cdsItemOcorrenciacdSubTipoOcorrencia.AsInteger,DM.cdsSolucaoItemcdSubTipoSolucao.AsInteger);

  cbxTransResponsavel.Enabled:=DM.cdsSolucaoID_TRANSP_RESPONSAVEL.AsBoolean;

  memObservacao.Enabled:=True;
  memObsAcaoRealizada.Enabled:=True;
  Application.ProcessMessages;
end;

procedure TFCausaItem.AtualizarDadosExternos1Click(Sender: TObject);
begin
  try
    DM.atualizarDataSetLocalGeral;
    Application.MessageBox('Dados atualizados com sucesso!','',0 + 64);
  except
    on E:Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFCausaItem.cbxTransResponsavelCloseUp(Sender: TObject);
begin
  if cbxTransResponsavel.ItemIndex >= 0 then
  begin
    ocorrencia.item.causa.dsTransporte:=cbxTransResponsavel.Items[cbxTransResponsavel.ItemIndex];
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TFCausaItem.dbLcbCausaItemCloseUp(Sender: TObject);
begin
  if dbLcbCausaItem.KeyValue > 0 then
  begin
    ocorrencia.item.causa.cdSubTipoCausa:=dbLcbCausaItem.KeyValue;
    liberarCamposParaCausa;
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TFCausaItem.FormActivate(Sender: TObject);
begin
  iniciarInterface;
end;

procedure TFCausaItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FCausaItem:=nil;
  Action:=caFree;
end;

procedure TFCausaItem.tBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFCausaItem.tbtnSalvarClick(Sender: TObject);
begin
  salvarCausaItem;
end;

procedure TFCausaItem.salvarCausaItem;
begin
  Screen.Cursor:=crSQLWait;
  try
    if Application.MessageBox('Confirma a gravação da Causa?','Solução de Ocorrência',4 + 32) = 6 then
    begin
      try
        tbtnSalvar.Enabled:=False;
        { gravar dados }
        DM.execProcessoGravarCausaItem;

        { atualiza as informações na tela }
        mostrarDadosOcorrencia;

        { atualiza tela de item - tela anterior }
        FItemOcorrencia.carregaDadosItemVisualizacao(True);

        Application.MessageBox('Causa gravada com sucesso!','Causa da Ocorrência',0 + 64);
      except
        on E:Exception do
          raise Exception.Createfmt('Erro ao gravar Causa da ocorrência. Detalhes: %s',[E.Message]);
      end;
    end;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

end.
