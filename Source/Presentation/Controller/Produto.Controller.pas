unit Produto.Controller;

interface

uses
  IProduto.Service,
  Produto.Entity,
  Produto.Service,
  ServiceBase,
  DMDataModule,
  FireDAC.Comp.Client,
  System.SysUtils;

type
  TProdutoController = class(TInterfacedObject, IProdutoService)
  private
  public
    procedure FindAll(aMemTable: TFDMemTable);
    procedure FindByID(aMemTable: TFDMemTable; aID: Integer);
    procedure FindLike(aMemTable: TFDMemTable; aDescription: String);
    function Insert(aProduto: TProdutoEntity): Boolean;
    function Update(aProduto: TProdutoEntity): Boolean;
    function Delete(aProduto: TProdutoEntity): Boolean;
    class function New: IProdutoService;

    function SumValues(X, Y: Integer): Integer;
  end;

implementation

{ TProdutoController }

function TProdutoController.Delete(aProduto: TProdutoEntity): Boolean;
var
  oServiceBase: TServiceBase<TProdutoEntity>;
begin
  { Regra de neg�cio }
  oServiceBase := TServiceBase<TProdutoEntity>.Create;
  try
    Result := oServiceBase.Delete(aProduto);
  finally
    oServiceBase.Free;
  end;
end;

procedure TProdutoController.FindAll(aMemTable: TFDMemTable);
var
  oServiceBase: TServiceBase<TProdutoEntity>;
begin
  { Regra de neg�cio }
  oServiceBase := TServiceBase<TProdutoEntity>.Create;
  try
    oServiceBase.FindAll(aMemTable);
  finally
    oServiceBase.Free;
  end;
end;

procedure TProdutoController.FindByID(aMemTable: TFDMemTable; aID: Integer);
var
  oServiceBase: TServiceBase<TProdutoEntity>;
begin
  { Regra de neg�cio }
  oServiceBase := TServiceBase<TProdutoEntity>.Create;
  try
    oServiceBase.FindByID(aMemTable, aID);
  finally
    oServiceBase.Free;
  end;
end;

procedure TProdutoController.FindLike(aMemTable: TFDMemTable;
  aDescription: String);
var
  oProdutoService: TProdutoService;
begin
  { Regra de neg�cio }
  oProdutoService := TProdutoService.Create;
  try
    oProdutoService.FindLike(aMemTable, aDescription);
  finally
    oProdutoService.Free;
  end;
end;

function TProdutoController.Insert(aProduto: TProdutoEntity): Boolean;
var
  oServiceBase: TServiceBase<TProdutoEntity>;
begin
  if aProduto.CodigoBarra = '1234' then
    raise Exception.Create
      ('N�o foi poss�vel cadastrar um produto com este c�digo de barras.');

  { Regra de neg�cio }
  oServiceBase := TServiceBase<TProdutoEntity>.Create;
  try
    Result := oServiceBase.Insert(aProduto);
  finally
    oServiceBase.Free;
  end;
end;

class function TProdutoController.New: IProdutoService;
begin
  Result := Self.Create;
end;

function TProdutoController.SumValues(X, Y: Integer): Integer;
begin
  Result := X + Y;
end;

function TProdutoController.Update(aProduto: TProdutoEntity): Boolean;
var
  oServiceBase: TServiceBase<TProdutoEntity>;
begin
  { Regra de neg�cio }
  oServiceBase := TServiceBase<TProdutoEntity>.Create;
  try
    Result := oServiceBase.Update(aProduto);
  finally
    oServiceBase.Free;
  end;
end;

end.
