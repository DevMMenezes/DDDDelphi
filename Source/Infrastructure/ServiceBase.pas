unit ServiceBase;

interface

uses IServiceBase,
  SimpleInterface,
  SimpleDAO,
  SimpleAttributes,
  SimpleQueryFiredac,
  Produto.Entity,
  Data.DB, FireDAC.Comp.Client;

type
  TServiceBase<T: class, constructor> = class(TInterfacedObject, IService<T>)
  private
    FParent: T;
    FConexao: TFDConnection;
    FConn: iSimpleQuery;
    FDAOEntity: iSimpleDAO<T>;
    FDataSource: TDataSource;
  public
    constructor Create(Parent: T);
    destructor Destroy; override;
    class function New: IService<T>;
    function FindAll(): TDataSet;
    function FindByID(ADataSet: TDataSet): TDataSet;
    function Insert(): IService<T>;
    function Update(): IService<T>;
    function Delete(): IService<T>;
  end;

implementation

uses
  Produto.Service, System.SysUtils, DMDataModule, Main;

{ TServiceBase<T> }

constructor TServiceBase<T>.Create(Parent: T);
begin
  FParent := Parent;
  FDataSource := TDataSource.Create(nil);
  FConexao := DMData.FBConnection;
  FConn := TSimpleQueryFiredac.New(FConexao);
  FDAOEntity := TSimpleDAO<T>.New(FConn).DataSource(FDataSource);
end;

function TServiceBase<T>.Delete: IService<T>;
begin

end;

destructor TServiceBase<T>.Destroy;
begin
  FDataSource.DisposeOf;
  inherited;
end;

function TServiceBase<T>.FindAll(): TDataSet;
begin
  try
    FDAOEntity.Find;

    Result := FDataSource.DataSet;
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;

end;

function TServiceBase<T>.FindByID(ADataSet: TDataSet): TDataSet;
begin

end;

function TServiceBase<T>.Insert: IService<T>;
begin

end;

class function TServiceBase<T>.New: IService<T>;
begin
  Result := Self.Create();
end;

function TServiceBase<T>.Update: IService<T>;
begin

end;

end.