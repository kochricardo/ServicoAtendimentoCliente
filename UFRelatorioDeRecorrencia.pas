unit UFRelatorioDeRecorrencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons,COMobj;

type
  TFRelatorioDeRecorrencia = class(TForm)
    StatusBar1: TStatusBar;
    gbxFiltro: TGroupBox;
    gbxFiltroPeriodo: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    dpkDataInicial: TDateTimePicker;
    dpkDataFinal: TDateTimePicker;
    btnProcessar: TBitBtn;
    btnLimpar: TBitBtn;
    procedure btnProcessarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    procedure gerarPlanilhaDeRecorrencia;
    procedure limparFiltroData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioDeRecorrencia: TFRelatorioDeRecorrencia;

implementation

uses UDm;

{$R *.dfm}

procedure TFRelatorioDeRecorrencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FRelatorioDeRecorrencia:=nil;
  Action:=caFree;
end;

procedure TFRelatorioDeRecorrencia.limparFiltroData;
begin
  dpkDataInicial.Date:=Date - 180;
  dpkDataFinal.Date:=Date;
end;

procedure TFRelatorioDeRecorrencia.FormCreate(Sender: TObject);
begin
  limparFiltroData;
end;

procedure TFRelatorioDeRecorrencia.gerarPlanilhaDeRecorrencia;
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

    Excel.workBooks[1].Sheets[1].name:='Controle de Recorrências';
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,1]:='Solucionador';
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,2]:='Gerente/Supervisor';
    Excel.workBooks[1].Sheets[1].Cells[nrLinha,3]:='Total';
    Excel.workBooks[1].Sheets[1].range['A1','C1'].font.bold := true;
    Excel.workBooks[1].Sheets[1].range['A1','C1'].Interior.Color:= $00ffcf9c;

    while not DM.sqlRelatorio.Eof do
    begin
      inc(nrLinha);
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,1]:=DM.sqlRelatorio.FieldByName('SOLUCIONADOR').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,2]:=DM.sqlRelatorio.FieldByName('GERENTE').AsString;
      Excel.workBooks[1].Sheets[1].Cells[nrLinha,3]:=DM.sqlRelatorio.FieldByName('TOTAL').AsString;
      Excel.workBooks[1].Sheets[1].range['A1',getNomeCelula(nrLinha,3)].Interior.Color:= $00ffcf9c;
      Excel.workBooks[1].Sheets[1].Range['A1',getNomeCelula(nrLinha,3)].Borders.LineStyle := 1;
      DM.sqlRelatorio.Next;
    end;

    { grafico }
    Excel.workBooks[1].WorkSheets[1].ChartObjects.Add(10,160,1000,300);
    chart:=Excel.workBooks[1].WorkSheets[1].ChartObjects(1);
    chart.Chart.ChartType := $00000033;
    chart.Chart.SeriesCollection.Add(Excel.workBooks[1].WorkSheets[1].Range['A1',getNomeCelula(nrLinha,3)]);
  finally

  end;
end;

procedure TFRelatorioDeRecorrencia.btnLimparClick(Sender: TObject);
begin

  limparFiltroData;
end;

procedure TFRelatorioDeRecorrencia.btnProcessarClick(Sender: TObject);
begin
  Screen.Cursor:=crSQLWait;
  try
    if dpkDataFinal.Date < dpkDataInicial.Date then
      raise Exception.Create('A "Data Final" deve ser maior que a "Data Inicial"');

    DM.gerarRelatorioDeRecorrencia(dpkDataInicial.Date,dpkDataFinal.Date);
    if not DM.sqlRelatorio.IsEmpty then
      gerarPlanilhaDeRecorrencia;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

end.
