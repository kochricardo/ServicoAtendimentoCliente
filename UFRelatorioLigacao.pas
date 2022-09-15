unit UFRelatorioLigacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, DB, DBClient, SimpleDS, Buttons, Mask,
  Grids, DBGrids,COMobj, RpDefine, RpCon, RpConDS, RpRave, UParametroSistema,
  ShellApi;

type
  TFRelatorioLigacao = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    rdgTipoAtendimento: TRadioGroup;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    mEdtDataInicial: TMaskEdit;
    mEdtDataFinal: TMaskEdit;
    GroupBox4: TGroupBox;
    btnProcessar: TBitBtn;
    btnGerarPlanilha: TBitBtn;
    btnPdf: TBitBtn;
    GroupBox5: TGroupBox;
    dbgRelatorioLigacao: TDBGrid;
    btnLimpar: TBitBtn;
    RvDataSetCon: TRvDataSetConnection;
    sqlRelatorio: TSimpleDataSet;
    sqlRelatorioID: TFMTBCDField;
    sqlRelatorioDDD: TWideStringField;
    sqlRelatorioTELEFONE: TWideStringField;
    sqlRelatorioDATA: TWideStringField;
    sqlRelatorioHORA: TWideStringField;
    sqlRelatorioCLIENTE: TWideStringField;
    sqlRelatorioATENDIMENTO: TWideStringField;
    dsRelatorio: TDataSource;
    RvProject: TRvProject;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnProcessarClick(Sender: TObject);
    procedure dbgRelatorioLigacaoTitleClick(Column: TColumn);
    procedure btnLimparClick(Sender: TObject);
    procedure btnGerarPlanilhaClick(Sender: TObject);
    procedure btnPdfClick(Sender: TObject);
    procedure mEdtDataInicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mEdtDataFinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure execConsultaLigacao;
    procedure carregaTipoAtendimento;
    procedure geraPlanilhaExcel;
    procedure geraArquivoPDF;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioLigacao: TFRelatorioLigacao;
  dataInicial : TDate;
  dataFinal : TDate;

implementation

uses UDM;

{$R *.dfm}

{ TFRelatorioLigacao }

procedure TFRelatorioLigacao.geraPlanilhaExcel;
var
  nrLinha : integer;
  excel : variant;
begin
  try
    excel:=CreateOleObject('excel.application');
    excel.WorkBooks.Add;
    nrLinha:=1;
    Excel.Cells[nrLinha,1]:='ID LIGAÇÃO';
    Excel.Cells[nrLinha,2]:='DDD';
    Excel.Cells[nrLinha,3]:='TELEFONE';
    Excel.Cells[nrLinha,4]:='DATA';
    Excel.Cells[nrLinha,5]:='HORARIO';
    Excel.Cells[nrLinha,6]:='CLIENTE';
    Excel.Cells[nrLinha,7]:='TIPO DE ATENDIMENTO';

    sqlRelatorio.First;
    sqlRelatorio.DisableControls;
    while not sqlRelatorio.eof do
    begin
      inc(nrLinha);
      Excel.Cells[nrLinha,1]:=sqlRelatorio.Fields.FieldByName('ID').AsString;
      Excel.Cells[nrLinha,2]:=sqlRelatorio.Fields.FieldByName('DDD').AsString;
      Excel.Cells[nrLinha,3]:=sqlRelatorio.Fields.FieldByName('TELEFONE').AsString;
      Excel.Cells[nrLinha,4]:=sqlRelatorio.Fields.FieldByName('DATA').AsDateTime;
      Excel.Cells[nrLinha,5]:=sqlRelatorio.Fields.FieldByName('HORA').AsString;
      Excel.Cells[nrLinha,6]:=sqlRelatorio.Fields.FieldByName('CLIENTE').AsString;
      Excel.Cells[nrLinha,7]:=sqlRelatorio.Fields.FieldByName('ATENDIMENTO').AsString;
      sqlRelatorio.Next;
    end;
    sqlRelatorio.EnableControls;
    if not Excel.Application.Visible then
    begin
      Excel.Application.Visible:= true;
    end;
  except
    on E:Exception do
      raise Exception.Create('Erro ao gerar Planilha excel.'+#13+
                             'Erro: ' + E.Message);
  end;
