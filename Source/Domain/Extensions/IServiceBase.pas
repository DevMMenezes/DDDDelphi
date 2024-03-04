unit IServiceBase;

interface

uses
  Data.DB;

type
  IService<T: Class> = interface
    ['{159ABEFF-862C-46B8-957D-D21D27BBD19E}']
    function FindAll(): TDataSet;
    function FindByID(ADataSet: TDataSet): TDataSet;
    function Insert():  IService<T>;
    function Update():  IService<T>;
    function Delete():  IService<T>;
  end;

implementation

end.
