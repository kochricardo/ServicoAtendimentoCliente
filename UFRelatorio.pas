unit UFRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DBCtrls, DB, DBClient, SimpleDS, Buttons, Grids,
  DBGrids, COMobj, UTipoRelatorio, CheckLst ;

type
  TParametroRelatorio = record
    cdEmpresa: integer;
    dataInicial: string;
    dataFinal: string;
    dataLimiteSolucao: string;
    cdStatus: integer;
    cdSolucionador: integer;
    cdSuperiorSolucionador: integer;
    cdGerenteDepartamento: integer;
    cdDistrito: integer;
    cdRepresentante: integer;
    cdAreaOrigem: integer;
    cdCliente: integer;
    cdRede: integer;
    dsTipoOcorrencia: string;
    dsSubTipoOcorrencia: string;
    dsSolucao: string;
    dsCausa: string;
    dsSubTipoSolucao: string;
    dsOcorrenciaForadePrazo:String;
    dsSubTipoCausa: string;
    cdMercadoria: integer;
    cdEntregador: integer;

    procedure limparDados;
  end;

  TFRelatorio = class(TForm)
    StatusBar1: TStatusBar;
    gbxFiltro: TGroupBox;
    Label1: TLabel;
    dblkListaEmpresa: TDBLookupComboBox;
    gbxFiltroPeriodo: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    dpkDataInicial: TDateTimePicker;
    dpkDataFinal: TDateTimePicker;
    gbxFiltroStatus: TGroupBox;
    rbtStatusTodos: TRadioButton;
    rbtStatusIndividual: TRadioButton;
    dblkListaStatus: TDBLookupComboBox;
    gbxFiltroSolucionador: TGroupBox;
    rbtSolucionadorTodos: TRadioButton;
    rbtSolucionadorIndividual: TRadioButton;
    dblkListaSolucionador: TDBLookupComboBox;
    gbxFiltroDataLimiteSolucao: TGroupBox;
    Label4: TLabel;
    dpkDataLimiteSolucao: TDateTimePicker;
    gbxFiltroDistrito: TGroupBox;
    rdbDistritoTodos: TRadioButton;
    rdbDistritoIndividual: TRadioButton;
    gbxFiltroRepresentante: TGroupBox;
    rdbRepresentanteTodos: TRadioButton;
    rdbRepresentanteIndividual: TRadioButton;
    gbxFiltroAreaOrigem: TGroupBox;
    rdbAreaOrigemTodos: TRadioButton;
    rdbAreaOrigemIndividual: TRadioButton;
    dblkListaAreaOrigem: TDBLookupComboBox;
    gbxFiltroCliente: TGroupBox;
    rdbClienteCodigo: TRadioButton;
    rdbClienteRede: TRadioButton;
    edtCodigoCliente: TEdit;
    dblkListaRede: TDBLookupComboBox;
    gbxFiltroOcorrencia: TGroupBox;
    dblkListaTipoOcorrencia: TDBLookupComboBox;
    dblkListaSubTipoOcorrencia: TDBLookupComboBox;
    dblkListaSolucao: TDBLookupComboBox;
    dblkListaCausa: TDBLookupComboBox;
    gbxTipoRelatorio: TGroupBox;
    btnProcessar: TBitBtn;
    btnLimpar: TBitBtn;
    edtCodigoDistrito: TEdit;
    edtCodigoSetor: TEdit;
    ckbOcorrenciaTipoOcorrencia: TCheckBox;
    ckbOcorrenciaSubTipoOcorrencia: TCheckBox;
    ckbOcorrenciaSolucao: TCheckBox;
    ckbOcorrenciaCausa: TCheckBox;
    ckbOcorrenciaTodos: TCheckBox;
    ckxRelatorioTodos: TCheckBox;
    ckxRelatorioControleOcorrencia: TCheckBox;
    ckxRelatorioControleSolucao: TCheckBox;
    ckxRelatorioControleCausa: TCheckBox;
    ckxRelatorioIndicadores: TCheckBox;
    dbgRelatorio: TDBGrid;
    ckxRelatorioListaOcorrencia: TCheckBox;
    rbtSolucionadorDistrito: TRadioButton;
    dblkListaSolucionadorDistrito: TDBLookupComboBox;
    rbtSolucionadorGerente: TRadioButton;
    dblkListaSolucionadorGerente: TDBLookupComboBox;
    rbtSolucionadorSupervisor: TRadioButton;
    dblkListaSolucionadorSupervisor: TDBLookupComboBox;
    gbxFiltroMercadoria: TGroupBox;
    rdbMercadoriaTodos: TRadioButton;
    rdbMercadoriaIndividual: TRadioButton;
    edtCodigoMercadoria: TEdit;
    gbxFiltroEntregador: TGroupBox;
    rbtEntregadorTodos: TRadioButton;
    rbtEntregadorIndividual: TRadioButton;
    dblkListaEntregador: TDBLookupComboBox;
    gbxFiltroOcorrencia2: TGroupBox;
    pctOcorrencia: TPageControl;
    tshTipoOcorrencia: TTabSheet;
    tshSubTipoOcorrencia: TTabSheet;
    cklTipoOcorrencia: TCheckListBox;
    cklSubTipoOcorrencia: TCheckListBox;
    tshSubTipoSolucao: TTabSheet;
    tshSubTipoCausa: TTabSheet;
    cklSubTipoCausa: TCheckListBox;
    cklSubTipoSolucao: TCheckListBox;
    _grBOcorrenciaForadePrazo: TGroupBox;
    _chkOcorrenciaForadePrazo: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnProcessarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dpkDataLimiteSolucaoCloseUp(Sender: TObject);
    procedure ckbOcorrenciaTodosClick(Sender: TObject);
    procedure ckbOcorrenciaTipoOcorrenciaClick(Sender: TObject);
    procedure rbtStatusIndividualClick(Sender: TObject);
    procedure rbtSolucionadorIndividualClick(Sender: TObject);
    procedure rdbAreaOrigemIndividualClick(Sender: TObject);
    procedure ckbOcorrenciaSubTipoOcorrenciaClick(Sender: TObject);
    procedure ckbOcorrenciaSolucaoClick(Sender: TObject);
    procedure ckbOcorrenciaCausaClick(Sender: TObject);
    procedure rbtStatusTodosClick(Sender: TObject);
    procedure rbtSolucionadorTodosClick(Sender: TObject);
    procedure rdbAreaOrigemTodosClick(Sender: TObject);
    procedure ckxRelatorioTodosClick(Sender: TObject);
    procedure ckxRelatorioControleOcorrenciaClick(Sender: TObject);
    procedure rdbClienteRedeClick(Sender: TObject);
    procedure rdbClienteCodigoClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure dbgRelatorioTitleClick(Column: TColumn);
    procedure dblkListaTipoOcorrenciaCloseUp(Sender: TObject);
    procedure dblkListaTipoOcorrenciaEnter(Sender: TObject);
    procedure rbtSolucionadorDistritoClick(Sender: TObject);
    procedure rbtSolucionadorGerenteClick(Sender: TObject);
    procedure rbtSolucionadorSupervisorClick(Sender: TObject);
    procedure rdbDistritoIndividualClick(Sender: TObject);
    procedure rdbRepresentanteIndividualClick(Sender: TObject);
    procedure rdbMercadoriaIndividualClick(Sender: TObject);
    procedure rbtEntregadorIndividualClick(Sender: TObject);
    procedure dblkListaEntregadorEnter(Sender: TObject);
    procedure rbtEntregadorTodosClick(Sender: TObject);
    procedure rdbDistritoTodosClick(Sender: TObject);
    procedure rdbRepresentanteTodosClick(Sender: TObject);
    procedure rdbMercadoriaTodosClick(Sender: TObject);
    procedure tshTipoOcorrenciaShow(Sender: TObject);
    procedure tshSubTipoOcorrenciaShow(Sender: TObject);
    procedure tshSolucaoShow(Sender: TObject);
    procedure tshCausaShow(Sender: TObject);
    procedure ckLSolucaoClickCheck(Sender: TObject);
    procedure cklCausaClickCheck(Sender: TObject);
    procedure cklTipoOcorrenciaClickCheck(Sender: TObject);
    procedure cklSubTipoOcorrenciaClickCheck(Sender: TObject);
    procedure tshSubTipoSolucaoShow(Sender: TObject);
    procedure tshSubTipoCausaShow(Sender: TObject);
    procedure cklSubTipoSolucaoClickCheck(Sender: TObject);
    procedure cklSubTipoCausaClickCheck(Sender: TObject);
  private
    procedure processarRelatorio;
    procedure carregarParametroConsulta;
    procedure geraPlanilhaOcorrenciaSAC;
    procedure carregarOpcoesDeConsulta;
    procedure carregarDadosRelatorioSubTipoOcorrencia;
    procedure carregarDadosRelatorioSolucaoOcorrencia;
    procedure geraPlanilhaSolucaoSAC;
    procedure carregarDadosRelatorioCausaOcorrencia;
    procedure geraPlanilhaCausaSAC;
    procedure carregarDadosRelatorioIndicadorDeProcessos;
    procedure geraPlanilhaIndicadorDeProcessos;
    procedure execControleCheckTipoRelatorio;
    procedure geraPlanilhaGeral;
    procedure configurarGridRelatorio;
    procedure limpaEdit;
    function getOpcaoMarcada(chkTemp: TCheckListBox): string;
    procedure carregarListaTipoOcorrencia;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorio: TFRelatorio;
  paramRelatorio: TParametroRelatorio;
implementation

uses UDm, UUtils;

{$R *.dfm}

procedure TFRelatorio.limpaEdit;
var
  I : integer;
begin
  for I:=0 to componentcount -1 do
  begin
    if (Components[i] is TEdit) then
     (Components[i] as TEdit).Clear;

    if (Components[i] is TCheckListBox) then
     (Components[i] as TCheckListBox).Clear;
  end;
end;

function TFRelatorio.getOpcaoMarcada(chkTemp:TCheckListBox):string;
var
  i:integer;
  dsValor: string;
begin
  Result:='';

  if chkTemp.Items.Count > 0 then
  begin
    if chkTemp.Checked[0] then
      exit;
    for i:= 0 to pred(chkTemp.Items.Count) do
    begin
      if chkTemp.Checked[i] then
      begin
        dsValor:=copy(chkTemp.Items.Strings[i],2,pos(']',chkTemp.Items.Strings[i])-2);
        if Result = EmptyStr then
          Result:=format('%s',[dsValor])
        else
          Result:=format('%s,%s',[Result,dsValor]);
      end;
    end;
  end;
end;

procedure TFRelatorio.carregarParametroConsulta;
begin
  try
    if dpkDataFinal.Date < dpkDataInicial.Date then
      raise Exception.Create('A "Data Final" deve ser maior que a "Data Inicial"');

    paramRelatorio.dataInicial:=FormatDateTime('DD/MM/YYYY',dpkDataInicial.Date);
    paramRelatorio.dataFinal:=FormatDateTime('DD/MM/YYYY',dpkDataFinal.Date);

    { empresa }
    if dblkListaEmpresa.KeyValue <> Null then
      paramRelatorio.cdEmpresa:=dblkListaEmpresa.KeyValue;

    { status da ocorrencia  }
    if ((rbtStatusIndividual.Checked) and (dblkListaStatus.KeyValue <> Null)) then
      paramRelatorio.cdStatus:=dblkListaStatus.KeyValue;

    { solucionador }
      { nome }
    if ((rbtSolucionadorIndividual.Checked) and (dblkListaSolucionador.KeyValue <> Null)) then
      paramRelatorio.cdSolucionador:=dblkListaSolucionador.KeyValue;

      { distrito }
    if ((rbtSolucionadorDistrito.Checked) and (dblkListaSolucionadorDistrito.KeyValue <> Null)) then
      paramRelatorio.cdSuperiorSolucionador:=dblkListaSolucionadorDistrito.KeyValue;

      { gerente }
    if ((rbtSolucionadorGerente.Checked) and (dblkListaSolucionadorGerente.KeyValue <> Null)) then
      paramRelatorio.cdGerenteDepartamento:=dblkListaSolucionadorGerente.KeyValue;

      { supervisor }
    if ((rbtSolucionadorSupervisor.Checked) and (dblkListaSolucionadorSupervisor.KeyValue <> Null)) then
      paramRelatorio.cdSuperiorSolucionador:=dblkListaSolucionadorSupervisor.KeyValue;

    {--------------------------------------------}

    { distrito }
    if ((rdbDistritoIndividual.Checked) and (edtCodigoDistrito.Text <> EmptyStr)) then
      paramRelatorio.cdDistrito:=strtoint(edtCodigoDistrito.Text);

    { representante }
    if ((rdbRepresentanteIndividual.Checked) and (edtCodigoSetor.Text <> EmptyStr)) then
      paramRelatorio.cdRepresentante:=strtoint(edtCodigoSetor.Text);

    { entregador }
    if ((rbtEntregadorIndividual.Checked) and (dblkListaEntregador.KeyValue <> Null)) then
      paramRelatorio.cdEntregador:=dblkListaEntregador.KeyValue;

    { area de origem }
    if ((rdbAreaOrigemIndividual.Checked) and (dblkListaAreaOrigem.KeyValue <> Null)) then
      paramRelatorio.cdAreaOrigem:=dblkListaAreaOrigem.KeyValue;

    { cliente }
    if ((rdbClienteCodigo.Checked) and (edtCodigoCliente.Text <> EmptyStr)) then
      paramRelatorio.cdCliente:=getCodigoSemDigitoVerificador(StrToInt(edtCodigoCliente.Text));

    { rede }
    if ((rdbClienteRede.Checked) and (dblkListaRede.KeyValue <> Null)) then
      paramRelatorio.cdRede:=dblkListaRede.KeyValue;

    {---------------------------------------------------}
    { Tipo de ocorrencia  }
    //if ((ckbOcorrenciaTipoOcorrencia.Checked) and (dblkListaTipoOcorrencia.KeyValue <> Null)) then
    //  paramRelatorio.cdTipoOcorrencia:=dblkListaTipoOcorrencia.KeyValue;

    paramRelatorio.dsTipoOcorrencia:=getOpcaoMarcada(cklTipoOcorrencia);

    { subtipo de ocorrencia }
    //if ((ckbOcorrenciaSubTipoOcorrencia.Checked) and (dblkListaSubTipoOcorrencia.KeyValue <> Null)) then
    //  paramRelatorio.cdSubTipoOcorrencia:=dblkListaSubTipoOcorrencia.KeyValue;

    paramRelatorio.dsSubTipoOcorrencia:=getOpcaoMarcada(cklSubTipoOcorrencia);

    { solução }
    //if ((ckbOcorrenciaSolucao.Checked) and (dblkListaSolucao.KeyValue <> Null)) then
    //  paramRelatorio.dsSolucao:=dblkListaSolucao.KeyValue;
    //paramRelatorio.dsSolucao:=getOpcaoMarcada(ckLSolucao);
    paramRelatorio.dsSubTipoSolucao:=getOpcaoMarcada(cklSubTipoSolucao);

    {Ocorrencia Fora do Prazo}
    if _chkOcorrenciaForadePrazo.Checked then
       paramRelatorio.dsOcorrenciaForadePrazo:='S';

    { causa }
    //if ((ckbOcorrenciaCausa.Checked) and (dblkListaCausa.KeyValue <> Null)) then
    //  paramRelatorio.dsCausa:=dblkListaCausa.KeyValue;
    //paramRelatorio.dsCausa:=getOpcaoMarcada(cklCausa);
    paramRelatorio.dsSubTipoCausa:=getOpcaoMarcada(cklSubTipoCausa);


    { mercadoria }
    if ((rdbMercadoriaIndividual.Checked) and (edtCodigoMercadoria.Text <> EmptyStr)) then
      paramRelatorio.cdMercadoria:=getCodigoSemDigitoVerificador(StrToInt(edtCodigoMercadoria.Text));
  except
    on E:Exception do
      raise Exception.Createfmt('Erro ao carregar parametros de pesquisa',[E.Message]);
  end;

end;

procedure TFRelatorio.ckbOcorrenciaCausaClick(Sender: TObject);
begin
  if ckbOcorrenciaCausa.Checked then
  begin
    ckbOcorrenciaTodos.Enabled:=True;
    ckbOcorrenciaTodos.Checked:=False;
    DM.carregaListaCausa(True);
    dblkListaCausa.Enabled:=True;
    dblkListaCausa.SetFocus;
  end
  else
  begin
    DM.cdsListaCausa.Close;
    dblkListaCausa.Enabled:=False;
  end;
end;

procedure TFRelatorio.ckbOcorrenciaSolucaoClick(Sender: TObject);
begin
  if ckbOcorrenciaSolucao.Checked then
  begin
    ckbOcorrenciaTodos.Enabled:=True;
    ckbOcorrenciaTodos.Checked:=False;
    DM.carregaListaSolucao(True);
    dblkListaSolucao.Enabled:=True;
    dblkListaSolucao.SetFocus;
  end
  else
  begin
    DM.cdsListaSolucao.Close;
    dblkListaSolucao.Enabled:=False;
  end;
end;

procedure TFRelatorio.ckbOcorrenciaSubTipoOcorrenciaClick(Sender: TObject);
begin
  if ckbOcorrenciaSubTipoOcorrencia.Checked then
  begin
    ckbOcorrenciaTodos.Enabled:=True;
    ckbOcorrenciaTodos.Checked:=False;
    DM.execFiltroSubTipoOcorrencia(dblkListaTipoOcorrencia.KeyValue);
    dblkListaSubTipoOcorrencia.Enabled:=True;
    dblkListaSubTipoOcorrencia.SetFocus;
  end
  else
  begin
    DM.cdsSubTipoOcorrencia.Close;
    dblkListaSubTipoOcorrencia.Enabled:=False;
  end;
end;

procedure TFRelatorio.ckbOcorrenciaTipoOcorrenciaClick(Sender: TObject);
begin
  if ckbOcorrenciaTipoOcorrencia.Checked then
  begin
    ckbOcorrenciaTodos.Checked:=False;
    DM.carregaTipoOcorrencia(True);
    dblkListaTipoOcorrencia.Enabled:=True;
    dblkListaTipoOcorrencia.SetFocus;
  end
  else
  begin
    DM.cdsTipoOcorrencia.Close;
    dblkListaTipoOcorrencia.Enabled:=False;

    ckbOcorrenciaSubTipoOcorrencia.Enabled:=False;
    DM.cdsSubTipoOcorrencia.Close;
    dblkListaSubTipoOcorrencia.Enabled:=False;

    ckbOcorrenciaTodos.Enabled:=True;
  end;
end;

procedure TFRelatorio.ckbOcorrenciaTodosClick(Sender: TObject);
begin
  if ckbOcorrenciaTodos.Checked then
  begin
    ckbOcorrenciaTipoOcorrencia.Checked:=False;
    ckbOcorrenciaSubTipoOcorrencia.Checked:=False;
    ckbOcorrenciaSubTipoOcorrencia.Enabled:=False;
    ckbOcorrenciaSolucao.Checked:=False;
    ckbOcorrenciaCausa.Checked:=False;
    ckbOcorrenciaTodos.Enabled:=False;
  end;