end;

procedure TFRelatorioLigacao.mEdtDataFinalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_ESCAPE : mEdtDataFinal.Clear;
    VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TFRelatorioLigacao.mEdtDataInicialKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_ESCAPE : mEdtDataInicial.Clear;
    VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TFRelatorioLigacao.btnGerarPlanilhaClick(Sender: TObject);
begin
  Screen.Cursor:=crHourGlass;
  try
    try
      StatusBar1.SimpleText:=' Gerando planilha, aguarde...';
      Application.ProcessMessages;
      geraPlanilhaExcel;
    except
      on E:exception do
        raise Exception.Create(E.Message);
    end;
  finally
    StatusBar1.SimpleText:='';
    Application.ProcessMessages;
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFRelatorioLigacao.geraArquivoPDF;
begin
  DM.RvSystem.DefaultDest:=rdFile;
  DM.RvSystem.DoNativeOutput:=false;
  DM.RvSystem.RenderObject:=DM.RvRenderPDF;
  DM.RvSystem.OutputFileName:=pastaSistema.relatorio + 'Ligação.pdf';
  DM.RvSystem.SystemSetups:= DM.RvSystem.SystemSetups -[ssAllowSetup];
  RvProject.ProjectFile:=pastaSistema.docRave + 'SAC_RelatorioLigacao.rav';
  RvProject.Engine:= DM.RvSystem;
  RvProject.ExecuteReport('rptRelatorioLigacao');
  RvProject.Open;

  RvProject.SetParam('TOTAL_LIGACAO',inttostr(sqlRelatorio.RecordCount));
  RvProject.SetParam('DATA_INICIAL',datetostr(dataInicial));
  RvProject.SetParam('DATA_FINAL',datetostr(dataFinal));

  RvProject.Execute;
end;

procedure TFRelatorioLigacao.btnPdfClick(Sender: TObject);
begin
  geraArquivoPDF;
  if FileExists(DM.RvSystem.OutputFileName) then
    ShellExecute(0, 'open',pchar(DM.RvSystem.OutputFileName), nil, nil,SW_SHOWNORMAL)
end;

procedure TFRelatorioLigacao.btnLimparClick(Sender: TObject);
begin
  rdgTipoAtendimento.ItemIndex:=0;
  mEdtDataInicial.Clear;
  mEdtDataFinal.Clear;
  btnProcessar.Enabled:=true;
  btnGerarPlanilha.Enabled:=false;
  btnPdf.Enabled:=false;
  btnLimpar.Enabled:=false;
  sqlRelatorio.Close;
  StatusBar1.SimpleText:='';
  Application.ProcessMessages;
end;

procedure TFRelatorioLigacao.btnProcessarClick(Sender: TObject);
begin
  Screen.Cursor:=crSQLWait;
  try
    try
      dataInicial:=strtodate(mEdtDataInicial.Text);
      dataFinal:=strtodate(mEdtDataFinal.Text);
    except
      on E:Exception do
      begin
        mEdtDataInicial.SetFocus;
        raise Exception.Create('Data inválida. Erro: '+E.Message);
      end;
    end;

    try
      if dataInicial > dataFinal then
        raise Exception.Create('A data inicial deve ser menor que a data final.');
      { consulta }
      execConsultaLigacao;
      if not sqlRelatorio.IsEmpty then
      begin
        btnProcessar.Enabled:=false;
        btnGerarPlanilha.Enabled:=true;
        btnPdf.Enabled:=true;
        StatusBar1.SimpleText:=' Quantidade de ligações: ' + inttostr(sqlRelatorio.RecordCount);
        Application.ProcessMessages;
      end;
      btnLimpar.Enabled:=true;
    except
      on E:Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFRelatorioLigacao.carregaTipoAtendimento;
var
  sqlData : TSimpleDataSet;
