unit UFCancelamentoOcorrencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Mask, DBCtrls, StdCtrls, ImgList, ToolWin, DB,
  UDadosOcorrencia,SqlExpr;

type
  TFCancelamentoDeOcorrencia = class(TForm)
    tbarCancelamento: TToolBar;
    tbtnSalvar: TToolButton;
    tBtnCancelar: TToolButton;
    tBtnFechar: TToolButton;
    ImageList: TImageList;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    memObservacaoOcorrencia: TMemo;
    dbEdtCodOcorrencia: TDBEdit;
    dbEdtDataRegistroOcorrencia: TDBEdit;
    dbEdtRazaoSocial: TDBEdit;
    StatusBar1: TStatusBar;
    dsOcorrencia: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsItemOcorrencia: TDataSource;
    _cbMotivoCancelamento: TComboBox;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tBtnFecharClick(Sender: TObject);
    procedure tBtnCancelarClick(Sender: TObject);
    procedure tbtnSalvarClick(Sender: TObject);
    procedure memObservacaoOcorrenciaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure atualizarDadosOcorrenciaAtual;
    procedure CarregaMotivoCancelamento;
    { Private declarations }
  public
    NR_ITEM_OCORRENCIA : integer;
    { Public declarations }
  end;

var
  FCancelamentoDeOcorrencia: TFCancelamentoDeOcorrencia;

implementation

uses UDm, UFItemOcorrencia;

{$R *.dfm}

procedure TFCancelamentoDeOcorrencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FCancelamentoDeOcorrencia:=nil;
  Action:=caFree;
end;

procedure TFCancelamentoDeOcorrencia.FormShow(Sender: TObject);
begin
   CarregaMotivoCancelamento;
end;

procedure TFCancelamentoDeOcorrencia.memObservacaoOcorrenciaChange(
  Sender: TObject);
begin
  if memObservacaoOcorrencia.Text = EmptyStr then
  begin
    tbtnSalvar.Enabled:=False;
    tBtnCancelar.Enabled:=False;
  end
  else
  begin
    tbtnSalvar.Enabled:=true;
    tBtnCancelar.Enabled:=true;
  end;

end;

procedure TFCancelamentoDeOcorrencia.tBtnCancelarClick(Sender: TObject);
begin
  memObservacaoOcorrencia.Clear;
  tbtnSalvar.Enabled:=False;
  tBtnCancelar.Enabled:=False;
  Application.ProcessMessages;
end;

procedure TFCancelamentoDeOcorrencia.tBtnFecharClick(Sender: TObject);
begin
  FItemOcorrencia.Close;
  Close;
end;

procedure TFCancelamentoDeOcorrencia.atualizarDadosOcorrenciaAtual;
begin
  try
    DM.cdsOcorrencia.Close;
    DM.gravarOcorrenciaLocal;
    DM.execConsultarItemOcorrencia;
  except
    on E:Exception do
      raise Exception.CreateFmt('Erro ao atualizar dados. Detalhes: %s',[E.Message]);
  end;
end;

procedure TFCancelamentoDeOcorrencia.tbtnSalvarClick(Sender: TObject);
begin

  if _cbMotivoCancelamento.ItemIndex=0 then
  begin
       Application.MessageBox('Escolha um motivo Para cancelamento Ocorrencia !','Resultado',0 + 64);
       exit;

  end;


  if Application.MessageBox('Deseja realmente cancelar a ocorrência atual?','Confirmação',4 + 32) = 6 then
  begin
    try
      try
        ocorrencia.item.dsMotivoCancelamento:= trim(memObservacaoOcorrencia.Text);
        ocorrencia.item.cdMotivoCancelamento:= StrToIntDef( copy(_cbMotivoCancelamento.Text,1,3),0);

        { exec cancelamento }
        DM.execCancelarOcorrenciaRegistrada(ocorrencia.cdOcorrencia,
                                            NR_ITEM_OCORRENCIA,
                                            ocorrencia.item.cdMotivoCancelamento,
                                            ocorrencia.item.dsMotivoCancelamento);

        { enviar email }
        StatusBar1.SimpleText:='Enviando email, aguarde ...';
        Application.ProcessMessages;

        DM.enviarEmailDeCancelamentoOcorrencia;

        StatusBar1.SimpleText:='';
        Application.ProcessMessages;

        { atualizar dados }
        atualizarDadosOcorrenciaAtual;
        DM.atualizarStatusSolucaoOcorrencia(False,False);
        DM.atualizarStatusCausaOcorrencia(False,False);

        tbtnSalvar.Enabled:=False;
        Application.MessageBox('A Ocorrência foi cancelada com sucesso!','Resultado',0 + 64);
      except
        on E:Exception do
          raise Exception.Create(E.Message);
      end;
    finally
      StatusBar1.SimpleText:='';
      Application.ProcessMessages;

    end;
  end;
 end;


 procedure TFCancelamentoDeOcorrencia.CarregaMotivoCancelamento;
var
  tempQuery: TSQLQuery;
begin
  tempQuery := nil;
  try
    tempQuery := DM.criaQueryGenerica;
    tempQuery.close;
    tempQuery.SQL.Clear;
    tempQuery.SQL.add('SELECT CD_SAC_MOTIVO_CANCELAMENTO AS CODIGO, DS_SAC_MOTIVO_CANCELAMENTO');
    tempQuery.SQL.add('FROM');
    tempQuery.SQL.add('GAMSAC.DC_SAC_MOTIVO_CANCELAMENTO');
    tempQuery.SQL.add('ORDER BY DS_SAC_MOTIVO_CANCELAMENTO');
    tempQuery.open;
    tempQuery.First;

    _cbMotivoCancelamento.Clear;
    _cbMotivoCancelamento.Items.add('000 - Escolha um motivo para cancelamento');
    while not tempQuery.Eof do
    begin
      _cbMotivoCancelamento.Items.add(formatfloat('000', tempQuery.FieldByName('CODIGO').AsInteger) + ' - ' +
        tempQuery.FieldByName('DS_SAC_MOTIVO_CANCELAMENTO').AsString);
      tempQuery.Next;
    end;
    _cbMotivoCancelamento.ItemIndex := 0;

  finally
    tempQuery.close;
    tempQuery.Free;
  end;
end;



end.