end;

procedure TFRelatorio.cklCausaClickCheck(Sender: TObject);
begin
  {
  if cklCausa.ItemIndex = 0 then
  begin
    paramRelatorio.dsCausa:='';
    if cklCausa.Checked[0] then
      cklCausa.CheckAll(cbChecked,True)
    else
      cklCausa.CheckAll(cbUnchecked,True);
  end
  else
  begin
    if cklCausa.Checked[0] then
    begin
      cklCausa.CheckAll(cbUnchecked,True);
      cklCausa.Checked[cklCausa.ItemIndex]:=True;
    end;

    paramRelatorio.dsCausa:=getOpcaoMarcada(cklCausa);
  end;
  cklSubTipoCausa.Items.Clear;
  }
end;

procedure TFRelatorio.ckLSolucaoClickCheck(Sender: TObject);
begin
  {
  if ckLSolucao.ItemIndex = 0 then
  begin
    paramRelatorio.dsSolucao:='';
    if ckLSolucao.Checked[0] then
      ckLSolucao.CheckAll(cbChecked,True)
    else
      ckLSolucao.CheckAll(cbUnchecked,True);
  end
  else
  begin
    if ckLSolucao.Checked[0] then
    begin
      ckLSolucao.CheckAll(cbUnchecked,True);
      ckLSolucao.Checked[ckLSolucao.ItemIndex]:=True;
    end;

    paramRelatorio.dsSolucao:=getOpcaoMarcada(ckLSolucao);
  end;

  cklSubTipoSolucao.Items.Clear;
  }
end;

procedure TFRelatorio.cklSubTipoCausaClickCheck(Sender: TObject);
begin
  if cklSubTipoCausa.ItemIndex = 0 then
  begin
    paramRelatorio.dsSubTipoCausa:='';
    if cklSubTipoCausa.Checked[0] then
      cklSubTipoCausa.CheckAll(cbChecked,True)
    else
      cklSubTipoCausa.CheckAll(cbUnchecked,True);
  end
  else
  begin
    if cklSubTipoCausa.Checked[0] then
    begin
      try
        cklSubTipoCausa.CheckAll(cbUnchecked,True);
        cklSubTipoCausa.Checked[cklSubTipoCausa.ItemIndex]:=True;
      except
        cklSubTipoCausa.Checked[cklSubTipoCausa.ItemIndex]:=True;
      end;
    end;

    paramRelatorio.dsSubTipoCausa:=getOpcaoMarcada(cklSubTipoCausa);
  end;

end;

procedure TFRelatorio.cklSubTipoOcorrenciaClickCheck(Sender: TObject);
begin
  if cklSubTipoOcorrencia.ItemIndex = 0 then
  begin
    paramRelatorio.dsSubTipoOcorrencia:='';
    if cklSubTipoOcorrencia.Checked[0] then
      cklSubTipoOcorrencia.CheckAll(cbChecked,True)
    else
      cklSubTipoOcorrencia.CheckAll(cbUnchecked,True);
  end
  else
  begin
    if cklSubTipoOcorrencia.Checked[0] then
    begin
      cklSubTipoOcorrencia.CheckAll(cbUnchecked,True);
      cklSubTipoOcorrencia.Checked[cklSubTipoOcorrencia.ItemIndex]:=True;
    end;

    paramRelatorio.dsSubTipoOcorrencia:=getOpcaoMarcada(cklSubTipoOcorrencia);
  end;

  cklSubTipoSolucao.Items.Clear;
end;


procedure TFRelatorio.cklSubTipoSolucaoClickCheck(Sender: TObject);
begin
  if cklSubTipoSolucao.ItemIndex = 0 then
  begin
    paramRelatorio.dsSubTipoSolucao:='';
    if cklSubTipoSolucao.Checked[0] then
      cklSubTipoSolucao.CheckAll(cbChecked,True)
    else
      cklSubTipoSolucao.CheckAll(cbUnchecked,True);
  end
  else
  begin
    if cklSubTipoSolucao.Checked[0] then
    begin
      try
        cklSubTipoSolucao.CheckAll(cbUnchecked,True);
        cklSubTipoSolucao.Checked[cklSubTipoSolucao.ItemIndex]:=True;
      except
        cklSubTipoSolucao.Checked[cklSubTipoSolucao.ItemIndex]:=True;
      end;
    end;

    paramRelatorio.dsSubTipoSolucao:=getOpcaoMarcada(cklSubTipoSolucao);
  end;

  cklSubTipoCausa.Items.Clear;
end;

procedure TFRelatorio.cklTipoOcorrenciaClickCheck(Sender: TObject);
begin
  if cklTipoOcorrencia.ItemIndex = 0 then
  begin
    paramRelatorio.dsTipoOcorrencia:='';

    if cklTipoOcorrencia.Checked[0] then
      cklTipoOcorrencia.CheckAll(cbChecked,True)
    else
      cklTipoOcorrencia.CheckAll(cbUnchecked,True);
  end
  else
  begin
    if cklTipoOcorrencia.Checked[0] then
    begin
      cklTipoOcorrencia.CheckAll(cbUnchecked,True);
      cklTipoOcorrencia.Checked[cklTipoOcorrencia.ItemIndex]:=True;
    end;
    paramRelatorio.dsTipoOcorrencia:=getOpcaoMarcada(cklTipoOcorrencia);
  end;

  cklSubTipoOcorrencia.Items.Clear;
end;

procedure TFRelatorio.ckxRelatorioControleOcorrenciaClick(Sender: TObject);
begin
  ckxRelatorioTodos.Checked:=False;
end;

procedure TFRelatorio.ckxRelatorioTodosClick(Sender: TObject);
begin
  execControleCheckTipoRelatorio;
end;

procedure TFRelatorio.dbgRelatorioTitleClick(Column: TColumn);
begin
  DM.ordenarGridS(DM.sqlRelatorio,Column.FieldName);
end;

procedure TFRelatorio.dblkListaEntregadorEnter(Sender: TObject);
begin
  if ((rdbRepresentanteIndividual.Checked) and (edtCodigoSetor.Text <> EmptyStr)) then
  begin
    DM.carregarListaDeEntregador(edtCodigoSetor.Text);
    dblkListaEntregador.Enabled:=True;
  end
  else
  begin
    Application.MessageBox('Para usar este filtro, é necessário informar um representante.','Atenção',0 + 64);
    rbtEntregadorIndividual.Checked:=False;
    rbtEntregadorTodos.Checked:=True;
  end;
end;

procedure TFRelatorio.dblkListaTipoOcorrenciaCloseUp(Sender: TObject);
begin
  if dblkListaTipoOcorrencia.KeyValue <> null then
    ckbOcorrenciaSubTipoOcorrencia.Enabled:=True
  else
    ckbOcorrenciaSubTipoOcorrencia.Enabled:=False;
end;

procedure TFRelatorio.dblkListaTipoOcorrenciaEnter(Sender: TObject);
begin
  DM.cdsSubTipoOcorrencia.Close;
  dblkListaSubTipoOcorrencia.Enabled:=False;
  ckbOcorrenciaSubTipoOcorrencia.Checked:=False;
  ckbOcorrenciaSubTipoOcorrencia.Enabled:=False;
end;

procedure TFRelatorio.dpkDataLimiteSolucaoCloseUp(Sender: TObject);
begin
  paramRelatorio.dataLimiteSolucao:=FormatDateTime('DD/MM/YYYY',dpkDataLimiteSolucao.Date);
end;

procedure TFRelatorio.carregarDadosRelatorioSubTipoOcorrencia;
var
  dsPeriodoAtual : string;      { controlador }
  cdTipoAtual: integer;    { controlador }
  cdSubTipoAtual: integer; { controlador }
  posicaoPeriodo: integer; { posiçao do array }
  posicaoTipo: integer;    { posiçao do array }
  posicaoSubTipo: integer; { posiçao do array }
begin
  dsPeriodoAtual:='';
  cdTipoAtual:=0;
  cdSubTipoAtual:=0;
  posicaoPeriodo:=0;
  posicaoTipo:=0;
  posicaoSubTipo:=0;

  if not DM.cdsGeradorRelatorio.IsEmpty then
  begin
    DM.cdsGeradorRelatorio.First;
    relatorio.limparDados;
    while not DM.cdsGeradorRelatorio.eof do
    begin
      if DM.cdsGeradorRelatorio.FieldByName('dataRegistro').AsString = dsPeriodoAtual then
      begin
        inc(relatorio.relOcorrencia[posicaoPeriodo].total);

        if DM.cdsGeradorRelatorio.FieldByName('cdTipoOcorrencia').AsInteger = cdTipoAtual then
        begin
          inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].total);

          if DM.cdsGeradorRelatorio.FieldByName('cdSubTipoOcorrencia').AsInteger = cdSubTipoAtual then
            inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].subTipo[posicaoSubTipo].total)
          else
          begin
            inc(posicaoSubTipo);
            cdSubTipoAtual:=DM.cdsGeradorRelatorio.FieldByName('cdSubTipoOcorrencia').AsInteger;
            relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].subTipo[posicaoSubTipo].descricao:=DM.cdsGeradorRelatorio.FieldByName('dsSubTipoOcorrencia').AsString;
            inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].subTipo[posicaoSubTipo].total)
          end;
        end
        else
        begin
          {posicao array}
          inc(posicaoTipo);
          posicaoSubTipo:=1;

          { controlador }
          cdTipoAtual:=DM.cdsGeradorRelatorio.FieldByName('cdTipoOcorrencia').AsInteger;
          cdSubTipoAtual:=DM.cdsGeradorRelatorio.FieldByName('cdSubTipoOcorrencia').AsInteger;

          { dados }
          relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].descricao:=DM.cdsGeradorRelatorio.FieldByName('dsTipoOcorrencia').AsString;
          inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].total);
          relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].subTipo[posicaoSubTipo].descricao:=DM.cdsGeradorRelatorio.FieldByName('dsSubTipoOcorrencia').AsString;
          inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].subTipo[posicaoSubTipo].total)
        end;
      end
      else
      begin
        {posicao array}
        inc(posicaoPeriodo);
        posicaoTipo:=1;
        posicaoSubTipo:=1;

        { controlador }
        dsPeriodoAtual:=DM.cdsGeradorRelatorio.FieldByName('dataRegistro').AsString;
        cdTipoAtual:=DM.cdsGeradorRelatorio.FieldByName('cdTipoOcorrencia').AsInteger;
        cdSubTipoAtual:=DM.cdsGeradorRelatorio.FieldByName('cdSubTipoOcorrencia').AsInteger;

        { dados }
        relatorio.relOcorrencia[posicaoPeriodo].descricao:=dsPeriodoAtual;
        inc(relatorio.relOcorrencia[posicaoPeriodo].total);

        relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].descricao:=DM.cdsGeradorRelatorio.FieldByName('dsTipoOcorrencia').AsString;
        inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].total);
        relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].subTipo[posicaoSubTipo].descricao:=DM.cdsGeradorRelatorio.FieldByName('dsSubTipoOcorrencia').AsString;
        inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].subTipo[posicaoSubTipo].total)
      end;
      { controle da quantidade de tipos de ocorrencia }
      if posicaoTipo > relatorio.quantTipoOcorrencia then
        relatorio.quantTipoOcorrencia:=posicaoTipo;

      DM.cdsGeradorRelatorio.Next;
    end;
  end;
end;

procedure TFRelatorio.carregarDadosRelatorioSolucaoOcorrencia;
var
  dsPeriodoAtual : string;      { controlador }
  cdTipoAtual: integer;    { controlador }
  cdSubTipoSolucao: integer; { controlador }
  posicaoPeriodo: integer; { posiçao do array }
  posicaoTipo: integer;    { posiçao do array }
  posicaoSolucao: integer; { posiçao do array }

begin
  dsPeriodoAtual:='';
  cdTipoAtual:=0;
  cdSubTipoSolucao:=0;
  posicaoPeriodo:=0;
  posicaoTipo:=0;
  posicaoSolucao:=0;

  if not DM.cdsGeradorRelatorio.IsEmpty then
  begin
    DM.cdsGeradorRelatorio.First;
    relatorio.limparDados;
    while not DM.cdsGeradorRelatorio.eof do
    begin
      if DM.cdsGeradorRelatorio.FieldByName('dataRegistro').AsString = dsPeriodoAtual then
      begin
        inc(relatorio.relOcorrencia[posicaoPeriodo].total);

        if DM.cdsGeradorRelatorio.FieldByName('cdTipoOcorrencia').AsInteger = cdTipoAtual then
        begin
          inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].total);

          if DM.cdsGeradorRelatorio.FieldByName('cdSolucao').AsInteger = cdSubTipoSolucao then
            inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].solucao[posicaoSolucao].total)
          else
          begin
            inc(posicaoSolucao);
            cdSubTipoSolucao:=DM.cdsGeradorRelatorio.FieldByName('cdSolucao').AsInteger;
            relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].solucao[posicaoSolucao].descricao:=DM.cdsGeradorRelatorio.FieldByName('dsSolucao').AsString;
            inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].solucao[posicaoSolucao].total)
          end;
        end
        else
        begin
          {posicao array}
          inc(posicaoTipo);
          posicaoSolucao:=1;

          { controlador }
          cdTipoAtual:=DM.cdsGeradorRelatorio.FieldByName('cdTipoOcorrencia').AsInteger;
          cdSubTipoSolucao:=DM.cdsGeradorRelatorio.FieldByName('cdSolucao').AsInteger;

          { dados }
          relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].descricao:=DM.cdsGeradorRelatorio.FieldByName('dsTipoOcorrencia').AsString;
          inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].total);
          relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].solucao[posicaoSolucao].descricao:=DM.cdsGeradorRelatorio.FieldByName('dsSolucao').AsString;
          inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].solucao[posicaoSolucao].total)
        end;
      end
      else
      begin
        {posicao array}
        inc(posicaoPeriodo);
        posicaoTipo:=1;
        posicaoSolucao:=1;

        { controlador }
        dsPeriodoAtual:=DM.cdsGeradorRelatorio.FieldByName('dataRegistro').AsString;
        cdTipoAtual:=DM.cdsGeradorRelatorio.FieldByName('cdTipoOcorrencia').AsInteger;
        cdSubTipoSolucao:=DM.cdsGeradorRelatorio.FieldByName('cdSolucao').AsInteger;

        { dados }
        relatorio.relOcorrencia[posicaoPeriodo].descricao:=dsPeriodoAtual;
        inc(relatorio.relOcorrencia[posicaoPeriodo].total);

        relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].descricao:=DM.cdsGeradorRelatorio.FieldByName('dsTipoOcorrencia').AsString;
        inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].total);
        relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].solucao[posicaoSolucao].descricao:=DM.cdsGeradorRelatorio.FieldByName('dsSolucao').AsString;
        inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].solucao[posicaoSolucao].total)
      end;
      { controle da quantidade de tipos de ocorrencia }
      if posicaoTipo > relatorio.quantTipoOcorrencia then
        relatorio.quantTipoOcorrencia:=posicaoTipo;

      DM.cdsGeradorRelatorio.Next;
    end;
  end;
end;

procedure TFRelatorio.carregarDadosRelatorioCausaOcorrencia;
var
  dsPeriodoAtual : string;      { controlador }
  cdTipoAtual: integer;    { controlador }
  cdCausa: integer; { controlador }
  posicaoPeriodo: integer; { posiçao do array }
  posicaoTipo: integer;    { posiçao do array }
  posicaoCausa: integer; { posiçao do array }

begin
  dsPeriodoAtual:='';
  cdTipoAtual:=0;
  cdCausa:=0;
  posicaoPeriodo:=0;
  posicaoTipo:=0;
  posicaoCausa:=0;

  if not DM.cdsGeradorRelatorio.IsEmpty then
  begin
    DM.cdsGeradorRelatorio.First;
    relatorio.limparDados;
    while not DM.cdsGeradorRelatorio.eof do
    begin
      if DM.cdsGeradorRelatorio.FieldByName('dataRegistro').AsString = dsPeriodoAtual then
      begin
        inc(relatorio.relOcorrencia[posicaoPeriodo].total);

        if DM.cdsGeradorRelatorio.FieldByName('cdTipoOcorrencia').AsInteger = cdTipoAtual then
        begin
          inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].total);

          if DM.cdsGeradorRelatorio.FieldByName('cdCausa').AsInteger = cdCausa then
            inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].causa[posicaoCausa].total)
          else
          begin
            inc(posicaoCausa);
            cdCausa:=DM.cdsGeradorRelatorio.FieldByName('cdCausa').AsInteger;
            relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].causa[posicaoCausa].descricao:=DM.cdsGeradorRelatorio.FieldByName('dsCausa').AsString;
            inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].causa[posicaoCausa].total)
          end;
        end
        else
        begin
          {posicao array}
          inc(posicaoTipo);
          posicaoCausa:=1;

          { controlador }
          cdTipoAtual:=DM.cdsGeradorRelatorio.FieldByName('cdTipoOcorrencia').AsInteger;
          cdCausa:=DM.cdsGeradorRelatorio.FieldByName('cdCausa').AsInteger;

          { dados }
          relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].descricao:=DM.cdsGeradorRelatorio.FieldByName('dsTipoOcorrencia').AsString;
          inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].total);
          relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].causa[posicaoCausa].descricao:=DM.cdsGeradorRelatorio.FieldByName('dsCausa').AsString;
          inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].causa[posicaoCausa].total)
        end;
      end
      else
      begin
        {posicao array}
        inc(posicaoPeriodo);
        posicaoTipo:=1;
        posicaoCausa:=1;

        { controlador }
        dsPeriodoAtual:=DM.cdsGeradorRelatorio.FieldByName('dataRegistro').AsString;
        cdTipoAtual:=DM.cdsGeradorRelatorio.FieldByName('cdTipoOcorrencia').AsInteger;
        cdCausa:=DM.cdsGeradorRelatorio.FieldByName('cdCausa').AsInteger;

        { dados }
        relatorio.relOcorrencia[posicaoPeriodo].descricao:=dsPeriodoAtual;
        inc(relatorio.relOcorrencia[posicaoPeriodo].total);

        relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].descricao:=DM.cdsGeradorRelatorio.FieldByName('dsTipoOcorrencia').AsString;
        inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].total);
        relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].causa[posicaoCausa].descricao:=DM.cdsGeradorRelatorio.FieldByName('dsCausa').AsString;
        inc(relatorio.relOcorrencia[posicaoPeriodo].tipoOcorrencia[posicaoTipo].causa[posicaoCausa].total)
      end;
      { controle da quantidade de tipos de ocorrencia }
      if posicaoTipo > relatorio.quantTipoOcorrencia then
        relatorio.quantTipoOcorrencia:=posicaoTipo;

      DM.cdsGeradorRelatorio.Next;
    end;
  end;
