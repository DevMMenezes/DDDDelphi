unit IProduto.Entity;

interface

type
  IProdutoEntity = interface
    ['{1F2EAC18-FB82-4576-A590-AF708CE17C7D}']
    function SetID(const aValue: Integer): IProdutoEntity;
    function SetDescricao(const aValue: String): IProdutoEntity;
    function SetCodigoBarra(const aValue: String): IProdutoEntity;
    function SetIdCadastro(const aValue: String): IProdutoEntity;
  end;

implementation

end.
