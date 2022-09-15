unit UFRegistroRecorrencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, ToolWin, StdCtrls, Mask, DBCtrls, DB,
  UDadosOcorrencia, UParametroSistema;

type
  TFRegistroReCorrencia = class(TForm)
    StatusBar1: TStatusBar;
    tBarRecorrencia: TToolBar;
    tbtnSalvar: TToolButton;
    tBtnCancelar: TToolButton;
    tBtnExcluirItem: TToolButton;
    tbtnAlterar: TToolButton;
    tBtnFechar: TToolButton;
    ImageList1: TImageList;
    GroupBox1: TGroupBox;
    cbxTipoRecorrencia: TComboBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    memObservacaoRecorrencia: TMemo;
    Label2: TLabel;
    dbEdtCodOcorrencia: TDBEdit;
    DataSource1: TDataSource;
    Label3: TLabel;
    dbEdtDataRegistroOcorrencia: TDBEdit;
    Label4: TLabel;
    dbEdtRazaoSocial: TDBEdit;
    Label5: TLabel;
    dbEdtDataLimite: TDBEdit;
    procedure tBtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbxTipoRecorrenciaCloseUp(Sender: TObject);
    procedure tbtnSalvarClick(Sender: TObject);
    procedure tBtnCancelarClick(Sender: TObject);
  private
    procedure salvarCadastroRecorrencia;
    procedure atualizarDadosOcorrenciaAtual;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegistroReCorrencia: TFRegistroReCorrencia;

implementation

uses UDm;

{$R *.dfm}

procedure TFRegistroReCorrencia.cbxTipoRecorrenciaCloseUp(Sender: TObject);
begin
  if cbxTipoRecorrencia.ItemIndex >= 0 then
  begin
    memObservacaoRecorrencia.Enabled:=True;
    memObservacaoRecorrencia.SetFocus;
    tbtnSalvar.Enabled:=True;
    tBtnCancelar.Enabled:=True;
  end
  else
    memObservacaoRecorrencia.Enabled:=False;
end;

procedure TFRegistroReCorrencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FRegistroReCorrencia:=nil;
  Action:=caFree;
end;

procedure TFRegistroReCorrencia.tBtnCancelarClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja Limpar os dados da Recorrência?','Registro de Recorrência',4 + 32) = 6 then
  begin
    cbxTipoRecorrencia.ItemIndex:=-1;
    cbxTipoRecorrencia.SetFocus;
    memObservacaoRecorrencia.Clear;
    memObservacaoRecorrencia.Enabled:=False;
    tbtnSalvar.Enabled:=False;
    tBtnCancelar.Enabled:=False;
  end;
end;

procedure TFRegistroReCorrencia.tBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFRegistroReCorrencia.atualizarDadosOcorrenciaAtual;
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

procedure TFRegistroReCorrencia.salvarCadastroRecorrencia;
begin
  if Application.MessageBox('Confirma a Gravação da Recorrência?','Registro de Recorrência',4 + 32) = 6 then
  begin
    Screen.Cursor:=crSQLWait;
    try
      { gravar recorrencia }
      DM.cadastrarRecorrencia(memObservacaoRecorrencia.Text,cbxTipoRecorrencia.Items[cbxTipoRecorrencia.ItemIndex]);
      { enviar email }
      DM.enviarEmailRecorrencia;
      { atualiza dados }
      atualizarDadosOcorrenciaAtual;

      tbtnSalvar.Enabled:=False;
      Application.MessageBox('Recorrência cadastrada com sucesso!','',0 + 64);
    finally
      Screen.Cursor:=crDefault;
    end;
  end;
end;

procedure TFRegistroReCorrencia.tbtnSalvarClick(Sender: TObject);
begin
  salvarCadastroRecorrencia;
end;

end.