end;

procedure TFRelatorio.carregarDadosRelatorioIndicadorDeProcessos;
var
  dsPeriodoAtual : string;      { controlador }
  posicaoPeriodo: integer; { posiçao do array }
  posicaoIndicador: integer;    { posiçao do array }

begin
  dsPeriodoAtual:='';
  posicaoPeriodo:=0;
  posicaoIndicador:=0;

  if not DM.cdsGeradorRelatorio.IsEmpty then
  begin
    DM.cdsGeradorRelatorio.First;
    relatorio.limparDados;
    while not DM.cdsGeradorRelatorio.eof do
    begin
      if DM.cdsGeradorRelatorio.FieldByName('dataRegistro').AsString = dsPeriodoAtual then
      begin
        inc(relatorio.relOcorrencia[posicaoPeriodo].total);

        case DM.cdsGeradorRelatorio.FieldByName('idExisteFilmagem').AsString[1]  of
          'S': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contFilmagemSim);
          'N': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contFilmagemNao);
        end;

        case DM.cdsGeradorRelatorio.FieldByName('idFilmagemVisivel').AsString[1]  of
          'S': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contEnvioSim);
          'N': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contEnvioNao);
        end;

        case DM.cdsGeradorRelatorio.FieldByName('idConfereEstoque').AsString[1]  of
          'S': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contConfereEstoqueSim);
          'N': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contEnvioNao);
        end;

        case DM.cdsGeradorRelatorio.FieldByName('idSituacaoEstoque').AsString[1]  of
          '1': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contEstoqueCorreto);
          '2': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contEstoqueMaior);
          '3': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contEstoqueMenor);
        end;

        case DM.cdsGeradorRelatorio.FieldByName('idGravacaoTlv').AsString[1]  of
          'S': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contHaviaGravacaoTlvSim);
          'N': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contHaviaGravacaoTlvNao);
        end;

        case DM.cdsGeradorRelatorio.FieldByName('idAtendimentoCorreto').AsString[1]  of
          'S': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contAtendimentoCorretoSim);
          'N': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contAtendimentoCorretoNao);
        end;
      end
      else
      begin
        {posicao array}
        inc(posicaoPeriodo);
        posicaoIndicador:=1;

        { controlador }
        dsPeriodoAtual:=DM.cdsGeradorRelatorio.FieldByName('dataRegistro').AsString;

        { dados }
        relatorio.relOcorrencia[posicaoPeriodo].descricao:=dsPeriodoAtual;
        inc(relatorio.relOcorrencia[posicaoPeriodo].total);

        case DM.cdsGeradorRelatorio.FieldByName('idExisteFilmagem').AsString[1]  of
          'S': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contFilmagemSim);
          'N': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contFilmagemNao);
        end;

        case DM.cdsGeradorRelatorio.FieldByName('idFilmagemVisivel').AsString[1]  of
          'S': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contEnvioSim);
          'N': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contEnvioNao);
        end;

        case DM.cdsGeradorRelatorio.FieldByName('idConfereEstoque').AsString[1]  of
          'S': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contConfereEstoqueSim);
          'N': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contEnvioNao);
        end;

        case DM.cdsGeradorRelatorio.FieldByName('idSituacaoEstoque').AsString[1]  of
          '1': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contEstoqueCorreto);
          '2': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contEstoqueMaior);
          '3': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contEstoqueMenor);
        end;

        case DM.cdsGeradorRelatorio.FieldByName('idGravacaoTlv').AsString[1]  of
          'S': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contHaviaGravacaoTlvSim);
          'N': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contHaviaGravacaoTlvNao);
        end;

        case DM.cdsGeradorRelatorio.FieldByName('idAtendimentoCorreto').AsString[1]  of
          'S': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contAtendimentoCorretoSim);
          'N': inc(relatorio.relOcorrencia[posicaoPeriodo].medidorProcessos.contAtendimentoCorretoNao);
        end;

      end;
      { controle da quantidade de tipos de ocorrencia }
      if posicaoIndicador > relatorio.quantTipoOcorrencia then
        relatorio.quantTipoOcorrencia:=posicaoIndicador;

      DM.cdsGeradorRelatorio.Next;
    end;
  end;
end;

procedure TFRelatorio.btnLimparClick(Sender: TObject);
begin
  limpaEdit;

  paramRelatorio.limparDados;
  carregarOpcoesDeConsulta;
  btnProcessar.Enabled:=True;
  rbtStatusTodos.Checked:=True;
  rbtSolucionadorTodos.Checked:=True;
  rdbDistritoTodos.Checked:=True;
  rdbRepresentanteTodos.Checked:=True;
  rdbAreaOrigemTodos.Checked:=True;
  ckbOcorrenciaTodos.Checked:=True;
  ckxRelatorioTodos.Checked:=False;
  ckxRelatorioListaOcorrencia.Checked:=True;
  rdbClienteCodigo.Checked:=False;
  rdbClienteRede.Checked:=False;
  rdbMercadoriaTodos.Checked:=True;
  rdbMercadoriaIndividual.Checked:=False;
  rbtEntregadorTodos.Checked:=True;
  rbtEntregadorIndividual.Checked:=False;
  pctOcorrencia.ActivePage:=tshTipoOcorrencia;
  _chkOcorrenciaForadePrazo.Checked:=false;

  carregarListaTipoOcorrencia;
  DM.carregarListaRedeCliente(False);
  DM.sqlRelatorio.Close;
  DM.cdsListaGerenteDepto.Close;
  DM.cdsListaSupervisorArea.Close;
  DM.sqlListaEntregador.Close;
  Application.ProcessMessages;
end;

procedure TFRelatorio.configurarGridRelatorio;
begin
  dbgRelatorio.Columns.Items[0].Title.Caption:='Empresa';
  dbgRelatorio.Columns.Items[0].Width:=100;
  dbgRelatorio.Columns.Items[1].Title.Caption:='Ocorrência';
  dbgRelatorio.Columns.Items[2].Title.Caption:='Item';
  dbgRelatorio.Columns.Items[3].Title.Caption:='Data Registro';
  dbgRelatorio.Columns.Items[4].Title.Caption:='Codigo';
  dbgRelatorio.Columns.Items[4].Width:=50;
  dbgRelatorio.Columns.Items[5].Title.Caption:='Digito';
  dbgRelatorio.Columns.Items[5].Width:=50;
  dbgRelatorio.Columns.Items[6].Title.Caption:='Razão Social';
  dbgRelatorio.Columns.Items[7].Title.Caption:='Setor';
  dbgRelatorio.Columns.Items[8].Title.Caption:='Entregador';
  dbgRelatorio.Columns.Items[9].Title.Caption:='Etiqueta de Entrega';
  dbgRelatorio.Columns.Items[9].Width:=100;
  dbgRelatorio.Columns.Items[10].Title.Caption:='Cidade';
  dbgRelatorio.Columns.Items[10].Width:=300;
  dbgRelatorio.Columns.Items[11].Title.Caption:='UF';
  dbgRelatorio.Columns.Items[12].Title.Caption:='Contato';
  dbgRelatorio.Columns.Items[12].Width:=150;
  dbgRelatorio.Columns.Items[13].Title.Caption:='Codigo Rede';
  dbgRelatorio.Columns.Items[13].Width:=50;
  dbgRelatorio.Columns.Items[14].Title.Caption:='Nome da Rede';
  dbgRelatorio.Columns.Items[15].Title.Caption:='Área de Origem';
  dbgRelatorio.Columns.Items[15].Width:=100;
  dbgRelatorio.Columns.Items[16].Title.Caption:='Tipo de Ocorrência';
  dbgRelatorio.Columns.Items[17].Title.Caption:='SubTipo';
  dbgRelatorio.Columns.Items[18].Title.Caption:='Solucionador';
  dbgRelatorio.Columns.Items[19].Title.Caption:='Descrição';
  dbgRelatorio.Columns.Items[20].Title.Caption:='Prioridade';
  dbgRelatorio.Columns.Items[21].Title.Caption:='Status da Solução';
  dbgRelatorio.Columns.Items[22].Title.Caption:='Status da Causa';
  dbgRelatorio.Columns.Items[23].Title.Caption:='Solução';
  dbgRelatorio.Columns.Items[23].Width:=150;
  dbgRelatorio.Columns.Items[24].Title.Caption:='Causa';
  dbgRelatorio.Columns.Items[24].Width:=150;
  dbgRelatorio.Columns.Items[25].Title.Caption:='Data Limite';
  dbgRelatorio.Columns.Items[25].Width:=100;
  dbgRelatorio.Columns.Items[26].Title.Caption:='Empresa NFe';
  dbgRelatorio.Columns.Items[26].Width:=100;
  dbgRelatorio.Columns.Items[27].Title.Caption:='NFe';
  dbgRelatorio.Columns.Items[28].Title.Caption:='Serie';
  dbgRelatorio.Columns.Items[29].Title.Caption:='Data da Emissão';
  dbgRelatorio.Columns.Items[29].Width:=100;
  dbgRelatorio.Columns.Items[30].Title.Caption:='Origem do Pedido';
  dbgRelatorio.Columns.Items[31].Title.Caption:='Codigo do Produto';
  dbgRelatorio.Columns.Items[31].Width:=50;
  dbgRelatorio.Columns.Items[32].Title.Caption:='Digito do Produto';
  dbgRelatorio.Columns.Items[32].Width:=50;
  dbgRelatorio.Columns.Items[33].Title.Caption:='Nome do Produto';
  dbgRelatorio.Columns.Items[34].Title.Caption:='Apresentação';
  dbgRelatorio.Columns.Items[35].Title.Caption:='Quantidade';
  dbgRelatorio.Columns.Items[36].Title.Caption:='Prazo de Validade';
  dbgRelatorio.Columns.Items[37].Title.Caption:='Lote';
  dbgRelatorio.Columns.Items[38].Title.Caption:='Data de Validade';
  dbgRelatorio.Columns.Items[38].Width:=100;
  dbgRelatorio.Columns.Items[39].Title.Caption:='Tipo de Mercadoria';
  dbgRelatorio.Columns.Items[40].Title.Caption:='Divisão (laboratorio) ';
  dbgRelatorio.Columns.Items[41].Title.Caption:='Digitador';
  dbgRelatorio.Columns.Items[42].Title.Caption:='Operação Logistica';
  dbgRelatorio.Columns.Items[43].Title.Caption:='Origem do Contato(Meio)';

  dbgRelatorio.Columns.Items[44].Title.Caption:='Situação da Embalagem';
  dbgRelatorio.Columns.Items[45].Title.Caption:='Transportador';
  dbgRelatorio.Columns.Items[46].Title.Caption:='Transbordo';
  dbgRelatorio.Columns.Items[47].Title.Caption:='Codigo Empresa NFe';
  dbgRelatorio.Columns.Items[48].Title.Caption:='Codigo Tipo Ocorrência';
  dbgRelatorio.Columns.Items[49].Title.Caption:='Codigo SubTipo Ocorrência';
  dbgRelatorio.Columns.Items[50].Title.Caption:='Codigo Solução';
  dbgRelatorio.Columns.Items[51].Title.Caption:='Codigo Causa';
  dbgRelatorio.Columns.Items[52].Title.Caption:='Codigo SubTipo Solução';
  dbgRelatorio.Columns.Items[53].Title.Caption:='Codigo SubTipo Causa';
  dbgRelatorio.Columns.Items[54].Title.Caption:='Codigo Tipo Produto';
  dbgRelatorio.Columns.Items[55].Title.Caption:='Codigo Empresa';
  dbgRelatorio.Columns.Items[56].Title.Caption:='Codigo Solucionador';
  dbgRelatorio.Columns.Items[57].Title.Caption:='Codigo Status Solução';
  dbgRelatorio.Columns.Items[58].Title.Caption:='Codigo Area de Origem';
  dbgRelatorio.Columns.Items[59].Title.Caption:='Prazo Limite';
  dbgRelatorio.Columns.Items[60].Title.Caption:='Observação Solução';
  dbgRelatorio.Columns.Items[61].Title.Caption:='ID Filmagem';
  dbgRelatorio.Columns.Items[62].Title.Caption:='ID Filmagem Visivel';
  dbgRelatorio.Columns.Items[63].Title.Caption:='Camera';
  dbgRelatorio.Columns.Items[64].Title.Caption:='Codigo Conferente';
  dbgRelatorio.Columns.Items[65].Title.Caption:='ID Confere Estoque';
  dbgRelatorio.Columns.Items[66].Title.Caption:='ID Situação Estoque';
  dbgRelatorio.Columns.Items[67].Title.Caption:='ID Gravaçao Televendas';
  dbgRelatorio.Columns.Items[68].Title.Caption:='Data Registro Solução';
  dbgRelatorio.Columns.Items[69].Title.Caption:='ID Atendimento';
  dbgRelatorio.Columns.Items[70].Title.Caption:='Codigo Situação Embalagem';
  dbgRelatorio.Columns.Items[71].Title.Caption:='Observação Causa';
  dbgRelatorio.Columns.Items[72].Title.Caption:='Data Registro Causa';
  dbgRelatorio.Columns.Items[73].Title.Caption:='Descrição da Ação Tomada';
  dbgRelatorio.Columns.Items[74].Title.Caption:='Data Atualização';
  dbgRelatorio.Columns.Items[75].Title.Caption:='Nome usuario';
  dbgRelatorio.Columns.Items[76].Title.Caption:='Transportador - Causa';
  dbgRelatorio.Columns.Items[77].Title.Caption:='Transportador - Solução';
  dbgRelatorio.Columns.Items[78].Title.Caption:='Codigo Status Causa';
  dbgRelatorio.Columns.Items[79].Title.Caption:='Codigo Prioridade';
  dbgRelatorio.Columns.Items[80].Title.Caption:='Recorrencia';
  dbgRelatorio.Columns.Items[81].Title.Caption:='Descrição da Recorrencia';
  dbgRelatorio.Columns.Items[82].Title.Caption:='ID Tipo Recorrencia';
  dbgRelatorio.Columns.Items[83].Title.Caption:='Data Registro';
  dbgRelatorio.Columns.Items[84].Title.Caption:='Data Registro da Recorrencia';
  dbgRelatorio.Columns.Items[85].Title.Caption:='Canal de Venda';
  dbgRelatorio.Columns.Items[86].Title.Caption:='Valor unitario';


  Application.ProcessMessages;
end;

procedure TFRelatorio.btnProcessarClick(Sender: TObject);
begin
  Screen.Cursor:=crSQLWait;
  try
    try
      StatusBar1.SimpleText:=' Consultando informações, aguarde...';
      Application.ProcessMessages;

      { parametros }
      carregarParametroConsulta;

      { executa consulta }
      processarRelatorio;
      configurarGridRelatorio;

      if DM.sqlRelatorio.IsEmpty then
        Application.MessageBox('Nenhum registro foi localizado.','Resultado da pesquisa',0 + 64)
      else
        btnProcessar.Enabled:=False;

      if not DM.sqlRelatorio.IsEmpty then
      begin
        if ckxRelatorioListaOcorrencia.Checked then
        begin
          StatusBar1.SimpleText:=' Gerando planilha - Geral...';
          Application.ProcessMessages;
          geraPlanilhaGeral;
        end;

        if ckxRelatorioControleOcorrencia.Checked then
        begin
          StatusBar1.SimpleText:=' Gerando planilha - Controle de Ocorrências...';
          Application.ProcessMessages;
          DM.ordenarDadosRelatorio(0);
          carregarDadosRelatorioSubTipoOcorrencia;
          geraPlanilhaOcorrenciaSAC;
        end;

        if ckxRelatorioControleSolucao.Checked then
        begin
          StatusBar1.SimpleText:=' Gerando planilha - Solução de Ocorrências...';
          Application.ProcessMessages;
          DM.ordenarDadosRelatorio(1);
          carregarDadosRelatorioSolucaoOcorrencia;
          geraPlanilhaSolucaoSAC;
        end;

        if ckxRelatorioControleCausa.Checked then
        begin
          StatusBar1.SimpleText:=' Gerando planilha - Causa de Ocorrências...';
          Application.ProcessMessages;
          DM.ordenarDadosRelatorio(2);
          carregarDadosRelatorioCausaOcorrencia;
          geraPlanilhaCausaSAC;
        end;

        if ckxRelatorioIndicadores.Checked then
        begin
          StatusBar1.SimpleText:=' Gerando planilha - Indicadores de Processos...';
          Application.ProcessMessages;
          DM.ordenarDadosRelatorio(0);
          carregarDadosRelatorioIndicadorDeProcessos;
          geraPlanilhaIndicadorDeProcessos;
        end;

        StatusBar1.SimpleText:='Planilhas geradas com sucesso!';
        Application.ProcessMessages;
      end;
    except
      on E:Exception do
        raise Exception.CreateFmt('Erro ao gerar relatórios. Detalhes: %s',[E.Message]);
    end;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFRelatorio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.carregaSubTipoOcorrencia(False,'');
  FRelatorio:=nil;
  Action:=caFree;
end;

procedure TFRelatorio.carregarOpcoesDeConsulta;
begin
  dpkDataInicial.Date:=getDataInicioMes(Date);
  dpkDataFinal.Date:=Date;
  dpkDataLimiteSolucao.Date:=Date;
  DM.carregarListaEmpresa(True);
  dblkListaEmpresa.KeyValue:=0;
  pctOcorrencia.ActivePage:=tshTipoOcorrencia;
  Application.ProcessMessages;
end;

procedure TFRelatorio.FormCreate(Sender: TObject);
begin
  paramRelatorio.limparDados;
  carregarOpcoesDeConsulta;
  DM.carregaSolucionador(True);
end;

procedure TFRelatorio.processarRelatorio;
var
  sqlTxt: TStringList;
  teste: string;
