unit MainInterface;

interface

uses
  Classes, Forms;

type
  IMainFormPlugin = interface
  ['{FBF5F310-07FC-438D-9A6E-5C0DE8DFCBDB}']
    procedure AddButton;
//    procedure Register;
//    procedure UnRegister;
  end;

  TMainFormPlugin = function(const AOwner: TForm): IMainFormPlugin;

implementation

end.
