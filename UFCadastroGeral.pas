unit UFCadastroGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, ImgList, ToolWin, StdCtrls, Grids, DBGrids,
  DBCtrls, UUtils;

type
  TFCadastroGeral = class(TForm)
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    tvwTipoDeCadastro: TTreeView;
    pnlPrincipal: TPanel;
    ntbControle: TNotebook;
    tBarCadstroGeral: TToolBar;
    tBtnNovo: TToolButton;
    tbtnSalvar: TToolButton;
    tBtnCancelar: TToolButton;
    tbtnAlterar: TToolButton;
    tBtnExcluirItem: TToolButton;
    tBtnFechar: TToolButton;
    gbxRelacaoGenerico: TGroupBox;
    dbgRelacaoGenerico: TDBGrid;
    pnlCadAreaOrigem: TPanel;
    gbxCadAreaOrigem: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCodigoAreaOrigem: TEdit;
    edtDescAreaDeOrigem: TEdit;
    pnlCadStatus: TPanel;
    gbxCadStatus: TGroupBox;
    lblCodigoCadStatus: TLabel;
    lblDescCadStatus: TLabel;
    edtCodigoStatusOcorrencia: TEdit;
    edtDescStatusOcorrencia: TEdit;
    pnlCadEmbalagem: TPanel;
    gbxCadEmbalgem: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    edtCodigoSitEmbalagem: TEdit;
    edtDescSitEmbalagem: TEdit;
    pnlCadTipoOcorrencia: TPanel;
    gbxTipoOcorrencia: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtCodigoTipoOcorrencia: TEdit;
    edtDescTipoOcorrencia: TEdit;
    cbxSituacaoStatusTipoOcorrencia: TComboBox;
    dblkDepResponsavelTipoOcorrencia: TDBLookupComboBox;
    ckbIdCausa: TCheckBox;
    ckbIdVerFilmagem: TCheckBox;
    ckbIdContaEstoque: TCheckBox;
    ckbIdGravacaoTlv: TCheckBox;
    ckbIdTransportador: TCheckBox;
    ckbIdEmbalagem: TCheckBox;
    ckbIdNecesSubTipoOcorrencia: TCheckBox;
    pnlSubTipoOcorrencia: TPanel;
    gbxSubTipoOcorrencia: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    dbLkpTipoOcorrencia: TDBLookupComboBox;
    edtCodigoSubTipoOcorrencia: TEdit;
    edtDescSubTipoOcorrencia: TEdit;
    cbxSituacaoSubTipo: TComboBox;
    pnlCadSolucao: TPanel;
    gbxSolucao: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edtCodigoSolucao: TEdit;
    edtDescSolucao: TEdit;
    cbxSituacaoSolucao: TComboBox;
    pnlCadCausa: TPanel;
    gbxCadCausa: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edtCodigoCausa: TEdit;
    edtDescCausa: TEdit;
    cbxSituacaoCausa: TComboBox;
    pnlSubTipoXSolucao: TPanel;
    gbxSubTipoSolucao: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    edtCodigoSubTipoOcXSolucao: TEdit;
    pnlSubTipoXCausa: TPanel;
    gbxSubTipoXCausa: TGroupBox;
    pnlCadSetorPesquisa: TPanel;
    gbxCadSetorPesquisa: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    pnlCadPerguntaPesquisa: TPanel;
    gbxPerguntaPesquisa: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    pnlCadPesquisa: TPanel;
    gbxPesquisa: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    cbxAreaPadrao: TComboBox;
    dblkSolucaoSOxSolucao: TDBLookupComboBox;
    dbLkSubTipoOcorrenciaSOxSolucao: TDBLookupComboBox;
    Label23: TLabel;
    dbLkTipoOcorrenciaSOxSolucao: TDBLookupComboBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    edtCodigoSubTipoOcXCausa: TEdit;
    dblkSolucaoSOxCausa: TDBLookupComboBox;
    dbLkSubTipoOcorrenciaSOxCausa: TDBLookupComboBox;
    dbLkTipoOcorrenciaSOxCausa: TDBLookupComboBox;
    pnlCadDepartamento: TPanel;
    gbxCadDepartamento: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    dblkGerenteDepartamento: TDBLookupComboBox;
    edtCodigoDepartamento: TEdit;
    edtDescDepartamento: TEdit;
    pnlCadAreaDepto: TPanel;
    gbxAreaDepto: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    dblkAreaDepto: TDBLookupComboBox;
    edtCodigoAreaDepartamento: TEdit;
    edtDescAreaDepartamento: TEdit;
    dblkSupervisorAreaDepto: TDBLookupComboBox;
    cbxPrazoSoucao: TComboBox;
    pnlSolucionador: TPanel;
    gbxSolucionador: TGroupBox;
    Label42: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label43: TLabel;
    Label46: TLabel;
    dblkDeptoSolucionador: TDBLookupComboBox;
    dblkAreaDeptoSolucionador: TDBLookupComboBox;
    dblkNomeSolucionador: TDBLookupComboBox;
    edtEmailSolucionador: TEdit;
    cbxSituacaoSolucionador: TComboBox;
    Label47: TLabel;
    edtMatriculaSolucionador: TEdit;
    ckbIdSolucao: TCheckBox;
    Label48: TLabel;
    dblkAreaOrigemDepartamento: TDBLookupComboBox;
    ckbIdRecolherMercadoria: TCheckBox;
    Label49: TLabel;
    cbxIdAceite: TComboBox;
    pnCadMotivo: TPanel;
    gbxMotivoCancelamento: TGroupBox;
    Label50: TLabel;
    Label51: TLabel;
    edtCodigoMotivo: TEdit;
    edtDescricaoMotivo: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvwTipoDeCadastroCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure tBtnFecharClick(Sender: TObject);
    procedure tvwTipoDeCadastroClick(Sender: TObject);
    procedure dbgRelacaoGenericoTitleClick(Column: TColumn);
    procedure tBtnNovoClick(Sender: TObject);
    procedure tbtnSalvarClick(Sender: TObject);
    procedure tBtnCancelarClick(Sender: TObject);
    procedure tBtnExcluirItemClick(Sender: TObject);
    procedure tbtnAlterarClick(Sender: TObject);
    procedure dblkSolucaoSOxSolucaoCloseUp(Sender: TObject);
    procedure dbLkTipoOcorrenciaSOxSolucaoCloseUp(Sender: TObject);
    procedure dbLkTipoOcorrenciaSOxCausaCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoSubTipoOcXCausaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbLkSubTipoOcorrenciaSOxCausaCloseUp(Sender: TObject);
    procedure dbLkSubTipoOcorrenciaSOxSolucaoCloseUp(Sender: TObject);
    procedure edtCodigoAreaOrigemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescAreaDeOrigemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxAreaPadraoCloseUp(Sender: TObject);
    procedure dbgRelacaoGenericoDblClick(Sender: TObject);
    procedure edtDescSitEmbalagemChange(Sender: TObject);
    procedure edtDescStatusOcorrenciaChange(Sender: TObject);
    procedure edtDescTipoOcorrenciaChange(Sender: TObject);
    procedure dbLkpTipoOcorrenciaCloseUp(Sender: TObject);
    procedure edtDescSubTipoOcorrenciaChange(Sender: TObject);
    procedure edtDescSolucaoChange(Sender: TObject);
    procedure edtDescCausaChange(Sender: TObject);
    procedure dblkSolucaoSOxCausaCloseUp(Sender: TObject);
    procedure dblkGerenteDepartamentoCloseUp(Sender: TObject);
    procedure dblkSupervisorAreaDeptoCloseUp(Sender: TObject);
    procedure dblkAreaDeptoCloseUp(Sender: TObject);
    procedure edtEmailSolucionadorChange(Sender: TObject);
    procedure dblkDeptoSolucionadorCloseUp(Sender: TObject);
    procedure dblkAreaDeptoSolucionadorCloseUp(Sender: TObject);
    procedure dblkNomeSolucionadorCloseUp(Sender: TObject);
    procedure edtEmailSolucionadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblkAreaOrigemDepartamentoCloseUp(Sender: TObject);
    procedure cbxIdAceiteCloseUp(Sender: TObject);
    procedure cbxIdAceiteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure execPainelCadAreaOrigem;
    procedure execPainelCadStatus;
    procedure execPainelCadEmbalagem;
    procedure execPainelCadTipoOcorrencia;
    procedure execPainelCadSubTipoOcorrencia;
    procedure execPainelCadSolucao;
    procedure execPainelCadSubTipoXSolucao;
    procedure execPainelCadCausa;
    procedure execPainelCadSubTipoXCausa;
    procedure execPainelCadSetorPesquisa;
    procedure execPainelCadPerguntaPesquisa;
    procedure execPainelCadPesquisa;
    procedure limpaEdit;
    procedure iniciarCadastroSubTipoOcXSolucao;
    procedure iniciarCadastroSubTipoOcXCausa;
    procedure salvarCadastroSubTipoOcXCausa;
    procedure salvarCadastroSubTipoOcXSolucao;
    procedure salvarCadastroAreaOrigem;
    procedure iniciarCadastroAreaOrigem;
    procedure mostrarDadosTela;
    procedure visualizarDadosAreaOrigem;
    procedure alterarCadastroAreaOrigem;
    procedure excluirCadastroAreaOrigem;
    procedure iniciarCadastroStatusOcorrencia;
    procedure visualizarStatusOcorrencia;
    procedure salvarCadastroStatusOcorrencia;
    procedure alterarCadastroAreaStatusOcorrencia;
    procedure excluirCadastroStatusOcorrencia;
    procedure iniciarCadastroSituacaoEmbalagem;
    procedure visualizarDadosSituacaoEmbalagem;
    procedure salvarCadastroSituacaoEmbalagem;
    procedure alterarCadastroSituacaoEmbalagem;
    procedure excluirCadastroSituacaoEmbalagem;
    procedure visualizarDadosTipoOcorrencia;
    procedure iniciarCadastroTipoOcorrencia;
    procedure habilitarChekBox;
    procedure salvarCadastroTipoOcorrencia;
    procedure alterarCadastroTipoOcorrencia;
    procedure excluirCadastroTipoOcorrencia;
    procedure visualizarDadosSubTipoOcorrencia;
    procedure iniciarCadastroSubTipoOcorrencia;
    procedure salvarCadastroSubTipoOcorrencia;
    procedure alterarCadastroSubTipoOcorrencia;
    procedure excluirCadastroSubTipoOcorrencia;
    procedure visualizarDadosSolucaoOcorrencia;
    procedure iniciarCadastroSolucaOcorrencia;
    procedure salvarCadastroSolucaoOcorrencia;
    procedure alterarCadastroSolucaoOcorrencia;
    procedure excluirCadastroSolucaoOcorrencia;
    procedure visualizarDadosSubTipoOcXSolucao;
    procedure alterarCadastroSubTipoOcXSolucao;
    procedure excluirCadastroSubTipoOcXSolucao;
    procedure iniciarCadastroCausaOcorrencia;
    procedure visualizarDadosCausaOcorrencia;
    procedure salvarCadastroCausaOcorrencia;
    procedure alterarCadastroCausaOcorrencia;
    procedure excluirCadastroCausaOcorrencia;
    procedure visualizarDadosSubTipoOcXCausa;
    procedure alterarCadastroSubTipoOcXCausa;
    procedure excluirCadastroSubTipoOcXCausa;
    procedure execPainelCadDepartamento;
    procedure execPainelCadAreaDepto;
    procedure execPainelCadSolucionador;
    procedure iniciarCadastroDepartamento;
    procedure salvarCadastroDepartamento;
    procedure visualizarDadosDepartamento;
    procedure alterarCadastroDepartamento;
    procedure excluirCadastroDepartamento;
    procedure visualizarDadosAreaDepartamento;
    procedure iniciarCadastroAreaDepartamento;
    procedure salvarCadastroAreaDepartamento;
    procedure alterarCadastroAreaDepartamento;
    procedure excluirCadastroAreaDepartamento;
    procedure visualizarDadosSolucionador;
    procedure iniciarCadastroSolucionador;
    procedure salvarCadastroSolucionador;
    procedure alterarCadastroSolucionador;
    procedure excluirCadastroSolucionador;
    procedure execPainelCadMotivo;
    procedure iniciarCadastroMotivo;
    procedure visualizarDadosMotivoCancelamento;
    procedure salvarMotivoCancelamento;
    procedure alterarMotivoCancelamento;
    procedure excluirMotivoCancelamento;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastroGeral: TFCadastroGeral;