begin
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT ');
    sqlTxt.Add('EMPRESA.NM_EMPRESA dsEmpresaItem,');
    sqlTxt.Add('ITEM.CD_OCORRENCIA cdOcorrencia,');
    sqlTxt.Add('ITEM.CD_ITEM_OCORRENCIA nrSequencia,');
    sqlTxt.Add('to_char(OC.DT_RE_OCORRENCIA,''DD/MM/YYYY'') dtRegistro,');
    sqlTxt.Add('OC.CD_CLIENTE codigoCliente,');
    sqlTxt.Add('CLIENTE.DIGC_C digitoCliente,');
    sqlTxt.Add('PES_CLIENTE.NOMP_P razaoSocial,');
    sqlTxt.Add('ITEM.CD_SETOR cdSetor,');
    sqlTxt.Add('ENTREGADOR.DS_TRANSPORTADOR||'' [ '' || ENTREGA.CD_ENTREGA || '' ] '' ENTREGADOR , ENTREGA.DS_ETIQUETA Etiqueta,');
    sqlTxt.Add('ENDERECO.NM_CIDADE cidade,');
    sqlTxt.Add('ENDERECO.ID_ESTADO UF,');
    sqlTxt.Add('OC.DS_CONTATO dsContato,');
    sqlTxt.Add('NROT_T codigoRede,SIGT_T dsRede,');
    sqlTxt.Add('ORIGEM.DS_AREA_ORIGEM dsAreaOrigem,');
    sqlTxt.Add('TIPO.NM_TIPO_OCORRENCIA dsTipoOcorrencia,');
    sqlTxt.Add('SUB_TIPO.NM_SUBTIPO_OCORRENCIA dsSubTipoOcorrencia,');
    sqlTxt.Add('USUARIO_S.NM_SOLUCIONADOR nomeSolucionador,');
    sqlTxt.Add('ITEM.DS_ITEM_OCORRENCIA descricaoOcorrencia,');
    sqlTxt.Add('CASE');
    sqlTxt.Add('  WHEN OC.CD_PR_OCORRENCIA = 1 THEN ''NORMAL''');
    sqlTxt.Add('  WHEN OC.CD_PR_OCORRENCIA = 2 THEN ''ALTA PRIORIDADE''');
    sqlTxt.Add('END dsPrioridade,');
    sqlTxt.Add('CASE');
    sqlTxt.Add('  WHEN  ITEM.CD_ST_SOLUCAO_ITEM_OCORRENCIA = 1 THEN ''PENDENTE''');
    sqlTxt.Add('  WHEN ITEM.CD_ST_SOLUCAO_ITEM_OCORRENCIA = 2  THEN ''FINALIZADO''');
    sqlTxt.Add('  WHEN ITEM.CD_ST_SOLUCAO_ITEM_OCORRENCIA = 4  THEN ''CANCELADO''');
    sqlTxt.Add('END dsStatusSolucao,');
    sqlTxt.Add('CASE');
    sqlTxt.Add('  WHEN ITEM.CD_ST_CAUSA_ITEM_OCORRENCIA = 1 THEN ''PENDENTE''');
    sqlTxt.Add('  WHEN ITEM.CD_ST_CAUSA_ITEM_OCORRENCIA = 2 THEN ''NAO NECESSITA CAUSA''');
    sqlTxt.Add('  WHEN ITEM.CD_ST_CAUSA_ITEM_OCORRENCIA = 3 THEN ''FINALIZADO''');
    sqlTxt.Add('  WHEN ITEM.CD_ST_CAUSA_ITEM_OCORRENCIA = 4 THEN ''CANCELADO''');
    sqlTxt.Add('END dsStatusCausa,');


    sqlTxt.Add('CASE');
    sqlTxt.Add('WHEN ITEM.CD_ST_SOLUCAO_ITEM_OCORRENCIA = 4 THEN ''CANCELADA'' ');
    sqlTxt.Add('  ELSE Nvl(DESC_SOLUCAO.DS_SOLUCAO,''SOLUCAO EM ABERT0'') END dsSolucao,');

    sqlTxt.Add('CASE');
    sqlTxt.Add('WHEN ITEM.CD_ST_CAUSA_ITEM_OCORRENCIA = 4 THEN ''CANCELADA'' ');
    sqlTxt.Add('  ELSE Nvl(DESC_CAUSA.DS_CAUSA,''CAUSA EM ABERTO'') END dsCausa,');

    sqlTxt.Add('TO_DATE(ITEM.DT_LIMITE_SOLUCAO,''DD/MM/YYYY'') dataLimite,');
    sqlTxt.Add('EMPRESA_NFE.NM_EMPRESA dsEmpresaNFe,');
    sqlTxt.Add('ITEM.NR_NFE_ITEM_OCORRENCIA nrNFe,');
    sqlTxt.Add('ITEM.NR_SERIE_NFE nrSerieNFe,');
    sqlTxt.Add('TO_DATE(ITEM.DT_EMISSAO_NF_ITEM_OCORRENCIA,''DD/MM/YYYY'') dataEmissao,');
    sqlTxt.Add('TRANSM.DS_MEIO_TRANSMISSAO Origem,');
    sqlTxt.Add('NVL(MERC.CD_MERCADORIA,''0'') cdProduto,');
    sqlTxt.Add('NVL(NR_DV_MERCADORIA,''0'') digitoProduto,');
    sqlTxt.Add('NVL(MERC.NM_MERCADORIA,''NENHUM PRODUTO ESPECIFICO VINCULADO'') nomeProduto,');
    sqlTxt.Add('NVL(MERC.DS_APRESENTACAO_MERCADORIA,'''') apresentacaoProduto,');
    sqlTxt.Add('ITEM.QT_PRODUTO_ITEM_OCORRENCIA quantProduto,');

    sqlTxt.Add('ITEM.PR_VAL_PRODUTO_ITEM_OCORRENCIA prazoValidade,');
    sqlTxt.Add('NVL(ITEM.DS_LOTE_ITEM_OCORRENCIA,''SEM TRATAMENTO'') loteProduto,');
    sqlTxt.Add('TO_DATE(ITEM.DT_VAL_PRODUTO_ITEM_OCORRENCIA,''DD/MM/YYYY'') dataValidadeProduto,');
    sqlTxt.Add('ds_Tipo_Mercadoria dsTipoMercadoria,');
    sqlTxt.Add('ds_grupo_fornecedor dsGrupoFornecedor,');
    sqlTxt.Add('ITEM.DS_DIGITADOR_PEDIDO dsDigitadorPedido,');
    sqlTxt.Add('ol.ds_operador_logistico||'' [ ''||nvl(ol.cd_operador_logistico,0) ||'' ] '' operacaoLogistica, ');
    sqlTxt.Add('Nvl(MC.DS_MEIO_CONTATO,'' '') dsMeioContato, ');
    sqlTxt.Add('EMB.DS_SITUACAO_EMBALAGEM dsSituacaoEmbalagem,');
    sqlTxt.Add('NVL(PESSOA.NOMP_P,TRANSP.DS_TRANSPORTADOR) nomeTransportador,');
    sqlTxt.Add('ITEM.DS_TRANSBORDO_VIAGEM dsTransbordoCarga,');
    sqlTxt.Add('ITEM.ID_EMPRESA_NFE_ITEM_OCORRENCIA idEmpresaNFe,');
    sqlTxt.Add('ITEM.CD_TIPO_OCORRENCIA cdTipoOcorrencia,');
    sqlTxt.Add('ITEM.CD_SUBTIPO_OCORRENCIA cdSubTipoOcorrencia,');
    sqlTxt.Add('Nvl(DESC_SOLUCAO.CD_SOLUCAO,0) cdSolucao,');
    sqlTxt.Add('Nvl(DESC_CAUSA.CD_CAUSA,0) cdCausa,');
    sqlTxt.Add('Nvl(SOLUCAO.CD_SUBTIPO_SOLUCAO,0) cdSubTipoSolucao,');
    sqlTxt.Add('Nvl(SOLUCAO.CD_SUBTIPO_CAUSA,0) cdSubTipoCausa,');
    sqlTxt.Add('ITEM.TP_PRODUTO_ITEM_OCORRENCIA cdTipoProduto,');
    sqlTxt.Add('ITEM.CD_EMPRESA_ITEM_OCORRENCIA cdEmpresa,');
    sqlTxt.Add('ITEM.NR_MATRIC_SOLUCIONADOR cdSolucionador,');
    sqlTxt.Add('ITEM.CD_ST_SOLUCAO_ITEM_OCORRENCIA cdStatusSolucao,');
    sqlTxt.Add('ITEM.CD_AREA_ORIGEM cdAreaOrigem,');
    sqlTxt.Add('ROUND((ITEM.DT_LIMITE_SOLUCAO - SYSDATE),2) prazoLimite,');
    sqlTxt.Add('Nvl(SOLUCAO.DS_SOLUCAO_ITEM_OCORRENCIA,'' '') obsSolucao,');
    sqlTxt.Add('Nvl(SOLUCAO.ID_FILMAGEM_ITEM_OCORRENCIA,''Z'') idExisteFilmagem,');
    sqlTxt.Add('Nvl(SOLUCAO.ID_VISIVEL_ITEM_OCORRENCIA,''Z'') idFilmagemVisivel,');
    sqlTxt.Add('Nvl(SOLUCAO.NR_CAMERA,0) nrCamera,');
    sqlTxt.Add('Nvl(SOLUCAO.CD_CONFERENTE,0)  cdConferente,');
    sqlTxt.Add('Nvl(SOLUCAO.ID_CONTA_ESTOQUE,''Z'') idConfereEstoque,');
    sqlTxt.Add('Nvl(SOLUCAO.ID_RESULTADO_ESTOQUE,''0'') idSituacaoEstoque,');
    sqlTxt.Add('Nvl(SOLUCAO.ID_GRAVACAO_TLV,''Z'') idGravacaoTlv,');
    sqlTxt.Add('Nvl(SOLUCAO.DT_SOLUCAO_ITEM_OCORRENCIA,NULL) dataRegistroSolucao,');
    sqlTxt.Add('Nvl(SOLUCAO.ID_RESULTADO_GRAVACAO_TLV,''0'') idAtendimentoCorreto,');
    sqlTxt.Add('Nvl(SOLUCAO.CD_SITUACAO_EMBALAGEM,0) cdSituacaoEmbalagem,');
    sqlTxt.Add('Nvl(SOLUCAO.DS_CAUSA_ITEM_OCORRENCIA,'' '') obsCausa,');
    sqlTxt.Add('Nvl(SOLUCAO.DT_CAUSA_ITEM_OCORRENCIA,NULL) dataRegistroCausa,');
    sqlTxt.Add('Nvl(SOLUCAO.DS_ACAO_CAUSA,'' '') dsAcaoTomada,');
    sqlTxt.Add('Nvl(SOLUCAO.DT_ATUALIZACAO,NULL) dataAtualizacao,');
    sqlTxt.Add('Nvl(SOLUCAO.NM_USUARIO,'' '') nomeUsuario,');
    sqlTxt.Add('Nvl(SOLUCAO.DS_TRANSP_RESP_CAUSA,'' '') dsTranspCausa,');
    sqlTxt.Add('Nvl(SOLUCAO.DS_TRANSP_RESP_SOLUCAO,'' '') dsTranspSolucao,');
    sqlTxt.Add('ITEM.CD_ST_CAUSA_ITEM_OCORRENCIA cdStatusCausa,');
    sqlTxt.Add('OC.CD_PR_OCORRENCIA idPrioridade,');
    sqlTxt.Add('Nvl(REC.CD_RECORRENCIA,0) cdRecorrencia,');
    sqlTxt.Add('Nvl(REC.DS_RECORRENCIA,'' '') dsRecorrencia,');
    sqlTxt.Add('Nvl(REC.ID_TIPO_RECORRENCIA,''I'') idTipoRecorrencia,');
    sqlTxt.Add('to_char(OC.DT_RE_OCORRENCIA,''MM/YYYY'') dataRegistro,');
    sqlTxt.Add('Nvl(REC.DT_RECORRENCIA,NULL) dataRecorrencia, ');
    sqlTxt.Add('Nvl(DESC_SOLUCAO.DS_SOLUCAO,''SOLUCAO EM ABERT0'') dsSolucao1,');
    sqlTxt.Add('Nvl(DESC_CAUSA.DS_CAUSA,''CAUSA EM ABERTO'') dsCausa1,');
    sqlTxt.Add('CANAL.NM_CANAL dsCanal');
    sqlTxt.Add(',NVL(ITEM.VL_UNITARIO,0) valorItemUnitario');


    sqlTxt.Add('FROM GAMSAC.DC_SAC_ITEM_OCORRENCIA ITEM ');
    sqlTxt.Add(' JOIN GAMSAC.DC_SAC_OCORRENCIA OC ON ITEM.CD_OCORRENCIA = OC.CD_OCORRENCIA');
    sqlTxt.Add(' LEFT OUTER JOIN PRDDM.DCCLI CLIENTE ON OC.CD_CLIENTE = CLIENTE.NROC_C');
    sqlTxt.Add(' LEFT OUTER JOIN PRDDM.DC_CANAL CANAL ON CLIENTE.CANC_C = CANAL.CD_CANAL');
    sqlTxt.Add(' LEFT OUTER JOIN PRDDM.DCPES PES_CLIENTE ON CLIENTE.CGCP_C = PES_CLIENTE.CGCP_P');
    sqlTxt.Add(' LEFT OUTER JOIN PRDDM.DC_ENDERECO_CLIENTE ENDERECO ON OC.CD_CLIENTE = ENDERECO.CD_CLIENTE');
    sqlTxt.Add(' LEFT OUTER JOIN PRDDM.DC_MEIO_TRANSMISSAO TRANSM ON ITEM.CD_ORIGEM_PEDIDO = TRANSM.CD_MEIO_TRANSMISSAO');
    sqlTxt.Add(' LEFT OUTER JOIN PRDDM.DC_MERCADORIA MERC ON ITEM.CD_PRODUTO_ITEM_OCORRENCIA = MERC.CD_MERCADORIA');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_SITUACAO_EMBALAGEM EMB ON ITEM.CD_SITUACAO_EMBALAGEM = EMB.CD_SITUACAO_EMBALAGEM');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_TIPO_OCORRENCIA TIPO ON ITEM.CD_TIPO_OCORRENCIA = TIPO.CD_TIPO_OCORRENCIA');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_SUBTIPO_OCORRENCIA SUB_TIPO ON ITEM.CD_SUBTIPO_OCORRENCIA = SUB_TIPO.CD_SUBTIPO_OCORRENCIA   AND ITEM.CD_TIPO_OCORRENCIA = SUB_TIPO.CD_TIPO_OCORRENCIA');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_SOLUCIONADOR USUARIO_S ON ITEM.NR_MATRIC_SOLUCIONADOR = USUARIO_S.NR_MATRIC_SOLUCIONADOR');
    sqlTxt.Add(' LEFT OUTER JOIN PRDDM.DC_FRETE_TRANSPORTADOR TRANSP ON ITEM.CD_TRANSPORTADOR = TRANSP.CD_TRANSPORTADOR');
    sqlTxt.Add(' LEFT OUTER JOIN PRDDM.DCPES PESSOA ON TRANSP.NR_CNPJ = PESSOA.CGCP_P');
    sqlTxt.Add(' LEFT OUTER JOIN ACESSO.DC_USUARIO USUARIO_G ON ITEM.NR_MATRIC_GERENTE_SOLUCIONADOR = USUARIO_G.NR_MATRICULA');
    sqlTxt.Add(' LEFT OUTER JOIN PRDDM.DCVEN SETOR ON ITEM.CD_SETOR = SETOR.NROV_V');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_AREA_ORIGEM_OCORRENCIA ORIGEM ON ITEM.CD_AREA_ORIGEM = ORIGEM.CD_AREA_ORIGEM');
    sqlTxt.Add(' LEFT OUTER JOIN ACESSO.DC_EMPRESA EMPRESA ON ITEM.CD_EMPRESA_ITEM_OCORRENCIA = EMPRESA.CD_EMPRESA');
    sqlTxt.Add(' LEFT OUTER JOIN ACESSO.DC_EMPRESA EMPRESA_NFE ON ITEM.ID_EMPRESA_NFE_ITEM_OCORRENCIA = EMPRESA_NFE.CD_EMPRESA');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_SOLUCAO_ITEM_OCORRENCIA SOLUCAO ON ITEM.CD_OCORRENCIA = SOLUCAO.CD_OCORRENCIA AND ITEM.CD_ITEM_OCORRENCIA = SOLUCAO.CD_ITEM_OCORRENCIA');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_RECORRENCIA REC ON ITEM.CD_OCORRENCIA = REC.CD_OCORRENCIA AND ITEM.CD_ITEM_OCORRENCIA = REC.CD_ITEM_OCORRENCIA');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_SUBTIPO_SOLUCAO SUBTIPO_SOLUCAO ON SOLUCAO.CD_SUBTIPO_SOLUCAO = SUBTIPO_SOLUCAO.CD_SUBTIPO_SOLUCAO ');
    sqlTxt.Add('   AND ITEM.CD_SUBTIPO_OCORRENCIA = SUBTIPO_SOLUCAO.CD_SUBTIPO_OCORRENCIA  AND ITEM.CD_TIPO_OCORRENCIA = SUBTIPO_SOLUCAO.CD_TIPO_OCORRENCIA');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_SOLUCAO DESC_SOLUCAO ON SUBTIPO_SOLUCAO.CD_SOLUCAO = DESC_SOLUCAO.CD_SOLUCAO');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_SUBTIPO_CAUSA SUBTIPO_CAUSA ON SOLUCAO.CD_SUBTIPO_CAUSA = SUBTIPO_CAUSA.CD_SUBTIPO_CAUSA AND ITEM.CD_SUBTIPO_OCORRENCIA = SUBTIPO_CAUSA.CD_SUBTIPO_OCORRENCIA AND ITEM.CD_TIPO_OCORRENCIA = SUBTIPO_CAUSA.CD_TIPO_OCORRENCIA');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_CAUSA DESC_CAUSA ON SUBTIPO_CAUSA.CD_CAUSA = DESC_CAUSA.CD_CAUSA');
    sqlTxt.Add(' JOIN GAMFRETE.DC_ENTREGA ENTREGA ON CLIENTE.CD_ENTREGA_CAMINHAO_SECUNDARIO = ENTREGA.CD_ENTREGA ');
    sqlTxt.Add(' LEFT OUTER JOIN PRDDM.DC_FRETE_TRANSPORTADOR ENTREGADOR ON ENTREGA.CD_TRANSPORTADOR = ENTREGADOR.CD_TRANSPORTADOR' );
    sqlTxt.Add(' JOIN PRDDM.DCTAB REDE ON TIPT_T = ''C'' AND CLIENTE.TIPC_C = REDE.NROT_T ');
    sqlTxt.Add(' LEFT OUTER JOIN PRDDM.DC_TIPO_MERCADORIA TIPO_MERC ON MERC.CD_TIPO_MERCADORIA = TIPO_MERC.CD_TIPO_MERCADORIA ');
    sqlTxt.Add(' LEFT OUTER JOIN PRDDM.DC_COMPRA_MERCADORIA COMPRA_MERC ON MERC.CD_MERCADORIA = COMPRA_MERC.CD_MERCADORIA');
    sqlTxt.Add('   AND EMPRESA.CD_EMPRESA = COMPRA_MERC.CD_EMPRESA');
    sqlTxt.Add(' LEFT OUTER JOIN PRDDM.DC_GRUPO_FORNECEDOR LAB ON COMPRA_MERC.cd_grupo_fornecedor = LAB.cd_grupo_fornecedor');
    sqlTxt.Add(' LEFT OUTER JOIN PRDDM.DC_OPERADOR_LOGISTICO OL ON ITEM.CD_OPERADOR_LOGISTICO = OL.CD_OPERADOR_LOGISTICO ');
    sqlTxt.Add(' LEFT OUTER JOIN GAMSAC.DC_SAC_MEIO_CONTATO MC ON OC.CD_MEIO_CONTATO = MC.CD_MEIO_CONTATO ');

    sqlTxt.Add('WHERE ITEM.CD_OCORRENCIA > 0 ');
    sqlTxt.Add('AND TRUNC(OC.DT_RE_OCORRENCIA) BETWEEN :DT_INICIAL AND :DT_FINAL');
    if paramRelatorio.cdEmpresa > 0 then
      sqlTxt.Add('AND ITEM.CD_EMPRESA_ITEM_OCORRENCIA = :CD_EMPRESA');
    if paramRelatorio.cdSolucionador > 0 then
      sqlTxt.Add('AND ITEM.NR_MATRIC_SOLUCIONADOR = :CD_SOLUCIONADOR');
    if paramRelatorio.cdSuperiorSolucionador > 0 then
      sqlTxt.Add('AND ( ITEM.NR_MATRIC_GERENTE_SOLUCIONADOR = :NR_MATRIC_GERENTE_SOLUCIONADOR OR ITEM.NR_MATRIC_SOLUCIONADOR = :NR_MATRIC_GERENTE_SOLUCIONADOR )');
    if paramRelatorio.cdGerenteDepartamento > 0 then
      sqlTxt.Add('AND ( ITEM.NR_MATRIC_GERENTE_SOLUCIONADOR = :NR_MATRIC_GERENTE_SOLUCIONADOR OR ITEM.NR_MATRIC_SOLUCIONADOR = :NR_MATRIC_GERENTE_SOLUCIONADOR )');
    if paramRelatorio.dataLimiteSolucao <> EmptyStr then
      sqlTxt.Add('AND ITEM.DT_LIMITE_SOLUCAO = :DT_LIMITE');
    if paramRelatorio.cdDistrito > 0 then
      sqlTxt.Add('AND ITEM.CD_DISTRITO = :CD_DISTRITO');
    if paramRelatorio.cdRepresentante > 0 then
      sqlTxt.Add('AND ITEM.CD_SETOR = :CD_SETOR');
    if paramRelatorio.cdEntregador > 0 then
      sqlTxt.Add('AND CLIENTE.CD_ENTREGA_CAMINHAO_SECUNDARIO = :CD_ENTREGA_CAMINHAO_SECUNDARIO');
    if paramRelatorio.cdAreaOrigem > 0 then
      sqlTxt.Add('AND ITEM.CD_AREA_ORIGEM = :CD_AREA_ORIGEM');
    if paramRelatorio.cdCliente > 0 then
      sqlTxt.Add('AND OC.CD_CLIENTE = :CD_CLIENTE');
    if paramRelatorio.cdRede > 0 then
      sqlTxt.Add('AND CLIENTE.TIPC_C = :REDE');

    if paramRelatorio.dsTipoOcorrencia <> EmptyStr then
      sqlTxt.Add('AND ITEM.CD_TIPO_OCORRENCIA in ( '+ paramRelatorio.dsTipoOcorrencia +' ) ');
    if paramRelatorio.dsSubTipoOcorrencia <> EmptyStr then
      sqlTxt.Add('AND ITEM.CD_SUBTIPO_OCORRENCIA in ('+ paramRelatorio.dsSubTipoOcorrencia +') ');
    if paramRelatorio.dsSubTipoSolucao <> EmptyStr then
      sqlTxt.Add('AND SOLUCAO.CD_SUBTIPO_SOLUCAO in ('+paramRelatorio.dsSubTipoSolucao+') ');
    if paramRelatorio.dsSubTipoCausa <> EmptyStr then
      sqlTxt.Add('AND SOLUCAO.CD_SUBTIPO_CAUSA in ('+paramRelatorio.dsSubTipoCausa+') ');

    if paramRelatorio.cdMercadoria > 0 then
      sqlTxt.Add('AND ITEM.CD_PRODUTO_ITEM_OCORRENCIA = :CD_PRODUTO_ITEM_OCORRENCIA');

    if paramRelatorio.dsOcorrenciaForadePrazo<>'' then
       sqlTxt.Add('AND ID_REGISTRO_FORA_PRAZO=''S''');

    case paramRelatorio.cdStatus of
      1: sqlTxt.Add('AND (ITEM.CD_ST_SOLUCAO_ITEM_OCORRENCIA = 1 AND ITEM.CD_ST_CAUSA_ITEM_OCORRENCIA = 1) ');
      2: sqlTxt.Add('AND (ITEM.CD_ST_SOLUCAO_ITEM_OCORRENCIA = 2 AND ITEM.CD_ST_CAUSA_ITEM_OCORRENCIA = 1) ');
      3: sqlTxt.Add('AND (ITEM.CD_ST_SOLUCAO_ITEM_OCORRENCIA = 2 AND ITEM.CD_ST_CAUSA_ITEM_OCORRENCIA = 3) ');
      4: sqlTxt.Add('AND (ITEM.CD_ST_SOLUCAO_ITEM_OCORRENCIA = 4 AND ITEM.CD_ST_CAUSA_ITEM_OCORRENCIA = 4) ');
    end;

    sqlTxt.Add('ORDER BY dataRegistro, cdTipoOcorrencia, cdSubTipoOcorrencia, cdSolucao');

    sqlTxt.SaveToFile('relatorio.sql');

    DM.sqlRelatorio.Close;
    DM.sqlRelatorio.DataSet.CommandText:=sqlTxt.Text;
    DM.sqlRelatorio.DataSet.ParamByName('DT_INICIAL').AsString:=paramRelatorio.dataInicial;
    DM.sqlRelatorio.DataSet.ParamByName('DT_FINAL').AsString:=paramRelatorio.dataFinal;
    if paramRelatorio.cdEmpresa > 0 then
      DM.sqlRelatorio.DataSet.ParamByName('CD_EMPRESA').AsString:=IntToStr(paramRelatorio.cdEmpresa);
    if paramRelatorio.cdSolucionador > 0 then
      DM.sqlRelatorio.DataSet.ParamByName('CD_SOLUCIONADOR').AsString:=IntToStr(paramRelatorio.cdSolucionador);
    if paramRelatorio.cdSuperiorSolucionador > 0 then
      DM.sqlRelatorio.DataSet.ParamByName('NR_MATRIC_GERENTE_SOLUCIONADOR').AsString:=IntToStr(paramRelatorio.cdSuperiorSolucionador);
    if paramRelatorio.cdGerenteDepartamento > 0 then
      DM.sqlRelatorio.DataSet.ParamByName('NR_MATRIC_GERENTE_SOLUCIONADOR').AsString:=IntToStr(paramRelatorio.cdGerenteDepartamento);
    if paramRelatorio.dataLimiteSolucao <> EmptyStr then
      DM.sqlRelatorio.DataSet.ParamByName('DT_LIMITE').AsString:=paramRelatorio.dataLimiteSolucao;
    if paramRelatorio.cdDistrito > 0 then
      DM.sqlRelatorio.DataSet.ParamByName('CD_DISTRITO').AsString:=IntToStr(paramRelatorio.cdDistrito);
    if paramRelatorio.cdRepresentante > 0 then
      DM.sqlRelatorio.DataSet.ParamByName('CD_SETOR').AsString:=IntToStr(paramRelatorio.cdRepresentante);
    if paramRelatorio.cdEntregador > 0 then
      DM.sqlRelatorio.DataSet.ParamByName('CD_ENTREGA_CAMINHAO_SECUNDARIO').AsString:=IntToStr(paramRelatorio.cdEntregador);
    if paramRelatorio.cdAreaOrigem > 0 then
      DM.sqlRelatorio.DataSet.ParamByName('CD_AREA_ORIGEM').AsString:=IntToStr(paramRelatorio.cdAreaOrigem);
    if paramRelatorio.cdCliente > 0 then
      DM.sqlRelatorio.DataSet.ParamByName('CD_CLIENTE').AsString:=IntToStr(paramRelatorio.cdCliente);
    if paramRelatorio.cdRede > 0 then
      DM.sqlRelatorio.DataSet.ParamByName('REDE').AsString:=IntToStr(paramRelatorio.cdRede);
    {
    if paramRelatorio.dsTipoOcorrencia <> EmptyStr then
      DM.sqlRelatorio.DataSet.ParamByName('CD_TIPO_OCORRENCIA').AsString:=paramRelatorio.dsTipoOcorrencia;
    if paramRelatorio.dsSubTipoOcorrencia <> EmptyStr then
      DM.sqlRelatorio.DataSet.ParamByName('CD_SUBTIPO_OCORRENCIA').AsString:=paramRelatorio.dsSubTipoOcorrencia;
    if paramRelatorio.dsSolucao <> EmptyStr then
      DM.sqlRelatorio.DataSet.ParamByName('CD_ST_SOLUCAO_ITEM_OCORRENCIA').AsString:=paramRelatorio.dsSolucao;
    if paramRelatorio.dsCausa <> EmptyStr then
      DM.sqlRelatorio.DataSet.ParamByName('CD_ST_CAUSA_ITEM_OCORRENCIA').AsString:=paramRelatorio.dsCausa;
    }
    if paramRelatorio.cdMercadoria > 0 then
      DM.sqlRelatorio.DataSet.ParamByName('CD_PRODUTO_ITEM_OCORRENCIA').AsString:=IntToStr(paramRelatorio.cdMercadoria);

    DM.sqlRelatorio.Open;
    if not DM.sqlRelatorio.IsEmpty then
      DM.carregarDataSetGeradorRelatorio;
  finally
    sqlTxt.SaveToFile('teste.sql');
    sqlTxt.Free;
  end;
