unit Produto.Controller;

interface

uses
  IProduto.Service,
  Data.DB,
  Produto.Entity, Produto.Service, System.SysUtils;

type
  TProdutoController = class(TInterfacedObject, IProdutoService)
  private
    dsProduto: TDataSource;
  public
    function FindAll(): TDataSet;
    function FindByID(aID: Integer): TDataSet;
    function Insert(aProduto: TProdutoEntity): Boolean;
    function Update(aProduto: TProdutoEntity): Boolean;
    function Delete(aProduto: TProdutoEntity): Boolean;
    class function New: TProdutoController;
    constructor Create;
    destructor Destroy; override;

    function SumValues(X, Y: Integer): Integer;
  end;

implementation

{ TProdutoController }

constructor TProdutoController.Create;
begin
  dsProduto := TDataSource.Create(nil);
end;

function TProdutoController.Delete(aProduto: TProdutoEntity): Boolean;
begin
  { Regra de neg�cio }
  Result := TProdutoService.New.Delete(aProduto);
end;

destructor TProdutoController.Destroy;
begin
  dsProduto.DisposeOf;
  inherited;
end;

function TProdutoController.FindAll(): TDataSet;
begin
  { Regra de neg�cio }
  dsProduto.DataSet := TProdutoService.New.FindAll();
  Result := dsProduto.DataSet.GetClonedDataSet(True);
end;

function TProdutoController.FindByID(aID: Integer): TDataSet;
begin
  { Regra de neg�cio }
  dsProduto.DataSet := TProdutoService.New.FindByID(aID);
  Result := dsProduto.DataSet.GetClonedDataSet(True);
end;

function TProdutoController.Insert(aProduto: TProdutoEntity): Boolean;
begin

  if aProduto.CodigoBarra = '1234' then
    raise Exception.Create
      ('N�o foi poss�vel cadastrar um produto com este c�digo de barras.');

  { Regra de neg�cio }
  Result := TProdutoService.New.Insert(aProduto);
end;

class function TProdutoController.New: TProdutoController;
begin
  Result := Self.Create;
end;

function TProdutoController.SumValues(X, Y: Integer): Integer;
begin
  Result := X + Y;
end;

function TProdutoController.Update(aProduto: TProdutoEntity): Boolean;
begin
  { Regra de neg�cio }
  Result := TProdutoService.New.Update(aProduto);
end;

end.
