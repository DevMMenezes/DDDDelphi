program DDDDelphi;

uses
  Vcl.Forms,
  IProduto.Entity in 'Source\Domain\Entities\IProduto.Entity.pas',
  EProduto.Enum in 'Source\Domain\Enums\EProduto.Enum.Pas',
  DMDataModule in 'Source\Infrastructure\DataModule\DMDataModule.pas' {DMData: TDataModule},
  Produto.Entity in 'Source\Infrastructure\Produto\Entities\Produto.Entity.pas',
  Produto.Service in 'Source\Infrastructure\Produto\Services\Produto.Service.pas',
  IProduto.Service in 'Source\Domain\Services\IProduto.Service.pas',
  Main.View in 'Source\Presentation\View\Main.View.pas' {vMain},
  Produto.Controller in 'Source\Presentation\Controller\Produto.Controller.pas',
  ServiceBase in 'Source\Infrastructure\ServiceBase.pas',
  IServiceBase in 'Source\Domain\IServiceBase.pas';

begin

  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMData, DMData);
  Application.CreateForm(TvMain, vMain);
  Application.Run;

end.