end;

procedure TFRelatorio.rbtEntregadorIndividualClick(Sender: TObject);
begin
  dblkListaEntregador.SetFocus;
end;

procedure TFRelatorio.rbtEntregadorTodosClick(Sender: TObject);
begin
  DM.sqlListaEntregador.Close;
end;

procedure TFRelatorio.rbtSolucionadorDistritoClick(Sender: TObject);
begin
  DM.execFiltroSolucionador(0,0,'',False,True,True,False);

  dblkListaSolucionador.Enabled:=False;
  dblkListaSolucionadorDistrito.Enabled:=True;
  dblkListaSolucionadorGerente.Enabled:=False;
  dblkListaSolucionadorSupervisor.Enabled:=False;

  dblkListaSolucionadorDistrito.SetFocus;
end;

procedure TFRelatorio.rbtSolucionadorIndividualClick(Sender: TObject);
begin
  DM.execFiltroSolucionador(0,0,'',False,False,True,False);

  dblkListaSolucionador.Enabled:=True;
  dblkListaSolucionadorDistrito.Enabled:=False;
  dblkListaSolucionadorGerente.Enabled:=False;
  dblkListaSolucionadorSupervisor.Enabled:=False;

  dblkListaSolucionador.SetFocus;
end;

procedure TFRelatorio.rbtSolucionadorTodosClick(Sender: TObject);
begin
  DM.cdsSolucionador.Close;
  DM.cdsListaGerenteDepto.Close;
  DM.cdsListaSupervisorArea.Close;
end;

procedure TFRelatorio.rbtStatusIndividualClick(Sender: TObject);
begin
  DM.carregaStatusSolucao(True);
  dblkListaStatus.SetFocus;
end;

procedure TFRelatorio.rbtStatusTodosClick(Sender: TObject);
begin
  DM.cdsStatusSolucao.Close;
end;

procedure TFRelatorio.rdbAreaOrigemIndividualClick(Sender: TObject);
begin
  DM.carregaListaAreaDeOrigem;
  dblkListaAreaOrigem.SetFocus;
end;

procedure TFRelatorio.rdbAreaOrigemTodosClick(Sender: TObject);
begin
  DM.cdsListaAreaOrigem.Close;
end;

procedure TFRelatorio.rdbClienteCodigoClick(Sender: TObject);
begin
  DM.carregarListaRedeCliente(False);
  edtCodigoCliente.SetFocus;
end;

procedure TFRelatorio.rdbClienteRedeClick(Sender: TObject);
begin
  DM.carregarListaRedeCliente(True);
end;

procedure TFRelatorio.rdbDistritoIndividualClick(Sender: TObject);
begin
  edtCodigoDistrito.SetFocus;
end;

procedure TFRelatorio.rdbDistritoTodosClick(Sender: TObject);
begin
  edtCodigoDistrito.Clear;
end;

procedure TFRelatorio.rdbMercadoriaIndividualClick(Sender: TObject);
begin
  edtCodigoMercadoria.SetFocus;
end;

procedure TFRelatorio.rdbMercadoriaTodosClick(Sender: TObject);
begin
  edtCodigoMercadoria.Clear;
end;

procedure TFRelatorio.rdbRepresentanteIndividualClick(Sender: TObject);
begin
  edtCodigoSetor.SetFocus;
end;

procedure TFRelatorio.rdbRepresentanteTodosClick(Sender: TObject);
begin
  edtCodigoSetor.Clear;
end;

procedure TFRelatorio.tshCausaShow(Sender: TObject);
begin
  {
  if cklCausa.Items.Count = 0 then
  begin
    cklCausa.Clear;
    cklCausa.Items.Add('Todos');
    DM.carregaListaCausa(True);

    DM.carregaCausaOcorrencia(True,paramRelatorio.dsTipoOcorrencia,paramRelatorio.dsSubTipoOcorrencia,paramRelatorio.dsCausa);

    DM.cdsCausa.First;
    while not DM.cdsCausa.Eof do
    begin
      cklCausa.Items.Add(format('[%d]%s',[DM.cdsCausaCD_CAUSA.AsInteger,DM.cdsCausaDS_CAUSA.AsString]));

      DM.cdsCausa.Next;
    end;

    cklCausa.CheckAll(cbChecked,True);
  end;
  }
end;

procedure TFRelatorio.tshSolucaoShow(Sender: TObject);
begin
  {
  if ckLSolucao.Items.Count = 0 then
  begin
    ckLSolucao.Clear;
    ckLSolucao.Items.Add('Todos');

    DM.carregaSolucaoOcorrencia(True,paramRelatorio.dsTipoOcorrencia,paramRelatorio.dsSubTipoOcorrencia,'');

    DM.cdsSolucao.First;
    while not DM.cdsSolucao.Eof do
    begin
      ckLSolucao.Items.Add(format('[%d]%s',[DM.cdsSolucaoCD_SOLUCAO.AsInteger,DM.cdsSolucaoDS_SOLUCAO.AsString]));

      DM.cdsSolucao.Next;
    end;

    ckLSolucao.CheckAll(cbChecked,True);
  end;
  }
end;

procedure TFRelatorio.tshSubTipoCausaShow(Sender: TObject);
begin
  if cklSubTipoCausa.Items.Count = 0 then
  begin
    cklSubTipoCausa.Clear;
    cklSubTipoCausa.Items.Add('Todos');
    { carrega a lista com base dos parametros de tipo e subtipo de ocorrencia }
    DM.carregaCausaOcorrencia(True,paramRelatorio.dsTipoOcorrencia,paramRelatorio.dsSubTipoOcorrencia,'');

    DM.cdsCausa.First;
    while not DM.cdsCausa.Eof do
    begin
      cklSubTipoCausa.Items.Add(format('[%d]%s',[DM.cdsCausaCD_SUBTIPO_CAUSA.AsInteger,DM.cdsCausaDS_CAUSA.AsString]));

      DM.cdsCausa.Next;
    end;

    cklSubTipoCausa.CheckAll(cbChecked,True);
  end;
end;

procedure TFRelatorio.tshSubTipoOcorrenciaShow(Sender: TObject);
begin
  if cklSubTipoOcorrencia.Items.Count = 0 then
  begin
    cklSubTipoOcorrencia.Clear;
    cklSubTipoOcorrencia.Items.Add('Todos');
    DM.carregaSubTipoOcorrencia(True,paramRelatorio.dsTipoOcorrencia);

    DM.cdsSubTipoOcorrencia.First;
    while not DM.cdsSubTipoOcorrencia.Eof do
    begin
      cklSubTipoOcorrencia.Items.Add(format('[%d]%s',[DM.cdsSubTipoOcorrenciaCD_SUBTIPO_OCORRENCIA.AsInteger,DM.cdsSubTipoOcorrenciaNM_SUBTIPO_OCORRENCIA.AsString]));

      DM.cdsSubTipoOcorrencia.Next;
    end;
    cklSubTipoOcorrencia.CheckAll(cbChecked,True);
  end;
end;

procedure TFRelatorio.tshSubTipoSolucaoShow(Sender: TObject);
begin
  if cklSubTipoSolucao.Items.Count = 0 then
  begin
    cklSubTipoSolucao.Clear;
    cklSubTipoSolucao.Items.Add('Todos');
    DM.carregaSolucaoOcorrencia(True,paramRelatorio.dsTipoOcorrencia,paramRelatorio.dsSubTipoOcorrencia,'');

    DM.cdsSolucao.First;
    while not DM.cdsSolucao.Eof do
    begin
      cklSubTipoSolucao.Items.Add(format('[%d]%s',[DM.cdsSolucaoCD_SUBTIPO_SOLUCAO.AsInteger,DM.cdsSolucaoDS_SOLUCAO.AsString]));

      DM.cdsSolucao.Next;
    end;

    cklSubTipoSolucao.CheckAll(cbChecked,True);
  end;
end;

procedure TFRelatorio.carregarListaTipoOcorrencia;
begin
  if cklTipoOcorrencia.Items.Count = 0 then
  begin
    ckLTipoOcorrencia.Clear;
    ckLTipoOcorrencia.Items.Add('Todos');
    DM.carregaTipoOcorrencia(True);

    DM.cdsTipoOcorrencia.First;
    while not DM.cdsTipoOcorrencia.Eof do
    begin
      ckLTipoOcorrencia.Items.Add(format('[%d]%s',[DM.cdsTipoOcorrenciaCD_TIPO_OCORRENCIA.AsInteger,DM.cdsTipoOcorrenciaNM_TIPO_OCORRENCIA.AsString]));

      DM.cdsTipoOcorrencia.Next;
    end;
    cklTipoOcorrencia.CheckAll(cbChecked,True);
  end;
end;

procedure TFRelatorio.tshTipoOcorrenciaShow(Sender: TObject);
begin
  carregarListaTipoOcorrencia;
end;

procedure TFRelatorio.rbtSolucionadorGerenteClick(Sender: TObject);
begin
  DM.iniciarListaGerente;

  dblkListaSolucionador.Enabled:=False;
  dblkListaSolucionadorDistrito.Enabled:=False;
  dblkListaSolucionadorGerente.Enabled:=True;
  dblkListaSolucionadorSupervisor.Enabled:=False;

  dblkListaSolucionadorGerente.SetFocus;
end;

procedure TFRelatorio.rbtSolucionadorSupervisorClick(Sender: TObject);
begin
  DM.iniciarListaSupervisorArea;

  dblkListaSolucionador.Enabled:=False;
  dblkListaSolucionadorDistrito.Enabled:=False;
  dblkListaSolucionadorGerente.Enabled:=False;
  dblkListaSolucionadorSupervisor.Enabled:=True;

  dblkListaSolucionadorSupervisor.SetFocus;