implementation

uses UDm;

{$R *.dfm}

procedure TFCadastroGeral.habilitarChekBox;
var
  I : integer;
begin
  for I:=0 to componentcount -1 do
  begin
    if (Components[i] is TCheckBox) then
     (Components[i] as TCheckBox).Enabled:=True;

    if (Components[i] is TComboBox) then
     (Components[i] as TComboBox).Enabled:=True;
  end;

end;

procedure TFCadastroGeral.limpaEdit;
var
  I : integer;
begin
  for I:=0 to componentcount -1 do
  begin
    if (Components[i] is TEdit) then
    begin
     (Components[i] as TEdit).Clear;
     (Components[i] as TEdit).ReadOnly:=False;
    end;

    if (Components[i] is TDBLookupComboBox) then
     (Components[i] as TDBLookupComboBox).Enabled:=False;

    if (Components[i] is TCheckBox) then
    begin
     (Components[i] as TCheckBox).Checked:=False;
     (Components[i] as TCheckBox).Enabled:=False;
    end;

    if (Components[i] is TComboBox) then
    begin
     (Components[i] as TComboBox).ItemIndex:=-1;
     (Components[i] as TComboBox).Enabled:=False;
    end;

  end;
end;

procedure TFCadastroGeral.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FCadastroGeral:=nil;
  Action:=caFree;
end;

procedure TFCadastroGeral.FormCreate(Sender: TObject);
begin
  ntbControle.PageIndex:=0;
  limpaEdit;
  DM.inicializarDataSetLocal(True,True,False);
end;

procedure TFCadastroGeral.tbtnAlterarClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma a alteração do cadastro?','Alterar Cadastro',4 + 32) = 6 then
  begin
    tBtnExcluirItem.Enabled:=False;
    case ntbControle.PageIndex of
      0 : alterarCadastroAreaOrigem;
      1 : alterarCadastroAreaStatusOcorrencia;
      2 : alterarCadastroSituacaoEmbalagem;
      3 : alterarCadastroTipoOcorrencia;
      4 : alterarCadastroSubTipoOcorrencia;
      5 : alterarCadastroSolucaoOcorrencia;
      6 : alterarCadastroCausaOcorrencia;
      7 : alterarCadastroSubTipoOcXCausa;
      8 : alterarCadastroSubTipoOcXSolucao;
      9 : ;
     10 : ;
     11 : ;
     12 : alterarCadastroDepartamento;
     13 : alterarCadastroAreaDepartamento;
     14 : alterarCadastroSolucionador;
     15 : alterarMotivoCancelamento;
    end;
  end;
end;

procedure TFCadastroGeral.tBtnCancelarClick(Sender: TObject);
begin
  limpaEdit;
  DM.inicializarDataSetLocal(True,True,False);
  tBtnNovo.Enabled:=True;
  tBtnCancelar.Enabled:=False;
  tbtnAlterar.Enabled:=False;
  tBtnExcluiritem.Enabled:=False;
end;

procedure TFCadastroGeral.tBtnExcluirItemClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir as informações?','Excluir Cadastro',4 + 32) = 6 then
  begin
    tbtnAlterar.Enabled:=False;
    case ntbControle.PageIndex of
      0 : excluirCadastroAreaOrigem;
      1 : excluirCadastroStatusOcorrencia;
      2 : excluirCadastroSituacaoEmbalagem;
      3 : excluirCadastroTipoOcorrencia;
      4 : excluirCadastroSubTipoOcorrencia;
      5 : excluirCadastroSolucaoOcorrencia;
      6 : excluirCadastroCausaOcorrencia;
      7 : excluirCadastroSubTipoOcXCausa;
      8 : excluirCadastroSubTipoOcXSolucao;
      9 : ;
     10 : ;
     11 : ;
     12 : excluirCadastroDepartamento;
     13 : excluirCadastroAreaDepartamento;
     14 : excluirCadastroSolucionador;
     15 : excluirMotivoCancelamento;
    end;
  end;
end;

procedure TFCadastroGeral.tBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFCadastroGeral.tBtnNovoClick(Sender: TObject);
begin
  limpaEdit;
  DM.inicializarDataSetLocal(True,True,False);

  case ntbControle.PageIndex of
    0 : iniciarCadastroAreaOrigem;
    1 : iniciarCadastroStatusOcorrencia;
    2 : iniciarCadastroSituacaoEmbalagem;
    3 : iniciarCadastroTipoOcorrencia;
    4 : begin
          DM.inicializarDataSetLocal(False,True,False);
          dbLkpTipoOcorrencia.Enabled:=True;
          dbLkpTipoOcorrencia.SetFocus;
    end;
    5 : iniciarCadastroSolucaOcorrencia;
    6 : iniciarCadastroCausaOcorrencia;
    7 : iniciarCadastroSubTipoOcXCausa;
    8 : iniciarCadastroSubTipoOcXSolucao;
    9 : ;
   10 : ;
   11 : ;
   12 : iniciarCadastroDepartamento;
   13 : iniciarCadastroAreaDepartamento;
   14 : iniciarCadastroSolucionador;
   15 : iniciarCadastroMotivo;
  end;

  tBtnNovo.Enabled:=False;
  tBtnCancelar.Enabled:=True;
  Application.ProcessMessages;
end;

procedure TFCadastroGeral.tbtnSalvarClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma a inclusão do novo cadastro?','Salvar Cadastro',4 + 32) = 6 then
  begin
    case ntbControle.PageIndex of
      0 : salvarCadastroAreaOrigem;
      1 : salvarCadastroStatusOcorrencia;
      2 : salvarCadastroSituacaoEmbalagem;
      3 : salvarCadastroTipoOcorrencia;
      4 : salvarCadastroSubTipoOcorrencia;
      5 : salvarCadastroSOlucaoOcorrencia;
      6 : salvarCadastroCausaOcorrencia;
      7 : salvarCadastroSubTipoOcXCausa;
      8 : salvarCadastroSubTipoOcXSolucao;
      9 : ;
     10 : ;
     11 : ;
     12 : salvarCadastroDepartamento;
     13 : salvarCadastroAreaDepartamento;
     14 : salvarCadastroSolucionador;
     15 : salvarMotivoCancelamento;
    end;
    DM.atualizarDataSetLocalGeral;
  end;
end;

procedure TFCadastroGeral.cbxAreaPadraoCloseUp(Sender: TObject);
begin
  if not tbtnAlterar.Enabled then
    tbtnSalvar.Enabled:=True
end;

procedure TFCadastroGeral.cbxIdAceiteCloseUp(Sender: TObject);
begin
  if cbxIdAceite.ItemIndex > -1 then
  begin
    if not tbtnAlterar.Enabled  then
      tbtnSalvar.Enabled:=True
  end
  else
    ShowMessage('Informe a condição de aceite da solução.');
end;

procedure TFCadastroGeral.cbxIdAceiteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_DELETE,VK_BACK:  Key:=0;
  end;
end;

