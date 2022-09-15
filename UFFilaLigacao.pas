unit UFFilaLigacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, StdCtrls, DB, DBClient, SimpleDS, ExtCtrls,
  UParametroSistema, UTelefoneAtendimento, Buttons, UUtils;

type
  TFFilaLigacao = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    gbxControleLigacao: TGroupBox;
    dbgFilaAtendimento: TDBGrid;
    tmrAtualizaFiladeEspera: TTimer;
    dbgControleLigacao: TDBGrid;
    rdgTipoAtendimento: TRadioGroup;
    btnAtualizaDados: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tmrAtualizaFiladeEsperaTimer(Sender: TObject);
    procedure dbgFilaAtendimentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgFilaAtendimentoMouseEnter(Sender: TObject);
    procedure dbgFilaAtendimentoMouseLeave(Sender: TObject);
    procedure rdgTipoAtendimentoClick(Sender: TObject);
    procedure dbgFilaAtendimentoTitleClick(Column: TColumn);
    procedure btnAtualizaDadosClick(Sender: TObject);
    procedure dbgFilaAtendimentoCellClick(Column: TColumn);
    procedure dbgControleLigacaoDblClick(Sender: TObject);
  private
    procedure atualizaFilaEspera;
    procedure carregaFormularioAtendimento;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFilaLigacao: TFFilaLigacao;
  dadosLigacao : TFDadosLigacao;

implementation

uses UDM, UFPrincipal, UFAtendimentoCliente;

{$R *.dfm}

procedure TFFilaLigacao.btnAtualizaDadosClick(Sender: TObject);
begin
  btnAtualizaDados.Enabled:=false;
  try
    atualizaFilaEspera;
  finally
    btnAtualizaDados.Enabled:=True;
  end;
end;

procedure TFFilaLigacao.carregaFormularioAtendimento;
begin
  if FAtendimentoCliente = nil then
    FAtendimentoCliente:=TFAtendimentoCliente.Create(self);

  FFilaLigacao.WindowState:=wsMinimized;
  FAtendimentoCliente.Show;
end;
procedure TFFilaLigacao.dbgControleLigacaoDblClick(Sender: TObject);
begin
  try
    DM.consultaFiladeEspera(DM.sqlControleLigacaoCD_TIPO_ATENDIMENTO.AsString);
    tmrAtualizaFiladeEspera.Enabled:=False;
  except
    on E:exception do
      raise Exception.Create('Erro ao consultar Fila de Espera.Erro: ' + E.Message);
  end;
end;

procedure TFFilaLigacao.dbgFilaAtendimentoCellClick(Column: TColumn);
begin
  if not DM.sqlConsultaFilaLigacao.IsEmpty then
  begin
    dadosLigacao.limparDados;
    dadosLigacao.codigoLigacao:=DM.sqlConsultaFilaLigacaoID.AsInteger;
    dadosLigacao.nrTelefone:=trim(DM.sqlConsultaFilaLigacaoTELEFONE.AsString);
    dadosLigacao.codigoCliente:=DM.sqlConsultaFilaLigacaoCODIGO.AsInteger;

    rdgTipoAtendimento.Enabled:=true;
  end
  else
    carregaFormularioAtendimento;
end;

procedure TFFilaLigacao.dbgFilaAtendimentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_F5 : atualizaFilaEspera;
  end;
end;

procedure TFFilaLigacao.dbgFilaAtendimentoMouseEnter(Sender: TObject);
begin
  tmrAtualizaFiladeEspera.Enabled:=false;
end;

procedure TFFilaLigacao.dbgFilaAtendimentoMouseLeave(Sender: TObject);
begin
  tmrAtualizaFiladeEspera.Enabled:=true;
end;

procedure TFFilaLigacao.dbgFilaAtendimentoTitleClick(Column: TColumn);
begin
  DM.ordenarGridS(DM.sqlConsultaFilaLigacao,Column.FieldName);
end;

procedure TFFilaLigacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.sqlConsultaFilaLigacao.Close;
  FFilaLigacao:=nil;
  if FAtendimentoCliente <> nil then
    FAtendimentoCliente.Close;
  Action:=caFree;
end;

procedure TFFilaLigacao.FormCreate(Sender: TObject);
begin
  atualizaFilaEspera;
end;

procedure TFFilaLigacao.rdgTipoAtendimentoClick(Sender: TObject);
var
  idRetorno : integer;
begin
  idRetorno:=0;
  case rdgTipoAtendimento.ItemIndex of
    0 : idRetorno:=TIPO_LIGACAO_ATENDIDO_NORMAL; { NORMAL }
    1 : begin
          idRetorno:=TIPO_LIGACAO_RETORNO_OK; { RETORNO }
          dadosLigacao.isIniciarLigacao:=True;
    end;
    2 : idRetorno:=TIPO_LIGACAO_SEM_RETORNO; { NAO RETORNADA }
  end;

  { alterar status da ligacao }
  if idRetorno > 0 then
  begin
    try
      { alterar o status da ligação }
      DM.alterarStatusLigacao(dadosLigacao,idRetorno);

      { atulizar tela fila de espera }
      atualizaFilaEspera;

      rdgTipoAtendimento.ItemIndex:=-1;
      rdgTipoAtendimento.Enabled:=false;

      if idRetorno in [TIPO_LIGACAO_ATENDIDO_NORMAL,TIPO_LIGACAO_RETORNO_OK] then
        carregaFormularioAtendimento;
    except
      on E:Exception do
        raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TFFilaLigacao.tmrAtualizaFiladeEsperaTimer(Sender: TObject);
begin
  try
    tmrAtualizaFiladeEspera.Enabled:=false;
    try
      atualizaFilaEspera;
    except
      on E:Exception do
        Application.MessageBox(pchar(e.Message),'SAC - Fila de espera',0 + 16);
    end;
  finally
    tmrAtualizaFiladeEspera.Enabled:=true;
  end;
end;

procedure TFFilaLigacao.atualizaFilaEspera;
begin
  Screen.Cursor:=crSQLWait;
  try
    if not tmrAtualizaFiladeEspera.Enabled then
      tmrAtualizaFiladeEspera.Enabled:=True;

    if rdgTipoAtendimento.Enabled then
      rdgTipoAtendimento.Enabled:=false;

    try
      DM.consultaFiladeEspera(IntToStr(TIPO_LIGACAO_AGUARDANDO));
    except
      on E:exception do
        raise Exception.Create('Erro ao consultar Fila de Espera.Erro: ' + E.Message);
    end;

    try
      DM.execControledeLigacao;
    except
      on E:exception do
        raise Exception.Create('Erro ao executar controle de ligações.Erro: ' + E.Message);
    end;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

end.