end;

function getFormulaSoma(celIni,celFinal:string):string;
begin
  if celIni <> celFinal then
    Result:=format('=SUM(%s:%s)',[celIni,celFinal])
  else
    Result:=format('=SUM(%s)',[celIni]);
end;

procedure TFRelatorio.geraPlanilhaGeral;
const
  ALFA = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  function getNomeCelula(nrLinha,nrColuna:integer):string;
  begin
    Result:=ALFA[nrColuna]+inttostr(nrLinha);
  end;

var
  excel,chart : Olevariant;
  nrLinha: integer;

begin
  try
    excel:=CreateOleObject('excel.application');
    excel.workBooks.Add;
    Excel.Application.Visible:= true;
    nrLinha:=1;

    Excel.workBooks[1].Sheets[1].name:='Relação de Ocorrências';
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,1]:=dbgRelatorio.Columns.Items[0].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,2]:=dbgRelatorio.Columns.Items[1].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,3]:=dbgRelatorio.Columns.Items[2].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,4]:=dbgRelatorio.Columns.Items[3].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,5]:=dbgRelatorio.Columns.Items[4].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,6]:=dbgRelatorio.Columns.Items[5].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,7]:=dbgRelatorio.Columns.Items[6].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,8]:=dbgRelatorio.Columns.Items[7].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,9]:=dbgRelatorio.Columns.Items[8].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,10]:=dbgRelatorio.Columns.Items[9].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,11]:=dbgRelatorio.Columns.Items[10].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,12]:=dbgRelatorio.Columns.Items[11].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,13]:=dbgRelatorio.Columns.Items[12].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,14]:=dbgRelatorio.Columns.Items[13].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,15]:=dbgRelatorio.Columns.Items[14].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,16]:=dbgRelatorio.Columns.Items[15].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,17]:=dbgRelatorio.Columns.Items[16].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,18]:=dbgRelatorio.Columns.Items[17].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,19]:=dbgRelatorio.Columns.Items[18].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,20]:=dbgRelatorio.Columns.Items[19].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,21]:=dbgRelatorio.Columns.Items[20].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,22]:=dbgRelatorio.Columns.Items[21].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,23]:=dbgRelatorio.Columns.Items[22].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,24]:=dbgRelatorio.Columns.Items[23].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,25]:=dbgRelatorio.Columns.Items[24].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,26]:=dbgRelatorio.Columns.Items[25].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,27]:=dbgRelatorio.Columns.Items[26].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,28]:=dbgRelatorio.Columns.Items[27].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,29]:=dbgRelatorio.Columns.Items[28].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,30]:=dbgRelatorio.Columns.Items[29].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,31]:=dbgRelatorio.Columns.Items[30].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,32]:=dbgRelatorio.Columns.Items[31].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,33]:=dbgRelatorio.Columns.Items[32].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,34]:=dbgRelatorio.Columns.Items[33].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,35]:=dbgRelatorio.Columns.Items[34].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,36]:=dbgRelatorio.Columns.Items[35].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,37]:=dbgRelatorio.Columns.Items[36].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,38]:=dbgRelatorio.Columns.Items[37].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,39]:=dbgRelatorio.Columns.Items[38].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,40]:=dbgRelatorio.Columns.Items[39].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,41]:=dbgRelatorio.Columns.Items[40].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,42]:=dbgRelatorio.Columns.Items[41].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,43]:=dbgRelatorio.Columns.Items[42].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,44]:=dbgRelatorio.Columns.Items[43].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,45]:=dbgRelatorio.Columns.Items[44].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,46]:=dbgRelatorio.Columns.Items[45].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,47]:=dbgRelatorio.Columns.Items[46].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,48]:=dbgRelatorio.Columns.Items[47].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,49]:=dbgRelatorio.Columns.Items[48].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,50]:=dbgRelatorio.Columns.Items[49].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,51]:=dbgRelatorio.Columns.Items[50].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,52]:=dbgRelatorio.Columns.Items[51].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,53]:=dbgRelatorio.Columns.Items[52].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,54]:=dbgRelatorio.Columns.Items[53].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,55]:=dbgRelatorio.Columns.Items[54].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,56]:=dbgRelatorio.Columns.Items[55].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,57]:=dbgRelatorio.Columns.Items[56].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,58]:=dbgRelatorio.Columns.Items[68].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,59]:=dbgRelatorio.Columns.Items[85].Title.Caption;
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,60]:=dbgRelatorio.Columns.Items[86].Title.Caption;

    DM.sqlRelatorio.First;
    DM.sqlRelatorio.DisableControls;
    while not DM.sqlRelatorio.Eof do
    begin
      inc(nrLinha);
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,1]:=DM.sqlRelatorio.FieldByName('dsEmpresaItem').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,2]:=DM.sqlRelatorio.FieldByName('cdOcorrencia').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,3]:=DM.sqlRelatorio.FieldByName('nrSequencia').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,4]:=DM.sqlRelatorio.FieldByName('dtRegistro').AsDateTime;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,5]:=DM.sqlRelatorio.FieldByName('codigoCliente').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,6]:=DM.sqlRelatorio.FieldByName('digitoCliente').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,7]:=DM.sqlRelatorio.FieldByName('razaoSocial').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,8]:=DM.sqlRelatorio.FieldByName('cdSetor').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,9]:=DM.sqlRelatorio.FieldByName('Entregador').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,10]:=DM.sqlRelatorio.FieldByName('Etiqueta').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,11]:=DM.sqlRelatorio.FieldByName('cidade').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,12]:=DM.sqlRelatorio.FieldByName('UF').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,13]:=DM.sqlRelatorio.FieldByName('dsContato').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,14]:=DM.sqlRelatorio.FieldByName('codigoRede').AsInteger;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,15]:=DM.sqlRelatorio.FieldByName('dsRede').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,16]:=DM.sqlRelatorio.FieldByName('dsAreaOrigem').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,17]:=DM.sqlRelatorio.FieldByName('dsTipoOcorrencia').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,18]:=DM.sqlRelatorio.FieldByName('dsSubTipoOcorrencia').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,19]:=DM.sqlRelatorio.FieldByName('nomeSolucionador').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,20]:=StringReplace(DM.sqlRelatorio.FieldByName('descricaoOcorrencia').AsString,#13,'',[rfReplaceAll]);
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,21]:=DM.sqlRelatorio.FieldByName('dsPrioridade').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,22]:=DM.sqlRelatorio.FieldByName('dsStatusSolucao').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,23]:=DM.sqlRelatorio.FieldByName('dsStatusCausa').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,24]:=DM.sqlRelatorio.FieldByName('dsSolucao').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,25]:=DM.sqlRelatorio.FieldByName('dsCausa').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,26]:=DM.sqlRelatorio.FieldByName('dataLimite').AsDateTime;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,27]:=DM.sqlRelatorio.FieldByName('dsEmpresaNFe').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,28]:=DM.sqlRelatorio.FieldByName('nrNFe').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,29]:=DM.sqlRelatorio.FieldByName('nrSerieNFe').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,30]:=DM.sqlRelatorio.FieldByName('dataEmissao').AsDateTime;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,31]:=DM.sqlRelatorio.FieldByName('Origem').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,32]:=DM.sqlRelatorio.FieldByName('cdProduto').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,33]:=DM.sqlRelatorio.FieldByName('digitoProduto').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,34]:=DM.sqlRelatorio.FieldByName('nomeProduto').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,35]:=DM.sqlRelatorio.FieldByName('apresentacaoProduto').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,36]:=DM.sqlRelatorio.FieldByName('quantProduto').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,37]:=DM.sqlRelatorio.FieldByName('prazoValidade').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,38]:=DM.sqlRelatorio.FieldByName('loteProduto').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,39]:=DM.sqlRelatorio.FieldByName('dataValidadeProduto').AsDateTime;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,40]:=DM.sqlRelatorio.FieldByName('dsTipoMercadoria').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,41]:=DM.sqlRelatorio.FieldByName('dsGrupoFornecedor').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,42]:=DM.sqlRelatorio.FieldByName('dsDigitadorPedido').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,43]:=DM.sqlRelatorio.FieldByName('operacaoLogistica').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,44]:=DM.sqlRelatorio.FieldByName('dsMeioContato').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,45]:=DM.sqlRelatorio.FieldByName('dsSituacaoEmbalagem').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,46]:=DM.sqlRelatorio.FieldByName('nomeTransportador').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,47]:=DM.sqlRelatorio.FieldByName('dsTransbordoCarga').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,48]:=DM.sqlRelatorio.FieldByName('idEmpresaNFe').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,49]:=DM.sqlRelatorio.FieldByName('cdTipoOcorrencia').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,50]:=DM.sqlRelatorio.FieldByName('cdSubTipoOcorrencia').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,51]:=DM.sqlRelatorio.FieldByName('cdSolucao').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,52]:=DM.sqlRelatorio.FieldByName('cdCausa').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,53]:=DM.sqlRelatorio.FieldByName('cdSubTipoSolucao').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,54]:=DM.sqlRelatorio.FieldByName('cdSubTipoCausa').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,55]:=DM.sqlRelatorio.FieldByName('cdTipoProduto').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,56]:=DM.sqlRelatorio.FieldByName('cdEmpresa').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,57]:=DM.sqlRelatorio.FieldByName('cdSolucionador').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,58]:=DM.sqlRelatorio.FieldByName('dataRegistroSolucao').AsDateTime;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,59]:=DM.sqlRelatorio.FieldByName('dsCanal').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,60]:=DM.sqlRelatorio.FieldByName('valorItemUnitario').Asfloat;

      DM.sqlRelatorio.Next;
    end;
    DM.sqlRelatorio.EnableControls;
  except
    on E:Exception do
      raise Exception.CreateFmt('Erro ao gerar planilha. Detalhes: %s .',[E.Message]);

  end;
end;

procedure TFRelatorio.geraPlanilhaOcorrenciaSAC;
const
  ALFA = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  function getNomeCelula(nrLinha,nrColuna:integer):string;
  begin
    Result:=ALFA[nrColuna]+inttostr(nrLinha);
  end;

var
  excel,chart : Olevariant;

  i: integer; { Periodo }
  j: integer;
  l: integer;
  x: integer; { tipo de ocorrencia }
  y: integer; { SubTipo de ocorrencia }
  z: integer;

  { controles }
  dsColuna: string;
  dsNomePlanilha: string;
  dsNomeNovaPlanilha: string;
  dsCelula : string;
  isAchouCelula: Boolean;
  isAchouPlanilha: Boolean;
  nrlinha: integer;
  nrLinha1 : integer;
  nrLinha2 : integer;
  nrLinha3 : integer;
  nrColuna: integer;
  nrPlanilha: integer;
  nrPlanilhaAtual: integer;
  totalDeColunas: integer;

begin
  try
    excel:=CreateOleObject('excel.application');
    excel.workBooks.Add;
    Excel.Application.Visible:= true;

    for I := 1 to 12 do
    begin
      if relatorio.relOcorrencia[i].descricao <> EmptyStr then
      begin
        for x := 1 to 100 do
        begin
          if relatorio.relOcorrencia[i].tipoOcorrencia[x].descricao <> EmptyStr then
            Excel.workBooks[1].Sheets.add
          else
            Break;
        end;
      end
      else
        break;
    end;

    nrLinha1:=1;
    nrPlanilha:=2;

    { periodo }
    { cabeçalho da planilha }
    Excel.workBooks[1].Sheets[1].name:='Visão Geral';
    Excel.workBooks[1].Sheets[1].Cells[nrLinha1,1]:='Periodo';
    Excel.workBooks[1].Sheets[1].Cells[nrLinha1,2]:='Quant';
    Excel.workBooks[1].Sheets[1].range['B1'].font.bold := true;
    Excel.workBooks[1].Sheets[1].range['A1','B1'].Interior.Color:= $00ffcf9c;

    { tipo de ocorrencia }
    { cabeçalho da planilha }
    Excel.workBooks[1].Sheets[2].name:='Tipo de ocorrência';
    Excel.workBooks[1].Sheets[2].Cells[1,1]:='Tipo de Ocorrencia';
    Excel.workBooks[1].Sheets[2].Cells[1,1].Interior.Color:= $00ffcf9c;

    for I := 1 to 12 do
    begin
      if relatorio.relOcorrencia[i].descricao <> EmptyStr then
      begin
        nrColuna:=i + 1;
        inc(nrLinha1);
        Excel.workBooks[1].Sheets[1].Cells[nrLinha1,1]:=relatorio.relOcorrencia[i].descricao;
        Excel.workBooks[1].Sheets[1].Cells[nrLinha1,2]:=relatorio.relOcorrencia[i].total;
        Excel.workBooks[1].Sheets[1].range['A1',getNomeCelula(nrLinha1,1)].Interior.Color:= $00ffcf9c;
        Excel.workBooks[1].Sheets[1].Cells[nrLinha1,1].font.bold := true;
        Excel.workBooks[1].Sheets[1].Range['A1',getNomeCelula(nrLinha1,2)].Borders.LineStyle := 1;

        { tipo de ocorrencia }
        { dados  }
        Excel.workBooks[1].Sheets[2].Cells[1,nrColuna]:=relatorio.relOcorrencia[i].descricao;
        Excel.workBooks[1].Sheets[2].Cells[1,nrColuna].font.bold := true;
        Excel.workBooks[1].Sheets[2].Cells[1,nrColuna].Interior.Color:= $00ffcf9c;
        Excel.workBooks[1].Sheets[2].range['A1'].ColumnWidth :=30;

        { preenche cabeçalhos dos meses }
        totalDeColunas:=0;
        for l:= 1 to 12 do
        begin
          if relatorio.relOcorrencia[l].descricao <> EmptyStr then
          begin
            Excel.workBooks[1].Sheets[2].Cells[1,l+1]:=relatorio.relOcorrencia[l].descricao;
            Excel.workBooks[1].Sheets[2].Cells[1,l+1].font.bold := true;
            Excel.workBooks[1].Sheets[2].Cells[1,l+1].Interior.Color:= $00ffcf9c;
            inc(totalDeColunas);
          end
          else
            break;
        end;

        for x := 1 to 100 do
        begin
          nrLinha2:=1;
          isAchouCelula:=False;
          if relatorio.relOcorrencia[i].tipoOcorrencia[x].descricao <> EmptyStr then
          begin
            inc(nrLinha2);
            dsColuna:='';
            while Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].value <> EmptyStr do
            begin
              dsColuna:=Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1];
              if (dsColuna = relatorio.relOcorrencia[i].tipoOcorrencia[x].descricao) then
              begin
                Excel.workBooks[1].Sheets[2].Cells[nrLinha2,nrColuna]:=relatorio.relOcorrencia[i].tipoOcorrencia[x].total;
                isAchouCelula:=True;
                Break;
              end
              else
              begin
                inc(nrLinha2);
                dsColuna:='';
              end;
            end;

            if ((dsColuna = EmptyStr) or (not isAchouCelula)) then
            begin
              Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1]:=relatorio.relOcorrencia[i].tipoOcorrencia[x].descricao;
              Excel.workBooks[1].Sheets[2].Cells[nrLinha2,nrColuna]:=relatorio.relOcorrencia[i].tipoOcorrencia[x].total;
            end;
            Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].font.bold := true;

            { subtipo de ocorrencia }
            { cabeçalho planilha }
            dsNomeNovaPlanilha:=formatarNomePessoa(trim(relatorio.relOcorrencia[i].tipoOcorrencia[x].descricao));
            isAchouPlanilha:=False;
            for j:= 1 to nrPlanilha do
            begin
              dsNomePlanilha:=trim(Excel.workBooks[1].Sheets[j].name);
              if dsNomeNovaPlanilha = dsNomePlanilha then
              begin
                isAchouPlanilha:=True;
                nrPlanilhaAtual:=j;
                Break;
              end;
            end;

            if not isAchouPlanilha then
            begin
              inc(nrPlanilha);
              nrPlanilhaAtual:=nrPlanilha;
            end;

            Excel.workBooks[1].Sheets[nrPlanilhaAtual].name:=dsNomeNovaPlanilha;
            Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,1]:='SubTipo de Ocorrencia';
            Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,1].Interior.Color:= $00ffcf9c;
            Excel.workBooks[1].Sheets[nrPlanilhaAtual].range['A1'].ColumnWidth :=60;

            Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,nrColuna]:=relatorio.relOcorrencia[i].descricao;
            Excel.workBooks[1].Sheets[nrPlanilhaAtual].range['A1',getNomeCelula(1,nrColuna)].Interior.Color:= $00ffcf9c;
            Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,nrColuna].font.bold := true;

            { preenche cabeçalhos dos meses }
            for l:= 1 to 12 do
            begin
              if relatorio.relOcorrencia[l].descricao <> EmptyStr then
              begin
                Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,l+1]:=relatorio.relOcorrencia[l].descricao;
                Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,l+1].font.bold := true;
                Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,l+1].Interior.Color:= $00ffcf9c;
              end
              else
                break;
            end;

            for y:= 1 to 100 do
            begin
              nrLinha3:=1;
              isAchouCelula:=False;
              if relatorio.relOcorrencia[i].tipoOcorrencia[x].subTipo[y].descricao <> EmptyStr then
              begin
                inc(nrLinha3);
                dsColuna:='';
                while Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,1].value <> EmptyStr do
                begin
                  dsColuna:=Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,1];
                  if (dsColuna = relatorio.relOcorrencia[i].tipoOcorrencia[x].subTipo[y].descricao) then
                  begin
                    Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,nrColuna]:=relatorio.relOcorrencia[i].tipoOcorrencia[x].subTipo[y].total;
                    isAchouCelula:=True;
                    Break;
                  end
                  else
                  begin
                    inc(nrLinha3);
                    dsColuna:='';
                  end;
                end;

                if ((dsColuna = EmptyStr) or (not isAchouCelula)) then
                begin
                  Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,1]:=relatorio.relOcorrencia[i].tipoOcorrencia[x].subTipo[y].descricao;
                  Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,nrColuna]:=relatorio.relOcorrencia[i].tipoOcorrencia[x].subTipo[y].total;
                end;

                Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,1].font.bold := true;
              end
              else
                Break;

              Excel.workBooks[1].Sheets[nrPlanilhaAtual].Range['A1',getNomeCelula(nrLinha3,nrColuna)].Borders.LineStyle := 1;
              Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,1].Interior.Color:= $00ffcf9c;
            end;
          end
          else
            Break;

          Excel.workBooks[1].Sheets[2].Range['A1',getNomeCelula(nrLinha2,nrColuna)].Borders.LineStyle := 1;
          Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].Interior.Color:= $00ffcf9c;
        end;
      end
      else
        Break;
    end;

    { somatorio, preenche celula vazia e grafico }
    for z:= 1 to nrPlanilha do
    begin
      nrColuna:=0;
      nrLinha:=1;
      while Excel.workBooks[1].Sheets[z].Cells[nrlinha,1].value <> null do
      begin
        dsCelula:=Excel.workBooks[1].Sheets[z].Cells[nrlinha,1].value;
        if dsCelula = EmptyStr then
          Break;
        if z > 1 then
        begin
          for j:=0 to totalDeColunas do
          begin
            inc(nrColuna);
            { preenche celula vazia com "zero"}
            dsCelula:=Excel.workBooks[1].Sheets[z].cells[nrLinha,nrColuna].value;
            if dsCelula = EmptyStr then
              Excel.workBooks[1].Sheets[z].cells[nrLinha,nrColuna]:=0;
          end;
        end
        else
          nrColuna:=1;

        { coloca borda na celula }
        Excel.workBooks[1].Sheets[z].Range[getNomeCelula(nrlinha,1),getNomeCelula(nrLinha,nrColuna)].Borders.LineStyle := 1;
        inc(nrlinha);
        nrColuna:=0;
      end;

      { linha do somatorio }
      nrColuna:=1;
      Excel.workBooks[1].Sheets[z].cells[nrLinha,nrColuna]:='TOTAL';
      Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.bold := true;
      Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.Color:= $000000FF;
      if z > 1 then
      begin
        for j:= 1 to totalDeColunas do
        begin
          inc(nrColuna);
          Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].formula:=getFormulaSoma(getNomeCelula(2,nrColuna),getNomeCelula(nrLinha -1,nrColuna));
          Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.bold := true;
          Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.Color:= $000000FF;
          Excel.workBooks[1].Sheets[z].Range[getNomeCelula(nrlinha,1),getNomeCelula(nrLinha,nrColuna)].Borders.LineStyle := 1;
        end;
      end
      else
      begin
        inc(nrColuna);
        Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].formula:=getFormulaSoma(getNomeCelula(2,nrColuna),getNomeCelula(nrLinha -1,nrColuna));
        Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.bold := true;
        Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.Color:= $000000FF;
        Excel.workBooks[1].Sheets[z].Range[getNomeCelula(nrlinha,1),getNomeCelula(nrLinha,nrColuna)].Borders.LineStyle := 1;
      end;

      { grafico }
      Excel.workBooks[1].WorkSheets[z].ChartObjects.Add(10,160,450,130);
      chart:=Excel.workBooks[1].WorkSheets[z].ChartObjects(1);
      chart.Chart.ChartType := $00000036;
      chart.Chart.SeriesCollection.Add(Excel.workBooks[1].WorkSheets[z].Range['A1',getNomeCelula(pred(nrLinha),nrColuna)]);
    end;
    excel.columns.AutoFit;
  except
    on E:Exception do
      raise Exception.CreateFmt('Erro ao gerar planilha. Erro: %s',[E.Message]);

  end;