procedure TFCadastroGeral.mostrarDadosTela;
begin
  case ntbControle.PageIndex of
    0 : visualizarDadosAreaOrigem;
    1 : visualizarStatusOcorrencia;
    2 : visualizarDadosSituacaoEmbalagem;
    3 : visualizarDadosTipoOcorrencia ;
    4 : visualizarDadosSubTipoOcorrencia;
    5 : visualizarDadosSolucaoOcorrencia;
    6 : visualizarDadosCausaOcorrencia;
    7 : visualizarDadosSubTipoOcXCausa;
    8 : visualizarDadosSubTipoOcXSolucao;
    9 : ;
   10 : ;
   11 : ;
   12 : visualizarDadosDepartamento;
   13 : visualizarDadosAreaDepartamento;
   14 : visualizarDadosSolucionador;
   15 : visualizarDadosMotivoCancelamento;
  end;
end;


procedure TFCadastroGeral.dbgRelacaoGenericoDblClick(Sender: TObject);
begin
  limpaEdit;
  tBtnNovo.Enabled:=False;
  tBtnCancelar.Enabled:=true;
  tbtnAlterar.Enabled:=true;
  tBtnExcluiritem.Enabled:=true;
  Application.ProcessMessages;

  { mostra dados no painel }
  mostrarDadosTela;
end;

procedure TFCadastroGeral.dbgRelacaoGenericoTitleClick(Column: TColumn);
begin
  DM.ordenarGridS(DM.sqlGenericaCadastro,Column.FieldName);
end;

procedure TFCadastroGeral.dblkAreaDeptoCloseUp(Sender: TObject);
begin
  if dblkAreaDepto.KeyValue <> null then
  begin
    //DM.execFiltroListaUsuario(False,false);
    DM.iniciarListaSupervisorArea;
    if not dm.cdsListaSupervisorArea.IsEmpty then
    begin
      dblkSupervisorAreaDepto.Enabled:=True;
      dblkSupervisorAreaDepto.SetFocus;
    end;
  end
  else
    ShowMessage('Informe o Departamento.');
end;

procedure TFCadastroGeral.dblkAreaDeptoSolucionadorCloseUp(Sender: TObject);
begin
  if dblkAreaDeptoSolucionador.KeyValue <> null then
    Perform(WM_NEXTDLGCTL,0,0)
  else
    ShowMessage('Informe a "Área de trabalho" do Solucionador.');
end;

procedure TFCadastroGeral.dblkAreaOrigemDepartamentoCloseUp(Sender: TObject);
begin
  if dblkAreaOrigemDepartamento.KeyValue <> null then
  begin
    if not tbtnAlterar.Enabled then
      tbtnSalvar.Enabled:=True;
  end
  else
    ShowMessage('Informe a Área de Origem do Departamento.');
end;

procedure TFCadastroGeral.dblkDeptoSolucionadorCloseUp(Sender: TObject);
begin
  if dblkDeptoSolucionador.KeyValue <> null then
  begin
    DM.execFiltroAreaSolucionador(dblkDeptoSolucionador.KeyValue);
    Perform(WM_NEXTDLGCTL,0,0);
  end
  else
    ShowMessage('Informe o Departamento do Solucionador.');
end;

procedure TFCadastroGeral.dblkSupervisorAreaDeptoCloseUp(Sender: TObject);
begin
  if dblkSupervisorAreaDepto.KeyValue <> null then
    Perform(WM_NEXTDLGCTL,0,0)
  else
    ShowMessage('Informe o Supervisor da Área.');
end;

procedure TFCadastroGeral.dblkGerenteDepartamentoCloseUp(Sender: TObject);
begin
  if dblkGerenteDepartamento.KeyValue <> null then
  begin
     dblkAreaOrigemDepartamento.Enabled:=True;
     tbtnSalvar.Enabled:=true;
     Perform(WM_NEXTDLGCTL,0,0);
  end
  else
    ShowMessage('Informe o Gerente do Departamento.');
end;

procedure TFCadastroGeral.dblkNomeSolucionadorCloseUp(Sender: TObject);
begin
  if dblkNomeSolucionador.KeyValue <> null then
  begin
    edtMatriculaSolucionador.Text:=dblkNomeSolucionador.KeyValue;
    dblkDeptoSolucionador.SetFocus;
  end
  else
    ShowMessage('Informe o Solucionador.');
end;

procedure TFCadastroGeral.dbLkpTipoOcorrenciaCloseUp(Sender: TObject);
begin
  if dbLkpTipoOcorrencia.KeyValue <> null then
    iniciarCadastroSubTipoOcorrencia;
end;

procedure TFCadastroGeral.dblkSolucaoSOxCausaCloseUp(Sender: TObject);
begin
  if dbLkSubTipoOcorrenciaSOxCausa.KeyValue <> null then
  begin
    if not tbtnAlterar.Enabled then
      tbtnSalvar.Enabled:=True;
  end
  else
    ShowMessage('Informe a Causa Desejada.');
end;

procedure TFCadastroGeral.dblkSolucaoSOxSolucaoCloseUp(Sender: TObject);
begin
  if dbLkSubTipoOcorrenciaSOxSolucao.KeyValue <> null then
  begin
    cbxIdAceite.Enabled:=True;
    Perform(WM_NEXTDLGCTL,0,0);
  end
  else
    ShowMessage('Informe a Solução Desejada.');
end;

procedure TFCadastroGeral.dbLkSubTipoOcorrenciaSOxCausaCloseUp(Sender: TObject);
begin
  if dbLkSubTipoOcorrenciaSOxCausa.KeyValue <> null then
  begin
    dblkSolucaoSOxCausa.Enabled:=True;
    Perform(WM_NEXTDLGCTL,0,0);
  end
  else
    ShowMessage('Informe o SubTipo de Ocorrência.');
end;

procedure TFCadastroGeral.dbLkSubTipoOcorrenciaSOxSolucaoCloseUp(
  Sender: TObject);
begin
  if dbLkSubTipoOcorrenciaSOxSolucao.KeyValue <> null then
  begin
    dblkSolucaoSOxSolucao.Enabled:=True;
    Perform(WM_NEXTDLGCTL,0,0);
  end
  else
    ShowMessage('Informe o SubTipo de Ocorrência.');
end;

procedure TFCadastroGeral.dbLkTipoOcorrenciaSOxCausaCloseUp(Sender: TObject);
begin
   if dbLkTipoOcorrenciaSOxCausa.KeyValue <> null then
   begin
     DM.execFiltroSubTipoOcorrencia(dbLkTipoOcorrenciaSOxCausa.KeyValue);
     dbLkSubTipoOcorrenciaSOxCausa.Enabled:=True;
     Perform(WM_NEXTDLGCTL,0,0);
     Application.ProcessMessages;
   end;
end;

procedure TFCadastroGeral.dbLkTipoOcorrenciaSOxSolucaoCloseUp(Sender: TObject);
begin
   if dbLkTipoOcorrenciaSOxSolucao.KeyValue <> null then
   begin
     DM.execFiltroSubTipoOcorrencia(dbLkTipoOcorrenciaSOxSolucao.KeyValue);
     dbLkSubTipoOcorrenciaSOxSolucao.Enabled:=True;
     Perform(WM_NEXTDLGCTL,0,0);
     Application.ProcessMessages;
   end
  else
    ShowMessage('Informe o Tipo de Ocorrência.');
end;

procedure TFCadastroGeral.edtCodigoAreaOrigemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if tBtnNovo.Enabled then
  begin
    case key of
      VK_ESCAPE : edtCodigoAreaOrigem.Clear;
      VK_RETURN : DM.consultarDadosAreaOrigem(StrToIntDef(edtCodigoAreaOrigem.Text,0),'');
    end;
    tBtnCancelar.Enabled:=True;
  end;
end;

procedure TFCadastroGeral.edtDescAreaDeOrigemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if tBtnNovo.Enabled then
  begin
    case key of
      VK_ESCAPE : edtDescAreaDeOrigem.Clear;
      VK_RETURN : DM.consultarDadosAreaOrigem(0,edtDescAreaDeOrigem.Text);
    end;
    tBtnCancelar.Enabled:=True;
  end
  else
  begin
    case key of
      VK_ESCAPE : edtDescAreaDeOrigem.Clear;
      VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
    end;
  end;
end;

procedure TFCadastroGeral.edtDescCausaChange(Sender: TObject);
begin
  if ((Length(trim(edtDescCausa.Text)) > 0) and (not tbtnAlterar.Enabled))then
    tbtnSalvar.Enabled:=True
  else
    tbtnSalvar.Enabled:=False;
end;

procedure TFCadastroGeral.edtDescSitEmbalagemChange(Sender: TObject);
begin
  if ((Length(trim(edtDescSitEmbalagem.Text)) > 0) and (not tbtnAlterar.Enabled))then
    tbtnSalvar.Enabled:=True
  else
    tbtnSalvar.Enabled:=False;
end;

procedure TFCadastroGeral.edtDescSolucaoChange(Sender: TObject);
begin
  if ((Length(trim(edtDescSolucao.Text)) > 0) and (not tbtnAlterar.Enabled))then
    tbtnSalvar.Enabled:=True
  else
    tbtnSalvar.Enabled:=False;
end;

procedure TFCadastroGeral.edtDescStatusOcorrenciaChange(Sender: TObject);
begin
  if ((Length(trim(edtDescStatusOcorrencia.Text)) > 0) and (not tbtnAlterar.Enabled))then
    tbtnSalvar.Enabled:=True
  else
    tbtnSalvar.Enabled:=False;
end;

procedure TFCadastroGeral.edtDescSubTipoOcorrenciaChange(Sender: TObject);
begin
  if ((Length(trim(edtDescricaoMotivo.Text)) > 0) and (not tbtnAlterar.Enabled))then
    tbtnSalvar.Enabled:=True
  else
    tbtnSalvar.Enabled:=False;
end;

procedure TFCadastroGeral.edtDescTipoOcorrenciaChange(Sender: TObject);
begin
  if ((Length(trim(edtDescTipoOcorrencia.Text)) > 0) and (not tbtnAlterar.Enabled))then
    tbtnSalvar.Enabled:=True
  else
    tbtnSalvar.Enabled:=False;
