unit Produto.Entity;

interface

uses
  SimpleAttributes;

type
{$M+}

  [Tabela('PRODUTO')]
  TProdutoEntity = class

  private
    FID: Integer;
    FDescricao: String;
    FCodigoBarra: String;
    FIDCadastro: String;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: TProdutoEntity;

    function SetID(const aValue: Integer): TProdutoEntity;
    function SetDescricao(const aValue: String): TProdutoEntity;
    function SetCodigoBarra(const aValue: String): TProdutoEntity;
    function SetIdCadastro(const aValue: String): TProdutoEntity;

  published
    [Campo('ID'), PK, AutoInc]
    property ID: Integer read FID;
    [Campo('DESCRICAO'), NotNull]
    property Descricao: String read FDescricao;
    [Campo('CODIGO_BARRAS'), NotNull]
    property CodigoBarra: String read FCodigoBarra;
    [Campo('ID_CADASTRO'), NotNull]
    property IDCadastro: String read FIDCadastro;
  end;

implementation

{ IProdutoEntity }

constructor TProdutoEntity.Create;
begin
  inherited;
end;

destructor TProdutoEntity.Destroy;
begin
  inherited;
end;

class function TProdutoEntity.New: TProdutoEntity;
begin
  Result := Self.Create;
end;

function TProdutoEntity.SetCodigoBarra(const aValue: String): TProdutoEntity;
begin
  FCodigoBarra := aValue;
  Result := Self;
end;

function TProdutoEntity.SetDescricao(const aValue: String): TProdutoEntity;
begin
  FDescricao := aValue;
  Result := Self;
end;

function TProdutoEntity.SetID(const aValue: Integer): TProdutoEntity;
begin
  FID := aValue;
  Result := Self;
end;

function TProdutoEntity.SetIdCadastro(const aValue: String): TProdutoEntity;
begin
  FIDCadastro := aValue;
  Result := Self;
end;

end.
