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
  IProduto.Entity;

type
  TProdutoService = class(TInterfacedObject, IProdutoService)
  private
    FConexao: TFDConnection;
    FConn: iSimpleQuery;
    FDAO: iSimpleDAO<TProdutoEntity>;
    FDataSource: TDataSource;

  public
    function FindAll(): TDataSet;
    function FindByID(aID: Integer): TDataSet;
    function Insert(aProduto: TProdutoEntity): Boolean;
    function Update(aProduto: TProdutoEntity): Boolean;
    function Delete(aProduto: TProdutoEntity): Boolean;
    class function New: IProdutoService;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

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
  try
    FDAO.Delete(aProduto);
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      raise Exception.Create(E.Message);
    end;
  end;
end;

destructor TProdutoService.Destroy;
begin
  FDataSource.DisposeOf;
  inherited;
end;

function TProdutoService.FindAll(): TDataSet;
begin
  try
    FDAO.Find(False);
    Result := FDataSource.DataSet;
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

function TProdutoService.FindByID(aID: Integer): TDataSet;
begin
  try
    FDAO.SQL.Where('ID = ' + IntToStr(aID)).&End.Find(False);
    Result := FDataSource.DataSet;
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;

end;

function TProdutoService.Insert(aProduto: TProdutoEntity): Boolean;
begin
  try
    FDAO.Insert(aProduto);
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      raise Exception.Create(E.Message);
    end;
  end;
end;

class function TProdutoService.New: IProdutoService;
begin
  Result := Self.Create;
end;

function TProdutoService.Update(aProduto: TProdutoEntity): Boolean;
begin
  try
    FDAO.Update(aProduto);
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      raise Exception.Create(E.Message);
    end;
  end;
end;

end.