end;

procedure TFCadastroGeral.edtEmailSolucionadorChange(Sender: TObject);
begin
  if ((Length(trim(edtEmailSolucionador.Text)) > 0) and (not tbtnAlterar.Enabled))then
    tbtnSalvar.Enabled:=True
  else
    tbtnSalvar.Enabled:=False;
end;

procedure TFCadastroGeral.edtEmailSolucionadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_ESCAPE : edtEmailSolucionador.Clear;
    VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

{ area de origem }
procedure TFCadastroGeral.visualizarDadosAreaOrigem;
begin
  edtCodigoAreaOrigem.Text:=DM.sqlGenericaCadastro.Fields.Fields[0].AsString;
  edtDescAreaDeOrigem.Text:=DM.sqlGenericaCadastro.Fields.Fields[1].AsString;
  if DM.sqlGenericaCadastro.Fields.Fields[2].AsString = 'S' then
    cbxAreaPadrao.ItemIndex:=0
  else
    cbxAreaPadrao.ItemIndex:=1;

  edtDescAreaDeOrigem.SetFocus;
  cbxAreaPadrao.Enabled:=True;
  Application.ProcessMessages;
end;

procedure TFCadastroGeral.iniciarCadastroAreaOrigem;
begin
  edtCodigoAreaOrigem.ReadOnly:=True;
  edtCodigoAreaOrigem.Text:=IntToStr(DM.getCodigoSequencial('CD_AREA_ORIGEM','DC_SAC_AREA_ORIGEM_OCORRENCIA','',''));
  edtDescAreaDeOrigem.SetFocus;
  cbxAreaPadrao.Enabled:=True;
end;

