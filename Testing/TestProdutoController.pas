unit TestProdutoController;

interface

uses
  DUnitX.TestFramework, Produto.Controller;

type

  [TestFixture]
  TTestProdutoController = class
  private
    oProdutoController: TProdutoController;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    [TestCase('SumValues 1', '1,2,3')]
    [TestCase('SumValues 2', '3,4,7')]
    procedure SumValues(const AValue1: Integer; const AValue2: Integer;
      const ResultSum: Integer);

  end;

implementation

procedure TTestProdutoController.Setup;
begin
  oProdutoController := TProdutoController.Create;
end;

procedure TTestProdutoController.TearDown;
begin
  oProdutoController.Free;
end;

procedure TTestProdutoController.SumValues(const AValue1: Integer;
  const AValue2: Integer; const ResultSum: Integer);
var
  Sum: Integer;
begin
  Sum := oProdutoController.SumValues(AValue1, AValue2);
  Assert.AreEqual(Sum, ResultSum);
end;

initialization

TDUnitX.RegisterTestFixture(TTestProdutoController);

end.
