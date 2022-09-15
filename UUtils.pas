unit UUtils;

interface


uses
  SysUtils, classes,DateUtils,StdCtrls, MessageDigest_5,StrUtils,
  UParametroSistema, UUsuario;

const
  TIPO_LIGACAO_AGUARDANDO = 1;
  TIPO_LIGACAO_ATENDIDO_NORMAL = 2;
  TIPO_LIGACAO_RETORNO_OK = 3;
  TIPO_LIGACAO_SEM_RETORNO = 4;
  TIPO_PRODUTO_MEDICAMENTO = 1;

  CD_PRIORIDADE_NORMAL = 1;
  CD_PRIORIDADE_ALTA = 2;

  DS_ESPECIALIDADE_ANTINEOPLASICO = 'ANTINEOPLASICO';
  NR_ESPECIALIDADE_ANTINEOPLASICO = 561;

  ID_TELEFONE_CLIENTE_IDENTIFICADOR = 'F';
  ID_TELEFONE_CLIENTE_SAC = 'S';
  CD_EMAIL_CATEGORIA_SAC = '31';

  { estrutura de email - PRDDM.DC_DOMINIO / PRDDM.DC_EMAIL }
  CD_CATEGORIA_EMAIL_SAC_DOMINIO = 5;
  CD_TIPO_DESTINO_EMAIL_SAC_DOMINIO = 3;

  { meio de contato que originou a ocorrencia }
  CD_MEIO_CONTATO_INTERNO_GAM = 1;
  CD_MEIO_CONTATO_EMAIL = 2;
  CD_MEIO_CONTATO_TELEFONE_SAC = 3;

  LINK_MENSAGEM_PRODUTO_TERMOLABIL = 'https://sites.google.com/gam.com.br/devoluo-termolbeis/p%C3%A1gina-inicial';

  function formataCNPJ(const value:string):string;
  function valorNumerico(const value:string):Boolean;
  function addDia(data: Tdate):string;
  function isEmailValido(dsEmail:string):Boolean;
  function EncriptaSenhaEmail(st:string):string;
  function DesEncriptaSenhaEmail(st:string):string;
  function limparCampoTelefone(dsTelefone:string):string;
  function formataNumeroTelefone(dsTelefone:string):string;
  function cdPrioridadeToDescricao(value: integer):string;
  function cdCausaOcorrenciaToDescricao(value: integer):string;
  function cdCausaItemToDescricao(value: integer):string;
  function cdSolucaoOcorrenciaToDescricao(value: integer):string;
  function cdSolucaoItemToDescricao(value: integer):string;
  function getDigitoVerificador(cdCodigo:integer):integer;
  function getCodigoSemDigitoVerificador(cdCodigo:integer):integer;
  function getDataInicioMes(dataAtual:TDate):TDate;
  function isDataValida(dsData:string):Boolean;
  function stringToBoolean(value :string):Boolean;
  function booleanToString(value :Boolean):string;
  function getListaTransbordo(value: string; comboBox:TComboBox):TComboBox;
  function getDescricaoSituacaoEstoque(value: integer):string;
  function criptografaMD5(value:AnsiString):string;
  function isSenhaValida(aSenhaInformada,aSenhaDB:string):Boolean;
  function formatarNomePessoa(dsNome:string):string;
  function getIntervaloEntreData(dataEmpresa,dataEmissaoNFe:TDate):integer;
  procedure gravaNomeTabela(dtEmissao,dtHoje:TDate);
  function TipoAmbienteToAString(ambiente:TAmbiente):string;
  function validarTextoObsevacao(dsTexto:string):string;
  function formatarNrTelefone(dsFone:string):string;
  function converterFloatParaString(dsTexto:string):string;

implementation

uses UDm;

