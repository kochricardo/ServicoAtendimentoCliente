unit UFRelatorioCausaCadastrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, ComCtrls,
  UParametroSistema;

type
  TFRelatorioCausaCadastrada = class(TForm)
    StatusBar1: TStatusBar;
    gbxPrincipal: TGroupBox;
    gbxFiltroPesquisa: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dblkListaTipoOcorrencia: TDBLookupComboBox;
    dblkListaSubTipoOcorrencia: TDBLookupComboBox;
    btnConsultar: TBitBtn;
    btnLimpar: TBitBtn;
    dbgRelacaoSolucao: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultarClick(Sender: TObject);
    procedure dblkListaTipoOcorrenciaCloseUp(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgRelacaoSolucaoTitleClick(Column: TColumn);
  private
    procedure configurarGridRelatorio;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioCausaCadastrada: TFRelatorioCausaCadastrada;

implementation

uses UDm;

{$R *.dfm}

procedure TFRelatorioCausaCadastrada.btnLimparClick(Sender: TObject);
begin
  btnConsultar.Enabled:=True;
  btnLimpar.Enabled:=False;
  dblkListaTipoOcorrencia.KeyValue:=Null;
  dblkListaSubTipoOcorrencia.KeyValue:=Null;
  dblkListaTipoOcorrencia.Enabled:=True;
  DM.sqlRelatorio.Close;
end;

procedure TFRelatorioCausaCadastrada.configurarGridRelatorio;
begin
  dbgRelacaoSolucao.Columns.Items[0].Visible:=False;
  dbgRelacaoSolucao.Columns.Items[1].Title.Caption:='Tipo de Ocorrência';
  dbgRelacaoSolucao.Columns.Items[1].Width:=200;
  dbgRelacaoSolucao.Columns.Items[2].Visible:=False;
  dbgRelacaoSolucao.Columns.Items[3].Title.Caption:='SubTipo de Ocorrência';
  dbgRelacaoSolucao.Columns.Items[3].Width:=450;
  dbgRelacaoSolucao.Columns.Items[4].Visible:=False;
  dbgRelacaoSolucao.Columns.Items[5].Visible:=False;
  dbgRelacaoSolucao.Columns.Items[6].Title.Caption:='Causa';
  dbgRelacaoSolucao.Columns.Items[6].Width:=400;
  Application.ProcessMessages;
end;

procedure TFRelatorioCausaCadastrada.dbgRelacaoSolucaoTitleClick(
  Column: TColumn);
begin
  DM.ordenarGridS(DM.sqlRelatorio,Column.FieldName);
end;

procedure TFRelatorioCausaCadastrada.dblkListaTipoOcorrenciaCloseUp(
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

procedure TFRelatorioCausaCadastrada.btnConsultarClick(Sender: TObject);
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
    DM.gerarRelatorioListaCausaCadastrada(cdTipoOc,cdSubTipoOc);

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

procedure TFRelatorioCausaCadastrada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.sqlRelatorio.Close;
  FRelatorioCausaCadastrada:=nil;
  Action:=caFree;
end;

procedure TFRelatorioCausaCadastrada.FormCreate(Sender: TObject);
begin
  DM.carregaTipoOcorrencia(True);
end;

procedure TFRelatorioCausaCadastrada.FormShow(Sender: TObject);
begin
  Top:=tamanhoTela.topo;
  Left:=tamanhoTela.esquerda;
  Height:=tamanhoTela.altura;
  Width:=tamanhoTela.largura;
end;

end.

