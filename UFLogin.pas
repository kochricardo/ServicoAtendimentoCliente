unit UFLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Winsock, jpeg, ExtCtrls, ComCtrls, StdCtrls, Buttons, DB, DBClient,
  SimpleDS, UUsuario, UUtils, UTelaSistema ;

const
  CD_SISTEMA = 98;

type
  TFLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    btnLogar: TBitBtn;
    btncancelar: TBitBtn;
    StatusBar1: TStatusBar;
    Image1: TImage;
    procedure btnLogarClick(Sender: TObject);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btncancelarClick(Sender: TObject);
    procedure edtLoginChange(Sender: TObject);
    procedure edtSenhaChange(Sender: TObject);
  private
    procedure consultarUsuario;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

uses UDm;

{$R *.dfm}

procedure TFLogin.consultarUsuario;
var
  sqlDados: TSimpleDataSet;
  sqlTxt: TStringList;
  dsSenha: string;
begin
  sqlDados:=TSimpleDataSet.Create(nil);
  sqlDados.Connection:=DM.conexaoProducao;
  sqlTxt:=TStringList.Create;
  try
    sqlTxt.Clear;
    sqlTxt.Add('SELECT NM_USUARIO,NR_MATRICULA,CD_USUARIO,DS_LOGIN,DS_PASSWD,CD_EMPRESA,ID_ATIVO');
    sqlTxt.Add('FROM ACESSO.DC_USUARIO');
    sqlTxt.Add('WHERE ID_ATIVO = ''A'' AND DS_LOGIN = :LOGIN');

    sqlDados.Close;
    sqlDados.DataSet.CommandText:=sqlTxt.Text;
    sqlDados.DataSet.ParamByName('LOGIN').AsString:=usuario.login;
    sqlDados.Open;
    if not sqlDados.IsEmpty then
    begin
      dsSenha:=sqlDados.FieldByName('DS_PASSWD').AsString;
      if usuario.senha = dsSenha then
      begin
        usuario.isAcessoLiberado:=True;
        usuario.nomeCompleto:=sqlDados.FieldByName('NM_USUARIO').AsString;
        usuario.matricula:=sqlDados.FieldByName('NR_MATRICULA').AsInteger;
        usuario.codigo:=sqlDados.FieldByName('CD_USUARIO').AsInteger;

        if ((usuario.matricula = 283) or (usuario.matricula = 1073)or (usuario.matricula = 212)) then
          usuario.ambiente:=Homologacao
        else
          usuario.ambiente:=Producao;
      end
      else
      begin
        usuario.limparDados;
        Application.MessageBox('Usuário/Senha inválido no sistema.','Acesso Negado',0 + 16);
        edtLogin.SetFocus;
      end;
    end
    else
    begin
      usuario.limparDados;
      Application.MessageBox('Usuário/Senha inválido no sistema.','Acesso Negado',0 + 16);
      edtLogin.SetFocus;
    end;
  finally
    sqlTxt.Free;
    sqlDados.Close;
    sqlDados.Free;
  end;
end;

function ConsultaIP:string;
var
  WSAData: TWSAData;
  HostEnt: PHostEnt;
  Name:string;

begin
  WSAStartup(2, WSAData);
  SetLength(Name, 255);
  Gethostname(PAnsiChar(Name), 255);
  SetLength(Name, StrLen(PChar(Name)));
  HostEnt := gethostbyname(PAnsiChar(Name));
  with HostEnt^ do
  begin
    Result := Format('%d.%d.%d.%d',
    [Byte(h_addr^[0]),Byte(h_addr^[1]),
    Byte(h_addr^[2]),Byte(h_addr^[3])]);
   end;
  WSACleanup;
end;

procedure TFLogin.btncancelarClick(Sender: TObject);
begin
  ModalResult:=mrcancel;
  close;
end;

procedure TFLogin.btnLogarClick(Sender: TObject);
begin
  if edtLogin.Text <> '' then
  begin
    if EdtSenha.Text <> '' then
    begin
      btnLogar.Enabled:=false;
      usuario.login:=UpperCase(trim(edtLogin.Text));

      { consultar login do usuario }
      DM.consultarLoginUsuario;

      if usuario.matricula > 0 then
      begin
        if usuario.situacao = ativo then
        begin
          { validar senha informada }
          if isSenhaValida(trim(edtSenha.Text),usuario.senha) then
          begin
            { consultar permissão de acesso ao sistema }
            DM.validarPermissaoAcessoSistema(CD_SISTEMA);
            if usuario.isAcessoLiberado then
            begin
              { 283 = Silvestre / 1073 = Raquel da Silva }
              if ((usuario.matricula = 283) or (usuario.matricula = 1073)) then
                usuario.ambiente:=Homologacao
              else
                usuario.ambiente:=Producao;

              { telas disponiveis }
              InicializarDadosTelaSistema;
              DM.consultarAcessoTelaSistema(CD_SISTEMA);

              ModalResult:=mrok;
              StatusBar1.SimpleText:=format('ACESSO LIBERADO : %s',[usuario.nomeCompleto]);
              Application.ProcessMessages;
              Sleep(1000);
            end
            else
            begin
              ModalResult:=mrCancel;
              StatusBar1.SimpleText:=format('ACESSO NEGADO : %s',[usuario.nomeCompleto]);
              Application.MessageBox('Usuário não liberado para acessar o programa.','Acesso Negado',0 + 16);
            end;
          end
          else
          begin
            Application.MessageBox('Senha ou Usuário inválido.','Acesso Negado',0 + 16);
            edtLogin.SetFocus;
          end;
        end
        else
        begin
          ModalResult:=mrCancel;
          StatusBar1.SimpleText:=format('ACESSO NEGADO : %s',[usuario.nomeCompleto]);
          Application.MessageBox('Usuário Inativo','Acesso Negado',0 + 16);
          Sleep(1000);
        end;
      end
      else
      begin
        Application.MessageBox('Usuário inválido.','Acesso Negado',0 + 16);
        edtLogin.SetFocus;
      end;
    end;
  end;

  {
  if edtLogin.Text <> '' then
  begin
    if EdtSenha.Text <> '' then
    begin
      usuario.login:=trim(UpperCase(edtLogin.Text));
      usuario.senha:=criptografaMD5(edtSenha.Text);

      // executa consulta do usuario
      consultarUsuario;

      if usuario.isAcessoLiberado then
      begin
        ModalResult:=mrok;
        StatusBar1.SimpleText:='ACESSO LIBERADO : '+ usuario.nomeCompleto;
        Application.ProcessMessages;
        Sleep(1000);
      end;
    end;
  end;
  }
end;

procedure TFLogin.edtLoginChange(Sender: TObject);
begin
  if length(trim(edtLogin.Text)) > 0 then
    edtSenha.Enabled:=true
  else
    edtSenha.Enabled:=false;

end;

procedure TFLogin.edtSenhaChange(Sender: TObject);
begin
  if length(trim(edtSenha.Text)) > 0 then
    btnLogar.Enabled:=true
  else
    btnLogar.Enabled:=false;
end;

procedure TFLogin.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case KEY of
    VK_RETURN : begin
                  btnLogar.SetFocus;
                  btnLogarClick(Self);
                end;
  end;
end;

end.