function converterFloatParaString(dsTexto:string):string;
begin
  Result:=StringReplace(StringReplace(dsTexto,'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);
end;

function validarTextoObsevacao(dsTexto:string):string;
begin
  if dsTexto <> EmptyStr then
    Result:=dsTexto
  else
    Result:=' ';
end;

function TipoAmbienteToAString(ambiente:TAmbiente):string;
begin
  case ambiente of
    Homologacao : Result:='Homologação';
    Producao : Result:='Produção';
  end;
end;

function getIntervaloEntreData(dataEmpresa,dataEmissaoNFe:TDate):integer;
var
  cdDataEmpresa: integer;
  cdDataNFe: integer;
begin
  cdDataEmpresa:=DayOfTheWeek(dataEmpresa);
  cdDataNFe:=DayOfTheWeek(dataEmissaoNFe);
      { segunda-feira }       { sexta-feira }
  if ((cdDataEmpresa = 1) and (cdDataNFe = 5)) then
    Result:=0
  else
    Result:=DaysBetween(dataEmpresa,dataEmissaoNFe);
end;


function formatarNomePessoa(dsNome:string):string;
var
  i: integer;
  x: integer;
  str: string;
  isAlterarLetra: Boolean;
begin
  str:=LowerCase(dsNome);
  x:=Length(str);
  isAlterarLetra:=True;

  for I:=1 to x do
  begin
    if isAlterarLetra  then
      str[i]:=UpCase(str[i]);

    if str[i] = ' ' then
      isAlterarLetra:=True
    else
      isAlterarLetra:=False;
  end;
  Result:=str;
end;

function criptografaMD5(value:AnsiString):string;
var
  hash: MessageDigest_5.IMD5;
begin
  hash := MessageDigest_5.GetMD5();
  hash.Update(Value);
  Result := hash.AsString();
end;

function isSenhaValida(aSenhaInformada,aSenhaDB:string):Boolean;
begin
  aSenhaInformada:=criptografaMD5(aSenhaInformada);
  Result:=isHexEquals(aSenhaInformada,aSenhaDB);
end;

function getDescricaoSituacaoEstoque(value: integer):string;
begin
  case value of
    1 : Result:='CORRETO';
    2 : Result:='MAIOR';
    3 : Result:='MENOR';
  end;
end;

function getListaTransbordo(value: string; comboBox:TComboBox):TComboBox;
const
  MSG_TRANSBORDO = 'TRANSBORDO EM :';
var
  posIni: integer;
  posFinal: integer;
  variacao: integer;
  strTemp: string;
  strTransb: string;

begin
  comboBox.Items.Clear;
  variacao:=(Length(MSG_TRANSBORDO)+1);
  posIni:=variacao;
  strTemp:=copy(value,posIni,length(value));

  while Length(strTemp) > 0 do
  begin
    posFinal:=(pos(MSG_TRANSBORDO,strTemp)-1);
    if posFinal <= 0 then
      posFinal:=length(strTemp);

    strTransb:=MSG_TRANSBORDO + copy(strTemp,1,posFinal);
    comboBox.Items.Add(strTransb);
    strTemp:=copy(strTemp,posFinal + variacao,length(strTemp));
  end;
  Result:=comboBox;
end;

function stringToBoolean(value :string):Boolean;
begin
  Result:=False;
  if UpperCase(value[1]) = 'S' then
    Result:=True;
end;

function booleanToString(value :Boolean):string;
begin
  Result:='N';
  if value then
    Result:='S';
end;

function isDataValida(dsData:string):Boolean;
var
  ano,mes,dia: Word;
begin
  Result:=False;
  try
    DecodeDate(StrToDate(dsData),ano,mes,dia);
  except
    exit;
  end;

  try
    if IsValidDate(ano,mes,dia) then
      Result:=True
    else
      raise Exception.Create('Data inválida');
  except
    on E:Exception  do
      raise Exception.Create(E.Message);
  end;
end;

function getDataInicioMes(dataAtual:TDate):TDate;
begin
  Result:=StartOfTheMonth(dataAtual);
end;

function getCodigoSemDigitoVerificador(cdCodigo:integer):integer;
var
  temp: string;
begin
  try
    temp:=inttostr(cdCodigo);
    temp:=copy(temp,1,pred(length(temp)));

    Result:=StrToInt(temp);
  except
    raise Exception.Create('Erro a buscar digito verificador');
  end;
end;

function getDigitoVerificador(cdCodigo:integer):integer;
var
  temp: string;
begin
  try
    temp:=inttostr(cdCodigo);
    temp:=temp[Length(temp)];
    Result:=StrToInt(temp);
  except
    raise Exception.Create('Erro a buscar digito verificador');
  end;
end;

function formataNumeroTelefone(dsTelefone:string):string;
begin
  if Length(trim(dsTelefone)) = 10 then
    Result:=FormatFloat('(##)####-####',strtofloat(dsTelefone))
  else
    Result:=dsTelefone;
end;

function limparCampoTelefone(dsTelefone:string):string;
var
  temp : string;
begin
  temp:=StringReplace(dsTelefone,'(','',[rfReplaceAll]);
  temp:=StringReplace(temp,')','',[rfReplaceAll]);
  temp:=StringReplace(temp,'-','',[rfReplaceAll]);
  temp:=StringReplace(temp,' ','',[rfReplaceAll]);
  Result:=temp;
end;

function isEmailValido(dsEmail:string):Boolean;
var
  i : integer;
begin
  Result:=false;

  // Verifica se existe o caracter "@" arroba
  i:=pos('@',dsEmail);
  if i > 0 then
    Result:=true
  else
  begin
    Result:=false;
    exit;
  end;

  // Verifica se existe ao menos 1 caracter (.)ponto
  i:=pos('.',dsEmail);
  if i > 0 then
    Result:=true
  else
  begin
    Result:=false;
    exit;
  end;

  // Verifica se o tamanho é no minino de 5 caracteres
  i:=length(trim(dsEmail));
  if i >= 5 then
    Result:=true
  else
  begin
    Result:=false;
    exit;
  end;

  // Verifica se os caracteres "@" e "." estao em sequencia
  i:=pos('@.',dsEmail);
  if i = 0 then
    Result:=true
  else
  begin
    Result:=false;
    exit;
  end;

end;

function formataCNPJ(const value:string):string;
var
  i : integer;
  str : string;
begin
  Result:='';
  for I := 1 to 14 do
  begin
    str:=copy(value,i,1);
    Result:=Result + str;
    if i in [2,5] then
      Result:=Result + '.';
    if i = 8 then
      Result:=Result + '/';
    if i = 12 then
      Result:=Result + '-';
  end;
end;

function valorNumerico(const value:string):Boolean;
var
  i : integer;
begin
  for I := 1 to Length(value) do
  begin
    if copy(value,i,1)[1] in ['0','1','2','3','4','5','6','7','8','9'] then
      Result:=true
    else
    begin
      Result:=false;
      break;
    end;
  end;
end;

function addDia(data: Tdate):string;
begin
  data:=IncDay(data,2);
  Result:=FormatDateTime('DD/MM/YYYY',data);
end;

function HexToInt(const HexStr: string): longint;
var
  iNdx: integer;
  cTmp: Char;
begin
  Result := 0;
  for iNdx := 1 to Length(HexStr) do
  begin
    cTmp := HexStr[iNdx];
    case cTmp of
    '0'..'9': Result := 16 * Result + (Ord(cTmp) - $30);
    'A'..'F': Result := 16 * Result + (Ord(cTmp) - $37);
    'a'..'f': Result := 16 * Result + (Ord(cTmp) - $57);
    else
      raise EConvertError.Create('Illegal character in hex string');
    end;
  end;
end;

function EncriptaSenhaEmail(st:string):string;
var
   stc : string;
   i, n : integer;
   chave : byte;
begin
   Result := '';
   Randomize;
   chave := Random(255);

   stc:=IntToHex((23 xor chave),2);
   if Length(st) > 0 then
   begin
      n := Length(st);
      for i := 1 to n do
      begin
         Result := Result + IntToHex(chave xor (ord(st[i])+i),2)
      end;
   Result := stc+Result;
   end;
end;

function DesEncriptaSenhaEmail(st:string):string;
var
   i, n : integer;
   chave : byte;
   Caracter : String[2];
begin
   Result := '';
   if Length(st) > 0 then
   begin
      Caracter := Copy(st,1,2);
      chave := 23 xor ord(HexToInt(Caracter));

      n:=length(st);
      n := n div 2;
      st := Copy(st,3,length(st));
      for i := 1 to n-1 do
      begin
        Caracter := Copy(st,1,2);
        st := Copy(st,3,length(st));
        Caracter := chr((Chave xor ord(HexToInt(Caracter))-i));
        Result   := Result + Caracter;
      end;
   end;
end;

function cdCausaItemToDescricao(value: integer):string;
begin
  case value of
    1 : Result:='Pendente';
    2 : Result:='Não Necessita Causa';
    3 : Result:='Finalizado';
    4 : Result:='Cancelado';
  end;
end;

function cdCausaOcorrenciaToDescricao(value: integer):string;
begin
  case value of
    1 : Result:='Pendente';
    2 : Result:='Parcialmente Solucionada';
    3 : Result:='Finalizado';
    4 : Result:='Cancelado';
  end;
end;

function cdSolucaoItemToDescricao(value: integer):string;
begin
  case value of
    1 : Result:='Pendente';
    2 : Result:='Finalizado';
    4 : Result:='Cancelado';
  end;
end;

function cdSolucaoOcorrenciaToDescricao(value: integer):string;
begin
  case value of
    1 : Result:='Pendente';
    2 : Result:='Parcialmente Solucionada';
    3 : Result:='Finalizado';
    4 : Result:='Cancelado';
  end;
end;

function cdPrioridadeToDescricao(value: integer):string;
begin
  case value of
    1 : Result:='Normal';
    2 : Result:='Alta Prioridade';
  end;
end;

procedure gravaNomeTabela(dtEmissao,dtHoje:TDate);
var
  mesEmissaoNF, anoEmissaoNF: string;
  mesAtual, anoAtual: string;
begin
  tabelaPesquisa.limparDados;
  anoEmissaoNF:=FormatFloat('0000',YearOf(dtEmissao));
  mesEmissaoNF:=FormatFloat('00',MonthOf(dtEmissao));
  anoAtual:=FormatFloat('0000',YearOf(dtHoje));
  mesAtual:=FormatFloat('00',MonthOf(dtHoje));

  if anoEmissaoNF < anoAtual then
  begin
    tabelaPesquisa.dcnot  :='PRDKP'+ anoEmissaoNF +'.DCNOT_'+ mesEmissaoNF + anoEmissaoNF;
    tabelaPesquisa.dcios  :='PRDKP'+ anoEmissaoNF +'.DCIOS_'+ mesEmissaoNF + anoEmissaoNF;
    tabelaPesquisa.dcilo  :='PRDKP'+ anoEmissaoNF +'.DCILO_'+ mesEmissaoNF + anoEmissaoNF;
    tabelaPesquisa.dcord  :='PRDKP'+ anoEmissaoNF +'.DCORD_'+ mesEmissaoNF + anoEmissaoNF;
    tabelaPesquisa.dcNFeDadosAdicionais  :='PRDKP'+ anoEmissaoNF +'.DC_NFE_DADOS_ADICIONAIS_'+ mesEmissaoNF + anoEmissaoNF;

    if not DM.isExisteTabela(tabelaPesquisa.dcnot) then
    begin
      tabelaPesquisa.dcnot:='PRDDM.DCNOT';
      tabelaPesquisa.dcios:='PRDDM.DCIOS';
      tabelaPesquisa.dcilo:='PRDDM.DCILO';
      tabelaPesquisa.dcord:='PRDDM.DCORD';
      tabelaPesquisa.dcNFeDadosAdicionais:='PRDDM.DC_NFE_DADOS_ADICIONAIS';
    end;
  end
  else
  begin
    if mesEmissaoNF < mesAtual then
    begin
      tabelaPesquisa.dcnot  :='PRDKP'+ anoEmissaoNF +'.DCNOT_'+ mesEmissaoNF + anoEmissaoNF;
      tabelaPesquisa.dcios  :='PRDKP'+ anoEmissaoNF +'.DCIOS_'+ mesEmissaoNF + anoEmissaoNF;
      tabelaPesquisa.dcilo  :='PRDKP'+ anoEmissaoNF +'.DCILO_'+ mesEmissaoNF + anoEmissaoNF;
      tabelaPesquisa.dcord  :='PRDKP'+ anoEmissaoNF +'.DCORD_'+ mesEmissaoNF + anoEmissaoNF;
      tabelaPesquisa.dcNFeDadosAdicionais  :='PRDKP'+ anoEmissaoNF +'.DC_NFE_DADOS_ADICIONAIS_'+ mesEmissaoNF + anoEmissaoNF;

      if not DM.isExisteTabela(tabelaPesquisa.dcnot) then
      begin
        tabelaPesquisa.dcnot:='PRDDM.DCNOT';
        tabelaPesquisa.dcios:='PRDDM.DCIOS';
        tabelaPesquisa.dcilo:='PRDDM.DCILO';
        tabelaPesquisa.dcord:='PRDDM.DCORD';
        tabelaPesquisa.dcNFeDadosAdicionais:='PRDDM.DC_NFE_DADOS_ADICIONAIS';
      end;
    end
    else
    begin
      tabelaPesquisa.dcnot:='PRDDM.DCNOT';
      tabelaPesquisa.dcios:='PRDDM.DCIOS';
      tabelaPesquisa.dcilo:='PRDDM.DCILO';
      tabelaPesquisa.dcord:='PRDDM.DCORD';
      tabelaPesquisa.dcNFeDadosAdicionais:='PRDDM.DC_NFE_DADOS_ADICIONAIS';
    end;
  end;

end;

function formatarNrTelefone(dsFone:string):string;
begin
  Result:=FormatFloat('(00)0000-0000',StrToFloat(dsFone));
end;

end.
