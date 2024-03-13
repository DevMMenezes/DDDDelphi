unit DMDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.Client;

type
  TDMData = class(TDataModule)
    FBConnection: TFDConnection;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDTransaction: TFDTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetQuery: TFDQuery;
    function GetDataSet: TDataSet;

  end;

var
  DMData: TDMData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDMData }

function TDMData.GetDataSet: TDataSet;
begin
  Result := TDataSet.Create(nil);
  Result.Close;
end;

function TDMData.GetQuery: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Transaction := FDTransaction;

  if FDTransaction.Active then
    FDTransaction.Commit;
  FDTransaction.StartTransaction;

  Result.Connection := FBConnection;
  Result.Close;
  Result.SQL.Clear;
end;

end.