procedure TFCadastroGeral.salvarCadastroAreaOrigem;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.cadastrarAreaOrigem(StrToInt(edtCodigoAreaOrigem.Text),edtDescAreaDeOrigem.Text,cbxAreaPadrao.Items[cbxAreaPadrao.ItemIndex]);
    { atualiza dados }
    DM.consultarDadosAreaOrigem(0,'');

    tbtnSalvar.Enabled:=False;
    edtCodigoAreaOrigem.SetFocus;
    Application.MessageBox('Informação cadastrada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.alterarCadastroAreaOrigem;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.alterarDadosAreaOrigem(StrToInt(edtCodigoAreaOrigem.Text),edtDescAreaDeOrigem.Text,cbxAreaPadrao.Items[cbxAreaPadrao.ItemIndex]);
    { atualiza dados }
    DM.consultarDadosAreaOrigem(0,'');

    tbtnAlterar.Enabled:=False;
    edtCodigoAreaOrigem.SetFocus;
    Application.MessageBox('Informação alterada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.excluirCadastroAreaOrigem;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.excluirDadosAreaOrigem(StrToInt(edtCodigoAreaOrigem.Text));
    { atualiza dados }
    DM.consultarDadosAreaOrigem(0,'');

    tBtnExcluiritem.Enabled:=False;
    edtCodigoAreaOrigem.SetFocus;
    Application.MessageBox('Informação alterada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

{ status da ocorrencia }
procedure TFCadastroGeral.visualizarStatusOcorrencia;
begin
  edtCodigoStatusOcorrencia.Text:=DM.sqlGenericaCadastro.Fields.Fields[0].AsString;
  edtDescStatusOcorrencia.Text:=DM.sqlGenericaCadastro.Fields.Fields[1].AsString;
  edtDescStatusOcorrencia.SetFocus;
  Application.ProcessMessages;
end;

procedure TFCadastroGeral.iniciarCadastroStatusOcorrencia;
begin
  edtCodigoStatusOcorrencia.ReadOnly:=True;
  edtCodigoStatusOcorrencia.Text:=IntToStr(DM.getCodigoSequencial('CD_ST_OCORRENCIA','DC_SAC_ST_OCORRENCIA','',''));
  edtDescStatusOcorrencia.SetFocus;
end;

procedure TFCadastroGeral.salvarCadastroStatusOcorrencia;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.cadastrarStatusOcorrencia(StrToInt(edtCodigoStatusOcorrencia.Text),edtDescStatusOcorrencia.Text);
    { atualiza dados }
    DM.consultarDadosStatusOcorrencia(0,'');

    tbtnSalvar.Enabled:=False;
    edtCodigoStatusOcorrencia.SetFocus;
    Application.MessageBox('Informação cadastrada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.alterarCadastroAreaStatusOcorrencia;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.alterarDadosStatusOcorrencia(StrToInt(edtCodigoStatusOcorrencia.Text),edtDescStatusOcorrencia.Text);
    { atualiza dados }
    DM.consultarDadosStatusOcorrencia(0,'');

    tbtnAlterar.Enabled:=False;
    edtCodigoStatusOcorrencia.SetFocus;
    Application.MessageBox('Informação alterada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.excluirCadastroStatusOcorrencia;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.excluirDadosStatusOcorrencia(StrToInt(edtCodigoStatusOcorrencia.Text));
    { atualiza dados }
    DM.consultarDadosStatusOcorrencia(0,'');

    tBtnExcluirItem.Enabled:=False;
    edtCodigoStatusOcorrencia.SetFocus;
    Application.MessageBox('Informação excluída com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

{ embalagem }
procedure TFCadastroGeral.visualizarDadosSituacaoEmbalagem;
begin
  edtCodigoSitEmbalagem.Text:=DM.sqlGenericaCadastro.Fields.Fields[0].AsString;
  edtDescSitEmbalagem.Text:=DM.sqlGenericaCadastro.Fields.Fields[1].AsString;
  edtDescSitEmbalagem.SetFocus;
  Application.ProcessMessages;
end;

procedure TFCadastroGeral.iniciarCadastroSituacaoEmbalagem;
begin
  edtCodigoSitEmbalagem.ReadOnly:=True;
  edtCodigoSitEmbalagem.Text:=IntToStr(DM.getCodigoSequencial('CD_SITUACAO_EMBALAGEM','DC_SAC_SITUACAO_EMBALAGEM','',''));
  edtDescSitEmbalagem.SetFocus;
end;

procedure TFCadastroGeral.salvarCadastroSituacaoEmbalagem;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.cadastrarSituacaoEmbalagem(StrToInt(edtCodigoSitEmbalagem.Text),edtDescSitEmbalagem.Text);
    { atualiza dados }
    DM.consultarDadosSituacaoEmbalagem(0,'');

    tbtnSalvar.Enabled:=False;
    edtCodigoSitEmbalagem.SetFocus;
    Application.MessageBox('Informação cadastrada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.alterarCadastroSituacaoEmbalagem;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.alterarDadosSituacaoEmbalagem(StrToInt(edtCodigoSitEmbalagem.Text),edtDescSitEmbalagem.Text);
    { atualiza dados }
    DM.consultarDadosSituacaoEmbalagem(0,'');

    tbtnAlterar.Enabled:=False;
    edtCodigoSitEmbalagem.SetFocus;
    Application.MessageBox('Informação alterada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.excluirCadastroSituacaoEmbalagem;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.excluirDadosSituacaoEmbalagem(StrToInt(edtCodigoSitEmbalagem.Text));
    { atualiza dados }
    DM.consultarDadosSituacaoEmbalagem(0,'');

    tBtnExcluiritem.Enabled:=False;
    edtCodigoSitEmbalagem.SetFocus;
    Application.MessageBox('Informação excluída com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

{ Tipo de Ocorrencia }
procedure TFCadastroGeral.visualizarDadosTipoOcorrencia;
begin
  edtCodigoTipoOcorrencia.Text:=DM.sqlGenericaCadastro.Fields.Fields[0].AsString;
  edtDescTipoOcorrencia.Text:=DM.sqlGenericaCadastro.Fields.Fields[1].AsString;

  habilitarChekBox;

  if DM.sqlGenericaCadastro.Fields.Fields[2].AsString = 'S' then
    ckbIdCausa.Checked:=True;
  if DM.sqlGenericaCadastro.Fields.Fields[2].AsString = 'S' then
    ckbIdCausa.Checked:=True;
  if DM.sqlGenericaCadastro.Fields.Fields[3].AsString = 'S' then
    ckbIdVerFilmagem.Checked:=True;
  if DM.sqlGenericaCadastro.Fields.Fields[4].AsString = 'S' then
    ckbIdContaEstoque.Checked:=True;
  if DM.sqlGenericaCadastro.Fields.Fields[5].AsString = 'S' then
    ckbIdGravacaoTlv.Checked:=True;
  if DM.sqlGenericaCadastro.Fields.Fields[6].AsString = 'S' then
    ckbIdTransportador.Checked:=True;
  if DM.sqlGenericaCadastro.Fields.Fields[7].AsString = 'S' then
    ckbIdEmbalagem.Checked:=True;
  if DM.sqlGenericaCadastro.Fields.Fields[8].AsString = 'S' then
    ckbIdNecesSubTipoOcorrencia.Checked:=True;
  if DM.sqlGenericaCadastro.Fields.Fields[11].AsString = 'S' then
    ckbIdSolucao.Checked:=True;
  if DM.sqlGenericaCadastro.Fields.Fields[12].AsString = 'S' then
    ckbIdRecolherMercadoria.Checked:=True;

  cbxSituacaoStatusTipoOcorrencia.Enabled:=True;
  if DM.sqlGenericaCadastro.Fields.Fields[9].AsString = 'S' then
    cbxSituacaoStatusTipoOcorrencia.ItemIndex:=0
  else
    cbxSituacaoStatusTipoOcorrencia.ItemIndex:=1;

  DM.cdsListaDepartamento.Open;
  dblkDepResponsavelTipoOcorrencia.Enabled:=True;
  dblkDepResponsavelTipoOcorrencia.KeyValue:=DM.sqlGenericaCadastro.Fields.Fields[10].AsString;

  edtDescTipoOcorrencia.SetFocus;
  Application.ProcessMessages;
end;

procedure TFCadastroGeral.iniciarCadastroTipoOcorrencia;
begin
  edtCodigoTipoOcorrencia.ReadOnly:=True;
  edtCodigoTipoOcorrencia.Text:=IntToStr(DM.getCodigoSequencial('CD_TIPO_OCORRENCIA','DC_SAC_TIPO_OCORRENCIA','',''));
  edtDescTipoOcorrencia.SetFocus;
  dblkDepResponsavelTipoOcorrencia.Enabled:=True;
  habilitarChekBox;
  cbxSituacaoStatusTipoOcorrencia.ItemIndex:=0;
  Application.ProcessMessages;
end;

procedure TFCadastroGeral.salvarCadastroTipoOcorrencia;
var
  cdDepartamento: integer;
begin
  Screen.Cursor:=crSQLWait;
  try
    if dblkDepResponsavelTipoOcorrencia.KeyValue <> null then
      cdDepartamento:=dblkDepResponsavelTipoOcorrencia.KeyValue
    else
      cdDepartamento:=0;

    DM.cadastrarTipoOcorrencia(StrToInt(edtCodigoTipoOcorrencia.Text),cdDepartamento,
      edtDescTipoOcorrencia.Text,booleanToString(ckbIdSolucao.Checked),booleanToString(ckbIdCausa.Checked),booleanToString(ckbIdVerFilmagem.Checked),booleanToString(ckbIdContaEstoque.Checked),
      booleanToString(ckbIdGravacaoTlv.Checked),cbxSituacaoStatusTipoOcorrencia.Items[cbxSituacaoStatusTipoOcorrencia.ItemIndex],
      booleanToString(ckbIdTransportador.Checked),booleanToString(ckbIdEmbalagem.Checked),booleanToString(ckbIdNecesSubTipoOcorrencia.Checked),booleanToString(ckbIdRecolherMercadoria.Checked));

    { atualiza dados }
    DM.consultarDadosTipoOcorrencia(0,0,'');

    tbtnSalvar.Enabled:=False;
    edtCodigoTipoOcorrencia.SetFocus;
    Application.MessageBox('Informação cadastrada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.alterarCadastroTipoOcorrencia;
var
  cdDepartamento: integer;
begin
  Screen.Cursor:=crSQLWait;
  try
    if dblkDepResponsavelTipoOcorrencia.KeyValue <> null then
      cdDepartamento:=dblkDepResponsavelTipoOcorrencia.KeyValue
    else
      cdDepartamento:=0;

    DM.alterarCadastroTipoOcorrencia(StrToInt(edtCodigoTipoOcorrencia.Text),cdDepartamento,
      edtDescTipoOcorrencia.Text,booleanToString(ckbIdSolucao.Checked),booleanToString(ckbIdCausa.Checked),booleanToString(ckbIdVerFilmagem.Checked),booleanToString(ckbIdContaEstoque.Checked),
      booleanToString(ckbIdGravacaoTlv.Checked),cbxSituacaoStatusTipoOcorrencia.Items[cbxSituacaoStatusTipoOcorrencia.ItemIndex],
      booleanToString(ckbIdTransportador.Checked),booleanToString(ckbIdEmbalagem.Checked),booleanToString(ckbIdNecesSubTipoOcorrencia.Checked),booleanToString(ckbIdRecolherMercadoria.Checked));

    { atualiza dados }
    DM.consultarDadosTipoOcorrencia(0,0,'');

    tbtnAlterar.Enabled:=False;
    edtCodigoTipoOcorrencia.SetFocus;
    Application.MessageBox('Informação alterada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.excluirCadastroTipoOcorrencia;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.excluirDadosTipoOcorrencia(StrToInt(edtCodigoTipoOcorrencia.Text));

    { atualiza dados }
    DM.consultarDadosTipoOcorrencia(0,0,'');

    tBtnExcluiritem.Enabled:=False;
    edtCodigoTipoOcorrencia.SetFocus;
    Application.MessageBox('Informação excluída com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

{ SubTipo de Ocorrência }
procedure TFCadastroGeral.visualizarDadosSubTipoOcorrencia;
begin
  DM.inicializarDataSetLocal(False,True,False);
  edtCodigoSubTipoOcorrencia.ReadOnly:=True;
  edtCodigoSubTipoOcorrencia.Text:=DM.sqlGenericaCadastro.Fields.Fields[3].AsString;
  edtDescSubTipoOcorrencia.Text:=DM.sqlGenericaCadastro.Fields.Fields[1].AsString;
  edtDescSubTipoOcorrencia.SetFocus;

  dbLkpTipoOcorrencia.Enabled:=True;
  dbLkpTipoOcorrencia.KeyValue:=DM.sqlGenericaCadastro.Fields.Fields[2].AsString;

  cbxSituacaoSubTipo.Enabled:=True;
  if DM.sqlGenericaCadastro.Fields.Fields[4].AsString = 'S' then
    cbxSituacaoSubTipo.ItemIndex:=0
  else
    cbxSituacaoSubTipo.ItemIndex:=1;

  Application.ProcessMessages;
end;

procedure TFCadastroGeral.iniciarCadastroSubTipoOcorrencia;
begin
  edtCodigoSubTipoOcorrencia.ReadOnly:=True;
  edtCodigoSubTipoOcorrencia.Text:=IntToStr(DM.getCodigoSequencial('CD_SUBTIPO_OCORRENCIA','DC_SAC_SUBTIPO_OCORRENCIA','CD_TIPO_OCORRENCIA',dbLkpTipoOcorrencia.KeyValue));
  dbLkpTipoOcorrencia.Enabled:=True;
  cbxSituacaoSubTipo.Enabled:=True;
  cbxSituacaoSubTipo.ItemIndex:=0;
  edtDescSubTipoOcorrencia.SetFocus;
end;

procedure TFCadastroGeral.salvarCadastroSubTipoOcorrencia;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.cadastrarSubTipoOcorrencia(dbLkpTipoOcorrencia.KeyValue,StrToInt(edtCodigoSubTipoOcorrencia.Text),edtDescSubTipoOcorrencia.Text,cbxSituacaoSubTipo.Items[cbxSituacaoSubTipo.ItemIndex]);
    { atualiza dados }
    DM.consultarDadosSubTipoOcorrencia(0,0,'');

    tbtnSalvar.Enabled:=False;
    edtCodigoSubTipoOcorrencia.SetFocus;
    Application.MessageBox('Informação cadastrada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.alterarCadastroSubTipoOcorrencia;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.alterarDadosSubTipoOcorrencia(dbLkpTipoOcorrencia.KeyValue,StrToInt(edtCodigoSubTipoOcorrencia.Text),edtDescSubTipoOcorrencia.Text,cbxSituacaoSubTipo.Items[cbxSituacaoSubTipo.ItemIndex]);
    { atualiza dados }
    DM.consultarDadosSubTipoOcorrencia(0,0,'');

    tbtnAlterar.Enabled:=False;
    dbLkpTipoOcorrencia.SetFocus;
    Application.MessageBox('Informação alterada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.excluirCadastroSubTipoOcorrencia;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.excluirDadosSubTipoOcorrencia(dbLkpTipoOcorrencia.KeyValue,StrToInt(edtCodigoSubTipoOcorrencia.Text));

    { atualiza dados }
    DM.consultarDadosSubTipoOcorrencia(0,0,'');

    tBtnExcluiritem.Enabled:=False;
    dbLkpTipoOcorrencia.SetFocus;
    Application.MessageBox('Informação excluída com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

{ Solução }
procedure TFCadastroGeral.visualizarDadosSolucaoOcorrencia;
begin
  edtCodigoSolucao.ReadOnly:=True;
  edtCodigoSolucao.Text:=DM.sqlGenericaCadastro.Fields.Fields[0].AsString;
  edtDescSolucao.Text:=DM.sqlGenericaCadastro.Fields.Fields[1].AsString;
  if DM.sqlGenericaCadastro.Fields.Fields[2].AsString = 'S' then
    cbxSituacaoSolucao.ItemIndex:=0
  else
    cbxSituacaoSolucao.ItemIndex:=1;
  cbxSituacaoSolucao.Enabled:=True;
  edtDescSolucao.SetFocus;
  Application.ProcessMessages;
end;

procedure TFCadastroGeral.iniciarCadastroSolucaOcorrencia;
begin
  edtCodigoSolucao.ReadOnly:=True;
  edtCodigoSolucao.Text:=IntToStr(DM.getCodigoSequencial('CD_SOLUCAO','DC_SAC_SOLUCAO','',''));
  cbxSituacaoSolucao.Enabled:=True;
  cbxSituacaoSolucao.ItemIndex:=0;
  edtDescSolucao.SetFocus;
end;

procedure TFCadastroGeral.salvarCadastroSolucaoOcorrencia;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.cadastrarSolucaoOcorrencia(strtoint(edtCodigoSolucao.Text),edtDescSolucao.Text,cbxSituacaoSolucao.Items[cbxSituacaoSolucao.ItemIndex]);
    { atualiza dados }
    DM.consultarDadosSolucaoOcorrencia(0,'');

    tbtnSalvar.Enabled:=False;
    edtCodigoSolucao.SetFocus;
    Application.MessageBox('Informação cadastrada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.alterarCadastroSolucaoOcorrencia;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.alterarDadosSolucao(strtoint(edtCodigoSolucao.Text),edtDescSolucao.Text,cbxSituacaoSolucao.Items[cbxSituacaoSolucao.ItemIndex]);
    { atualiza dados }
    DM.consultarDadosSolucaoOcorrencia(0,'');

    tbtnAlterar.Enabled:=False;
    edtCodigoSolucao.SetFocus;
    Application.MessageBox('Informação alterada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.excluirCadastroSolucaoOcorrencia;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.excluirDadosSolucaoOcorrencia(strtoint(edtCodigoSolucao.Text));

    { atualiza dados }
    DM.consultarDadosSolucaoOcorrencia(0,'');

    tBtnExcluiritem.Enabled:=False;
    edtCodigoSolucao.SetFocus;
    Application.MessageBox('Informação excluída com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

{ Solução X SubTipo de Ocorrencia }
procedure TFCadastroGeral.visualizarDadosSubTipoOcXSolucao;
begin
  DM.inicializarDataSetLocal(False,True,False);
  edtCodigoSubTipoOcXSolucao.ReadOnly:=True;
  edtCodigoSubTipoOcXSolucao.Text:=DM.sqlGenericaCadastro.Fields.Fields[0].AsString;

  dbLkTipoOcorrenciaSOxSolucao.KeyValue:=DM.sqlGenericaCadastro.Fields.Fields[4].AsString;
  DM.execFiltroSubTipoOcorrencia(DM.sqlGenericaCadastro.Fields.Fields[4].AsInteger);
  dbLkSubTipoOcorrenciaSOxSolucao.KeyValue:=DM.sqlGenericaCadastro.Fields.Fields[5].AsString;

  dblkSolucaoSOxSolucao.KeyValue:=DM.sqlGenericaCadastro.Fields.Fields[6].AsString;
  dblkSolucaoSOxSolucao.Enabled:=True;

  cbxIdAceite.Enabled:=True;
  case DM.sqlGenericaCadastro.Fields.Fields[7].AsString[1] of
    'N' : cbxIdAceite.ItemIndex:=0;
    'S' : cbxIdAceite.ItemIndex:=1;
  end;

  Application.ProcessMessages;
end;

procedure TFCadastroGeral.iniciarCadastroSubTipoOcXSolucao;
begin
  edtCodigoSubTipoOcXSolucao.ReadOnly:=True;
  edtCodigoSubTipoOcXSolucao.Text:=IntToStr(DM.getCodigoSequencial('CD_SUBTIPO_SOLUCAO','DC_SAC_SUBTIPO_SOLUCAO','',''));
  dbLkTipoOcorrenciaSOxSolucao.Enabled:=True;
  dbLkTipoOcorrenciaSOxSolucao.SetFocus;
end;

procedure TFCadastroGeral.salvarCadastroSubTipoOcXSolucao;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.cadastrarSolucaoXSubTipoOcorrencia(StrToInt(edtCodigoSubTipoOcXSolucao.Text),
      dbLkSubTipoOcorrenciaSOxSolucao.KeyValue,dblkSolucaoSOxSolucao.KeyValue,dbLkTipoOcorrenciaSOxSolucao.KeyValue,cbxIdAceite.Items[cbxIdAceite.ItemIndex]);
    { atualiza dados }
    DM.consultarDadosSolucaoXSubTipoOcorrencia(0);

    tbtnSalvar.Enabled:=False;
    Application.MessageBox('Informação cadastrada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.alterarCadastroSubTipoOcXSolucao;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.alterarDadosSubTipoOcXSolucao(strtoint(edtCodigoSubTipoOcXSolucao.Text),dblkSolucaoSOxSolucao.KeyValue,cbxIdAceite.Items[cbxIdAceite.ItemIndex]);
    { atualiza dados }
    DM.consultarDadosSolucaoXSubTipoOcorrencia(0);

    tbtnAlterar.Enabled:=False;
    edtCodigoSubTipoOcXSolucao.SetFocus;
    Application.MessageBox('Informação alterada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.excluirCadastroSubTipoOcXSolucao;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.excluirDadosSubTipoOcXSolucao(strtoint(edtCodigoSubTipoOcXSolucao.Text));

    { atualiza dados }
    DM.consultarDadosSolucaoXSubTipoOcorrencia(0);

    tBtnExcluiritem.Enabled:=False;
    edtCodigoSubTipoOcXSolucao.SetFocus;
    Application.MessageBox('Informação excluída com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

{ Causa }
procedure TFCadastroGeral.visualizarDadosCausaOcorrencia;
begin
  edtCodigoCausa.ReadOnly:=True;
  edtCodigoCausa.Text:=DM.sqlGenericaCadastro.Fields.Fields[0].AsString;
  edtDescCausa.Text:=DM.sqlGenericaCadastro.Fields.Fields[1].AsString;
  if DM.sqlGenericaCadastro.Fields.Fields[2].AsString = 'S' then
    cbxSituacaoCausa.ItemIndex:=0
  else
    cbxSituacaoCausa.ItemIndex:=1;
  cbxSituacaoCausa.Enabled:=True;
  edtDescCausa.SetFocus;
  Application.ProcessMessages;
end;

procedure TFCadastroGeral.iniciarCadastroCausaOcorrencia;
begin
  edtCodigoCausa.ReadOnly:=True;
  edtCodigoCausa.Text:=IntToStr(DM.getCodigoSequencial('CD_CAUSA','DC_SAC_CAUSA','',''));
  cbxSituacaoCausa.Enabled:=True;
  cbxSituacaoCausa.ItemIndex:=0;
  edtDescCausa.SetFocus;
end;

procedure TFCadastroGeral.salvarCadastroCausaOcorrencia;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.cadastrarCausaOcorrencia(StrToInt(edtCodigoCausa.Text),edtDescCausa.Text,cbxSituacaoCausa.Items[cbxSituacaoCausa.ItemIndex]);
    { atualiza dados }
    DM.consultarDadosCausaOcorrencia(0,'');

    tbtnSalvar.Enabled:=False;
    Application.MessageBox('Informação cadastrada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.alterarCadastroCausaOcorrencia;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.alterarDadosCausa(strtoint(edtCodigoCausa.Text),edtDescCausa.Text,cbxSituacaoCausa.Items[cbxSituacaoCausa.ItemIndex]);
    { atualiza dados }
    DM.consultarDadosCausaOcorrencia(0,'');

    tbtnAlterar.Enabled:=False;
    edtCodigoCausa.SetFocus;
    Application.MessageBox('Informação alterada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.excluirCadastroCausaOcorrencia;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.excluirDadosCausaOcorrencia(strtoint(edtCodigoCausa.Text));

    { atualiza dados }
    DM.consultarDadosCausaOcorrencia(0,'');

    tBtnExcluiritem.Enabled:=False;
    edtCodigoCausa.SetFocus;
    Application.MessageBox('Informação excluída com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

{ Causa X SubTipo de Ocorrencia }
procedure TFCadastroGeral.visualizarDadosSubTipoOcXCausa;
begin
  DM.inicializarDataSetLocal(False,True,False);
  edtCodigoSubTipoOcXCausa.ReadOnly:=True;
  edtCodigoSubTipoOcXCausa.Text:=DM.sqlGenericaCadastro.Fields.Fields[0].AsString;

  dbLkTipoOcorrenciaSOxCausa.KeyValue:=DM.sqlGenericaCadastro.Fields.Fields[4].AsString;
  DM.execFiltroSubTipoOcorrencia(DM.sqlGenericaCadastro.Fields.Fields[4].AsInteger);
  dbLkSubTipoOcorrenciaSOxCausa.KeyValue:=DM.sqlGenericaCadastro.Fields.Fields[5].AsString;

  dblkSolucaoSOxCausa.KeyValue:=DM.sqlGenericaCadastro.Fields.Fields[6].AsString;
  dblkSolucaoSOxCausa.Enabled:=True;
  Application.ProcessMessages;
end;

procedure TFCadastroGeral.iniciarCadastroSubTipoOcXCausa;
begin
  edtCodigoSubTipoOcXCausa.ReadOnly:=True;
  edtCodigoSubTipoOcXCausa.Text:=IntToStr(DM.getCodigoSequencial('CD_SUBTIPO_CAUSA','DC_SAC_SUBTIPO_CAUSA','',''));
  dbLkTipoOcorrenciaSOxCausa.Enabled:=True;
  dbLkTipoOcorrenciaSOxCausa.SetFocus;
end;

procedure TFCadastroGeral.salvarCadastroSubTipoOcXCausa;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.cadastrarCausaXSubTipoOcorrencia(StrToInt(edtCodigoSubTipoOcXCausa.Text),
      dbLkSubTipoOcorrenciaSOxCausa.KeyValue,dblkSolucaoSOxCausa.KeyValue,dbLkTipoOcorrenciaSOxCausa.KeyValue);
    { atualiza dados }
    DM.consultarDadosCausaXSubTipoOcorrencia(0);

    tbtnSalvar.Enabled:=False;
    Application.MessageBox('Informação cadastrada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.alterarCadastroSubTipoOcXCausa;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.alterarDadosSubTipoOcXCausa(strtoint(edtCodigoSubTipoOcXCausa.Text),dblkSolucaoSOxCausa.KeyValue);
    { atualiza dados }
    DM.consultarDadosCausaXSubTipoOcorrencia(0);

    tbtnAlterar.Enabled:=False;
    edtCodigoSubTipoOcXCausa.SetFocus;
    Application.MessageBox('Informação alterada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.excluirCadastroSubTipoOcXCausa;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.excluirDadosSubTipoOcXCausa(strtoint(edtCodigoSubTipoOcXCausa.Text));

    { atualiza dados }
    DM.consultarDadosCausaXSubTipoOcorrencia(0);

    tBtnExcluiritem.Enabled:=False;
    edtCodigoSubTipoOcXCausa.SetFocus;
    Application.MessageBox('Informação excluída com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

{ departamento }
procedure TFCadastroGeral.visualizarDadosDepartamento;
begin
  DM.inicializarDataSetLocal(False,True,False);
  edtCodigoDepartamento.ReadOnly:=True;
  edtCodigoDepartamento.Text:=DM.sqlGenericaCadastro.Fields.Fields[0].AsString;
  edtDescDepartamento.Text:=DM.sqlGenericaCadastro.Fields.Fields[1].AsString;
  edtDescDepartamento.SetFocus;

  dblkGerenteDepartamento.Enabled:=True;
  DM.execFiltroListaUsuario(False,False);
  dblkGerenteDepartamento.KeyValue:=DM.sqlGenericaCadastro.Fields.Fields[3].AsInteger;
  Application.ProcessMessages;
end;

{ Motivo Cancelamento }
procedure TFCadastroGeral.visualizarDadosMotivoCancelamento;
begin
//  DM.inicializarDataSetLocal(False,True,False);
  edtCodigoMotivo.ReadOnly:=True;
  edtCodigoMotivo.Text    :=DM.sqlGenericaCadastro.Fields.Fields[0].AsString;
  edtDescricaoMotivo.Text :=DM.sqlGenericaCadastro.Fields.Fields[1].AsString;;
  edtDescricaoMotivo.SetFocus;
  DM.cdsMotivoCancelamento.open;
  DM.dsMotivoCancelamento.DataSet:=DM.cdsMotivoCancelamento;

  Application.ProcessMessages;
end;


procedure TFCadastroGeral.iniciarCadastroDepartamento;
begin
  DM.inicializarDataSetLocal(False,True,False);
  //DM.execFiltroListaUsuario(True,False);
  DM.iniciarListaGerente;

  dblkGerenteDepartamento.Enabled:=True;
  edtCodigoDepartamento.ReadOnly:=True;
  edtCodigoDepartamento.Text:=IntToStr(DM.getCodigoSequencial('CD_DEPTO','DC_SAC_DEPTO','',''));
  edtDescDepartamento.SetFocus;
end;


procedure TFCadastroGeral.iniciarCadastroMotivo;
begin
  DM.inicializarDataSetLocal(False,True,False);
  //DM.execFiltroListaUsuario(True,False);
  DM.iniciarListaMotivoCancelamento;

 //dblkGerenteDepartamento.Enabled:=True;
  edtCodigoMotivo.ReadOnly:=True;
  edtCodigoMotivo.Text:=IntToStr(DM.getCodigoSequencial('CD_SAC_MOTIVO_CANCELAMENTO','DC_SAC_MOTIVO_CANCELAMENTO','',''));

  edtDescricaoMotivo.SetFocus;
  DM.dsMotivoCancelamento.DataSet:=DM.cdsMotivoCancelamento;
//  dbgRelacaoGenerico.DataSource:=DM.dsMotivoCancelamento;
end;


procedure TFCadastroGeral.salvarCadastroDepartamento;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.cadastrarDepartamento(StrToInt(edtCodigoDepartamento.Text),dblkGerenteDepartamento.KeyValue,
    edtDescDepartamento.Text);
    { atualiza dados }
    DM.consultarDadosDepartamento(0);

    tbtnSalvar.Enabled:=False;
    Application.MessageBox('Informação cadastrada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.salvarMotivoCancelamento;
begin
  Screen.Cursor:=crSQLWait;
  try

    dm.cadastrarMotivoCancelamento(StrToInt(edtCodigoMotivo.Text), edtDescricaoMotivo.Text, '');
    { atualiza dados }

    tbtnSalvar.Enabled:=False;
    Application.MessageBox('Informação cadastrada com sucesso!','',0 + 64);

    visualizarDadosMotivoCancelamento;
    Dm.consultarMotivoCancelamento(0);


  finally
    Screen.Cursor:=crDefault;
  end;
end;


procedure TFCadastroGeral.alterarCadastroDepartamento;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.alterarDadosDepartamento(StrToInt(edtCodigoDepartamento.Text),dblkGerenteDepartamento.KeyValue,
      edtDescDepartamento.Text);
    { atualiza dados }
    DM.consultarDadosDepartamento(0);

    tbtnAlterar.Enabled:=False;
    edtCodigoDepartamento.SetFocus;
    Application.MessageBox('Informação alterada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.alterarMotivoCancelamento;
begin
  Screen.Cursor:=crSQLWait;
  try

    DM.AlterarMotivoCancelamento(StrToInt(edtCodigoMotivo.Text), edtDescricaoMotivo.Text,'');
    { atualiza dados }
     DM.cdsMotivoCancelamento.Close;
     DM.consultarMotivoCancelamento(0);
     visualizarDadosMotivoCancelamento;

    tbtnAlterar.Enabled:=False;
    edtCodigoMotivo.SetFocus;
    Application.MessageBox('Informação alterada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;


procedure TFCadastroGeral.excluirCadastroDepartamento;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.excluirDadosDepartamento(strtoint(edtCodigoDepartamento.Text));

    { atualiza dados }
    DM.consultarDadosDepartamento(0);

    tBtnExcluiritem.Enabled:=False;
    edtCodigoDepartamento.SetFocus;
    Application.MessageBox('Informação excluída com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

{ area departamento }
procedure TFCadastroGeral.visualizarDadosAreaDepartamento;
begin
  DM.inicializarDataSetLocal(False,False,False);

  edtCodigoAreaDepartamento.ReadOnly:=True;
  edtCodigoAreaDepartamento.Text:=DM.sqlGenericaCadastro.Fields.Fields[0].AsString;
  edtDescAreaDepartamento.Text:=DM.sqlGenericaCadastro.Fields.Fields[2].AsString;
  edtDescAreaDepartamento.SetFocus;

  cbxPrazoSoucao.Enabled:=True;
  cbxPrazoSoucao.ItemIndex:=Pred(DM.sqlGenericaCadastro.Fields.Fields[3].AsInteger);

  dblkAreaDepto.Enabled:=True;
  dblkAreaDepto.KeyValue:=DM.sqlGenericaCadastro.Fields.Fields[1].AsInteger;

  dblkSupervisorAreaDepto.Enabled:=True;
  dm.iniciarListaSupervisorArea;
  dblkSupervisorAreaDepto.KeyValue:=DM.sqlGenericaCadastro.Fields.Fields[5].AsInteger;

  dblkAreaOrigemDepartamento.Enabled:=True;
  dblkAreaOrigemDepartamento.KeyValue:=DM.sqlGenericaCadastro.Fields.Fields[6].AsInteger;

  Application.ProcessMessages;
end;

procedure TFCadastroGeral.iniciarCadastroAreaDepartamento;
begin
  DM.inicializarDataSetLocal(False,True,False);
  //DM.execFiltroListaUsuario(False,True);
  DM.iniciarListaSupervisorArea;

  edtCodigoAreaDepartamento.ReadOnly:=True;
  edtCodigoAreaDepartamento.Text:=IntToStr(DM.getCodigoSequencial('CD_AREA_DEPTO','DC_SAC_AREA_DEPTO','',''));
  edtDescAreaDepartamento.SetFocus;
  cbxPrazoSoucao.Enabled:=True;
  dblkAreaDepto.Enabled:=True;
  dbLkSubTipoOcorrenciaSOxSolucao.Enabled:=True;
  dblkAreaOrigemDepartamento.Enabled:=True;
end;

procedure TFCadastroGeral.salvarCadastroAreaDepartamento;
var
  prazoSolucao: integer;
begin
  Screen.Cursor:=crSQLWait;
  try
    prazoSolucao:=cbxPrazoSoucao.ItemIndex + 1;
    DM.cadastrarAreaDepartamento(StrToInt(edtCodigoAreaDepartamento.Text),prazoSolucao,
      dblkAreaDepto.KeyValue,dblkSupervisorAreaDepto.KeyValue,dblkAreaOrigemDepartamento.KeyValue,edtDescAreaDepartamento.Text);
    { atualiza dados }
    DM.consultarDadosAreaDepto(0);

    tbtnSalvar.Enabled:=False;
    Application.MessageBox('Informação cadastrada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.alterarCadastroAreaDepartamento;
var
  prazoSolucao: integer;
begin
  Screen.Cursor:=crSQLWait;
  try
    prazoSolucao:=cbxPrazoSoucao.ItemIndex + 1;

    DM.alterarDadosAreaDepartamento(StrToInt(edtCodigoAreaDepartamento.Text),prazoSolucao,
      dblkAreaDepto.KeyValue,dblkSupervisorAreaDepto.KeyValue,dblkAreaOrigemDepartamento.KeyValue,edtDescAreaDepartamento.Text);
    { atualiza dados }
    DM.consultarDadosAreaDepto(0);

    tbtnAlterar.Enabled:=False;
    edtCodigoAreaDepartamento.SetFocus;
    Application.MessageBox('Informação alterada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.excluirCadastroAreaDepartamento;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.excluirDadosAreaDepartamento(strtoint(edtCodigoAreaDepartamento.Text));

    { atualiza dados }
    DM.consultarDadosAreaDepto(0);

    tBtnExcluiritem.Enabled:=False;
    edtCodigoAreaDepartamento.SetFocus;
    Application.MessageBox('Informação excluída com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

{ solucionador }
procedure TFCadastroGeral.visualizarDadosSolucionador;
begin
  DM.inicializarDataSetLocal(False,True,False);
  dblkNomeSolucionador.KeyValue:=DM.sqlGenericaCadastro.Fields.Fields[0].AsString;
  edtMatriculaSolucionador.ReadOnly:=True;
  edtMatriculaSolucionador.Text:=DM.sqlGenericaCadastro.Fields.Fields[0].AsString;
  dblkDeptoSolucionador.KeyValue:=DM.sqlGenericaCadastro.Fields.Fields[4].AsString;
  dblkAreaDeptoSolucionador.KeyValue:=DM.sqlGenericaCadastro.Fields.Fields[5].AsString;
  edtEmailSolucionador.Text:=DM.sqlGenericaCadastro.Fields.Fields[2].AsString;
  if DM.sqlGenericaCadastro.Fields.Fields[3].AsString = 'S' then
    cbxSituacaoSolucionador.ItemIndex:=0
  else
    cbxSituacaoSolucionador.ItemIndex:=1;

  dblkDeptoSolucionador.Enabled:=True;
  dblkAreaDeptoSolucionador.Enabled:=True;
  cbxSituacaoSolucionador.Enabled:=True;
  edtEmailSolucionador.SetFocus;

  Application.ProcessMessages;
end;

procedure TFCadastroGeral.iniciarCadastroSolucionador;
begin
  DM.inicializarDataSetLocal(False,True,False);
  edtMatriculaSolucionador.ReadOnly:=True;
  dblkNomeSolucionador.Enabled:=True;
  dblkNomeSolucionador.SetFocus;
  dblkDeptoSolucionador.Enabled:=True;
  dblkAreaDeptoSolucionador.Enabled:=True;
  edtEmailSolucionador.Clear;
  cbxSituacaoSolucionador.Enabled:=True;
  cbxSituacaoSolucionador.ItemIndex:=0;
  Application.ProcessMessages;
end;

procedure TFCadastroGeral.salvarCadastroSolucionador;
var
  nmSolucionador: string;
  posFinal: integer;
begin
  Screen.Cursor:=crSQLWait;
  try
    nmSolucionador:=dblkNomeSolucionador.Text;
    posFinal:=pred(pos('[',nmSolucionador));
    nmSolucionador:=trim(copy(nmSolucionador,1,posFinal));

    DM.cadastrarSolucionador(StrToInt(edtMatriculaSolucionador.Text),dblkDeptoSolucionador.KeyValue,
      dblkAreaDeptoSolucionador.KeyValue,nmSolucionador,edtEmailSolucionador.Text,
      cbxSituacaoSolucionador.Items[cbxSituacaoSolucionador.ItemIndex]);
    { atualiza dados }
    DM.consultarDadosSolucionador(0);

    tbtnSalvar.Enabled:=False;
    Application.MessageBox('Informação cadastrada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.alterarCadastroSolucionador;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.alterarDadosSolucionador(StrToInt(edtMatriculaSolucionador.Text),dblkDeptoSolucionador.KeyValue,
      dblkAreaDeptoSolucionador.KeyValue,edtEmailSolucionador.Text,cbxSituacaoSolucionador.Items[cbxSituacaoSolucionador.ItemIndex]);
    { atualiza dados }
    DM.consultarDadosSolucionador(0);

    tbtnAlterar.Enabled:=False;
    edtMatriculaSolucionador.SetFocus;
    Application.MessageBox('Informação alterada com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.excluirCadastroSolucionador;
begin
  Screen.Cursor:=crSQLWait;
  try
    DM.excluirDadosSolucionador(strtoint(edtMatriculaSolucionador.Text));

    { atualiza dados }
    DM.consultarDadosSolucionador(0);

    tBtnExcluiritem.Enabled:=False;
    edtMatriculaSolucionador.SetFocus;
    Application.MessageBox('Informação excluída com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFCadastroGeral.excluirMotivoCancelamento;
begin
  Screen.Cursor:=crSQLWait;
  try
    //DM.excluirDadosSolucionador(strtoint(edtMatriculaSolucionador.Text));
      Application.MessageBox('Opção não disponivel !','',0 + 64);
    { atualiza dados }
    DM.consultarMotivoCancelamento(0);



    tBtnExcluiritem.Enabled:=False;
    edtCodigoMotivo.SetFocus;
//    Application.MessageBox('Informação excluída com sucesso!','',0 + 64);
  finally
    Screen.Cursor:=crDefault;
  end;
end;


procedure TFCadastroGeral.edtCodigoSubTipoOcXCausaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_ESCAPE : edtCodigoSubTipoOcXCausa.Clear;
    VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TFCadastroGeral.execPainelCadAreaOrigem;
begin
  ntbControle.ActivePage:='cadAreaOrigem';
  tBtnNovo.Enabled:=True;
  DM.consultarDadosAreaOrigem(0,'');
end;

procedure TFCadastroGeral.execPainelCadStatus;
begin
  ntbControle.ActivePage:='cadStatus';
  tBtnNovo.Enabled:=True;
  DM.consultarDadosStatusOcorrencia(0,'');

end;

procedure TFCadastroGeral.execPainelCadEmbalagem;
begin
  ntbControle.ActivePage:='cadEmbalagem';
  tBtnNovo.Enabled:=True;
  DM.consultarDadosSituacaoEmbalagem(0,'');

end;

procedure TFCadastroGeral.execPainelCadTipoOcorrencia;
begin
  ntbControle.ActivePage:='cadTipoOcorrencia';
  tBtnNovo.Enabled:=True;
  DM.consultarDadosTipoOcorrencia(0,0,'');
end;

procedure TFCadastroGeral.execPainelCadSubTipoOcorrencia;
begin
  ntbControle.ActivePage:='cadSubTipoOcorrencia';
  tBtnNovo.Enabled:=True;
  DM.consultarDadosSubTipoOcorrencia(0,0,'');
end;

procedure TFCadastroGeral.execPainelCadSolucao;
begin
  ntbControle.ActivePage:='cadSolucao';
  tBtnNovo.Enabled:=True;
  DM.consultarDadosSolucaoOcorrencia(0,'');
end;

procedure TFCadastroGeral.execPainelCadSubTipoXSolucao;
begin
  ntbControle.ActivePage:='cadSubTipoXSolucao';
  tBtnNovo.Enabled:=True;
  DM.consultarDadosSolucaoXSubTipoOcorrencia(0);
  dbgRelacaoGenerico.SetFocus;
end;

procedure TFCadastroGeral.execPainelCadCausa;
begin
  ntbControle.ActivePage:='cadCausa';
  tBtnNovo.Enabled:=True;
  DM.consultarDadosCausaOcorrencia(0,'');
end;

procedure TFCadastroGeral.execPainelCadSubTipoXCausa;
begin
  ntbControle.ActivePage:='cadSubTipoXCausa';
  tBtnNovo.Enabled:=True;
  DM.consultarDadosCausaXSubTipoOcorrencia(0);
end;

procedure TFCadastroGeral.execPainelCadSetorPesquisa;
begin
  ntbControle.ActivePage:='cadSetorPesquisa';
  tBtnNovo.Enabled:=True;
  DM.consultarDadosSetorPesquisaSatisfacao;
end;

procedure TFCadastroGeral.execPainelCadPerguntaPesquisa;
begin
  ntbControle.ActivePage:='cadPerguntaPesquisa';
  tBtnNovo.Enabled:=True;
  DM.consultarDadosPerguntaPesquisaSatisfacao;
end;

procedure TFCadastroGeral.execPainelCadPesquisa;
begin
  ntbControle.ActivePage:='cadPesquisa';
  tBtnNovo.Enabled:=True;
  DM.consultarDadosPesquisaSatisfacao;
end;

procedure TFCadastroGeral.execPainelCadDepartamento;
begin
  ntbControle.ActivePage:='cadDepartamento';
  tBtnNovo.Enabled:=True;
  DM.consultarDadosDepartamento(0);
end;

procedure TFCadastroGeral.execPainelCadAreaDepto;
begin
  ntbControle.ActivePage:='cadAreaDepto';
  tBtnNovo.Enabled:=True;
  DM.consultarDadosAreaDepto(0);
end;

procedure TFCadastroGeral.execPainelCadSolucionador;
begin
  ntbControle.ActivePage:='cadSolucionador';
  tBtnNovo.Enabled:=True;
  DM.consultarDadosSolucionador(0);
end;

procedure TFCadastroGeral.execPainelCadMotivo;
begin
  ntbControle.ActivePage:='cadMotivo';
  tBtnNovo.Enabled:=True;
  dm.iniciarListaMotivoCancelamento;
  Dm.consultarMotivoCancelamento(0);
  visualizarDadosMotivoCancelamento
end;


procedure TFCadastroGeral.tvwTipoDeCadastroClick(Sender: TObject);
begin
  if not ntbControle.Enabled then
    ntbControle.Enabled:=True;


  limpaEdit;
  DM.inicializarDataSetLocal(True,False,False);

  if tvwTipoDeCadastro.Items[0].Selected then
    execPainelCadAreaOrigem;

  if tvwTipoDeCadastro.Items[1].Selected then
    execPainelCadStatus;

  if tvwTipoDeCadastro.Items[2].Selected then
    execPainelCadEmbalagem;

  if tvwTipoDeCadastro.Items[3].Selected then
    execPainelCadTipoOcorrencia;

  if tvwTipoDeCadastro.Items[4].Selected then
    execPainelCadSubTipoOcorrencia;

  if tvwTipoDeCadastro.Items[5].Selected then
    execPainelCadSolucao;

  if tvwTipoDeCadastro.Items[6].Selected then
    execPainelCadSubTipoXSolucao;

  if tvwTipoDeCadastro.Items[7].Selected then
    execPainelCadCausa;

  if tvwTipoDeCadastro.Items[8].Selected then
    execPainelCadSubTipoXCausa;

  if tvwTipoDeCadastro.Items[9].Selected then
    execPainelCadSetorPesquisa;

  if tvwTipoDeCadastro.Items[10].Selected then
    execPainelCadPerguntaPesquisa;

  if tvwTipoDeCadastro.Items[11].Selected then
    execPainelCadPesquisa;

  if tvwTipoDeCadastro.Items[12].Selected then
    execPainelCadDepartamento;

  if tvwTipoDeCadastro.Items[13].Selected then
    execPainelCadAreaDepto;

  if tvwTipoDeCadastro.Items[14].Selected then
    execPainelCadSolucionador;

  if tvwTipoDeCadastro.Items[16].Selected then
    execPainelCadMotivo;

end;

procedure TFCadastroGeral.tvwTipoDeCadastroCustomDrawItem(
  Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if Node.Selected then
  begin
    tvwTipoDeCadastro.Canvas.Brush.Color := clHighlight;
    tvwTipoDeCadastro.Canvas.Font.Color := clWhite;
  end
  else
  begin
    tvwTipoDeCadastro.Canvas.Brush.Color := clWhite;
    tvwTipoDeCadastro.Canvas.Font.Color := clWindowText;
  end;
end;

end.