begin
  { Primeiro item }
  rdgTipoAtendimento.Items.Add('[0] TODAS LIGAÇÕES');
  rdgTipoAtendimento.ItemIndex:=0;

  sqlData:=TSimpleDataSet.Create(nil);
  sqlData.Connection:=DM.conexaoProducao;
  try
    try
      sqlData.Close;
      sqlData.DataSet.CommandText:='SELECT CD_TIPO_ATENDIMENTO,DS_TIPO_ATENDIMENTO '+
                                   'FROM PRDDM.DC_SAC_TIPO_ATENDIMENTO '+
                                   'ORDER BY DS_TIPO_ATENDIMENTO';
      sqlData.Open;
      { monta lista de opções de atendimento }
      while not sqlData.Eof do
      begin
        rdgTipoAtendimento.Items.Add('['+sqlData.FieldByName('CD_TIPO_ATENDIMENTO').AsString + '] '+
                                     sqlData.FieldByName('DS_TIPO_ATENDIMENTO').AsString);
        sqlData.Next;
      end;

    except
      on E:Exception do
        raise Exception.Create('Erro ao carregar tipo de atendimento.' + #13 +
                               'Erro: '+ E.Message);
    end;
  finally
    sqlData.Close;
    sqlData.Free;
  end;

end;

procedure TFRelatorioLigacao.dbgRelatorioLigacaoTitleClick(Column: TColumn);
begin
  DM.ordenarGridS(sqlRelatorio,Column.FieldName);
end;

procedure TFRelatorioLigacao.execConsultaLigacao;
  function getSqlTxt:string;
  var
    txt : string;
  begin
    txt:='';
    txt:='SELECT DISTINCT CD_LOG_LIGACAO ID, SUBSTR(LIGACAO.NR_TELEFONE,1,2) DDD,LIGACAO.NR_TELEFONE TELEFONE,';
    txt:=txt + 'To_Char(DT_LIGACAO,''DD/MM/YYYY'') DATA,';
    txt:=txt + 'To_Char(DT_LIGACAO,''HH24:MI:SS'') HORA,';
    txt:=txt + 'To_Char(Nvl(NROC_C||DIGC_C,0),''000000'')||'' - ''||Nvl(NOMP_P,''SEM IDENTIFICACAO'') CLIENTE,';
    txt:=txt + 'TIPO.DS_TIPO_ATENDIMENTO ATENDIMENTO ';
    txt:=txt + 'FROM PRDDM.DC_SAC_LOG_LIGACAO LIGACAO ';
    txt:=txt + 'JOIN PRDDM.DC_SAC_TIPO_ATENDIMENTO TIPO ON TIPO.CD_TIPO_ATENDIMENTO = LIGACAO.CD_TIPO_ATENDIMENTO ';
    txt:=txt + 'LEFT OUTER JOIN PRDDM.DC_TELEFONE_CLIENTE FONE ON FONE.NR_TELEFONE = LIGACAO.NR_TELEFONE ';
    txt:=txt + 'LEFT OUTER JOIN PRDDM.DCCLI CLIENTE ON CLIENTE.NROC_C = FONE.NR_CLIENTE AND ID_SITUACAO_CLIENTE = ''A'' ';
    txt:=txt + 'LEFT OUTER JOIN PRDDM.DCPES PES ON PES.CGCP_P = CLIENTE.CGCP_C ';
    txt:=txt + 'WHERE CD_LOG_LIGACAO > 0 ';

    if rdgTipoAtendimento.ItemIndex > 0 then
      txt:=txt + 'AND LIGACAO.CD_TIPO_ATENDIMENTO = ' +
                  copy(rdgTipoAtendimento.Items.Strings[rdgTipoAtendimento.ItemIndex],2,1);
    txt:=txt + ' AND TRUNC(LIGACAO.DT_LIGACAO) BETWEEN '+ QuotedStr(datetostr(dataInicial))+' AND '+ QuotedStr(datetostr(dataFinal));

    txt:=txt + ' ORDER BY CD_LOG_LIGACAO';
    Result:=txt;
  end;
begin
  try
    sqlRelatorio.Close;
    sqlRelatorio.DataSet.CommandText:=getSqlTxt;
    sqlRelatorio.Open;
  except
    on E:Exception do
      raise Exception.Create('Erro ao buscar dados de ligações.' +
                             'Erro: '+ E.Message);
  end;
end;

procedure TFRelatorioLigacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
  FRelatorioLigacao:=nil;
end;

procedure TFRelatorioLigacao.FormCreate(Sender: TObject);
begin
  carregaTipoAtendimento;
end;

end.
