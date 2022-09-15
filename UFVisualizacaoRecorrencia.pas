unit UFVisualizacaoRecorrencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DBCtrls, Grids, DBGrids, UDadosOcorrencia;

type
  TFVisualizacaoRecorrencia = class(TForm)
    StatusBar1: TStatusBar;
    gbxPrincipal: TGroupBox;
    dbgRelacaoRecorrencia: TDBGrid;
    dbMemObservacaoRecorrencia: TDBMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgRelacaoRecorrenciaTitleClick(Column: TColumn);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbgRelacaoRecorrenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure execExcluirRecorrencia;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVisualizacaoRecorrencia: TFVisualizacaoRecorrencia;

implementation

uses UDm;

{$R *.dfm}

procedure TFVisualizacaoRecorrencia.dbgRelacaoRecorrenciaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_F2 : begin
              { carrega dados da recorrencia }
              recorrencia.limparDados;
              recorrencia.cdOcorrencia:=DM.cdsOcorrenciacdOcorrencia.AsInteger;
              recorrencia.cdItem:=DM.cdsRecorrenciaItemCD_ITEM_OCORRENCIA.AsInteger;
              recorrencia.cdRecorrencia:=DM.cdsRecorrenciaItemCD_RECORRENCIA.AsInteger;

              if Application.MessageBox(pchar('Deseja excluir o item "'+ inttostr(recorrencia.cdItem) +'" da recorrência atual?'),'Alerta do Sistema',4 + 32) = 6 then
                execExcluirRecorrencia;
    end;
  end;
end;

procedure TFVisualizacaoRecorrencia.dbgRelacaoRecorrenciaTitleClick(
  Column: TColumn);
begin
  DM.ordenarGridD(DM.cdsRecorrenciaItem,Column.FieldName);
end;

procedure TFVisualizacaoRecorrencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FVisualizacaoRecorrencia:=nil;
  Action:=caFree;
end;

procedure TFVisualizacaoRecorrencia.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
    Close;
end;

procedure TFVisualizacaoRecorrencia.execExcluirRecorrencia;
begin
  Screen.Cursor:=crSQLWait;
  try
    try
      { excluir a recorrencia do item atual }
      DM.excluirRecorrencia;
    except
      on E:Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

end.
