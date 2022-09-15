unit URelacaoCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, UFAtendimentoCliente;

type
  TFRelacaoCliente = class(TForm)
    StatusBar1: TStatusBar;
    dbgRelacaoCliente: TDBGrid;
    procedure dbgRelacaoClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgRelacaoClienteDblClick(Sender: TObject);
    procedure dbgRelacaoClienteTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelacaoCliente: TFRelacaoCliente;

implementation

uses UDM ;

{$R *.dfm}

procedure TFRelacaoCliente.dbgRelacaoClienteDblClick(Sender: TObject);
begin
  FAtendimentoCliente.carregaDadosCliente;
  close;
end;

procedure TFRelacaoCliente.dbgRelacaoClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_ESCAPE : close;
    VK_RETURN : begin
                  FAtendimentoCliente.carregaDadosCliente;
                  close;
                end;
  end;
end;

procedure TFRelacaoCliente.dbgRelacaoClienteTitleClick(Column: TColumn);
begin
  DM.ordenarGridS(DM.sqlConsultaCliente,Column.FieldName);
end;

procedure TFRelacaoCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FRelacaoCliente:=nil;
  Action:=caFree;
end;

end.
