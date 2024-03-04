unit Main.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Produto.Entity, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DMDataModule, Datasnap.DBClient,
  Produto.Controller, Produto.Service;

type
  TvMain = class(TForm)
    btnFindAll: TButton;
    btnInsert: TButton;
    btnUpdate: TButton;
    btnDelete: TButton;
    btnFindByID: TButton;
    DBGridProd: TDBGrid;
    DS: TDataSource;
    procedure btnFindAllClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnFindByIDClick(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  vMain: TvMain;

implementation

{$R *.dfm}

procedure TvMain.btnDeleteClick(Sender: TObject);
var
  oProduto: TProdutoEntity;
begin
  oProduto := TProdutoEntity.New;
  try
    try
      with oProduto do
      begin
        SetID(1).SetDescricao('UpdateTesteMarcelo').SetCodigoBarra('1234')
          .SetIdCadastro('123456');
      end;

      TProdutoController.New.Delete(oProduto);
    except
      on E: Exception do
        Application.MessageBox(PWideChar(E.Message),
          'Mensagem do Sistema', MB_OK);
    end;
  finally
    oProduto.Free;
  end;
end;

procedure TvMain.btnFindAllClick(Sender: TObject);
begin
  DBGridProd.DataSource.DataSet := TProdutoController.New.FindAll();
end;

procedure TvMain.btnFindByIDClick(Sender: TObject);
begin
  DBGridProd.DataSource.DataSet := TProdutoController.New.FindByID(10);
end;

procedure TvMain.btnInsertClick(Sender: TObject);
var
  oProduto: TProdutoEntity;
begin
  oProduto := TProdutoEntity.New;
  try
    try
      with oProduto do
      begin
        SetDescricao('TesteMarcelo').SetCodigoBarra('1234')
          .SetIdCadastro('123456');
      end;

      TProdutoController.New.Insert(oProduto);
    except
      on E: Exception do
        Application.MessageBox(PWideChar(E.Message),
          'Mensagem do Sistema', MB_OK);
    end;
  finally
    oProduto.Free;
  end;
end;

procedure TvMain.btnUpdateClick(Sender: TObject);
var
  oProduto: TProdutoEntity;
begin
  oProduto := TProdutoEntity.New;
  try
    try
      with oProduto do
      begin
        SetID(1).SetDescricao('UpdateTesteMarcelo').SetCodigoBarra('1234')
          .SetIdCadastro('123456');
      end;
      TProdutoController.New.Update(oProduto);
    except
      on E: Exception do
        Application.MessageBox(PWideChar(E.Message),
          'Mensagem do Sistema', MB_OK);
    end;
  finally
    oProduto.Free;
  end;
end;

end.