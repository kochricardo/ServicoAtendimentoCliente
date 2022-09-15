unit uFRelacaoVolumeNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, Grids, DBGrids, StdCtrls, DBClient,UDm;

type
  TFRelacaoVolumeDaNota = class(TForm)
    _grBoxVolume: TGroupBox;
    _dbgVolumes: TDBGrid;
    StatusBar1: TStatusBar;
    _dsRelacaoVolume: TDataSource;
    _cdsTemp2: TClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure _dbgVolumesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    function MostraVolumes(PnrRomaneio,PnrEmpresa: Integer;PdtRomaneio:String): Boolean;
    procedure SetGridVolume;
    { Private declarations }
  public
    { Public declarations }
   _cdstemp:TClientDataSet;

  end;

var
  FRelacaoVolumeDaNota: TFRelacaoVolumeDaNota;

  nrRomaneio :Integer;
  dtRomaneio :String;
  nrEmpresa  :Integer;

implementation



{$R *.dfm}



procedure TFRelacaoVolumeDaNota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TFRelacaoVolumeDaNota.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
     VK_ESCAPE :Close;

   end;
end;

procedure TFRelacaoVolumeDaNota.FormShow(Sender: TObject);
begin
MostraVolumes(nrRomaneio,nrempresa,dtRomaneio);
end;

function TFRelacaoVolumeDaNota.MostraVolumes(PnrRomaneio,PnrEmpresa:Integer;PdtRomaneio:String) :Boolean;
var
  stQry :TStringList;

begin

   stQry:=TStringList.Create;
   _cdstemp:=TClientDataSet.Create(nil);
   _cdstemp.RemoteServer:=dm._LocalConexao;

   with stQry do
   begin
     Add('SELECT NROM_I*10+NR_DV_MERCADORIA CODIGO,NM_MERCADORIA||'' ''||DS_APRESENTACAO_MERCADORIA MERCADORIA, QUAI_I QUANT,DS_LOCAL_SEPARACAO TIPO_VOLUME,SEQV_I SEQ_VOLUME,''N'' as ID_SELECIONADO,');
     Add('              NR_DV_MERCADORIA DIG');
     Add('FROM');
     Add(' PRDDM.V_DCIOSDHST I,');
     Add(' PRDDM.DC_LOCAL_SEPARACAO L,');
     Add(' PRDDM.DC_MERCADORIA,');
     Add(' PRDDM.V_DCPRNHST P');
     Add('WHERE TIPN_I = ''V''');
     Add('AND TIPV_I = CD_LOCAL_SEPARACAO');
     Add('AND NROM_I = CD_MERCADORIA');
     Add('AND I.CD_EMPRESA = L.CD_EMPRESA');
     Add('AND P.ID_EMPRESA = I.CD_EMPRESA');
     Add('AND P.NROR_R = I.NRON_I');
     Add('AND I.CD_EMPRESA = :PnrEmpresa');
     Add('AND P.NRON_R = :PnrRomaneio');
     Add('AND P.DATO_R = :PdtRomaneio');
     //Add('ORDER BY 5,1'):
   end;

   with _cdstemp do
   begin
     close;
      ProviderName := '_dsPGenerica';
     CommandText:=stQry.Text;
     Params.ParamByName('PnrEmpresa').AsBCD:= PnrEmpresa;
     Params.ParamByName('PnrRomaneio').AsBCD:= PnrRomaneio;
     Params.ParamByName('PdtRomaneio').AsString:= PdtRomaneio;
     open;
   end;
   if not _cdstemp.IsEmpty then
   begin
        _cdstemp.IndexFieldNames:='SEQ_VOLUME;CODIGO';
       _dsRelacaoVolume.DataSet:=_cdstemp;
      _dbgVolumes.DataSource:= _dsRelacaoVolume;
      SetGridVolume;

   end
   else
      close;
end;

procedure TFRelacaoVolumeDaNota.SetGridVolume;
begin

   TIntegerField(_cdsTemp.FieldByName('CODIGO')).DisplayLabel:='CODIGO';
   TIntegerField(_cdstemp.FieldByName('CODIGO')).DisplayWidth:=07;

   TStringField(_cdstemp.FieldByName('MERCADORIA')).DisplayLabel:='MERCADORIA';
   TStringField(_cdstemp.FieldByName('MERCADORIA')).DisplayWidth:=50;

   TIntegerField(_cdstemp.FieldByName('QUANT')).DisplayLabel:='QUANT';
   TIntegerField(_cdstemp.FieldByName('QUANT')).DisplayWidth:=07;


   TStringField(_cdstemp.FieldByName('TIPO_VOLUME')).DisplayLabel:='Tipo Vol.';
   TStringField(_cdstemp.FieldByName('TIPO_VOLUME')).DisplayWidth:=15;

   TIntegerField(_cdstemp.FieldByName('SEQ_VOLUME')).DisplayLabel:='Seq.Vol.';
   TIntegerField(_cdstemp.FieldByName('SEQ_VOLUME')).DisplayWidth:=07;

   TStringField(_cdstemp.FieldByName('ID_SELECIONADO')).Visible:=false;
   TStringField(_cdstemp.FieldByName('DIG')).Visible:=false;




end;

procedure TFRelacaoVolumeDaNota._dbgVolumesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

   if _cdstemp.Active then
   begin

   // mude a cor das celulas em que valor = 0
      if odd(_cdstemp.RecNo) then
      begin
        _dbgVolumes.Canvas.Font.Color := clBlack;
        _dbgVolumes.Canvas.Brush.Color := clSkyBlue;
      end
      else
      begin
        _dbgVolumes.Canvas.Font.Color := clBlack;
        _dbgVolumes.Canvas.Brush.Color := clWhite;
      end;

      _dbgVolumes.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
end;

end.
