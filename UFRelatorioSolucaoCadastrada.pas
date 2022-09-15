unit UFRelatorioSolucaoCadastrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, UParametroSistema,
  ComCtrls;

type
  TFRelatorioSolucaoCadastrada = class(TForm)
    gbxPrincipal: TGroupBox;
    gbxFiltroPesquisa: TGroupBox;
    dblkListaTipoOcorrencia: TDBLookupComboBox;
    dblkListaSubTipoOcorrencia: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    btnConsultar: TBitBtn;
    btnLimpar: TBitBtn;
    dbgRelacaoSolucao: TDBGrid;
    StatusBar1: TStatusBar;
    procedure dblkListaTipoOcorrenciaCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgRelacaoSolucaoTitleClick(Column: TColumn);
    procedure btnLimparClick(Sender: TObject);
  private
    procedure configurarGridRelatorio;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioSolucaoCadastrada: TFRelatorioSolucaoCadastrada;

implementation

uses UDm;

{$R *.dfm}

procedure TFRelatorioSolucaoCadastrada.btnLimparClick(Sender: TObject);
begin
  btnConsultar.Enabled:=True;
  btnLimpar.Enabled:=False;
  dblkListaTipoOcorrencia.KeyValue:=Null;
  dblkListaSubTipoOcorrencia.KeyValue:=Null;
  dblkListaTipoOcorrencia.Enabled:=True;
  DM.sqlRelatorio.Close;
end;

procedure TFRelatorioSolucaoCadastrada.configurarGridRelatorio;
begin
  dbgRelacaoSolucao.Columns.Items[0].Visible:=False;
  dbgRelacaoSolucao.Columns.Items[1].Title.Caption:='Tipo de Ocorrência';
  dbgRelacaoSolucao.Columns.Items[1].Width:=200;
  dbgRelacaoSolucao.Columns.Items[2].Visible:=False;
  dbgRelacaoSolucao.Columns.Items[3].Title.Caption:='SubTipo de Ocorrência';
  dbgRelacaoSolucao.Columns.Items[3].Width:=400;
  dbgRelacaoSolucao.Columns.Items[4].Visible:=False;
  dbgRelacaoSolucao.Columns.Items[5].Visible:=False;
  dbgRelacaoSolucao.Columns.Items[6].Title.Caption:='Solução';
  dbgRelacaoSolucao.Columns.Items[6].Width:=400;
  Application.ProcessMessages;
end;

procedure TFRelatorioSolucaoCadastrada.btnConsultarClick(Sender: TObject);
var
  cdTipoOc: integer;
  cdSubTipoOc: integer;

begin
  Screen.Cursor:=crSQLWait;
  try
    if dblkListaTipoOcorrencia.KeyValue <> null then
      cdTipoOc:=dblkListaTipoOcorrencia.KeyValue
    else
      cdTipoOc:=0;

    if dblkListaSubTipoOcorrencia.KeyValue <> null then
      cdSubTipoOc:=dblkListaSubTipoOcorrencia.KeyValue
    else
      cdSubTipoOc:=0;

    { consultar }
    DM.gerarRelatorioListaSolucaoCadastrada(cdTipoOc,cdSubTipoOc);

    configurarGridRelatorio;
    btnConsultar.Enabled:=False;
    btnLimpar.Enabled:=True;
    dblkListaTipoOcorrencia.Enabled:=False;
    dblkListaSubTipoOcorrencia.Enabled:=False;
    dbgRelacaoSolucao.SetFocus;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFRelatorioSolucaoCadastrada.dbgRelacaoSolucaoTitleClick(
  Column: TColumn);
begin
  DM.ordenarGridS(DM.sqlRelatorio,Column.FieldName);
end;

procedure TFRelatorioSolucaoCadastrada.dblkListaTipoOcorrenciaCloseUp(
  Sender: TObject);
begin
  if dblkListaTipoOcorrencia.KeyValue <> null then
  begin
    DM.execFiltroSubTipoOcorrencia(dblkListaTipoOcorrencia.KeyValue);
    dblkListaSubTipoOcorrencia.Enabled:=True;
  end
  else
    dblkListaSubTipoOcorrencia.Enabled:=False;
end;

procedure TFRelatorioSolucaoCadastrada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.sqlRelatorio.Close;
  FRelatorioSolucaoCadastrada:=nil;
  Action:=caFree;
end;

procedure TFRelatorioSolucaoCadastrada.FormCreate(Sender: TObject);
begin
  DM.carregaTipoOcorrencia(True);
end;

procedure TFRelatorioSolucaoCadastrada.FormShow(Sender: TObject);
begin
  Top:=tamanhoTela.topo;
  Left:=tamanhoTela.esquerda;
  Height:=tamanhoTela.altura;
  Width:=tamanhoTela.largura;
end;

end.
