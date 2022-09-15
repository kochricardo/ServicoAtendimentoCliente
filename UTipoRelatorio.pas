unit UTipoRelatorio;

interface

uses
  StrUtils,classes,DateUtils;

type
  TMedidorDeProcessos = record
    contFilmagemSim: integer;
    contFilmagemNao: integer;
    contEnvioSim: integer;
    contEnvioNao: integer;
    contConfereEstoqueSim: integer;
    contConfereEstoqueNao: integer;
    contEstoqueCorreto: integer;
    contEstoqueMaior: integer;
    contEstoqueMenor: integer;
    contHaviaGravacaoTlvSim: integer;
    contHaviaGravacaoTlvNao: integer;
    contAtendimentoCorretoSim: integer;
    contAtendimentoCorretoNao: integer;
  end;

  TSolucao = record
    descricao: string;
    total: integer;
  end;

  TCausa = record
    descricao: string;
    total: integer;
  end;

  TSubTipoOcorrencia = record
    descricao: string;
    total: integer;
  end;

  TTipoOcorrencia = record
    descricao: string;
    total: integer;

    subTipo: array [1..100] of TSubTipoOcorrencia;
    solucao: array [1..100] of TSolucao;
    causa: array [1..100] of TCausa;

  end;

  TPeriodoPesquisa = record
    descricao: string;
    total: integer;
    tipoOcorrencia: array [1..100] of TTipoOcorrencia;
    medidorProcessos: TMedidorDeProcessos;
  end;

  TRelatorio = record
    relOcorrencia : array [1..12] of TPeriodoPesquisa;
    quantTipoOcorrencia: integer;

    procedure limparDados;
  end;

var
  relatorio: TRelatorio;

implementation

{ TRelatorio }

procedure TRelatorio.limparDados;
var
  i: integer;
  x: integer;
  y: integer;
begin
  relatorio.quantTipoOcorrencia:=0;
  for i:= 1 to 12 do
  begin
    relOcorrencia[i].descricao:='';
    relOcorrencia[i].total:=0;
    for x:= 1 to 100 do
    begin
      relOcorrencia[i].tipoOcorrencia[x].descricao:='';
      relOcorrencia[i].tipoOcorrencia[x].total:=0;
      for y:= 1 to 100 do
      begin
        { subTipo de ocorrencia }
        relOcorrencia[i].tipoOcorrencia[x].subTipo[y].descricao:='';
        relOcorrencia[i].tipoOcorrencia[x].subTipo[y].total:=0;

        { solução }
        relOcorrencia[i].tipoOcorrencia[x].solucao[y].descricao:='';
        relOcorrencia[i].tipoOcorrencia[x].solucao[y].total:=0;
        { causa }
        relOcorrencia[i].tipoOcorrencia[x].causa[y].descricao:='';
        relOcorrencia[i].tipoOcorrencia[x].causa[y].total:=0;
      end;

      { medidor de processos }
      relOcorrencia[i].medidorProcessos.contFilmagemSim:=0;
      relOcorrencia[i].medidorProcessos.contFilmagemNao:=0;
      relOcorrencia[i].medidorProcessos.contEnvioSim:=0;
      relOcorrencia[i].medidorProcessos.contEnvioNao:=0;
      relOcorrencia[i].medidorProcessos.contConfereEstoqueSim:=0;
      relOcorrencia[i].medidorProcessos.contConfereEstoqueNao:=0;
      relOcorrencia[i].medidorProcessos.contEstoqueCorreto:=0;
      relOcorrencia[i].medidorProcessos.contEstoqueMaior:=0;
      relOcorrencia[i].medidorProcessos.contEstoqueMenor:=0;
      relOcorrencia[i].medidorProcessos.contHaviaGravacaoTlvSim:=0;
      relOcorrencia[i].medidorProcessos.contHaviaGravacaoTlvNao:=0;
      relOcorrencia[i].medidorProcessos.contAtendimentoCorretoSim:=0;
      relOcorrencia[i].medidorProcessos.contAtendimentoCorretoNao:=0;
    end;
  end;
end;

end.