end;

procedure TFRelatorio.geraPlanilhaSolucaoSAC;
const
  ALFA = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  function getNomeCelula(nrLinha,nrColuna:integer):string;
  begin
    Result:=ALFA[nrColuna]+inttostr(nrLinha);
  end;

var
  excel,chart : Olevariant;

  i: integer; { Periodo }
  j: integer;
  l: integer;
  x: integer; { tipo de ocorrencia }
  y: integer; { SubTipo de ocorrencia }
  z: integer;

  { controles }
  dsColuna: string;
  dsNomePlanilha: string;
  dsNomeNovaPlanilha: string;
  dsCelula: string;
  isAchouCelula: Boolean;
  isAchouPlanilha: Boolean;
  nrLinha : integer;
  nrLinha1 : integer;
  nrLinha2 : integer;
  nrLinha3 : integer;
  nrColuna: integer;
  nrPlanilha: integer;
  nrPlanilhaAtual: integer;
  totalDeColunas : integer;

begin
  try
    excel:=CreateOleObject('excel.application');
    excel.workBooks.Add;
    Excel.Application.Visible:= true;

    for I := 1 to 12 do
    begin
      if relatorio.relOcorrencia[i].descricao <> EmptyStr then
      begin
        for x := 1 to 100 do
        begin
          if relatorio.relOcorrencia[i].tipoOcorrencia[x].descricao <> EmptyStr then
            Excel.workBooks[1].Sheets.add
          else
            Break;
        end;
      end
      else
        break;
    end;

    nrLinha1:=1;
    nrPlanilha:=2;

    { periodo }
    { cabeçalho da planilha }
    Excel.workBooks[1].Sheets[1].name:='Visão Geral';
    Excel.workBooks[1].Sheets[1].Cells[nrLinha1,1]:='Periodo';
    Excel.workBooks[1].Sheets[1].Cells[nrLinha1,2]:='Quant';
    Excel.workBooks[1].Sheets[1].range['B1'].font.bold := true;
    Excel.workBooks[1].Sheets[1].range['A1','B1'].Interior.Color:= $00ffcf9c;

    { tipo de ocorrencia }
    { cabeçalho da planilha }
    Excel.workBooks[1].Sheets[2].name:='Tipo de ocorrência';
    Excel.workBooks[1].Sheets[2].Cells[1,1]:='Tipo de Ocorrencia';
    Excel.workBooks[1].Sheets[2].Cells[1,1].Interior.Color:= $00ffcf9c;

    for I := 1 to 12 do
    begin
      if relatorio.relOcorrencia[i].descricao <> EmptyStr then
      begin
        nrColuna:=i + 1;
        inc(nrLinha1);
        Excel.workBooks[1].Sheets[1].Cells[nrLinha1,1]:=relatorio.relOcorrencia[i].descricao;
        Excel.workBooks[1].Sheets[1].Cells[nrLinha1,2]:=relatorio.relOcorrencia[i].total;
        Excel.workBooks[1].Sheets[1].range['A1',getNomeCelula(nrLinha1,1)].Interior.Color:= $00ffcf9c;
        Excel.workBooks[1].Sheets[1].Cells[nrLinha1,1].font.bold := true;
        Excel.workBooks[1].Sheets[1].Range['A1',getNomeCelula(nrLinha1,2)].Borders.LineStyle := 1;

        { tipo de ocorrencia }
        { dados  }
        Excel.workBooks[1].Sheets[2].Cells[1,nrColuna]:=relatorio.relOcorrencia[i].descricao;
        Excel.workBooks[1].Sheets[2].Cells[1,nrColuna].font.bold := true;
        Excel.workBooks[1].Sheets[2].Cells[1,nrColuna].Interior.Color:= $00ffcf9c;
        Excel.workBooks[1].Sheets[2].range['A1'].ColumnWidth :=30;

        { preenche cabeçalhos dos meses }
        totalDeColunas:=0;
        for l:= 1 to 12 do
        begin
          if relatorio.relOcorrencia[l].descricao <> EmptyStr then
          begin
            Excel.workBooks[1].Sheets[2].Cells[1,l+1]:=relatorio.relOcorrencia[l].descricao;
            Excel.workBooks[1].Sheets[2].Cells[1,l+1].font.bold := true;
            Excel.workBooks[1].Sheets[2].Cells[1,l+1].Interior.Color:= $00ffcf9c;
            inc(totalDeColunas);
          end
          else
            break;
        end;

        for x := 1 to 100 do
        begin
          nrLinha2:=1;
          isAchouCelula:=False;
          if relatorio.relOcorrencia[i].tipoOcorrencia[x].descricao <> EmptyStr then
          begin
            inc(nrLinha2);
            dsColuna:='';
            while Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].value <> EmptyStr do
            begin
              dsColuna:=Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1];
              if (dsColuna = relatorio.relOcorrencia[i].tipoOcorrencia[x].descricao) then
              begin
                Excel.workBooks[1].Sheets[2].Cells[nrLinha2,nrColuna]:=relatorio.relOcorrencia[i].tipoOcorrencia[x].total;
                isAchouCelula:=True;
                Break;
              end
              else
              begin
                inc(nrLinha2);
                dsColuna:='';
              end;
            end;
            if ((dsColuna = EmptyStr) or (not isAchouCelula)) then
            begin
              Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1]:=relatorio.relOcorrencia[i].tipoOcorrencia[x].descricao;
              Excel.workBooks[1].Sheets[2].Cells[nrLinha2,nrColuna]:=relatorio.relOcorrencia[i].tipoOcorrencia[x].total;
            end;
            Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].font.bold := true;

            { subtipo de ocorrencia }
            { cabeçalho planilha }
            dsNomeNovaPlanilha:='Solução - ' + formatarNomePessoa(trim(relatorio.relOcorrencia[i].tipoOcorrencia[x].descricao));
            isAchouPlanilha:=False;
            for j:= 1 to nrPlanilha do
            begin
              dsNomePlanilha:=trim(Excel.workBooks[1].Sheets[j].name);
              if dsNomeNovaPlanilha = dsNomePlanilha then
              begin
                isAchouPlanilha:=True;
                nrPlanilhaAtual:=j;
                Break;
              end;
            end;

            if not isAchouPlanilha then
            begin
              inc(nrPlanilha);
              nrPlanilhaAtual:=nrPlanilha;
            end;

            Excel.workBooks[1].Sheets[nrPlanilhaAtual].name:=trim(copy(dsNomeNovaPlanilha,1,31));
            Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,1]:='Solução';
            Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,1].Interior.Color:= $00ffcf9c;
            Excel.workBooks[1].Sheets[nrPlanilhaAtual].range['A1'].ColumnWidth :=60;

            Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,nrColuna]:=relatorio.relOcorrencia[i].descricao;
            Excel.workBooks[1].Sheets[nrPlanilhaAtual].range['A1',getNomeCelula(1,nrColuna)].Interior.Color:= $00ffcf9c;
            Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,nrColuna].font.bold := true;

            { preenche cabeçalhos dos meses }
            for l:= 1 to 12 do
            begin
              if relatorio.relOcorrencia[l].descricao <> EmptyStr then
              begin
                Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,l+1]:=relatorio.relOcorrencia[l].descricao;
                Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,l+1].font.bold := true;
                Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,l+1].Interior.Color:= $00ffcf9c;
              end
              else
                break;
            end;

            for y:= 1 to 100 do
            begin
              nrLinha3:=1;
              isAchouCelula:=False;
              if relatorio.relOcorrencia[i].tipoOcorrencia[x].solucao[y].descricao <> EmptyStr then
              begin
                inc(nrLinha3);
                dsColuna:='';
                while Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,1].value <> EmptyStr do
                begin
                  dsColuna:=Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,1];
                  if (dsColuna = relatorio.relOcorrencia[i].tipoOcorrencia[x].solucao[y].descricao) then
                  begin
                    Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,nrColuna]:=relatorio.relOcorrencia[i].tipoOcorrencia[x].solucao[y].total;
                    isAchouCelula:=True;
                    Break;
                  end
                  else
                  begin
                    inc(nrLinha3);
                    dsColuna:='';
                  end;
                end;

                if ((dsColuna = EmptyStr) or (not isAchouCelula)) then
                begin
                  Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,1]:=relatorio.relOcorrencia[i].tipoOcorrencia[x].solucao[y].descricao;
                  Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,nrColuna]:=relatorio.relOcorrencia[i].tipoOcorrencia[x].solucao[y].total;
                end;

                Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,1].font.bold := true;
              end
              else
                Break;

              Excel.workBooks[1].Sheets[nrPlanilhaAtual].Range['A1',getNomeCelula(nrLinha3,nrColuna)].Borders.LineStyle := 1;
              Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,1].Interior.Color:= $00ffcf9c;
            end;
          end
          else
            Break;

          Excel.workBooks[1].Sheets[2].Range['A1',getNomeCelula(nrLinha2,nrColuna)].Borders.LineStyle := 1;
          Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].Interior.Color:= $00ffcf9c;
        end;
      end
      else
        Break;
    end;

    { preenche celulas vazias e somatorio e gera grafico }
    for z:= 1 to nrPlanilha do
    begin
      nrColuna:=0;
      nrLinha:=1;
      while Excel.workBooks[1].Sheets[z].Cells[nrlinha,1].value <> null do
      begin
        dsCelula:=Excel.workBooks[1].Sheets[z].Cells[nrlinha,1].value;
        if dsCelula = EmptyStr then
          Break;
        if z > 1 then
        begin
          for j:=0 to totalDeColunas do
          begin
            inc(nrColuna);
            { preenche celula vazia com "zero"}
            dsCelula:=Excel.workBooks[1].Sheets[z].cells[nrLinha,nrColuna].value;
            if dsCelula = EmptyStr then
              Excel.workBooks[1].Sheets[z].cells[nrLinha,nrColuna]:=0;
          end;
        end
        else
          nrColuna:=1;

        { coloca borda na celula }
        Excel.workBooks[1].Sheets[z].Range[getNomeCelula(nrlinha,1),getNomeCelula(nrLinha,nrColuna)].Borders.LineStyle := 1;
        inc(nrlinha);
        nrColuna:=0;
      end;

      { linha do somatorio }
      nrColuna:=1;
      Excel.workBooks[1].Sheets[z].cells[nrLinha,nrColuna]:='TOTAL';
      Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.bold := true;
      Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.Color:= $000000FF;
      if z > 1 then
      begin
        for j:= 1 to totalDeColunas do
        begin
          inc(nrColuna);
          Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].formula:=getFormulaSoma(getNomeCelula(2,nrColuna),getNomeCelula(nrLinha -1,nrColuna));
          Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.bold := true;
          Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.Color:= $000000FF;
          Excel.workBooks[1].Sheets[z].Range[getNomeCelula(nrlinha,1),getNomeCelula(nrLinha,nrColuna)].Borders.LineStyle := 1;
        end;
      end
      else
      begin
        inc(nrColuna);
        Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].formula:=getFormulaSoma(getNomeCelula(2,nrColuna),getNomeCelula(nrLinha -1,nrColuna));
        Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.bold := true;
        Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.Color:= $000000FF;
        Excel.workBooks[1].Sheets[z].Range[getNomeCelula(nrlinha,1),getNomeCelula(nrLinha,nrColuna)].Borders.LineStyle := 1;
      end;

      { grafico }
      Excel.workBooks[1].WorkSheets[z].ChartObjects.Add(10,160,450,130);
      chart:=Excel.workBooks[1].WorkSheets[z].ChartObjects(1);
      chart.Chart.ChartType := $00000036;
      chart.Chart.SeriesCollection.Add(Excel.workBooks[1].WorkSheets[z].Range['A1',getNomeCelula(pred(nrLinha),nrColuna)]);
    end;

    excel.columns.AutoFit;
  except
    on E:Exception do
      raise Exception.CreateFmt('Erro ao gerar planilha. Erro: %s',[E.Message]);

  end;
end;

procedure TFRelatorio.geraPlanilhaCausaSAC;
const
  ALFA = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  function getNomeCelula(nrLinha,nrColuna:integer):string;
  begin
    Result:=ALFA[nrColuna]+inttostr(nrLinha);
  end;

var
  excel,chart : Olevariant;

  i: integer; { Periodo }
  j: integer;
  l: integer;
  x: integer; { tipo de ocorrencia }
  y: integer; { SubTipo de ocorrencia }
  z: integer;

  { controles }
  dsColuna: string;
  dsNomePlanilha: string;
  dsNomeNovaPlanilha: string;
  dsCelula: string;
  isAchouCelula: Boolean;
  isAchouPlanilha: Boolean;
  nrLinha1 : integer;
  nrLinha2 : integer;
  nrLinha3 : integer;
  nrColuna: integer;
  totalDeColunas: integer;
  nrLinha: integer;
  nrLinhaSoma: integer;
  nrPlanilha: integer;
  nrPlanilhaAtual: integer;
  strTotalizador: string;
