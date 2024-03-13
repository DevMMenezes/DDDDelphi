unit Produto.Service;

interface

uses
  SimpleInterface,
  SimpleDAO,
  SimpleAttributes,
  SimpleQueryFiredac,
  IProduto.Service,
  Produto.Entity,
  Data.DB,
  FireDAC.Comp.Client,
  DMDataModule,
  IProduto.Entity,
  FireDAC.Comp.DataSet,
  System.SysUtils;

type
  TProdutoService = class(TInterfacedObject, IProdutoService)
  private
    FConexao: TFDConnection;
    FConn: iSimpleQuery;
    FDAO: iSimpleDAO<TProdutoEntity>;
    FDataSource: TDataSource;
  public
    procedure FindAll(aQuery: TFDMemTable);
    procedure FindByID(aMemTable: TFDMemTable; aID: Integer);
    function Insert(aProduto: TProdutoEntity): Boolean;
    function Update(aProduto: TProdutoEntity): Boolean;
    function Delete(aProduto: TProdutoEntity): Boolean;
    class function New: IProdutoService;
    constructor Create;
    destructor Destroy; override;

    procedure FindLike(aMemTable: TFDMemTable; aDescription: String);
  end;

implementation

{ TProdutoService }

constructor TProdutoService.Create;
begin
  FDataSource := TDataSource.Create(nil);
  FConexao := DMData.FBConnection;
  FConn := TSimpleQueryFiredac.New(FConexao);
  FDAO := TSimpleDAO<TProdutoEntity>.New(FConn).DataSource(FDataSource);
end;

function TProdutoService.Delete(aProduto: TProdutoEntity): Boolean;
begin
  { Implementada na BaseService }
end;

destructor TProdutoService.Destroy;
begin
  FDataSource.DisposeOf;
  inherited;
end;

procedure TProdutoService.FindAll(aQuery: TFDMemTable);
begin
  { Implementada na BaseService }
end;

procedure TProdutoService.FindLike(aMemTable: TFDMemTable;
  aDescription: String);
begin

  try
    FDAO.SQL.Where('DESCRICAO like ' + QuotedStr('%' + aDescription + '%') +
      ' or CODIGO_BARRAS like ' + QuotedStr('%' + aDescription + '%'))
      .&End.Find(False);
    aMemTable.CopyDataSet(FDataSource.DataSet, [coStructure, coRestart,
      coAppend]);
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;

end;

procedure TProdutoService.FindByID(aMemTable: TFDMemTable; aID: Integer);
begin
  { Implementada na BaseService }
end;

function TProdutoService.Insert(aProduto: TProdutoEntity): Boolean;
begin
  { Implementada na BaseService }
end;

class function TProdutoService.New: IProdutoService;
begin
  Result := Self.Create;
end;

function TProdutoService.Update(aProduto: TProdutoEntity): Boolean;
begin
  { Implementada na BaseService }
end;

end.
