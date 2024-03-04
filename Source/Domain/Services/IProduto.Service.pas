unit IProduto.Service;

interface

uses
  Data.DB, Produto.Entity;

type
  IProdutoService = interface
    ['{7235F61B-F92C-4221-8C82-F7208B9572FD}']
    function FindAll(): TDataSet;
    function FindByID(aID: Integer): TDataSet;
    function Insert(aProduto : TProdutoEntity): Boolean;
    function Update(aProduto : TProdutoEntity): Boolean;
    function Delete(aProduto : TProdutoEntity): Boolean;
  end;

implementation

end.