begin
  try
    excel:=CreateOleObject('excel.application');
    excel.workBooks.Add;

    for I := 1 to 12 do
    begin
      if relatorio.relOcorrencia[i].descricao <> EmptyStr then
      begin
        for x := 1 to 100 do
        begin
          if relatorio.relOcorrencia[i].tipoOcorrencia[x].descricao <> EmptyStr then
            Excel.workBooks[1].Sheets.add
          else
            Break;
        end;
      end
      else
        break;
    end;

    Excel.Application.Visible:= true;

    nrLinha1:=1;
    nrPlanilha:=2;

    { periodo }
    { cabeçalho da planilha }
    Excel.workBooks[1].Sheets[1].name:='Visão Geral';
    Excel.workBooks[1].Sheets[1].Cells[nrLinha1,1]:='Periodo';
    Excel.workBooks[1].Sheets[1].Cells[nrLinha1,2]:='Quant';
    Excel.workBooks[1].Sheets[1].range['B1'].font.bold := true;
    Excel.workBooks[1].Sheets[1].range['A1','B1'].Interior.Color:= $00ffcf9c;

    { tipo de ocorrencia }
    { cabeçalho da planilha }
    Excel.workBooks[1].Sheets[2].name:='Tipo de ocorrência';
    Excel.workBooks[1].Sheets[2].Cells[1,1]:='Tipo de Ocorrencia';
    Excel.workBooks[1].Sheets[2].Cells[1,1].Interior.Color:= $00ffcf9c;

    for I := 1 to 12 do
    begin
      if relatorio.relOcorrencia[i].descricao <> EmptyStr then
      begin
        nrColuna:=i + 1;
        inc(nrLinha1);
        Excel.workBooks[1].Sheets[1].Cells[nrLinha1,1]:=relatorio.relOcorrencia[i].descricao;
        Excel.workBooks[1].Sheets[1].Cells[nrLinha1,2]:=relatorio.relOcorrencia[i].total;
        Excel.workBooks[1].Sheets[1].range['A1',getNomeCelula(nrLinha1,1)].Interior.Color:= $00ffcf9c;
        Excel.workBooks[1].Sheets[1].Cells[nrLinha1,1].font.bold := true;
        Excel.workBooks[1].Sheets[1].Range['A1',getNomeCelula(nrLinha1,2)].Borders.LineStyle := 1;

        { tipo de ocorrencia }
        { dados  }
        Excel.workBooks[1].Sheets[2].Cells[1,nrColuna]:=relatorio.relOcorrencia[i].descricao;
        Excel.workBooks[1].Sheets[2].Cells[1,nrColuna].font.bold := true;
        Excel.workBooks[1].Sheets[2].Cells[1,nrColuna].Interior.Color:= $00ffcf9c;
        Excel.workBooks[1].Sheets[2].range['A1'].ColumnWidth :=30;

        { preenche cabeçalhos dos meses }
        totalDeColunas:=0;
        for l:= 1 to 12 do
        begin
          if relatorio.relOcorrencia[l].descricao <> EmptyStr then
          begin
            Excel.workBooks[1].Sheets[2].Cells[1,l+1]:=relatorio.relOcorrencia[l].descricao;
            Excel.workBooks[1].Sheets[2].Cells[1,l+1].font.bold := true;
            Excel.workBooks[1].Sheets[2].Cells[1,l+1].Interior.Color:= $00ffcf9c;
            inc(totalDeColunas);
          end
          else
            break;
        end;

        for x := 1 to 100 do
        begin
          nrLinha2:=1;
          isAchouCelula:=False;
          if relatorio.relOcorrencia[i].tipoOcorrencia[x].descricao <> EmptyStr then
          begin
            inc(nrLinha2);
            dsColuna:='';
            while Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].value <> EmptyStr do
            begin
              dsColuna:=Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1];
              if (dsColuna = relatorio.relOcorrencia[i].tipoOcorrencia[x].descricao) then
              begin
                Excel.workBooks[1].Sheets[2].Cells[nrLinha2,nrColuna]:=relatorio.relOcorrencia[i].tipoOcorrencia[x].total;
                isAchouCelula:=True;
                Break;
              end
              else
              begin
                inc(nrLinha2);
                dsColuna:='';
              end;
            end;

            if ((dsColuna = EmptyStr) or (not isAchouCelula)) then
            begin
              Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1]:=relatorio.relOcorrencia[i].tipoOcorrencia[x].descricao;
              Excel.workBooks[1].Sheets[2].Cells[nrLinha2,nrColuna]:=relatorio.relOcorrencia[i].tipoOcorrencia[x].total;
            end;
            Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].font.bold := true;

            { subtipo de ocorrencia }
            { cabeçalho planilha }
            dsNomeNovaPlanilha:='Causa - ' + formatarNomePessoa(trim(relatorio.relOcorrencia[i].tipoOcorrencia[x].descricao));
            isAchouPlanilha:=False;
            for j:= 1 to nrPlanilha do
            begin
              dsNomePlanilha:=trim(Excel.workBooks[1].Sheets[j].name);
              if dsNomeNovaPlanilha = dsNomePlanilha then
              begin
                isAchouPlanilha:=True;
                nrPlanilhaAtual:=j;
                Break;
              end;
            end;

            if not isAchouPlanilha then
            begin
              inc(nrPlanilha);
              nrPlanilhaAtual:=nrPlanilha;
            end;

            Excel.workBooks[1].Sheets[nrPlanilhaAtual].name:=copy(dsNomeNovaPlanilha,1,31);
            Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,1]:='Causa';
            Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,1].Interior.Color:= $00ffcf9c;
            Excel.workBooks[1].Sheets[nrPlanilhaAtual].range['A1'].ColumnWidth :=60;

            Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,nrColuna]:=relatorio.relOcorrencia[i].descricao;
            Excel.workBooks[1].Sheets[nrPlanilhaAtual].range['A1',getNomeCelula(1,nrColuna)].Interior.Color:= $00ffcf9c;
            Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,nrColuna].font.bold := true;

            { preenche cabeçalhos dos meses }
            if not isAchouPlanilha then
            begin
              for l:= 1 to 12 do
              begin
                if relatorio.relOcorrencia[l].descricao <> EmptyStr then
                begin
                  Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,l+1]:=relatorio.relOcorrencia[l].descricao;
                  Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,l+1].font.bold := true;
                  Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[1,l+1].Interior.Color:= $00ffcf9c;
                end
                else
                begin
                  Excel.workBooks[1].Sheets[nrPlanilhaAtual].Range['A1',getNomeCelula(1,l+1)].Borders.LineStyle := 1;
                  break;
                end;
              end;
            end;

            for y:= 1 to 100 do
            begin
              nrLinha3:=1;
              isAchouCelula:=False;
              if relatorio.relOcorrencia[i].tipoOcorrencia[x].causa[y].descricao <> EmptyStr then
              begin
                inc(nrLinha3);
                dsColuna:='';
                while Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,1].value <> EmptyStr do
                begin
                  dsColuna:=Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,1];
                  if (dsColuna = relatorio.relOcorrencia[i].tipoOcorrencia[x].causa[y].descricao) then
                  begin
                    Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,nrColuna]:=relatorio.relOcorrencia[i].tipoOcorrencia[x].causa[y].total;
                    isAchouCelula:=True;
                    Break;
                  end
                  else
                  begin
                    inc(nrLinha3);
                    dsColuna:='';
                  end;
                end;

                if ((dsColuna = EmptyStr) or (not isAchouCelula)) then
                begin
                  Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,1]:=relatorio.relOcorrencia[i].tipoOcorrencia[x].causa[y].descricao;
                  Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,nrColuna]:=relatorio.relOcorrencia[i].tipoOcorrencia[x].causa[y].total;
                end;

                Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,1].font.bold := true;
                nrLinhaSoma:=nrLinha3 + 1;
              end
              else
                Break;

              Excel.workBooks[1].Sheets[nrPlanilhaAtual].Range['A1',getNomeCelula(nrLinha3,nrColuna)].Borders.LineStyle := 1;
              Excel.workBooks[1].Sheets[nrPlanilhaAtual].Cells[nrLinha3,1].Interior.Color:= $00ffcf9c;
            end;
          end
          else
            Break;

          Excel.workBooks[1].Sheets[2].Range['A1',getNomeCelula(nrLinha2,nrColuna)].Borders.LineStyle := 1;
          Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].Interior.Color:= $00ffcf9c;
        end;

      end
      else
        Break;
    end;

    { preenche celulas vazias, somatorio e gera grafico }
    for z:= 1 to nrPlanilha do
    begin
      nrColuna:=0;
      nrLinha:=1;
      while Excel.workBooks[1].Sheets[z].Cells[nrlinha,1].value <> null do
      begin
        dsCelula:=Excel.workBooks[1].Sheets[z].Cells[nrlinha,1].value;
        if dsCelula = EmptyStr then
          Break;
        if z > 1 then
        begin
          for j:=0 to totalDeColunas do
          begin
            inc(nrColuna);
            { preenche celula vazia com "zero"}
            dsCelula:=Excel.workBooks[1].Sheets[z].cells[nrLinha,nrColuna].value;
            if dsCelula = EmptyStr then
              Excel.workBooks[1].Sheets[z].cells[nrLinha,nrColuna]:=0;
          end;
        end
        else
          nrColuna:=1;

        { coloca borda na celula }
        Excel.workBooks[1].Sheets[z].Range[getNomeCelula(nrlinha,1),getNomeCelula(nrLinha,nrColuna)].Borders.LineStyle := 1;
        inc(nrlinha);
        nrColuna:=0;
      end;

      { linha do somatorio }
      nrColuna:=1;
      Excel.workBooks[1].Sheets[z].cells[nrLinha,nrColuna]:='TOTAL';
      Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.bold := true;
      Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.Color:= $000000FF;
      if z > 1 then
      begin
        for j:= 1 to totalDeColunas do
        begin
          inc(nrColuna);
          Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].formula:=getFormulaSoma(getNomeCelula(2,nrColuna),getNomeCelula(nrLinha -1,nrColuna));
          Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.bold := true;
          Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.Color:= $000000FF;
          Excel.workBooks[1].Sheets[z].Range[getNomeCelula(nrlinha,1),getNomeCelula(nrLinha,nrColuna)].Borders.LineStyle := 1;
        end;
      end
      else
      begin
        inc(nrColuna);
        Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].formula:=getFormulaSoma(getNomeCelula(2,nrColuna),getNomeCelula(nrLinha -1,nrColuna));
        Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.bold := true;
        Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.Color:= $000000FF;
        Excel.workBooks[1].Sheets[z].Range[getNomeCelula(nrlinha,1),getNomeCelula(nrLinha,nrColuna)].Borders.LineStyle := 1;
      end;

      { grafico }
      Excel.workBooks[1].WorkSheets[z].ChartObjects.Add(10,160,450,130);
      chart:=Excel.workBooks[1].WorkSheets[z].ChartObjects(1);
      chart.Chart.ChartType := $00000036;
      chart.Chart.SeriesCollection.Add(Excel.workBooks[1].WorkSheets[z].Range['A1',getNomeCelula(pred(nrLinha),nrColuna)]);
    end;

    excel.columns.AutoFit;
  except
    on E:Exception do
      raise Exception.CreateFmt('Erro ao gerar planilha. Detalhes: %s . Erro: %s',[dsNomeNovaPlanilha,E.Message]);
  end;
end;

procedure TFRelatorio.geraPlanilhaIndicadorDeProcessos;
const
  ALFA = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  function getNomeCelula(nrLinha,nrColuna:integer):string;
  begin
    Result:=ALFA[nrColuna]+inttostr(nrLinha);
  end;

var
  excel,chart : Olevariant;

  i: integer; { Periodo }
  j: integer;
  x: integer; { tipo de ocorrencia }
  z: integer;

  { controles }
  dsColuna: string;
  dsCelula: string;
  nrLinha : integer;
  nrLinha1 : integer;
  nrLinha2 : integer;
  nrColuna: integer;
  totalDeColunas: integer;
begin
  try
    excel:=CreateOleObject('excel.application');
    excel.workBooks.Add;
    excel.Application.Visible:= true;
    nrLinha1:=1;

    { periodo }
    { cabeçalho da planilha }
    Excel.workBooks[1].Sheets[1].name:='Visão Geral';
    Excel.workBooks[1].Sheets[1].Cells[nrLinha1,1]:='Periodo';
    Excel.workBooks[1].Sheets[1].Cells[nrLinha1,2]:='Quant';
    Excel.workBooks[1].Sheets[1].range['B1'].font.bold := true;
    Excel.workBooks[1].Sheets[1].range['A1','B1'].Interior.Color:= $00ffcf9c;

    { tipo de ocorrencia }
    { cabeçalho da planilha }
    Excel.workBooks[1].Sheets[2].name:='Indicador de Processos';
    Excel.workBooks[1].Sheets[2].Cells[1,1]:='Tipo de Processo';
    Excel.workBooks[1].Sheets[2].Cells[1,1].Interior.Color:= $00ffcf9c;
    Excel.workBooks[1].Sheets[2].range['A1'].ColumnWidth :=50;

    for I := 1 to 12 do
    begin
      if relatorio.relOcorrencia[i].descricao <> EmptyStr then
      begin
        nrColuna:=i + 1;
        inc(nrLinha1);
        Excel.workBooks[1].Sheets[1].Cells[nrLinha1,1]:=relatorio.relOcorrencia[i].descricao;
        Excel.workBooks[1].Sheets[1].Cells[nrLinha1,2]:=relatorio.relOcorrencia[i].total;
        Excel.workBooks[1].Sheets[1].range['A1',getNomeCelula(nrLinha1,1)].Interior.Color:= $00ffcf9c;
        Excel.workBooks[1].Sheets[1].Cells[nrLinha1,1].font.bold := true;
        Excel.workBooks[1].Sheets[1].Range['A1',getNomeCelula(nrLinha1,2)].Borders.LineStyle := 1;

        { indicador  }
        { dados  }
        Excel.workBooks[1].Sheets[2].Cells[1,nrColuna]:=relatorio.relOcorrencia[i].descricao;
        Excel.workBooks[1].Sheets[2].Cells[1,nrColuna].font.bold := true;
        Excel.workBooks[1].Sheets[2].Cells[1,nrColuna].Interior.Color:= $00ffcf9c;
        Excel.workBooks[1].Sheets[2].range['A1'].ColumnWidth :=50;

        nrLinha2:=1;
        inc(nrLinha2);
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1]:='Visualizar Filmagem - Sim';
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,nrColuna]:=relatorio.relOcorrencia[i].medidorProcessos.contFilmagemSim;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].Interior.Color:= $00ffcf9c;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].font.bold := true;

        inc(nrLinha2);
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1]:='Visualizar Filmagem - Não';
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,nrColuna]:=relatorio.relOcorrencia[i].medidorProcessos.contFilmagemNao;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].Interior.Color:= $00ffcf9c;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].font.bold := true;

        inc(nrLinha2);
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1]:='Confirmado Envio pela Filmagem - Sim ';
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,nrColuna]:=relatorio.relOcorrencia[i].medidorProcessos.contEnvioSim;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].Interior.Color:= $00ffcf9c;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].font.bold := true;

        inc(nrLinha2);
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1]:='Confirmado Envio pela Filmagem - Não';
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,nrColuna]:=relatorio.relOcorrencia[i].medidorProcessos.contEnvioNao;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].Interior.Color:= $00ffcf9c;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].font.bold := true;

        inc(nrLinha2);
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1]:='Conferencia de Estoque - Sim';
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,nrColuna]:=relatorio.relOcorrencia[i].medidorProcessos.contConfereEstoqueSim;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].Interior.Color:= $00ffcf9c;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].font.bold := true;

        inc(nrLinha2);
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1]:='Conferencia de Estoque - Não';
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,nrColuna]:=relatorio.relOcorrencia[i].medidorProcessos.contConfereEstoqueNao;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].Interior.Color:= $00ffcf9c;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].font.bold := true;

        inc(nrLinha2);
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1]:='Estoque Correto';
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,nrColuna]:=relatorio.relOcorrencia[i].medidorProcessos.contEstoqueCorreto;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].Interior.Color:= $00ffcf9c;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].font.bold := true;

        inc(nrLinha2);
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1]:='Estoque Maior';
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,nrColuna]:=relatorio.relOcorrencia[i].medidorProcessos.contEstoqueMaior;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].Interior.Color:= $00ffcf9c;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].font.bold := true;

        inc(nrLinha2);
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1]:='Estoque Menor';
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,nrColuna]:=relatorio.relOcorrencia[i].medidorProcessos.contEstoqueMenor;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].Interior.Color:= $00ffcf9c;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].font.bold := true;

        inc(nrLinha2);
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1]:='Escutar Gravação Televendas - Sim';
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,nrColuna]:=relatorio.relOcorrencia[i].medidorProcessos.contHaviaGravacaoTlvSim;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].Interior.Color:= $00ffcf9c;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].font.bold := true;

        inc(nrLinha2);
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1]:='Escutar Gravação Televendas - Não';
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,nrColuna]:=relatorio.relOcorrencia[i].medidorProcessos.contHaviaGravacaoTlvNao;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].Interior.Color:= $00ffcf9c;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].font.bold := true;

        inc(nrLinha2);
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1]:='Atendimento Televendas Correto - Sim';
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].Interior.Color:= $00ffcf9c;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,nrColuna]:=relatorio.relOcorrencia[i].medidorProcessos.contAtendimentoCorretoSim;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].font.bold := true;

        inc(nrLinha2);
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1]:='Atendimento Televendas Correto - Não';
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].font.bold := true;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,nrColuna]:=relatorio.relOcorrencia[i].medidorProcessos.contAtendimentoCorretoNao;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].Interior.Color:= $00ffcf9c;

        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].font.bold := true;
        Excel.workBooks[1].Sheets[2].Range['A1',getNomeCelula(nrLinha2,nrColuna)].Borders.LineStyle := 1;
        Excel.workBooks[1].Sheets[2].Cells[nrLinha2,1].Interior.Color:= $00ffcf9c;
      end
      else
        Break;
      totalDeColunas:=i;
    end;

    { somatorio, preenche com zero a celula vazia e gera grafico }
    for z:= 1 to 2 do
    begin
      nrColuna:=0;
      nrLinha:=1;
      while Excel.workBooks[1].Sheets[z].Cells[nrlinha,1].value <> null do
      begin
        dsCelula:=Excel.workBooks[1].Sheets[z].Cells[nrlinha,1].value;
        if dsCelula = EmptyStr then
          Break;
        if z > 1 then
        begin
          for j:=0 to totalDeColunas do
          begin
            inc(nrColuna);
            { preenche celula vazia com "zero"}
            dsCelula:=Excel.workBooks[1].Sheets[z].cells[nrLinha,nrColuna].value;
            if dsCelula = EmptyStr then
              Excel.workBooks[1].Sheets[z].cells[nrLinha,nrColuna]:=0;
          end;
        end
        else
          nrColuna:=1;

        { coloca borda na celula }
        Excel.workBooks[1].Sheets[z].Range[getNomeCelula(nrlinha,1),getNomeCelula(nrLinha,nrColuna)].Borders.LineStyle := 1;
        inc(nrlinha);
        nrColuna:=0;
      end;

      { linha do somatorio }
      nrColuna:=1;
      Excel.workBooks[1].Sheets[z].cells[nrLinha,nrColuna]:='TOTAL';
      Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.bold := true;
      Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.Color:= $000000FF;
      if z > 1 then
      begin
        for j:= 1 to totalDeColunas do
        begin
          inc(nrColuna);
          Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].formula:=getFormulaSoma(getNomeCelula(2,nrColuna),getNomeCelula(nrLinha -1,nrColuna));
          Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.bold := true;
          Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.Color:= $000000FF;
          Excel.workBooks[1].Sheets[z].Range[getNomeCelula(nrlinha,1),getNomeCelula(nrLinha,nrColuna)].Borders.LineStyle := 1;
        end;
      end
      else
      begin
        inc(nrColuna);
        Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].formula:=getFormulaSoma(getNomeCelula(2,nrColuna),getNomeCelula(nrLinha -1,nrColuna));
        Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.bold := true;
        Excel.workBooks[1].Sheets[z].Cells[nrLinha,nrColuna].font.Color:= $000000FF;
        Excel.workBooks[1].Sheets[z].Range[getNomeCelula(nrlinha,1),getNomeCelula(nrLinha,nrColuna)].Borders.LineStyle := 1;
      end;

      { grafico }
      Excel.workBooks[1].WorkSheets[z].ChartObjects.Add(10,160,450,130);
      chart:=Excel.workBooks[1].WorkSheets[z].ChartObjects(1);
      chart.Chart.ChartType := $00000036;
      chart.Chart.SeriesCollection.Add(Excel.workBooks[1].WorkSheets[z].Range['A1',getNomeCelula(pred(nrLinha),nrColuna)]);
    end;

    excel.columns.AutoFit;
  except
    on E:Exception do
      raise Exception.CreateFmt('Erro ao gerar planilha. Erro: %s',[E.Message]);
  end;
end;

procedure TFRelatorio.execControleCheckTipoRelatorio;
begin
  if ckxRelatorioTodos.Checked then
  begin
    ckxRelatorioControleOcorrencia.Checked:=True;
    ckxRelatorioControleSolucao.Checked:=True;
    ckxRelatorioControleCausa.Checked:=True;
    ckxRelatorioIndicadores.Checked:=True;
    ckxRelatorioListaOcorrencia.Checked:=True;
  end
  else
  begin
    ckxRelatorioControleOcorrencia.Checked:=False;
    ckxRelatorioControleSolucao.Checked:=False;
    ckxRelatorioControleCausa.Checked:=False;
    ckxRelatorioIndicadores.Checked:=False;
    ckxRelatorioListaOcorrencia.Checked:=False;
  end;
end;

{ TParametroRelatorio }

procedure TParametroRelatorio.limparDados;
begin
  cdEmpresa:=0;
  dataInicial:='';
  dataFinal:='';
  dataLimiteSolucao:='';
  cdStatus:=0;
  cdSolucionador:=0;
  cdSuperiorSolucionador:=0;
  cdGerenteDepartamento:=0;
  cdDistrito:=0;
  cdRepresentante:=0;
  cdAreaOrigem:=0;
  cdCliente:=0;
  cdRede:=0;
  dsTipoOcorrencia:='';
  dsSubTipoOcorrencia:='';
  dsSolucao:='';
  dsCausa:='';
  dsSubTipoSolucao:='';
  dsSubTipoCausa:='';
  cdMercadoria:=0;
  cdEntregador:=0;
  dsOcorrenciaForadePrazo:='';
end;

end.
