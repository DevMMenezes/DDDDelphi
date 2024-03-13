unit IServiceBase;

interface

uses
  Data.DB;

type
  IServicesBase<T: Class> = interface
    ['{6D611F59-BD99-4CBA-8FB3-D030F0770248}']
    function FindAll(): TDataSet;
    function FindByID(aID: Integer): TDataSet;
    function Insert(aValue: T): Boolean;
    function Update(aValue: T): Boolean;
    function Delete(aValue: T): Boolean;
  end;

implementation

end.
