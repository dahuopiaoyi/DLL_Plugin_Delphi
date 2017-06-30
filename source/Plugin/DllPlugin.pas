unit DllPlugin;

interface

uses
  MainInterface, Classes, StdCtrls, Controls, Forms;

type
  TMainFormPlugin = class(TObject, IMainFormPlugin)
  private
    FOwner: TForm;
  protected
    function  QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function  _AddRef: Integer; stdcall;
    function  _Release: Integer; stdcall;
  public
    constructor Create(AOwner: TForm); overload;
    procedure AddButton;
  end;

implementation

{ TMainFormPlugin }

procedure TMainFormPlugin.AddButton;
var
  iBtn: TButton;
begin
  iBtn := TButton.Create(nil);
  iBtn.Name := 'btnPlugin';
  iBtn.Caption := 'DLLÀ©Õ¹';
  iBtn.Parent := FOwner;
end;

constructor TMainFormPlugin.Create(AOwner: TForm);
begin
  FOwner := AOwner;
end;

function TMainFormPlugin.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  Result := -1;
end;

function TMainFormPlugin._AddRef: Integer;
begin
  Result := -1;
end;

function TMainFormPlugin._Release: Integer;
begin
  Result := -1;
end;

end.
